class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :register
  has_many :expenses
  has_many :payments
  has_many :you_owe_mes
  has_many :i_paid_yous

  validates_presence_of :id, :first_name, :last_name, :email, :password, :password_confirmation
  
end
