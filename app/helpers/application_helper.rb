module ApplicationHelper
  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page), class: 'page-link'), :class => [('active' if page == current_page), 'page-item'].join(' ')
    end

    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#', class: 'page-link'), :class => [classname[0..3], classname, ('page-item'), ('disabled' unless page)].join(' ')
    end
  end

  def page_navigation_links(pages)
    will_paginate(pages, :class => 'pagination pagination-sm', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end
end
