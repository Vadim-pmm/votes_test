module ApplicationHelper
  def my_flash_helper
    if flash[:notice]
      html = "<div class='alert alert-info my-alert'><span>#{flash[:notice]}</span></div>"
    elsif flash[:error]
      html = "<div class='alert alert-warning my-alert'><span>#{flash[:error]}</span></div>"
    else
      html = ''
    end

    html.html_safe
  end
end
