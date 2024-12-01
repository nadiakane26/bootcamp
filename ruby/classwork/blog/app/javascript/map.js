function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 10,
      center: { lat: 0, lng: 0 } // Default center; will be updated
    });
  
    // Use jQuery to fetch the GeoJSON file
    $.getJSON('/landmarks.geojson', function(data) {
        console.log(data)
      const bounds = new google.maps.LatLngBounds(); // To adjust the view to fit all markers
  
      // Loop through each GeoJSON feature
      $.each(data.features, function(index, feature) {
        const coords = feature.geometry.coordinates;
        const marker = new google.maps.Marker({
          position: { lat: coords[1], lng: coords[0] }, // GeoJSON uses [longitude, latitude]
          map: map,
          title: feature.properties.resname 
        });
        bounds.extend(marker.position); // Extend bounds to include each marker
      });
  
      map.fitBounds(bounds); // Adjust map view to show all markers
    })
    .fail(function() {
      console.error('Error loading GeoJSON data');
    });
  }
  
  window.initMap = initMap;
  