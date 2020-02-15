class User < ApplicationRecord
  belongs_to :portfolio
  
  validates :name, presence: true
  validates :content, presence: true
  
end
