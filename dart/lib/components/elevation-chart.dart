part of twopi_components;

@Component(
    selector: 'elevation-chart',
    template: '<div id="chart" style="height: 100%; width: 100%"></div>',
    publishAs: 'cmp')
class ElevationChart extends ShadowRootAware {
  var _seriesData = [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4];
  JsObject chart = null;
  
  void onShadowRoot(ShadowRoot shadowRoot) {
    if (chart == null) {
      var theDiv = shadowRoot.querySelector('#chart');
      
      chart = new JsObject(context['Highcharts']['Chart'], [new JsObject.jsify({
        'chart': {
          'renderTo': theDiv,
        },
        'title': {
          'text': 'Elevation profile'
        },
        'yAxis': {
          'title': {
            'text': 'Elevation (m)',
          }
        },
        'xAxis': {
          'title': {
            'text': 'Distance (km)', 
          },
          'allowDecimals': false,
        },
        'series': [{
            'showInLegend': false,
            'type': 'area',
            'data': _seriesData,
        }],
        'plotOptions': {
          'series': {
            'marker': {
              'enabled': false,
            },
            'turboThreshold': 0,
          }
        }
      })]);
    }
  }
}
