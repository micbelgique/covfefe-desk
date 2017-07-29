class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      search:      "",
      suggestions: []
    }
  }

  componentDidMount() {
    this.dUpdateSuggestions = _.debounce(this.updateSuggestions, 300)

    this.updateSuggestions()
  }

  updateSearch(e) {
    this.setState({
      search: e.target.value
    }, this.dUpdateSuggestions)
  }

  updateSuggestions() {
    axios.get('/api/people.json').then((response) => {
      let patients = humps.camelizeKeys(response.data.patients)
      let agents   = humps.camelizeKeys(response.data.agents)

      let suggestions = patients.concat(agents)

      suggestions = _.filter(suggestions, (suggestion) => {
        return suggestion.name.toLowerCase().indexOf(this.state.search) > -1
      })

      this.setState({ suggestions: _.sortBy(suggestions, 'name') })
    })
  }

  render() {
    return (
      <div>
        <input type="search"
               placeholder="Commencez à taper..."
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
    return _.map(this.state.suggestions, (suggestion, index) => {
      return (
        <div className="suggestion"
             key={index}>
          <img src={ suggestion.pictureUrl } width="40"/>
          <span>{ suggestion.name }</span>
        </div>
      )
    })
  }
}

module.exports = Search
