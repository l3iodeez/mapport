  CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['AWS_BUCKET_NAME']
  #config.aws_acl    = :public_read
  config.asset_host = 'http://nyeaportal.herokuapp.com'
  config.aws_authenticated_url_expiration = 600

    
  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID']
     }
    config.aws_credentials = {
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
     }
  
end