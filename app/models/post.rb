class Post < ApplicationRecord
  validates :title, :content, presence: true
  scope :ordered, -> do
    order created_at: :desc
  end
  scope :published, -> { ordered.where(published: true) }
end
