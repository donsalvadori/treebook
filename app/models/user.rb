class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :first_name, prescence: true

         validates :last_name, prescence: true

         validates :profile_name, prescence: true,
         			uniqueness: true, 
         				format: {
         					with: /a-zA-Z0-9_-/,
         					message: 'Must be formatted correctly'
         				}

         has_many :statuses

         def full_name
         	 self.first_name + " " + self.last_name
         end

end
