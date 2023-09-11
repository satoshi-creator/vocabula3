class Wordbook < ApplicationRecord
  belongs_to :user

  has_many :words, dependent: :destroy

  validates :title, presence: true, length: { maximum: 25 }

end
