class Box < ActiveRecord::Base
    
    belongs_to :move
    belongs_to :user
    has_many :items, dependent: :destroy
end
