class WelcomeController < ActionController::Base
  layout 'application'
  def index
    unless current_user.present?
      redirect_to new_user_session_path and return
    end
    @todos = current_user.todos
  end

end
