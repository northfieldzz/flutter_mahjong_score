/// カスタムポイント抽象クラス
abstract class AbstractPoint {
  /// 名称
  final String? name;

  AbstractPoint({this.name});

  num operator +(num other) => point + other;

  num operator *(num other) => point * other;

  /// 算出される基底ポイント
  int get point => 0;
}
