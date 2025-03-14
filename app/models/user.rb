class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :equipments, dependent: :destroy

  has_many :bookings_as_client, dependent: :destroy, class_name: 'Booking'
  has_many :bookings_as_owner, through: :equipments, source: :bookings

  has_one_attached :photo

  def full_name
    "#{first_name} #{last_name}"
  end
end
