class User < ApplicationRecord
    
    def self.search(search)
        where(["name LIKE ?", "%#{search}%"]) #|| where(["email LIKE ?", "%#{search}%"])
    end 
    
    def correct_usertype
        if self.vendor
            self.userType = "Vendor"
        else
            self.standard = true
            self.userType = "didnt work"
        end
    end

    def correct_userbool

        case self.userType
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