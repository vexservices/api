module PicturesHelper
  def default_image_for_picture(size)
    "#{ assets_server_url }/common/product/#{ size }.png"
  end

  def default_image_for_logo(size = 'medium')
    "#{ assets_server_url }/common/store/#{ size }.png"
  end

  def assets_server_url
    "http://assets2.vexapps.com"
  end
end
