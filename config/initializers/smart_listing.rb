SmartListing.configure do |config|
  config.global_options({
    #:param_names  => {                                              # param names
      #:page                         => :page,
      #:per_page                     => :per_page,
      #:sort                         => :sort,
    #},
    #:array                          => false,                       # controls whether smart list should be using arrays or AR collections
    #:max_count                      => nil,                         # limit number of rows
    #:unlimited_per_page             => false,                       # allow infinite page size
    #:paginate                       => true,                        # allow pagination
    #:memorize_per_page              => false,                       # save per page settings in the cookie
    #:page_sizes                     => DEFAULT_PAGE_SIZES,          # set available page sizes array
    #:kaminari_options               => {:theme => "smart_listing"}, # Kaminari's paginate helper options
  })

  config.constants :classes, {
    #:main                  => "smart-listing",
    #:editable              => "editable",
    #:content               => "content",
    #:loading               => "loading",
    #:status                => "smart-listing-status",
    #:item_actions          => "actions",
    #:new_item_placeholder  => "new-item-placeholder",
    #:new_item_action       => "new-item-action",
    #:new_item_button       => "btn",
    #:hidden                => "hidden",
    #:autoselect            => "autoselect",
    #:callback              => "callback",
    #:pagination_per_page   => "pagination-per-page text-center",
    #:pagination_count      => "count",
    #:inline_editing        => "info",
    #:no_records            => "no-records",
    #:limit                 => "smart-listing-limit",
    #:limit_alert           => "smart-listing-limit-alert",
    #:controls              => "smart-listing-controls",
    #:controls_reset        => "reset",
    :filtering_search      => "fa fa-search",
    :filtering_cancel      => "fa fa-times",
    #:filtering_disabled    => "disabled",
    #:sortable              => "sortable",
    :icon_new              => "fa fa-plus fa-lg",
    :icon_edit             => "fa fa-pencil fa-lg",
    :icon_copy             => "fa fa-copy fa-lg",
    :icon_trash            => "fa fa-trash-o fa-lg",
    :icon_inactive         => "fa fa-circle",
    :icon_show             => "fa fa-trash-o",
    :icon_sort_none        => "fa fa-sort",
    :icon_sort_up          => "fa fa-sort-up",
    :icon_sort_down        => "fa fa-sort-desc",
  }

  config.constants :data_attributes, {
    #:main                  => "smart-listing",
    #:confirmation          => "confirmation",
    #:id                    => "id",
    #:href                  => "href",
    #:callback_href         => "callback-href",
    #:max_count             => "max-count",
    #:inline_edit_backup    => "smart-listing-edit-backup",
    #:params                => "params",
    #:observed              => "observed",
    #:href                  => "href",
    #:autoshow              => "autoshow",
    #:popover               => "slpopover",
  }

  config.constants :selectors, {
    #:item_action_destroy   => "a.destroy",
    #:edit_cancel           => "button.cancel",
    #:row                   => "tr",
    #:head                  => "thead",
    #:filtering_icon        => "i"
  }
end
