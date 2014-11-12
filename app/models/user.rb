class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :statuses

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true, uniqueness: true, format: {
      with: /a-zA-Z0-9_-/,
      message: "Must be formatted correctly."
    }

    def full_name
        result = ""
        if ( first_name != nil )
            result = first_name
        end

        if ( last_name != nil )
            result = result + " " + last_name
        end

        #first_name + " " + last_name

        result
    end
end
