var AllSpots = React.createClass ({
  available(taken) {
    if (taken == true) {
      return("Taken");
    } else {
      return("Available");
    }
  },
  render() {
    var spots = this.props.spots.map((spot) => {
      return(
        <tr key={spot.spot.id}>
          <Name name={spot.lot.name} />
          <SpotNumber spotNumber={spot.spot.number} />
          <Address  lat={spot.lot.lat}
                    long={spot.lot.long} />
          <Taken  taken={spot.spot.taken}
                  available={this.available} />
        </tr>
      )
    });
    return(
      <tbody>
        {spots}
      </tbody>
    )
  }
})
