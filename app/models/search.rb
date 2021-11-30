class Search < ApplicationRecord
    def search_user
        user = User.all 

        user = user.where(['name LIKE ?', "%#{self.name}%"]) unless self.name.empty?
        user = user.where(['email LIKE ?', "%#{self.email}%"]) unless self.email.empty?
        user = user.where(['address LIKE ?', "%#{self.address}%"]) unless self.address.empty?
        user = user.where(['userType LIKE ?', self.userType]) unless self.userType.empty?

        return user
    end 
end
