class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_one  :register
  has_many :expenses
  has_many :payments
  has_many :you_owe_mes

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates :email, :uniqueness => true

  def full_name
    [first_name,last_name].join(' ')
  end
end
