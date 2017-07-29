json.agents @agents do |agent|
  json.id   agent.id
  json.name agent.name
end

json.patients @patients do |patient|
  json.id   patient.id
  json.name patient.name
end
