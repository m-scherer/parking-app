var GMap = React.createClass({
  componentDidMount() {
    this.map = this.createMap();
  },

  createMap: function() {
    var mapOptions = {
      zoom: 13,
      center: { lat: 39.7466999, lng: -104.9878364 }
    }
    return new google.maps.Map(this.refs.map, mapOptions);
  },

  createMarker: function(lot) {
    var bounds = new google.maps.LatLngBounds();
    var markerOptions = {
      position: new google.maps.LatLng(lot.lat, lot.long),
      map: this.map
    }
    return new google.maps.Marker(markerOptions);
  },
  createListener: function(marker, lot) {
    var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', (function (marker, lot) {
        return function () {
            infowindow.setContent("Name: " + lot.name);
            infowindow.open(this.map, marker);
        }
    })(marker, lot));
  },

  render(){
    const divStyle = {
      height: '500px',
      width: 'auto'
    }
    var bounds = new google.maps.LatLngBounds();
    var spots = this.props.spots.map((spot) => {
      this.createListener(this.createMarker(spot.lot), spot.lot)
    });
    return(
      <div>
        <div id="map" ref='map' style={divStyle}>map</div>
      </div>
    )
  }
});
