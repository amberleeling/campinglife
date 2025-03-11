class Booking < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  enum :status, { pending: 'pending', accepted: 'accepted', declined: 'declined' }
end
