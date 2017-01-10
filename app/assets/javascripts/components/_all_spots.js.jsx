var AllSpots = React.createClass ({
  render() {
    var spots = this.props.spots.map((spot) => {
      return(
        <tr key={spot.id} id="spot">
          <Spot spot={spot}/>
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
