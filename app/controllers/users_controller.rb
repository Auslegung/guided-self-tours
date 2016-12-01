class UsersController < ApplicationController
  before_action :authenticate, except: [:login, :create, :index]

  ####################################
  ##          /users routes         ##
  ####################################

  # GET /users
  def index
    users = User.all
    render json: users
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # POST /users/login
  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      token = token(user.id, user.username)
      render json:
      {
        status: 201, user:
        {
          id: user.id,
          username: user.username,
          markers: user.markers
        },
          token: token
        }
    else
      render json: {status: 401, message: "unauthorized"}
    end
  end

  # GET /users/:id
  def show
    user = User.find(params[:id])
    markers = Marker.where(user_id: params[:id])
    render json:
    {
      status: 200,
      user: user,
      markers: markers
    }
  end

  # PATCH/PUT /users/:id
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {status: 204}
  end

  ####################################
  ##    /users/markers routes     ##
  ####################################

  # Adds a marker to a user POST /users/:id/add_marker
  def add_marker
    user = current_user
    new_marker = user.markers.new(marker_params)
    if new_marker.save
      render json:
      {
        status: 200,
        # user: user,
        marker: user.markers,
      }
    else
      render json:
      {
        status: 400,
        user: user,
        marker: marker.errors
      }
    end
  end

  # Updates a user's single marker PATCH /users/:id/update_marker
  def update_marker
    user = User.find(params[:id])
    updating_marker = Marker.find(params[:marker_id])
    updating_marker.update(marker_params)
    render json:
    {
      status: 200,
      user: user,
      markers: user.markers,
      updated_marker: updating_marker
    } # end render json
  end

  # Remove a marker from a user DELETE /users/:id/remove_marker/:marker_id
  def remove_marker
    user = User.find(params[:id])
    marker = Marker.find(params[:marker_id])
    marker.destroy
    render json:
    {
      status: 204,
      user: user,
      markers: user.markers,
      deleted_marker: marker
    } # end render json
  end

  private
  def token(id, username)
    # The below line works without using the .env file.
    # JWT.encode(payload(id, username), Rails.application.secrets.secret_key_base, 'HS256')
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')

  end

    def payload(id, username)
      {
        exp: (Time.now + 1.day).to_i, # Expiration date 24 hours from now
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def marker_params
        params.require(:marker).permit(:title, :description, :category, :audio, :user_id)
    end
end
