class TeamMemberUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [72, 72]
  end

  version :show do
    process resize_to_fill: [545, 548]
  end

end
