class Zoo < ActiveRecord::Base
  has_many :animals, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  # Public: override to_s to return the name of the zoo
  # force every zoo name to format "Xyz Zoo"
  # examples:
  # Chicago Zoo => Chicago Zoo
  # Chicago     => Chicago Zoo
  # Kalamazoo   => Kalamazoo Zoo
  def to_s
    name.sub(/\sZoo$/i, '') + " Zoo"
  end

  # Public: returns the number of unique species for this zoo
  def unique_species_count
    Animal.select("DISTINCT species_id").where(zoo_id: self.id).count
  end

end
