class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :correct_usertype
    validates :name, presence: true
    validates :email, presence: true

    def correct_usertype
        # Matches user booleans based on userType.  NOTE: May be more dynamic as a hash?
        if self.venue
            self.update_attribute(:usertype, "Venue") # update_attribute should not be the final answer. Loose reason is that
        elsif self.vendor                             # it bypasses validation, which is not safe for a production environment.
            self.update_attribute(:usertype, "Vendor")
        elsif self.event
            self.update_attribute(:usertype, "Event")
        elsif self.press
            self.update_attribute(:usertype, "Press")
        else
            self.update_attribute(:standard, true)
            self.update_attribute(:usertype, "Attendee")
        end
    end

    def correct_userbool
        # Matches userType based on user booleans.  NOTE: May be more dynamic as a hash?
        case self.usertype
        when "Attendee"
            self.update_attribute(:standard, true)

            self.update_attribute(:venue, false)
            self.update_attribute(:vendor, false)
            self.update_attribute(:event, false)
            self.update_attribute(:press, false)
        when "Venue"
            self.update_attribute(:venue, true)

            self.update_attribute(:vendor, false)
            self.update_attribute(:event, false)
            self.update_attribute(:press, false)
            self.update_attribute(:standard, false)
        when "Vendor"
            self.update_attribute(:vendor, true)
            
            self.update_attribute(:standard, false)
            self.update_attribute(:venue, false)
            self.update_attribute(:event, false)
            self.update_attribute(:press, false)
        when "Event"
            self.update_attribute(:event, true)
            
            self.update_attribute(:press, false)
            self.update_attribute(:standard, false)
            self.update_attribute(:venue, false)
            self.update_attribute(:vendor, false)
        when "Press"
            self.update_attribute(:press, true)
            
            self.update_attribute(:standard, false)
            self.update_attribute(:venue, false)
            self.update_attribute(:vendor, false)
            self.update_attribute(:event, false)
        end
    end
end