part of twopi_components;

@Component(
    selector: 'blue-button',
    templateUrl: 'packages/twopi/components/blue-button.html',
    cssUrl: 'packages/twopi/components/blue-button.css',
    publishAs: 'cmp')
class BlueButton {
  @NgAttr('href')
  String href = '';
}