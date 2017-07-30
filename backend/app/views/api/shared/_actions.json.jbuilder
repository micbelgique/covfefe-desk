json.actions resource.actions.order(datetime: :desc) do |action|
  json.datetime action.datetime
  json.type     action.type.name

  json.agent do
    json.name        action.agent.name
    json.picture_url action.agent.picture_url
  end
end
