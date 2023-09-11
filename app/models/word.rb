class Word < ApplicationRecord
  belongs_to :wordbook

 validates :term, presence: true, length: { maximum: 25 }
 validates :definition, presence: true, length: { maximum: 50}

end
