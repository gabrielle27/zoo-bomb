class Species < ActiveRecord::Base
  has_many :animals

  validates :name, presence: true

  def to_s
    name
  end

end
