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

  def nav_items
    [
      { url: root_path,
        title: 'Home' },
      { url: contact_path,
        title: 'Contact' },
      { url: about_me_path,
        title: 'About me' },
      { url: blogs_path,
        title: 'Blog' },
      { url: portfolios_path,
        title: 'Portfolio' }
    ]
  end

  def nav_helper(styles, tag)
    nav_string = ''
    nav_items.each do |item|
      nav_string << "<#{tag}><a href='#{item[:url]}' class='#{styles} #{is_active? item[:url]}'>#{item[:title]}</a></#{tag}>"
    end

    nav_string.html_safe
  end

  def is_active?(path)
    'active' if current_page? path
  end
end
