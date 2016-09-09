module ApplicationHelper

  def authenticate
    html = "<input type='hidden' "
    html += "name='authenticity_token' "
    html += "value='#{form_authenticity_token}'>"

    html.html_safe
  end

  def errors
    html = ""
    unless flash[:errors].nil?
      html = flash[:errors].join(", ")
    end
    html.html_safe
  end
end
