class PortfolioUploader < CarrierWave::Uploader::Base

  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end


  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
