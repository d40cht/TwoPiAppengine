library twopi;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:twopi/lib.dart';


void twoPiRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'default': ngRoute(
        defaultRoute: true,
        enter: (RouteEnterEvent e) => router.go('splash', {
        }, replace:true)),
    'splash': ngRoute(
        path: '/splash',
        viewHtml: '<splash-screen></splash-screen>'),
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
    
    bind(RouteInitializerFn, toValue : twoPiRouteInitializer);
    bind(NgRoutingUsePushState,  toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  applicationFactory()
    .addModule(new TwoPiDartModule())
    .run();
}