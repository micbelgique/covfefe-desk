class Api::PatientsController < Api::BaseController

  def show
    @agent = Agent.find_by_device_id(params[:device_id])

    if @agent
      @patient = Patient.find_by_code(params[:id])

      unless @patient
        render_error('Could not find patient with code.')
      end
    else
      render_error('Could not find agent with device_id.')
    end
  end

end
