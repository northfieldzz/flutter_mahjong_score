import 'abstract.dart';

class Score {
  final AbstractPoint abstractPoint;

  /// 勝者が東家か
  final bool isHost;

  /// 上がり方がツモ
  final bool isPicked;

  /// 連荘している回数
  final int noMoreReaderCount;

  Score({
    this.abstractPoint,
    this.isHost,
    this.isPicked,
    this.noMoreReaderCount,
  });

  bool get isUniform => isHost;

  /// 表示を行うか
  ///
  /// 基底ポイントが200以下の場合は表示しない
  bool get isNotDisplay => abstractPoint.point <= 200;

  /// ベースとなる点の子と親別の点数
  num get _point => abstractPoint * (isHost ? 1.5 : 1);

  /// 合計点数(切り上げ前)
  num get sumPoint => _point * 4;

  /// 合計点数(ロンのときの点数)
  num get point => _ceil(sumPoint);

  /// 親の受け取れる点数
  int get hostPoint => payOtherPoint * 3 + (300 * noMoreReaderCount);

  /// 親の支払い点数(ツモのときの点数)
  int get payHostPoint => _ceil(abstractPoint * 2) + (100 * noMoreReaderCount);

  /// 子の受け取れる点数
  int get otherPoint {
    return payOtherPoint * 2 + payHostPoint + (300 * noMoreReaderCount);
  }

  /// 子の支払い点数(ツモのときの点数)
  int get payOtherPoint {
    return _ceil(isHost ? sumPoint / 3 : _point) + (100 * noMoreReaderCount);
  }

  /// 100点以下の点数はすべて切り上げする
  int _ceil(num number) => (number / 100).ceil() * 100;

  /// 表示用
  String toString() {
    var text = point.toString();
    if (abstractPoint.name != null) {
      text += ' (${abstractPoint.name})';
    }
    text += '\n${payOtherPoint.toString()}';
    text += isUniform ? ' All' : '/${payHostPoint.toString()}';
    return text;
  }
}
