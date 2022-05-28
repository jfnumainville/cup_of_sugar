import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
      console.log('Hello 1');
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb"
    });


    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //     mapboxgl: mapboxgl }))

    this._addMarkersToMap()
    this._fitMapToMarkers()
  }


  _addMarkersToMap() {
    // this.markersValue.forEach((marker) => {
    //     const popup = new mapboxgl.Popup().setHTML(marker.info_window)
    //     console.log(marker);

    //     // Create a HTML element for your custom marker
    //     const customMarker = document.createElement("div")
    //     customMarker.className = "marker"
    //     customMarker.style.backgroundImage = `url('${marker.image_url}')`
    //     customMarker.style.backgroundSize = "contain"
    //     customMarker.style.width = "25px"
    //     customMarker.style.height = "25px"

    //     // Pass the element as an argument to the new marker
    //     new mapboxgl.Marker(customMarker)
    //       .setLngLat([marker.lng, marker.lat])
    //       .setPopup(popup)
    //       .addTo(this.map)
    //   })

    this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      });
  }

  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 })
  }

}
