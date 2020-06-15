class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #  ActionController::Base.helpers.asset_path("/default/default.png")
  #
  # "/images/fallback/" + [version_name, "default.png"].compact.join('_')
#  end

  # Process files as they are uploaded:
#  process scale(400, 400)
  #
 # def scale(width, height)
#  process resize_to_fit: [width, height]
 # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_and_crop: 200
  end

  version :mini do
    process resize_and_crop: 40
  end

private

  def resize_and_crop(size)
    manipulate! do |image|
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width]) / 2).round
        image.shave("0x#{remove}")
      elsif image[:width] > image[:height]
        remove = ((image[:width] - image[:height]) / 2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details
  # def filename
  #   "something.jpg" if original_filename
  # end
end
