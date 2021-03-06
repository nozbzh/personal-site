CarrierWave.configure do |config|

  config.cache_dir        = 'uploads/tmp'
  config.fog_provider     = 'fog/aws'
  config.fog_directory    = ENV["AWS_S3_BUCKET_NAME"]

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"] || '',
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"] || '',
    region: 'us-west-2'
  }
end
