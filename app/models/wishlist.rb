class Wishlist < ApplicationRecord
  belongs_to :user, optional: true
  has_many :wishlist_items
  has_many :items, through: :wishlist_items
  validates :name, uniqueness: {case_sensitive: false}
end
