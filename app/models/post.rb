class Post < ApplicationRecord
  validates :title, :content, presence: true
  scope :ordered, -> do
    order created_at: :desc
  end
  scope :published, -> { ordered.where(published: true) }

  def to_param
    "#{id.to_s}-#{title.parameterize}" rescue nil
  end
end
