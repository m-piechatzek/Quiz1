class Request < ActiveRecord::Base
  validates :name, presence: true

  validates :email, presence: true

  # paginates_per 5

  # def search(term)
  #   where(["name ILIKE :search_term", {search_term: "%#{term}%"}])
  #
  # end

  def self.search(query)
  # where(:title, query) -> This would return an exact match of the query
  where("name like ? OR email like ? OR message like?", "%#{query}%", "%#{query}%", "%#{query}%")
end
end
