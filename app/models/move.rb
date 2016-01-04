class Move < ActiveRecord::Base
    
    has_many :boxes, dependent: :destroy
    
    validates_presence_of :name, :to, :from
end
