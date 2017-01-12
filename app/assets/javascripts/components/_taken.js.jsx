var Taken = React.createClass({

  render() {
    var taken = this.props.available(this.props.taken)
    return (
      <td>{taken.toString()}</td>
    )
  }
});
