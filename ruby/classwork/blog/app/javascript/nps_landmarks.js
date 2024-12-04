async function initMap() {
  // Request needed libraries
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  // Center of the map
  const position = { lat: 46.257640, lng:  -94.635031 };
  
  // Initialize the map
  const map = new Map(document.getElementById("map"), {
    zoom: 6.25,
    center: position,
    mapId: "landmarks",
  });

  // Load GeoJSON data
  map.data.loadGeoJson("landmarks.geojson");
  map.data.setStyle({ visible: false }); 

  // Add event listener for when GeoJSON data is loaded
  map.data.addListener("addfeature", function (event) {
    // Create a div element for the red dot inside the event listener
    const redDot = document.createElement("div");
    redDot.style.width = "10px";
    redDot.style.height = "10px";
    redDot.style.backgroundColor = "red";
    redDot.style.borderRadius = "50%";  // Makes it a circle
    redDot.style.border = "1px solid white"; // Optional: white border for visibility
    redDot.style.boxShadow = "0 0 5px rgba(0, 0, 0, 0.5)"; // Optional: shadow for depth

    // Create a marker using the custom red dot
    const marker = new AdvancedMarkerElement({
      position: event.feature.getGeometry().get(),
      map: map,
      content: redDot  
    });

    // Optional: Add an animation or effect
    redDot.style.opacity = ".2";
    setTimeout(() => {
      redDot.style.transition = "opacity 2s";
      redDot.style.opacity = "1";
    }, 100); // Delay for animation effect
  });

  // Add a button to reset the example
  const controlDiv = document.createElement("div");
  const controlUI = document.createElement("button");

  controlUI.classList.add("ui-button");
  controlUI.innerText = "Reset the example";
  controlUI.addEventListener("click", () => {
    refreshMap();
  });
  controlDiv.appendChild(controlUI);
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(controlDiv);
}

function refreshMap() {
  // Refresh the map
  const mapContainer = document.getElementById("mapContainer");
  const map = document.getElementById("map");

  map.remove();

  const mapDiv = document.createElement("div");
  mapDiv.id = "map";
  mapContainer.appendChild(mapDiv);
  initMap();
}

initMap();
