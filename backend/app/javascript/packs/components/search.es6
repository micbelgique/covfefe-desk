import onClickOutside from 'react-onclickoutside'

class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      search: "",
      open:   false,
    }
  }

  componentDidMount() {
    this.logoUrl = $('.logo-path').attr('data-logo-path')
  }

  handleClickOutside(evt) {
    this.close()
  }

  updateSearch(e) {
    this.setState({
      search: e.target.value
    })
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
    return _.filter(this.props.suggestions, (suggestion) => {
      return suggestion.name.toLowerCase().indexOf(this.state.search) > -1
    })
  }

  render() {
    return (
      <div>
        <img className="logo"
             width="420"
             height="214"
             src={this.logoUrl} />

        <input type="search"
               placeholder="Rechercher un patient ou un agent"
               className="search-input"
               value={ this.state.search }
               onChange={ this.updateSearch.bind(this) }
               onFocus={ this.open.bind(this) } />

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
          <img src={ suggestion.thumbPictureUrl } />
          <span>{ suggestion.name }</span>
        </div>
      )
    })
  }
}

export default onClickOutside(Search)
