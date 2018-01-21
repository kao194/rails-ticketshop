class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tickets
  validates :name, :presence => true, :length => {:minimum => 6}
  validates :date_of_birth, :presence => true
  validates :phone, :presence => true

end
