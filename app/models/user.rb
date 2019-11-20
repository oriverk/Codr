# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]
  has_many :posts, dependent: :destroy

  def self.from_omniauth(auth)
    find_or_create_by!(provider: auth['provider'], uid: auth['uid']) do |user|
      user.name = auth['info']['name']
      user.profile = auth['info']['description']
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.username = auth['info']['nickname']
      user.email = User.dummy_email(auth)
    end
   end

  # when provider exists, donot require password
  def password_required?
    super && provider.blank?
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
