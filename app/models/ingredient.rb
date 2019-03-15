class Ingredient < ApplicationRecord
  has_many :doses
  # has_many :doses, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
  before_destroy :check_for_recipes

  private

  def check_for_recipes
    if doses.count.positive?
      raise_error
      return false
    end
  end
end
