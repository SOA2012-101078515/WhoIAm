class User < ActiveRecord::Base

  has_many :readedbooks
  has_many :readed_books, :through => :readedbooks, :source => :book
  has_many :bookideas
  has_many :book_ideas, :through => :bookideas, :source => :book
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :readedbook_id


	def self.from_omniauth(auth)
    		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      			user.provider = auth.provider
      			user.uid = auth.uid
      			user.name = auth.info.name
      			user.oauth_token = auth.credentials.token
      			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      			user.save!


    		end
  	end
end
