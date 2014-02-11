class Species < ActiveRecord::Base
  has_many :animals, inverse_of: :species

  validates :name, presence: true

  def to_s
    name
  end

end
