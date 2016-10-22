ActiveAdmin.register Page do
  csv_importable :columns => [:title, :body],
                              :import_unique_key => :title

  action_item only: :index do
    link_to 'Clear Cache', clear_cache_admin_pages_path, method: :post, remote: true, class: 'clear_cache', data: {confirm: 'Are you sure to clear the cache?'}
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :body, :position
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  sortable tree: true,
           max_levels: 0,               # infinite indent levels
           protect_root: false,         # allow root items to be dragged
           sorting_attribute: :position,
           parent_method: :parent,
           children_method: :children,
           roots_method: :roots,
           roots_collection: nil,       # proc to specifiy retrieval of roots
           sortable: true,              # Disable sorting (use only 'tree' functionality)
           collapsible: false,          # show +/- buttons to collapse children
           start_collapsed: false      # when collapsible, start with all roots collapsed


  index :as => :sortable do
    label :title # item content
        actions
  end
  sidebar :versionate, :partial => "layouts/version", :only => :show

  
  collection_action :clear_cache, method: :post do
  end

  member_action :history do
    @page = Page.find(params[:id])
    @versions = @page.versions
    render "layouts/history"
  end

  controller do
    before_filter :authenticate_admin_user!
    def clear_cache
      begin
        @response = ''
        @response = 'Bad this is !!'
        raise "Exeception!!"
      rescue Exception => e
        @response = e.message
      end
      respond_to do |format|
        format.js
      end
    end
    def show
      @page = Page.includes(versions: :item).find(params[:id])
      @versions = @page.versions 
      @page = @page.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
  end
end
