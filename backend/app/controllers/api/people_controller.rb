class Api::PeopleController < Api::BaseController

  def index
    q        = params[:q].to_s
    agents   = Agent.where('agents.name LIKE ?',   "%#{q}%")
    patients = Agent.where('patients.name LIKE ?', "%#{q}%")

  end

end
