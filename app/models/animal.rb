class Animal < ActiveRecord::Base
  belongs_to :zoo, inverse_of: :animals
  belongs_to :species, inverse_of: :animals, autosave: true
  accepts_nested_attributes_for :species

  default_scope { order('name ASC') }

  validates :name, presence: true

  def to_s
    name
  end

  private

  # Private: Find or create the approprate species record and link to the animal
  def autosave_associated_records_for_species
    # Find or create the species by name
    if new_species = Species.find_by_name(species.name)
      self.species = new_species
    else
      # Set the association between animals and species
      self.species.animals = [self]
      self.species.save!
    end
  end

end
