class Picture < ApplicationRecord
  has_one_attached :picture

  # Define picture_url as an instance method
  # def picture_url
  #   # Use url_for or any other method to generate the picture URL
  #   # Assuming the 'picture' attribute is a string containing the image URL
  #   url_for(self.picture) # Modify this line as needed
  # end

  def picture_url
    # Use rails_blob_url to generate the picture URL
    if self.picture.attached?
      Rails.application.routes.url_helpers.rails_blob_url(self.picture, only_path: true)
    else
      # Return a default URL or error message if the picture is not attached
      # Replace 'default_url' with your desired fallback URL
      render json: self.errors, status: :unprocessable_entity
    end
  end
end
