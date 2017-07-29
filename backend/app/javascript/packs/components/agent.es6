class Agent extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <div className="back"></div>
        <div className="agent-page">
          <div className="agent-photo">
            <img src={this.props.agent.pictureUrl} alt="Photo"/>
          </div>
          <div className="agent-details">
            <div className="agent-name">{this.props.agent.name}</div>
            <div className="agent-type">{this.props.agent.type}</div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = Agent
