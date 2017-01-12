var Address = React.createClass({

  render() {
    var address = this.props.lat + ', ' + this.props.long
    return (
      <td>{address}</td>
    )
  }
});
