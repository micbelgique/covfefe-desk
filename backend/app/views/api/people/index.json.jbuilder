json.agents @agents do |agent|
  json.person_type           'agent'
  json.id                    agent.id
  json.name                  agent.name
  json.type                  agent.type.name
  json.picture_url           agent.picture_url
  json.thumb_picture_url     agent.thumb_picture_url
  json.big_thumb_picture_url agent.big_thumb_picture_url

  json.partial! 'api/shared/actions', resource: agent
end

json.patients @patients do |patient|
  json.person_type           'patient'
  json.id                    patient.id
  json.name                  patient.name
  json.birth_date            patient.birth_date
  json.age                   patient.age
  json.picture_url           patient.picture_url
  json.thumb_picture_url     patient.thumb_picture_url
  json.big_thumb_picture_url patient.big_thumb_picture_url
  json.latitude              patient.latitude
  json.longitude             patient.longitude

  json.partial! 'api/shared/actions', resource: patient
end
