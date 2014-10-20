part of twopi_components;

@Component(
    selector: 'summary-data',
    templateUrl: 'packages/twopi/components/summary-data.html',
    cssUrl: 'packages/twopi/components/summary-data.css',
    publishAs: 'cmp')
class SummaryData {
  @NgAttr('title')
  String title;
  
  List<List<String>> data = [
    ['Name', 'Abergavenny 114 k'],
    ['Description', 'Hilly training route'], 
    ['Route type', 'Walking'],
    ['Estimated time', '343 minutes'],
    ['Distance', '114km'],
    ['Ascent', '1607m'],
  ];
}