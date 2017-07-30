import Actions from './actions.es6'

class Patient extends React.Component {
  constructor(props) {
    super(props)

    this.state = {}
  }

  render() {
    return (
      <div className="animated bounceInRight">
        <div className="back"
             onClick={ this.props.selectPerson.bind(this, undefined) }>
          &times;
        </div>
        <div className="patient-page">
          <div className="patient-photo">
            <img src={this.props.patient.bigThumbPictureUrl} alt="Photo"/>
          </div>
          <div className="patient-details text-center">
            <div className="patient-name">{this.props.patient.name}</div>
            <div className="patient-age">{this.props.patient.age}</div>
          </div>

          <Actions person={ this.props.patient }
                   actions={ this.props.patient.actions }
                   selectPersonByIdAndType={ this.props.selectPersonByIdAndType } />
        </div>
      </div>
    )
  }
}

export default Patient
