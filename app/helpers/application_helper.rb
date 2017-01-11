module ApplicationHelper
  def my_flash_helper
    if flash[:notice]
      html = "<div class='alert alert-success my-alert'><span>#{flash[:notice]}</span></div>"
    elsif flash[:error]
      html = "<div class='alert alert-danger my-alert'><span>#{flash[:error]}</span></div>"
    else
      html = ''
    end

    html.html_safe
  end
end
