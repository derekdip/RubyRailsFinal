class Chat < ApplicationRecord
  belongs_to :username
  belongs_to :recipient
 
end
