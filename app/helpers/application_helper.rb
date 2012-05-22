module ApplicationHelper
  def full_title(page_title)
    title = 'Margherita'
    if page_title.empty?
      title
    else
      "#{Margherita} | #{page_title}"
    end
  end


end
