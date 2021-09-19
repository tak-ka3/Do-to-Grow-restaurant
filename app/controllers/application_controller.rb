class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resources)
    case resources
    when User
      todos_path
    end
  end
end
