class Project < ApplicationRecord

  validates :name, :summary, :content, :priority_order, :image, presence: true

  mount_uploader :image, ProjectImageUploader

  scope :ordered, -> do
    order :priority_order
  end

  scope :published, -> { ordered.where(published: true) }

  before_create :set_slug

  private

  def set_slug
    self.slug = self.name.parameterize
  end
end
