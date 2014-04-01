class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  FLASH_KEY_TO_CSS_KEY = {
    'alert' => "danger",
    'notice' => 'success'
  }
  def translate_errors(errors,object=nil)
    messages = []
    errors.each do |key,msg|
      if object
        messages << object.class.human_attribute_name(key) + " " + msg.to_s
      else
        messages << key.to_s + " " + msg.to_s
      end
    end
    messages
  end
end
