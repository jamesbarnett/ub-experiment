require_dependency './lib/services/user_creator'

class ApiUsersController < ApiBaseController
  def show

  end

  def create
    user_creator = ::UserCreator.new(self)
    user_creator.run(Request.new(params[:user]))
  end

  def index

  end

  def update

  end

  def destroy

  end

  def create_user_succeeded(user)
    render json: { message: "Successfully created account for #{user.email}" }
  end

  def create_user_failed(user)
    render json: { message: "Failed to create account for #{user.email}" }, status: 500
  end

  private

  def user_parameters
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
