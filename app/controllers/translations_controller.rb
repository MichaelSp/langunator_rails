class TranslationsController < ApplicationController
  include Concerns::SmartTable
  table_is_searchable

  def new
    @translation = Translation.new
    @translation.section = (session[:last_section] || nil)
    @translation.word1.language_id = session[:last_language_1] || nil
    @translation.word2.language_id = session[:last_language_2] || nil
    @translation.user = current_user
    super
  end

  def create
    super
    session[:last_language_1] = resource.word1.language.id rescue nil
    session[:last_language_2] = resource.word2.language.id rescue nil
  end

  def update
    super
    session[:last_language_1] = resource.word1.language.id rescue nil
    session[:last_language_2] = resource.word2.language.id rescue nil
  end

  private
    def resource_params
      p = params.require(:translation).permit(:section,
          :word_id, :word_id, :times_right, :times_wrong, :times_skiped, :times_resetted,
          word1_attributes: [:id, :name, :language_id, language_attributes: [:name, :id]],
          word2_attributes: [:id, :name, :language_id, language_attributes: [:name, :id]]
          ) if params[:translation]
      [:word1_attributes, :word2_attributes].each do |word|
        if p[word] && p[word][:language_id] && !(p[word][:language_id] =~ /\d+/)
          language = p[word].delete :language_id
          p[word][:language_attributes] ={name: language}
        end
      end
      p
    end
end
