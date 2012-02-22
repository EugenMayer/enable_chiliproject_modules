module EnhancedProjectSearch
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_layouts_base_top_menu_items,
              :partial => 'hooks/view_layouts_base_top_menu_items'
    render_on :view_layouts_base_html_head,
              :partial => 'hooks/view_layouts_base_html_head'
  end
end