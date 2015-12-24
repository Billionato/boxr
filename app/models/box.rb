class Box < ActiveRecord::Base
    
    belongs_to :move
    has_many :items
end
