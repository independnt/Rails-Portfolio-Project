class Category < ApplicationRecord
  has_many :project_categories
  has_many :projects, through: :project_categories

  #def self.by_category(category_name)
    #where(name: category_name)
  #end

end
