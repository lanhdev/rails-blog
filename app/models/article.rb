class Article < ApplicationRecord
  is_impressionable
  def self.search(search)
    where("title || body ILIKE ?", "%#{search}%") 
    # where("body ILIKE ?", "%#{search}%")
  end
end
