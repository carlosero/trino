class User < ActiveRecord::Base

  has_many :clients
  accepts_nested_attributes_for :clients
  default_scope order('name ASC')
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :client_ids, :kind_of_user

  KINDS_OF_USER = [
    [I18n.t("activerecord.attributes.user.kinds_of_user.admin"),     'admin'    ],
    [I18n.t("activerecord.attributes.user.kinds_of_user.seller"),    'seller'   ],
  ]

  def to_seller
    Seller.find(id)
  end

  def admin?
    kind_of_user == 'admin'
  end

  def seller?
    kind_of_user == 'seller'
  end

end
