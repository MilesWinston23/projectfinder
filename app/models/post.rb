class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, as: :commentable

    def self.search(search)
        if search
            where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
        else 
            all 
        end 
    end 
end
