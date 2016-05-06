# encoding: utf-8
class ProjectImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog
  # storage :file

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  version :thumb do
    process :resize_to_fill => [118, 100]
  end

  version :content do
    process :resize_to_limit => [800, 800]
  end

  def extension_white_list
    ["jpg", "jpeg", "png", "gif", "tiff"]
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
