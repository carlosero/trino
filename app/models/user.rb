class User < ActiveRecord::Base
  has_and_belongs_to_many :clients
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  before_save :set_default_kind_of_user

  KINDS_OF_USER = [
    [I18n.t("activerecord.attributes.user.kinds_of_user.admin"),     'admin'    ],
    [I18n.t("activerecord.attributes.user.kinds_of_user.seller"),    'seller'   ],
  ]
  DEFAULT_KIND_OF_USER = 'seller'

  def set_default_kind_of_user
    kind_of_user ||= DEFAULT_KIND_OF_USER
  end

  def admin?
    kind_of_user == 'admin'
  end

  def seller?
    kind_of_user == 'seller'
  end
end
