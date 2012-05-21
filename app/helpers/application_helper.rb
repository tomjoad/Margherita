module ApplicationHelper
  def full_title(page_title)
    title = 'Margherita'
    if page_title.empty?
      title
    else
      "#{Margherita} | #{page_title}"
    end
  end

  def there_is_something_in_cart?
    !session[:cart].try(:empty?).nil? && !session[:cart].try(:empty?)
  end

end
