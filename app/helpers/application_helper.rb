module ApplicationHelper
  def module_link(text, link, options = {})
    begin
      link_to text, send(link), options
    rescue
      link_to text, '#invalid-link', options
    end
  end
end
