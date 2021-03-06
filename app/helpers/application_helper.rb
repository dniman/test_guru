module ApplicationHelper
  
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "TestGuru", "https://github.com/#{author}/#{repo}" , target: "_blank"
  end

  def flash_message(type)
    content_tag(:p, flash[type], class: "flash #{type}") if flash.now[type] 
  end
     
  def auth_pages?
    except_auth_pages.detect { |page| current_page?(page) }
  end

  def flash_class(level)
    case level.to_sym
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end
  
  def gist_hash(gist_url)
    #gist_url.reverse[0..gist_url.reverse.index("\/")-1].reverse
    gist_url.split("\/").last
  end

  private

  def except_auth_pages
    [ new_user_session_path, new_user_registration_path ]
  end

end
