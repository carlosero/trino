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
    [I18n.t("models.clients.statuses.closed"),     'closed'    ],
    [I18n.t("models.clients.statuses.waiting"),    'waiting'   ],
    [I18n.t("models.clients.statuses.no_contact"), 'no_contact'],
    [I18n.t("models.clients.statuses.negotiate"),  'negotiate' ],
    [I18n.t("models.clients.statuses.contacted"),  'contacted' ],
  ]

  MARITAL_STATUS = [
    [I18n.t("models.clients.marital_statuses.single"),     'single'    ],
    [I18n.t("models.clients.marital_statuses.married"),    'married'   ],
    [I18n.t("models.clients.marital_statuses.divorced"),    'divorced'   ],
    [I18n.t("models.clients.marital_statuses.widowed"),    'widowed'   ],
  ]


end
