class Actions extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div className="actions">
        { this.renderActions() }
      </div>
    )
  }

  renderActions() {
    return _.map(this.props.actions, (action, index) => {
      let type   = action.patient.id == this.props.person.id ? 'agent' : 'patient'
      let target = action[type]

      return (
        <div className="action"
             key={index}
             onClick={ this.props.selectPersonByIdAndType.bind(this, target.id, type) }>
          <div className="media">
            <div className="media-left">
              <img src={ target.thumbPictureUrl } />
            </div>

            <div className="media-body">
              <h4 className="media-heading">
                { action.agent.name } <em>({ action.agent.type })</em>
              </h4>

              <div className="media-content">
                <strong>{ action.type }</strong> pour { action.patient.name }
              </div>

              <div className="date" title={ moment(action.datetime).format('lll') }>
                { moment(action.datetime).fromNow() }
              </div>
            </div>
          </div>
        </div>
      )
    })
  }
}

export default Actions
