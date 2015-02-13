class Cocktail < ActiveRecord::Base
  has_many :doses
  has_many :ingredients, through: :doses, dependent: :destroy
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates :name, presence: true, uniqueness: true
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
