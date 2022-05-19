class ArtCategory < ApplicationRecord
  has_many :arts

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
