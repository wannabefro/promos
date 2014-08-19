AttachmentUploader
if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['S3_SECRET_ACCESS_KEY'],
      :region                 => ENV['S3_REGION']
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end

