class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      search:      "",
      suggestions: []
    }
  }

  componentDidMount() {
    this.reloadFromBackend()
  }

  reloadFromBackend() {
    axios.get('/api/people.json').then((response) => {
      let patients = humps.camelizeKeys(response.data.patients)
      let agents   = humps.camelizeKeys(response.data.agents)

      let suggestions = patients.concat(agents)

      this.setState({ suggestions: _.sortBy(suggestions, 'name') })
    })
  }

  updateSearch(e) {
    this.setState({
      search: e.target.value
    }, this.dUpdateSuggestions)
  }

  filteredSuggestions() {
    return _.filter(this.state.suggestions, (suggestion) => {
      return suggestion.name.toLowerCase().indexOf(this.state.search) > -1
    })
  }

  render() {
    return (
      <div>
        <input type="search"
               placeholder="Rechercher un patient ou un agent"
               className="search-input"
               value={ this.state.search }
               onChange={ this.updateSearch.bind(this) } />

        <div className="suggestions">
          { this.renderSuggestions() }
        </div>
      </div>
    )
  }

  renderSuggestions() {
    return _.map(this.filteredSuggestions(), (suggestion, index) => {
      return (
        <div className="suggestion"
             key={index}>
          <img src={ suggestion.pictureUrl } width="40"/>
          <span onClick={ this.props.selectPerson.bind(this, suggestion) }>{ suggestion.name }</span>
        </div>
      )
    })
  }
}

module.exports = Search
