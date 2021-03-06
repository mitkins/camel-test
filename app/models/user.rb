class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :statuses

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true, uniqueness: true, format: {
      with: /^[a-zA-Z0-9_-]+$/,
      multiline: true,
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

    def gravatar_url
      stripped_email = email.strip
      downcased_email = stripped_email.downcase

      hash = Digest::MD5.hexdigest( downcased_email )

      "http://gravatar.com/avatar/#{hash}"
    end
end
