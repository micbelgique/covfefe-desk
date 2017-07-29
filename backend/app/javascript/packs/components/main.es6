import Search   from './search.es6'
import Agent    from './agent.es6'
import Patient  from './patient.es6'

class Main extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <Search />
        <Patient />
        <Agent />
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Main />, document.getElementById('main'))
})

