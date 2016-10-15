ActiveAdmin.register Page do


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

end
