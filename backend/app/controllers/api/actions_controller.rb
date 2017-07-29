class Api::ActionsController < Api::BaseController

  def create
    @agent = Agent.find_by_device_id(params[:device_id])

    if @agent
      @patient = Patient.find_by_code(params[:id])

      if @patient
        @action_type = @agent.action_types.find(params[:action_type_id])

        if @action_type
          @patient.actions.create!({
            agent:    agent,
            type:     action_type,
            datetime: Time.now
          })
        else
          render_error('Unknown action type.')
        end
      else
        render_error('Could not find patient with code.')
      end
    else
      render_error('Could not find agent with device_id.')
    end
  end

end
