class Destination < ApplicationRecord
    has_many :bloggers
    has_many :posts, through: :bloggers

    def post_count
        self.posts.count
    end
end
