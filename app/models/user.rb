class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :statuses

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
