part of twopi_components;

@Component(
    selector: 'leaflet-map',
    template: '<div id="mapDiv" style="width: 100%; height: 100%"></div>',
    cssUrl: 'packages/twopi/components/leaflet.css',
    publishAs: 'cmp')
class LeafletMap extends ShadowRootAware {
  void onShadowRoot(ShadowRoot shadowRoot) {
    var leaflet = context['L'];
    var tileLayer = leaflet.callMethod('tileLayer', [
      'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      {
        'attribution': 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors',
        'maxZoom': 18
      }
    ]);
    
    var mapDiv = shadowRoot.querySelector('#mapDiv');
    var map = leaflet.callMethod('map', [mapDiv]);
    map.callMethod('setView', new JsObject.jsify([[51.505, -0.09], 13]));
    tileLayer.callMethod('addTo', [map]);
  }
}