class Post < ApplicationRecord

  validates :title, :content, presence: true

  scope :ordered, -> do
    order created_at: :desc
  end

  scope :published, -> { ordered.where(published: true) }

  before_create :set_slug

  private

  def set_slug
    self.slug = self.title.parameterize
  end
end
