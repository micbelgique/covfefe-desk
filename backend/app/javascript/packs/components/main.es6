import Search   from './search.es6'
import Agent    from './agent.es6'
import Patient  from './patient.es6'

class Main extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      suggestions:   [],
      currentPerson: undefined
    }
  }

  componentDidMount() {
    this.reloadFromBackend()

    setInterval(this.reloadFromBackend.bind(this), 1000)
  }

  reloadFromBackend() {
    axios.get('/api/people.json').then((response) => {
      let patients = humps.camelizeKeys(response.data.patients)
      let agents   = humps.camelizeKeys(response.data.agents)

      let suggestions = patients.concat(agents)

      this.setState({ suggestions: _.sortBy(suggestions, 'name') }, () => {
        if(this.state.currentPerson) {
          this.selectPersonByIdAndType(this.state.currentPerson.id, this.state.currentPerson.personType)

          // this.setState({
          //   currentPerson: this.state.currentPerson
          // })
        }
      })
    })
  }

  selectPerson(person) {
    this.setState({
      currentPerson: person
    })
  }

  selectPersonByIdAndType(id, type) {
    let person = _.find(this.state.suggestions, (suggestion) => {
      return suggestion.id == id && suggestion.personType == type
    })

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
        <Search suggestions={ this.state.suggestions }
                selectPerson={ this.selectPerson.bind(this) }/>
      )
    }
  }

  renderPatient() {
    if(this.state.currentPerson && this.state.currentPerson.personType == 'patient') {
      return (
        <Patient patient={ this.state.currentPerson }
                 selectPerson={ this.selectPerson.bind(this) }
                 selectPersonByIdAndType={ this.selectPersonByIdAndType.bind(this) } />
      )
    }
  }

  renderAgent() {
    if(this.state.currentPerson && this.state.currentPerson.personType == 'agent') {
      return (
        <Agent agent={ this.state.currentPerson }
               selectPerson={ this.selectPerson.bind(this) }
               selectPersonByIdAndType={ this.selectPersonByIdAndType.bind(this) } />
      )
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Main />, document.getElementById('main'))
})
