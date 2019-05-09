module BadgesHelper
  def badge_icon(badge_id)
    file_name = Badge.where(id: badge_id).pluck(:file_name).first
    image_tag file_name, style: "height: 32px; width: 32px"
  end

  def badge_rule_types
    Badge.rule_types.map { |k,v| [I18n.t("rule_types.#{k}"), v] }
  end

  def badge_rule_name(rule_type)
    Badge.rule_types.map { |k,v| I18n.t("rule_types.#{k}") }[rule_type]
  end
end
