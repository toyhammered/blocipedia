class User < ActiveRecord::Base
  has_many :collaborators
  has_many :wikis, through: :collaborators, dependent: :destroy


  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable,
         :trackable, :validatable


  def set_default_role
    self.role ||= :standard
  end

  def owns?(wiki)
    self.id == wiki.user_id
  end


end
