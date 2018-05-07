class Post < ActiveRecord::Base

    def self.search(search)
        if search
            where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
        else 
            all 
        end 
    end 
end
