class Search < ApplicationRecord
    def search_user
        user = User.all
        #Post.find_by name: 'Spartacus', rating: 4 

        user = User.where(['name LIKE ?', "%#{self.name}%"]) unless self.name.empty?
        
        #where(['name LIKE ?', "%#{self.name}%"]) unless self.name.empty?
        user = user.where(['email LIKE ?', "%#{self.email}%"]) unless self.email.empty?
        user = user.where(['address LIKE ?', "%#{self.address}%"]) unless self.address.empty?
        #user = user.where(['userType LIKE ?', self.userType]) unless self.userType.empty? 
        #<BROKEN FOR SOME REASON ^^^^>
        return user
    end 
end
