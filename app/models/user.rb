class User < ApplicationRecord
  validates_presence_of :name, :password, :email_address
  validates_uniqueness_of :name
  validates_uniqueness_of :email_address
  validates_length_of :password, {within: 6..40}

  def self.authenticate(email_address, password)
    if find_by(email_address: email_address)
      if find_by(email_address: email_address).password == password
        find_by(email_address: email_address)
      end
    end
  end
end
