var Table = React.createClass ({
  getInitialState() {
    return { spots: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/spots.json', (response) => { this.setState({ spots: response }) });
  },

  render() {
    return(
      <div className="container-fluid" id="table">
        <table className="table table-condensed">
          <thead className="text-center">
            <tr>
              <th>Lot</th>
              <th>Spot Number</th>
              <th>Address</th>
              <th>Availability</th>
            </tr>
          </thead>
            <AllSpots spots={this.state.spots}/>
        </table>
      </div>
    )
  }
});
