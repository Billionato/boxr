class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :moves, dependent: :destroy
  has_many :boxes, dependent: :destroy
  has_many :items, dependent: :destroy
  
end
