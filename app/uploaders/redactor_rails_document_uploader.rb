# encoding: utf-8
class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base

  storage :fog
  # storage :file

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def extension_white_list
    RedactorRails.document_file_types
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
