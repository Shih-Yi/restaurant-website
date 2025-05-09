module BackgroundHelper
  def background_image_style(setting_image, default_image)
    url = Setting.first&.send(setting_image)&.url || asset_pack_path("media/image/home/#{default_image}")
    "background: url('#{url}') center center no-repeat; background-size: cover; background-position: center;"
  end
end
