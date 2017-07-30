module Picture

  extend ActiveSupport::Concern

  included do
    mount_uploader :picture, PictureUploader

    def picture_url
      "http://#{APP_HOSTNAME}#{picture.url}"
    end

    def thumb_picture_url
      "http://#{APP_HOSTNAME}#{picture.url(:thumb)}"
    end

    def big_thumb_picture_url
      "http://#{APP_HOSTNAME}#{picture.url(:big_thumb)}"
    end
  end

end
