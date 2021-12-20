class Search < ApplicationRecord
    def search_user
        userResults = User.where("lower(name) LIKE ? 
        OR lower(email) LIKE ? 
        OR lower(address) LIKE ?", 
        "%#{name.downcase}%", "%#{email.downcase}%", 
        "%#{address.downcase}%")

        return userResults
    end 
end

# form sends list of input info
# acquire search fields in list, empty values removed

#dynamic list = take in/out fields based on empty or non-empty input, build SQL dynamically
#single search + modifier list = search against all fields all the time, but risk pulling
#back information that isnt useful, geo location vs non-geo location would require a single if statement.



#1. rollback usertype and make sure its all downcase
#2. radio button usertype on form page and figure out how to hook up radio
#3. create query builder, pass through an array of info, concat together into query.