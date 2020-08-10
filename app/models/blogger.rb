class Blogger < ApplicationRecord
    has_many :destinations
    has_many :posts, through: :destinations
    validates :name, uniqueness: true
    # validates :age, numericality: true
    validates :age, numericality: { greater_than: 0, message: ": You're Too Young" }
    validates :bio, length: { :minimum => 30 }

    def self.average_age
        ages = self.all.sum do |blogger|
            blogger.age
        end
        (ages / self.all.count)
    end

    def total_likes
        self.posts.sum do |post|
            post.likes
        end
    end

    def popular_post
        self.posts.max do |a, b|
            a.likes <=> b.likes
        end
    end

    def top_five
        # self.destination.sort_by do |destination|
        #     byebug
        #     destination.post_count
        # end.take(5)
        self.destinations
        byebug
    end
end