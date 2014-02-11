class Product < ActiveRecord::Base
  unloadable

  belongs_to :issue
  validates :price, :quantity, :issue, presence: true
  validates :name, uniqueness: true, presence: true

  def self.filter_and_sort(sort_clause, filter_by)
    query = order(sort_clause)
    query = query.where(name: filter_by) if filter_by.present?
    query
  end
end
