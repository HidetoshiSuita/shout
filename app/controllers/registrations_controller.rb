class RegistrationsController < Devise::RegistrationsController
  
  def build_resource(hash=nil)
    img = File.open("public/img/init_img.png", "r+b")
        
    hash[:img] = img.read
    hash[:img_content] = "image/png"
    hash[:user_available] = true
    super
  end
 
end