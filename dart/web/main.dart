library twopi;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:twopi/page-lib.dart';
import 'package:twopi/component-lib.dart';


void twoPiRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'default': ngRoute(
        defaultRoute: true,
        enter: (RouteEnterEvent e) => router.go('splash', {
        }, replace:true)),
    'splash': ngRoute(
        path: '/splash',
        viewHtml: '<div splash-screen></div>'),
    'routeEdit': ngRoute(
        path: '/routeEdit',
        viewHtml: '<div route-edit-controller></div>'),
    'routeSummary': ngRoute(
        path: '/routeSummary',
        viewHtml: '<div route-summary-controller></div>'),
  });
}

class TwoPiDartModule extends Module {
  TwoPiDartModule() {
    bind(SplashScreenComponent);
    bind(RouteEditController);
    bind(RouteSummaryController);
    
    bind(BlueButton);
    bind(ElevationChart);
    bind(LeafletMap);
    
    bind(RouteInitializerFn, toValue : twoPiRouteInitializer);
    bind(NgRoutingUsePushState,  toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  applicationFactory()
    .addModule(new TwoPiDartModule())
    .run();
}