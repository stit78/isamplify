class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchases
  has_many :potential_clients
  has_many :samples
  has_many :sales

  validates :role, presence: true, inclusion: { in: ["Trader", "Exporter", "Client"] }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

end
