class DownloadUploader < Optimadmin::ImageUploader

  version :focus do
    process resize_to_fill: [168, 263]
  end

  version :show do
    process resize_to_fill: [82, 116]
  end

end
