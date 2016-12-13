class Article < ApplicationRecord
  def self.search(search)
    where("title ILIKE ?", "%#{search}%") 
    where("body ILIKE ?", "%#{search}%")
  end
end
