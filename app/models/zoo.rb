class Zoo < ActiveRecord::Base
  has_many :animals, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  # Public: override to_s to return the name of the zoo
  # force every zoo name to format "Xyz Zoo"
  def to_s
    name.gsub(/\sZoo$/i, '') + " Zoo"
  end

  # Public: returns the number of unique species for this zoo
  def unique_species_count
    Animal.select("DISTINCT species_id").where( zoo_id: self.id ).count()
  end

end
