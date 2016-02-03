class ApiKey < ActiveRecord::Base
  belongs_to :user
  before_create :generate_new_value
  validates :value, uniqueness: true

  def generate_new_value
    begin
      self.value = SecureRandom.hex
    end while self.class.exists?(value: value)
  end
end
