import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String, placeholder: String }

  static targets = ["address", "addressWrapper", "latitude", "longitude"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      placeholder: this.placeholderValue,
    });

    this.geocoder.addTo(this.addressWrapperTarget);
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #setInputValue(event) {
    console.log(event.result);
    console.log(event.result.geometry.coordinates[1]);
    console.log(this.latitudeTarget);
    this.addressTarget.value = event.result["place_name"];
    this.latitudeTarget.value = event.result.geometry.coordinates[1];
    this.longitudeTarget.value = event.result.geometry.coordinates[0];
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
