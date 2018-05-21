class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :comments, through: :posts
  
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user  
  
  #For Paperclip
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/app/assets/images/placehold.gif"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
