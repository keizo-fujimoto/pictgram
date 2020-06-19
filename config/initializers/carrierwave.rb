unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAZ3EFBBH4LZGLH6JG',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'techboostpictgram'
    config.cache_storage = :fog
  end
end