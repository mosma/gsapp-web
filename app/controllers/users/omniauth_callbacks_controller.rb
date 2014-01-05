class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token

  def facebook
    authenticate_with :facebook
  end

  def linkedin
    authenticate_with :linkedin
  end

  def instagram
    authenticate_with :instagram
  end

  def google_oauth2
    authenticate_with :google_oauth2
  end

  def github
    authenticate_with :github
  end

  def destroy
    auth = current_user.authentications.find_by(provider: params[:provider])
    auth.destroy!
    redirect_to edit_user_registration_url
  end

  private

  def authenticate_with(kind)
    omniauth = request.env['omniauth.auth']
    user = User.includes(:authentications).merge(
      Authentication.where(provider: omniauth['provider'],
        uid: omniauth['uid'])).references(:authentications).first

    if user
      user.update_auth_info auth_hash(kind, omniauth), user_hash(kind, omniauth)
      sign_in @user, event: :authentication
      redirect_to after_sign_in_path_for(@user)
    elsif current_user
      current_user.update_auth_info auth_hash(kind, omniauth), user_hash(kind, omniauth)
      redirect_to edit_user_registration_url
    else
      user_info = user_hash(kind, omniauth)
      user = User.find_or_initialize_by email: user_info[:email]
      user.update_attributes user_info
      user.password = Devise.friendly_token[0,20] if user.new_record?
      user.authentications.build(auth_hash(kind, omniauth))
      if user.save validate: false
        sign_in user
        redirect_to after_sign_in_path_for(user)
      end
    end
  end

  def auth_hash(provider, hash)
    case provider
    when :facebook
      {
        provider: hash['provider'],
        uid: hash['uid'],
        name: hash['info']['name'],
        link: hash['info']['urls']['Facebook'],
        token: hash['credentials']['token'],
        secret: nil,
        avatar: hash['info']['image'],
        full_data: hash.to_json
      }

    when :linkedin
      {
        provider: hash['provider'],
        uid: hash['uid'],
        name: hash['info']['nickname'],
        link: hash['info']['urls']['public_profile'],
        token: hash['credentials']['token'],
        secret: hash['credentials']['secret'],
        avatar: hash['info']['image'],
        full_data: hash.to_json
      }

    when :instagram
      {
        provider: hash['provider'],
        uid: hash['uid'],
        name: hash['info']['nickname'],
        link: hash['info']['urls']['public_profile'],
        token: hash['credentials']['token'],
        secret: hash['credentials']['secret'],
        avatar: hash['info']['image'],
        full_data: hash.to_json
      }

    when :google_oauth2
      {
        provider: hash['provider'],
        uid: hash['uid'],
        name: hash['info']['nickname'],
        link: hash['info']['urls']['public_profile'],
        token: hash['credentials']['token'],
        secret: hash['credentials']['secret'],
        avatar: hash['info']['image'],
        full_data: hash.to_json
      }

    when :github
      {
        provider: hash['provider'],
        uid: hash['uid'],
        name: hash['info']['nickname'],
        link: hash['info']['urls']['public_profile'],
        token: hash['credentials']['token'],
        secret: hash['credentials']['secret'],
        avatar: hash['info']['image'],
        full_data: hash.to_json
      }
    end
  end

  def user_hash(provider, hash)
    case provider
    when :facebook
      { name: hash['info']['name'], email: hash['info']['email'] }
    when :linkedin
      { name: hash['info']['name'], email: hash['info']['email'] }
    when :instagram
      { name: hash['info']['name'], email: hash['info']['email'] }
    when :google_oauth2
      { name: hash['info']['name'], email: hash['info']['email'] }
    when :github
      { name: hash['info']['name'], email: hash['info']['email'] }
    end
  end
end
