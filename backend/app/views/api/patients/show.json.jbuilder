json.patient do
  json.name                  @patient.name
  json.birth_date            @patient.birth_date
  json.age                   @patient.age
  json.picture_url           @patient.picture_url
  json.thumb_picture_url     @patient.thumb_picture_url
  json.big_thumb_picture_url @patient.big_thumb_picture_url
end

json.action_types @agent.action_types do |action_type|
  json.id                    action_type.id
  json.name                  action_type.name
  json.picture_url           action_type.picture_url
  json.thumb_picture_url     action_type.thumb_picture_url
  json.big_thumb_picture_url action_type.big_thumb_picture_url
end

json.partial! 'api/shared/actions', resource: @patient
