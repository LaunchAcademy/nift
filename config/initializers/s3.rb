# if Rails.env.test?
#   CarrierWave.configure do |config|
#     config.storage = :file
#     config.enable_processing = false
#   end
# else
#   Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

#   fog_dir = Rails.env == 'production' ? 'nift' : 'nift-test'

#   CarrierWave.configure do |config|
#     config.fog_credentials = {provider: 'AWS'}
#     config.fog_directory  = fog_dir                                 # required
#     #config.fog_host       = 'https://s3.amazonaws.com'              # optional, defaults to nil
#     config.fog_public     = false                                   # optional, defaults to true
#     config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
#   end
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = 'nift'
  config.fog_public     = true
end
