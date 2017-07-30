json.actions resource.actions.order(datetime: :desc) do |action|
  json.datetime action.datetime
  json.type     action.type.name
  json.picture_url           action.type.picture_url
  json.thumb_picture_url     action.type.thumb_picture_url
  json.big_thumb_picture_url action.type.big_thumb_picture_url

  json.agent do
    json.name                  action.agent.name
    json.type                  action.agent.type.name
    json.picture_url           action.agent.picture_url
    json.thumb_picture_url     action.agent.thumb_picture_url
    json.big_thumb_picture_url action.agent.big_thumb_picture_url
  end

  json.patient do
    json.name                  action.patient.name
    json.picture_url           action.patient.picture_url
    json.thumb_picture_url     action.patient.thumb_picture_url
    json.big_thumb_picture_url action.patient.big_thumb_picture_url
  end
end
