json.agents @agents do |agent|
  json.id   agent.id
  json.name agent.name
  json.type agent.type.name
end

json.patients @patients do |patient|
  json.id          patient.id
  json.name        patient.name
  json.birth_date  patient.birth_date
  json.age         patient.age
  json.picture_url patient.picture.url
  json.latitude    patient.latitude
  json.longitude   patient.longitude
end
