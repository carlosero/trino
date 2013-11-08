class Client < ActiveRecord::Base
  # devise :database_authenticatable, :registerable, :recoverable
  has_one :vehicle
  accepts_nested_attributes_for :vehicle

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

  def agenda
    read_attribute(:agenda).strftime('%d-%m-%Y %I:%M %P') if read_attribute(:agenda)
  end

  def expiration_date
    read_attribute(:expiration_date).strftime('%d-%m-%Y %I:%M %P') if read_attribute(:expiration_date)
  end


end
