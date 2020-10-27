module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: style) +
        ' '.html_safe +
        (link_to 'Sign up', new_user_registration_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def session_helper
    if session[:source]
      greetings = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, greetings, class: 'source-greeting-helper')
    end
  end
end
