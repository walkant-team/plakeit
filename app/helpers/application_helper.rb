module ApplicationHelper
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/ && request.user_agent !~ /iPad/
  end

  def link_to_current(name = nil, options = nil, html_options = nil, &block)
    _class =  request.original_fullpath == options ? 'active' : ''
    content_tag :li, class: _class do
      link_to name, options, html_options, &block
    end
  end
end
