module ApplicationHelper
  def display_autorized_content(content, status)
    status ? content : "#{content} : It can be restricted"
  end
end
