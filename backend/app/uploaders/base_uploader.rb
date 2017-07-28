class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  VERY_LARGE = 100_000

  def cache_dir
    'system/tmp/carrierwave'
  end

  def store_dir
    "#{Rails.root}/public/system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
