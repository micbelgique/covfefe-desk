import Search   from './search.es6'
import Agent    from './agent.es6'
import Patient  from './patient.es6'

class Main extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      currentPerson: undefined
    }
  }

  selectPerson(person) {
    this.setState({
      currentPerson: person
    })
  }

  render() {
    return (
      <div>
        { this.renderSearch()  }
        { this.renderPatient() }
        { this.renderAgent()   }
      </div>
    )
  }

  renderSearch() {
    if(this.state.currentPerson == undefined) {
      return (
        <Search selectPerson={this.selectPerson.bind(this)}/>
      )
    }
  }

  renderPatient() {
    if(this.state.currentPerson && this.state.currentPerson.personType == 'patient') {
      return (
        <Patient patient={this.state.currentPerson} />
      )
    }
  }

  renderAgent() {
    if(this.state.currentPerson && this.state.currentPerson.personType == 'agent') {
      return (
        <Agent agent={this.state.currentPerson} />
      )
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Main />, document.getElementById('main'))
})

