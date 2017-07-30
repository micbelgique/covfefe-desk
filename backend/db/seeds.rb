module SeedHelpers
  class << self
    def agent_type(name)
      AgentType.where(name: name).first_or_create!
    end

    def action_type(name)
      type = ActionType.where(name: name).first_or_create!

      if type.picture.blank?
        picture_path = "misc/pictures/action_types/#{name.downcase}.png"

        if File.exists?(picture_path)
          type.picture = File.new(picture_path)
          type.save!
        end
      end

      type
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

    def create_agent(device_id, name, type, action_types)
      Agent.create!(
        device_id:    device_id,
        name:         name,
        type:         SeedHelpers.agent_type(type),
        action_types: SeedHelpers.action_types(action_types),
        picture:      File.new("misc/pictures/agents/#{name.downcase}.jpg")
      )
    end

    def create_patient(name, code, address)
      Patient.create!(
        name:       name,
        birth_date: SeedHelpers.random_birth_date,
        code:       code,
        address:    address,
        picture:    File.new("misc/pictures/patients/#{name.downcase}.jpg")
      )
    end
  end
end

SeedHelpers.create_agent('78A12647-4910-4162-9FC5-10A5EB259A75', "Annie",      'Infirmère',  ['Toilette', 'Lavage des pieds',          'Coupe des ongles'])
SeedHelpers.create_agent('',                                     "Jacqueline", 'Infirmère',  ['Toilette', 'Evacuation des excréments', 'Changement de litterie'])
SeedHelpers.create_agent('',                                     "Jessica",    'Infirmière', ['Visite'])
SeedHelpers.create_agent('',                                     "Michel",     'Voisin',     ['Visite', 'Courses'])
SeedHelpers.create_agent('',                                     "Josiane",    'Amie',       ['Visite'])

SeedHelpers.create_patient('Alberte',   'yo', "Rue de Nimy 27, 7000 Mons, Belgium")
SeedHelpers.create_patient('Gilberte',  'gi', "Rue Royale 42, 7500 Tournai, Belgium")
SeedHelpers.create_patient('Xavier',    'xa', "Rue de Nimy 27, 7000 Mons, Belgium")
SeedHelpers.create_patient('Paulette',  'pa', "Rue de Nimy 27, 7000 Mons, Belgium")
SeedHelpers.create_patient('Nina',      'ni', "Rue de Nimy 27, 7000 Mons, Belgium")
SeedHelpers.create_patient('Jules',     'ju', "Rue de Nimy 27, 7000 Mons, Belgium")

Patient.all.each do |patient|
  datetime = Time.now

  (rand(10) + 2).times do
    action_type = ActionType.all.sample
    datetime   -= rand(72).hours

    patient.actions.create!(
      datetime: datetime,
      type:     action_type,
      agent:    action_type.agents.sample
    )
  end
end
