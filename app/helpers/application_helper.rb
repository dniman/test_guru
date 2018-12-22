module ApplicationHelper
  
  EXCEPT_AUTH_PAGES = %i[ login_path signup_path ]

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "TestGuru", "https://github.com/#{author}/#{repo}" , target: "_blank"
  end

  def flash_message(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash.now[type] 
  end
     
  def auth_pages
    EXCEPT_AUTH_PAGES.each(&:current_page?)
  end

end
