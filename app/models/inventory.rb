class Inventory < ActiveRecord::Base
  belongs_to :warehouse
  has_many :products
  validates :warehouse, presence: true
end
