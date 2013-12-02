class Client < ActiveRecord::Base
  # devise :database_authenticatable, :registerable, :recoverable
  has_one :vehicle
  belongs_to :seller, :foreign_key => "user_id"
  accepts_nested_attributes_for :vehicle
  scope :unasigned, where(:user_id => nil)
  default_scope order('agenda DESC')

  before_destroy { |c| c.vehicle.destroy }

  STATUS = {
    :closed => 'closed',
    :waiting => 'waiting',
    :no_contact => 'no_contact',
    :negotiate => 'negotiate',
    :contacted => 'contacted'
  }

  STATUS_FOR_SELECT = [
    [I18n.t("activerecord.attributes.client.statuses.closed"),     'closed'    ],
    [I18n.t("activerecord.attributes.client.statuses.waiting"),    'waiting'   ],
    [I18n.t("activerecord.attributes.client.statuses.no_contact"), 'no_contact'],
    [I18n.t("activerecord.attributes.client.statuses.negotiate"),  'negotiate' ],
    [I18n.t("activerecord.attributes.client.statuses.contacted"),  'contacted' ],
  ]

  MARITAL_STATUS = [
    [I18n.t("activerecord.attributes.client.marital_statuses.single"),     'single'    ],
    [I18n.t("activerecord.attributes.client.marital_statuses.married"),    'married'   ],
    [I18n.t("activerecord.attributes.client.marital_statuses.divorced"),    'divorced'   ],
    [I18n.t("activerecord.attributes.client.marital_statuses.widowed"),    'widowed'   ],
  ]

  AFINITY_FOR_SELECT = [
    ['Objeto Uno',     'Objeto Uno'    ],
    ['Objeto Dos',     'Objeto Dos'    ],
    ['Objeto Tres',    'Objeto Tres'   ],
  ]

  def self.asignable_for_seller(user_id)
    where("user_id = ? or user_id is NULL", user_id)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? or document_id LIKE ?', "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end

  def assigned?
    !!seller
  end

  def agenda_is_old?
    agenda && agenda.to_date == Date.today.to_date
  end

end
