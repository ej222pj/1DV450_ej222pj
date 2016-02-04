class Apikey < ActiveRecord::Base
  belongs_to :user
  attr_accessor :tmp_user_id

  before_validation { self.key = Array.new(30){rand(36).to_s(36)}.join.upcase}
  before_validation { set_user }
  before_save { self.device = device.downcase }
  
  validates :key, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :device, presence: {:message => "Please Enter!"}, length: {maximum: 30}

  def set_user
    if User.find_by(id: tmp_user_id) &&  tmp_user_id
      self.user_id = tmp_user_id
    end
  end
end
