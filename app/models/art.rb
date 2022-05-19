class Art < ApplicationRecord
  has_many_attached :images
  belongs_to :art_category

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
