class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true #redundant?
  validates :ingredient, presence: true #redundant?
  validates :cocktail, uniqueness: { scope: :ingredient}
end
