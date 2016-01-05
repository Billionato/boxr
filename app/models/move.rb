class Move < ActiveRecord::Base
    
    has_many :boxes, dependent: :destroy
    belongs_to :user
    
    validates_presence_of :name, :to, :from
end
