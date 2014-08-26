class Status < ActiveRecord::Base
	belongs_to :user
    validates_presence_of :user

    validates :content, presence: true,
    						length: { minimum: 2 }

   validates :user_id, presence: true

end
