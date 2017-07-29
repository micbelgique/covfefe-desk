class Search extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <input type="search" placeholder="Commencez à taper..." class="search-input" />
      </div>
    )
  }
}

module.exports = Search
