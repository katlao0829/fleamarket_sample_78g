class Product < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, allow_destroy: true
  
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :region
  belongs_to_active_hash :day

  validates :name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true
  validates :price, presence: true

  validates_associated :images
  validates :images, presence: true

  def self.search(search)
    return Product.all unless search
    Product.where('name LIKE(?)', "%#{search}%")
  end

end
