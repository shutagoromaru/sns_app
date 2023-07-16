class Topic < ApplicationRecord
   validates :title, presence: true, length: { maximum: 100 }
   validates :content, length: { maximum: 1000 }
end