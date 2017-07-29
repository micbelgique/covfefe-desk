import onClickOutside from 'react-onclickoutside'

class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      search:      "",
      open:        false,
      suggestions: []
    }
  }

  componentDidMount() {
    this.reloadFromBackend()
    this.logoUrl = $('.logo-path').attr('data-logo-path')
  }

  handleClickOutside(evt) {
    this.close()
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

  open() {
    this.setState({
      open: true
    })
  }

  close() {
    this.setState({
      open: false
    })
  }

  filteredSuggestions() {
    return _.filter(this.state.suggestions, (suggestion) => {
      return suggestion.name.toLowerCase().indexOf(this.state.search) > -1
    })
  }

  render() {
    return (
      <div>
        <img className="logo"
             src={this.logoUrl} />

        <input type="search"
               placeholder="Rechercher un patient ou un agent"
               className="search-input"
               value={ this.state.search }
               onChange={ this.updateSearch.bind(this) }
               onFocus={ this.open.bind(this) }
               autoFocus="true" />

        { this.renderSuggestionsContainer() }
      </div>
    )
  }

  renderSuggestionsContainer() {
    if(this.state.open) {
      return (
        <div className="suggestions">
          { this.renderSuggestions() }
        </div>
      )
    }
  }

  renderSuggestions() {
    return _.map(this.filteredSuggestions(), (suggestion, index) => {
      return (
        <div className="suggestion"
             key={index}
             onClick={ this.props.selectPerson.bind(this, suggestion) }>
          <img src={ suggestion.pictureUrl } width="40"/>
          <span>{ suggestion.name }</span>
        </div>
      )
    })
  }
}

export default onClickOutside(Search)
