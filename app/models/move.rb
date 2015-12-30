class Move < ActiveRecord::Base
    
    has_many :boxes, dependent: :destroy
end
