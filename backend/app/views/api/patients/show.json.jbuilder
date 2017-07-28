json.patient do
  json.name        @patient.name
  json.birth_date  @patient.birth_date
  json.age         @patient.age
  json.picture_url @patient.picture.url
end

json.actions @patient.actions do |action|
  json.date  action.date
  json.type  action.type
  json.agent action.agent.name
  json.date  action.date
end

json.action_types @agent.action_types do |action_type|
  json.id   action_type.id
  json.name action_type.name
end
