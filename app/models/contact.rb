class Contact < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :email,      :presence => true, :format => {
    :with => /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  }
end
