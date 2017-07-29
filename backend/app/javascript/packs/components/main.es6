import Search   from './search.es6'
import Agent    from './agent.es6'
import Patient  from './patient.es6'

class Main extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      page: "search"
    }
  }

  changePage(newPage) {
    this.setState({
      page: newPage
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
    if(this.state.page == 'search') {
      return (
        <Search changePage={this.changePage.bind(this)}/>
      )
    }
  }

  renderPatient() {
    if(this.state.page == 'patient') {
      return (
        <Patient />
      )
    }
  }

  renderAgent() {
    if(this.state.page == 'agent') {
      return (
        <Agent />
      )
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Main />, document.getElementById('main'))
})

