class ReportsUploader < CarrierWave::Uploader::Base

  before :cache, :save_original_filename
  fog_authenticated_url_expiration 600


  def save_original_filename(file)
    model.filename = file.original_filename.underscore if file.respond_to?(:original_filename)

  end

  


  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if ENV['MY_ENV'] != 'development'
    storage :aws
  else
    storage :file
  end
  

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
     if ENV['MY_ENV'] != 'development'
     "pdf_reports/#{model.customer_id}/"
     else
    "/pdf_reports/#{model.customer_id}"
     end

  end

 
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(pdf)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

    def move_to_cache
    true
  end

  def move_to_store
    true
  end

end
