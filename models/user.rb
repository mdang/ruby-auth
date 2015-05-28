require 'bcrypt'

require_relative '../db/connection'

class User < ActiveRecord::Base
	# attributes
	attr_accessor :password

	def authenticate(password)
		if BCrypt::Password.new(self.password_digest) == password
			return true
		else
			return false
		end
	end

	def encrypt_password
		if password.present?
			return self.password_digest = BCrypt::Password.create(password)
		end
	end

end
