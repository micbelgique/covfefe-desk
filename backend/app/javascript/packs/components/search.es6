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
  }

  updateSearch(e) {
    this.setState({
      search: e.target.value
    }, this.dUpdateSuggestions)
  }

  updateSuggestions() {

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
    return _.map(this.props.suggestions, (suggestion, index) => {
      return (
        <div className="suggestion"
             key={index}>
          <img src={ suggestion.pictureUrl }/>
          <h3>{ suggestion.name }</h3>
        </div>
      )
    })
  }
}

module.exports = Search
