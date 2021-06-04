class Player < ApplicationRecord
    def has_username
        if self.username.length<4
            errors.add(:username,"username must be atleast 4 characters") 
            return true
        end
    end
    def has_password
        if self.password.length<4
            errors.add(:password,"password must be atleast 4 characters") 
            return true
        end
    end
    def username_already_used(preExistingPlayers)
        preExistingPlayers.each do |preplayer|
            if(preplayer.username==self.username)
                errors.add(:username,"has already been used ")
                return true
            end
        end
    end
    def username_password_dont_match(preExistingPlayers)
        preExistingPlayers.each do |preplayer|
            if(preplayer.username==self.username)
                if(preplayer.password!=self.password)
                    errors.add(:password,"wrong password try again") 
                    return true
                else
                    return preplayer.id
                end
            end
        end
        errors.add(:password,"username  is not found") 
        return true
    end
end
