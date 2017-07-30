class Patient extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div>
        <div className="back"
             onClick={ this.props.selectPerson.bind(this, undefined) }>
            &larr;
        </div>
        <div className="patient-page">
          <div className="patient-photo">
            <img src={this.props.patient.bigThumbPictureUrl} alt="Photo"/>
          </div>
          <div className="patient-details text-center">
            <div className="patient-name">{this.props.patient.name}</div>
            <div className="patient-age">{this.props.patient.age}</div>
          </div>
        </div>
      </div>
    )
  }
}

module.exports = Patient
