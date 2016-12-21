class Article < ApplicationRecord
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	is_impressionable
	def self.search(search)
		where("title || body ILIKE ?", "%#{search}%") 
    # where("body ILIKE ?", "%#{search}%")
   end
   def all_tags=(names)
   	self.tags = names.split(",").map do |name|
   		Tag.where(name: name.strip).first_or_create!
   	end
   end
   def all_tags
   	self.tags.map(&:name).join(", ")
   end
   def self.tagged_with(name)
   	Tag.find_by_name!(name).articles
   end
end
