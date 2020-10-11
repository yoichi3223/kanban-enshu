class List < ApplicationRecord
  has_many :cards,dependent: :destroy
  belongs_to:user
  validates :title, length: { in: 1..255 }
end
