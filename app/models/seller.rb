class Seller < ActiveRecord::Base
  self.table_name = "users"

  has_many :clients, :foreign_key => "user_id"
  accepts_nested_attributes_for :clients
  default_scope order('name ASC')
  default_scope where(:kind_of_user => 'seller')

  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :client_ids
  before_save :set_default_kind_of_user
  validates :email, :presence => true
  before_destroy {clients.clear}

  KINDS_OF_USER = [
    [I18n.t("activerecord.attributes.user.kinds_of_user.admin"),     'admin'    ],
    [I18n.t("activerecord.attributes.user.kinds_of_user.seller"),    'seller'   ],
  ]
  DEFAULT_KIND_OF_USER = 'seller'

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? or email LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def to_user
    User.find(id)
  end

  def set_default_kind_of_user
    kind_of_user ||= DEFAULT_KIND_OF_USER
  end

  def clients_count
    clients.count
  end
end
