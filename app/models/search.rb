class Search < ApplicationRecord

  validates :query, presence: true

  def self.most_searched
    group(:query).order('count_id DESC').count('id')
  end

  def self.delete_all_searches
    delete_all
  end
end
