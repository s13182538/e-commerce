class Category < ActiveRecord::Base
  acts_as_nested_set

  has_many :products

  validates :name, presence: true

end
