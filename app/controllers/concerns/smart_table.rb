module Concerns::SmartTable
  extend ActiveSupport::Concern
  include SmartListing::Helper::ControllerExtensions

  module Helpers
    def collection_sym
      @collection_sym = nil
      @collection_sym ||= model.to_s.underscore.downcase.pluralize.to_sym
    end

    def collection_action
      @collection_action = nil
      @collection_action ||= model.to_s.underscore.downcase.singularize.to_sym
    end

    def collection_ivar
      "@#{collection_sym}"
    end

    def resource_sym
      @resource_sym ||= model.to_s.underscore.downcase.to_sym
    end

    def resource_ivar
      "@#{resource_sym}"
    end

    def current_engine
      self.class.parent.to_s.downcase
    end

    def model
      @model = nil
      @model ||= begin
                   # First priority is the namespaced model, e.g. User::Group
        resource_class ||= begin
          namespaced_class = self.name.sub(/Controller/, '').singularize
          namespaced_class.constantize
        rescue NameError
          nil
        end

        # Second priority is the top namespace model, e.g. EngineName::Article for EngineName::Admin::ArticlesController
        resource_class ||= begin
          namespaced_classes = self.name.sub(/Controller/, '').split('::')
          namespaced_class = [namespaced_classes.first, namespaced_classes.last].join('::').singularize
          namespaced_class.constantize
        rescue NameError
          nil
        end

        # Third priority the camelcased c, i.e. UserGroup
        resource_class ||= begin
          camelcased_class = self.name.sub(/Controller/, '').gsub('::', '').singularize
          camelcased_class.constantize
        rescue NameError
          nil
        end

        # Otherwise use the Group class, or fail
        resource_class ||= begin
          class_name = self.controller_name.classify
          class_name.constantize
        rescue NameError => e
          raise unless e.message.include?(class_name)
          nil
        end
      end
    end

    def action_copy(object, path)
      {
          name: :copy,
          custom_url: path,
          custom_icon: SmartListing.config.classes(:icon_copy),
          custom_title: 'Copy'
      }
    end

    def action_edit(object, path)
      {name: :edit, url: path}
    end

    def action_destroy(object, path)
      {name: :destroy, url: path}
    end
  end

  included do
    helper SmartListing::Helper
    include Helpers


    helper_method :collection_sym, :collection_action, :collection_ivar, :resource_sym, :resource_ivar, :model, :collection, :resource, :current_engine
    helper_method :action_copy, :action_edit, :action_destroy

    def self.table_is_searchable(filter_parameter = :filter)
      @@filter_parameter = filter_parameter
    end
  end

  def filtered(model)
    (!params[@@filter_parameter].blank?) ? model.search(params[@@filter_parameter]) : model.all
  end

  def load_collection
    instance_variable_set collection_ivar, smart_listing_create(collection_sym, filtered(model), partial: "#{collection_sym}/listing")
  end

  def load_resource
    instance_variable_set resource_ivar, (model.find(params[:id]) rescue (action_name == 'new' ? model.new(resource_params) : nil))
  end

  def resource
    instance_variable_get(resource_ivar) || load_resource
  end

  def collection
    instance_variable_get(collection_ivar) || load_collection
  end

  # Actions
  def index
    collection
    respond_to do |format|
      format.html
      format.js { render action: 'index.js.erb'}
    end
  end

  def new
    instance_variable_get(resource_ivar) || instance_variable_set(resource_ivar, model.new(resource_params))
  end

  def create
    instance_variable_get(resource_ivar) || instance_variable_set(resource_ivar, model.create(resource_params))
  end

  def copy
    instance_variable_set resource_ivar, resource.dup
  end

  def show
    resource
    render resource, object: resource
  end

  def edit
    resource
  end

  def update
    resource.update resource_params
  end

  def destroy
    resource.destroy
  end

end