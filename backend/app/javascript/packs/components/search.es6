class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      search: ""
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
        </div>
      </div>
    )
  }
}

module.exports = Search
