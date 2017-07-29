class Agent extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      photo_url: 'https://i.stack.imgur.com/24jlg.jpg?s=32&g=1',
      name: 'Jeanine',
      type: 'Aidant'
    }
  }

  render() {
    return (
      <div>
        <div className="agent-page">
          <div className="agent-photo">
            <img src={this.state.photo_url} alt="Photo"/>
          </div>
          <div className="agent-details">
            <div className="agent-name">{this.state.name}</div>
            <div className="agent-type">{this.state.type}</div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = Agent
