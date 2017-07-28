module SeedHelpers
  class << self
    def agent_type(name)
      AgentType.where(name: name).first_or_create!
    end

    def action_type(name)
      ActionType.where(name: name).first_or_create!
    end

    def action_types(names)
      names.collect do |name|
        SeedHelpers.action_type(name)
      end
    end

    def random_birth_date
      year  = (1927..1957).to_a.sample
      month = rand(12) + 1
      day   = rand(28) + 1

      Date.civil(year, month, day)
    end

    def create_agent(name, type, action_types)
      Agent.create!(
        name:         name,
        type:         SeedHelpers.agent_type(type),
        action_types: SeedHelpers.action_types(action_types),
        # picture:    File.new("#{Rails.root}/../res/agents/#{name.downcase}.jpg")
        picture:    File.new("#{Rails.root}/../res/agents/annie.jpg")
      )
    end

    def create_patient(name, code, address)
      Patient.create!(
        name:       name,
        birth_date: SeedHelpers.random_birth_date,
        code:       code,
        address:    address,
        picture:    File.new("#{Rails.root}/../res/patients/#{name.downcase}.jpg")
      )
    end
  end
end

annie      = SeedHelpers.create_agent("Annie",      'Infirmier', ['Toilette', 'Lavage des pieds',          'Coupe des ongles'])
jacqueline = SeedHelpers.create_agent("Jacqueline", 'Infirmier', ['Toilette', 'Evacuation des excréments', 'Changement de litterie'])
alberto    = SeedHelpers.create_agent("Alberto",    'Voisin',    ['Visite'])
michele    = SeedHelpers.create_agent("Michèle",    'Voisin',    ['Visite', 'Courses'])
josiane    = SeedHelpers.create_agent("Josiane",    'Ami',       ['Visite'])

alberte  = SeedHelpers.create_patient('Alberte',  'yo', "Rue de Nimy 27, 7000 Mons, Belgium")
gilberte = SeedHelpers.create_patient('Gilberte', 'yu', "Rue Royale 42, 7500 Tournai, Belgium")

