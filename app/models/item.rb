class Item < ActiveRecord::Base
    
    belongs_to :box
    belongs_to :user
    
    has_attached_file :image, styles: { large: "500x500#", medium: "300x300#", thumb: "100x100#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates_attachment_presence :image
end
