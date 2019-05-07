module BadgesHelper
  def badge_icon(badge_id)
    file_name = Badge.where(id: badge_id).pluck(:file_name).first
    image_tag "#{file_name}", style: "height: 32px; width: 32px"
  end
end
