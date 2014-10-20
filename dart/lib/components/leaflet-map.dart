part of twopi_components;

@Component(
    selector: 'leaflet-map',
    template: '<div id="mapDiv" style="width: 100%; height: 100%"></div>',
    cssUrl: 'packages/twopi/components/leaflet.css',
    publishAs: 'cmp')
class LeafletMap extends ShadowRootAware {
  void onShadowRoot(ShadowRoot shadowRoot) {
    var mapDiv = shadowRoot.querySelector('#mapDiv');
    var map = context['L'].callMethod('map', [mapDiv]);
    map.callMethod('setView', new JsObject.jsify([[51.505, -0.09], 13]));
  }
}