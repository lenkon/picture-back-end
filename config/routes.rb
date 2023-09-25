Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pictures, only: %i[index new create]  do
        get 'image_url', on: :member
      end   
    end
  end  
end
