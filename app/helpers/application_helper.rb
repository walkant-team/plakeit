module ApplicationHelper
  def active_class(link_path)
    # /#{link_path}/.match(request.original_fullpath) ? 'active' : ''
    link_path == request.original_fullpath ? 'active' : ''
  end

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/ && request.user_agent !~ /iPad/
  end
end
