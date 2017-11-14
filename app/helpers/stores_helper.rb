module StoresHelper
  def logo_by_store(logo)
    if logo.blank?
      default_image_for_logo('medium')
    else
      logo.url(:medium)
    end
  end
end
