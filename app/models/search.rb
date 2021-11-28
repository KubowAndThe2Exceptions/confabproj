class Search < ApplicationRecord
    def search_user
        user = User.all 

        user = user.where(['name LIKE ?', "%#{name}%"]) unless name.empty?
        user = user.where(['email LIKE ?', "%#{email}%"]) unless email.empty?
        user = user.where(['address LIKE ?', "%#{address}%"]) unless address.empty?

        return user
    end 
end
