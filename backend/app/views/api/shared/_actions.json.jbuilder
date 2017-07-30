json.actions resource.actions.order(datetime: :desc) do |action|
  json.partial! 'api/shared/action', action: action
end
