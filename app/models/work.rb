class Work < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

  has_many :votes
  has_many :users, :through => :votes
  
  def media_spotlight
  end

  def top_ten
  end
end
