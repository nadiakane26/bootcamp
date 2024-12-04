async function initMap() {
    // Request needed libraries.
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");
  
    // Center of the map
    const position = { lat: 46.257640, lng: -93.0900 };
    
    // Initialize the map
    const map = new Map(document.getElementById("map"), {
      zoom: 6.25,
      center: position,
      mapId: "landmarks",
    });
  
    // Drop Animation
    const intersectionObserver = new IntersectionObserver((entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add("drop"); 
          intersectionObserver.unobserve(entry.target);
        }
      }
    });
  
      // Load GeoJSON data
      map.data.loadGeoJson("landmarks.geojson");
      map.data.setStyle({ visible: false }); 
  
    // Add event listener for when GeoJSON data is loaded
    map.data.addListener("addfeature", function (event) {
      const advancedMarker = new AdvancedMarkerElement({
        position: event.feature.getGeometry().get(),
        map: map,
      });
  
      // Optionally, set content or additional behavior for each marker
      const content = advancedMarker.content;
      
      content.style.opacity = "0"; // Start with opacity 0 for the marker
      content.addEventListener("animationend", (event) => {
        content.classList.remove("drop"); // Remove 'drop' class after animation ends
        content.style.opacity = "1"; // Ensure marker is fully visible after animation
      });
  
      // Delay animation
      const time = 2 + Math.random(); 
      content.style.setProperty("--delay-time", time + "s");
      // Start observing the content element for intersection visibility
      intersectionObserver.observe(content);
    });
  
    // Add a button to reset the example
    const controlDiv = document.createElement("div");
    const controlUI = document.createElement("button");
  
    controlUI.classList.add("ui-button");
    controlUI.innerText = "Reset the example";
    controlUI.addEventListener("click", () => {
      // Reset the example by reloading the map iframe
      refreshMap();
    });
    controlDiv.appendChild(controlUI);
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(controlDiv);
  }
  
  function refreshMap() {
    // Refresh the map.
    const mapContainer = document.getElementById("map-container");
    const map = document.getElementById("map");
  
    map.remove();
  
    const mapDiv = document.createElement("div");
    mapDiv.id = "map";
    mapContainer.appendChild(mapDiv);
    initMap();
  }
  
  initMap();
  