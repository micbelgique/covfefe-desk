class Api::PeopleController < Api::BaseController

  def index
    @agents   = Agent.order(:name)
    @patients = Patient.order(:name)
  end

end
