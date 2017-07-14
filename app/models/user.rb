class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone, :email, uniqueness: true
  validates :firstname, :middlename, :lastname, presence: true

  has_one :deposit

  def fullname
    "#{lastname} #{firstname} #{middlename}"
  end
end
