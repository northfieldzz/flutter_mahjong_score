import 'abstract.dart';

class Score {
  final AbstractPoint basePoint;

  /// 勝者が東家か
  final bool? isHost;

  /// 上がり方がツモ
  final bool? isPicked;

  /// 連荘している回数
  final int? consecutivelyCount;

  Score({
    required this.basePoint,
    this.isHost,
    this.isPicked,
    this.consecutivelyCount,
  });

  bool? get isUniform => isHost;

  /// 表示を行うか
  ///
  /// 基底ポイントが200以下の場合は表示しない
  bool get isNotDisplay => basePoint.point <= 200;

  /// ベースとなる点の子と親別の点数
  num get _point => basePoint * (isHost! ? 1.5 : 1);

  /// 合計点数(切り上げ前)
  int get sumPoint => _point * 4 as int;

  /// 合計点数(ロンのときの点数)
  int get point => _ceil(sumPoint);

  /// 親の受け取れる点数
  int get hostPoint => payOtherPoint * 3 + (300 * consecutivelyCount!);

  /// 親の支払い点数(ツモのときの点数)
  int get payHostPoint => _ceil(basePoint * 2) + (100 * consecutivelyCount!);

  /// 子の受け取れる点数
  int get otherPoint {
    return payOtherPoint * 2 + payHostPoint + (300 * consecutivelyCount!);
  }

  /// 子の支払い点数(ツモのときの点数)
  int get payOtherPoint {
    return _ceil(isHost! ? sumPoint / 3 : _point) + (100 * consecutivelyCount!);
  }

  /// 100点以下の点数はすべて切り上げする
  int _ceil(num number) => (number / 100).ceil() * 100;

  /// 表示用
  String toString() {
    var text = point.toString();
    if (basePoint.name != null) {
      text += ' (${basePoint.name})';
    }
    text += '\n${payOtherPoint.toString()}';
    text += isUniform! ? ' All' : '/${payHostPoint.toString()}';
    return text;
  }
}
