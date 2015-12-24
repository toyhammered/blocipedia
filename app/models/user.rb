class User < ActiveRecord::Base

  has_many :wikis, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable,
         :trackable, :validatable

end
