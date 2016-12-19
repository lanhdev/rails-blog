class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
  is_impressionable
  def self.search(search)
    where("title || body ILIKE ?", "%#{search}%") 
    # where("body ILIKE ?", "%#{search}%")
  end
end
