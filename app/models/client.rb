class Client < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable

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


end
