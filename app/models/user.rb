class User < ActiveRecord::Base
	has_one :student

  validates :name, presence: true, uniqueness: true
  
  accepts_nested_attributes_for :student

  after_destroy :ensure_a_user_remains
  has_secure_password

  private

    def ensure_a_user_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
    
end
