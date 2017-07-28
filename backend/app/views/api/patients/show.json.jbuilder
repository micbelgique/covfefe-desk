json.patient do
  json.name        @patient.name
  json.birth_date  @patient.birth_date
  json.age         @patient.age
  json.picture_url @patient.picture.url
end

json.action_types @agent.action_types do |action_type|
  json.id   action_type.id
  json.name action_type.name
end

json.actions @patient.actions.order(datetime: :desc).limit(10) do |action|
  json.datetime action.datetime
  json.type     action.type.name

  json.agent do
    json.name        action.agent.name
    json.picture_url action.agent.picture.url
  end
end
