class Project < ApplicationRecord
  belongs_to :user
  has_many :project_categories
  has_many :categories, through: :project_categories
  has_many :backed_projects
  has_many :backed, through: :backed_projects, source: 'user'
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end
  
end
