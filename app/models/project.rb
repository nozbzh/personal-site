class Project < ApplicationRecord
  validates :name, :summary, :content, :priority_order, :image, presence: true
  mount_uploader :image, ProjectImageUploader
  scope :ordered, -> do
    order :priority_order
  end
  scope :published, -> { ordered.where(published: true) }

  def to_param
    "#{id.to_s}-#{name.parameterize}" rescue nil
  end
end
