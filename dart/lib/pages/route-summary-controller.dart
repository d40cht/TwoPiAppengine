part of twopi_controller;

class Route {
}

@Component(
    selector: '[route-summary-controller]',
    templateUrl: 'packages/twopi/pages/route-summary-controller.html',
    cssUrl: 'packages/twopi/pages/route-summary-controller.css',
    publishAs: 'ctrl')
class RouteSummaryController {
  final Http _http;
  
  List<String> foos = ["one", "two", "three"];
  Route route;
  
  RouteSummaryController(this._http) {
    _loadData();
  }
  
  void _loadData() {
    _http.get('data/route1.json')
      .then((HttpResponse response) {
        route = response.data.map((d) => new Route.fromJson(d)).toList();
    });
  }
}