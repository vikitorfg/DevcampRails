module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Login', new_user_session_path) +
        '<br>'.html_safe +
        (link_to 'Sign up', new_user_registration_path)
    end
  end

  def session_helper
    if session[:source]
      greetings = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greetings, class: 'source-greeting-helper')
    end
  end
end
