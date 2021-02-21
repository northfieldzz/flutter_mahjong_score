/// カスタムポイント抽象クラス
abstract class AbstractPoint {
  /// 名称
  final String name;

  /// 符
  final int hu;

  /// 翻
  final int fan;

  AbstractPoint({this.name, this.hu, this.fan});

  num operator +(num other) => point + other;

  num operator *(num other) => point * other;

  /// 算出される基底ポイント
  num get point;
}
