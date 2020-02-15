class Portfolio < ApplicationRecord
  
  has_many :users, dependent: :destroy
  
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
  
end
