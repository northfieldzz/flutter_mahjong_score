import 'abstract.dart';

/// 固定ポイント
///
/// 一定の基準を満たし、
/// 符、翻の計算から外れた固定的なポイント
class FixedPoint extends AbstractPoint {
  @override
  final int point;

  FixedPoint({this.point, String name}) : super(name: name);
}

/// 固定値点数
enum FixedPointType {
  /// 満貫
  Mangan,

  /// 跳満
  Haneman,

  /// 倍満
  Baiman,

  /// 三倍満
  Sanbaiman,

  /// 役満
  Yakuman,
}

/// 満貫以上表示点数計算用列列挙拡張
extension FixedPointExtension on FixedPointType {
  static final details = <FixedPointType, FixedPoint>{
    FixedPointType.Mangan: FixedPoint(name: '満貫', point: 2000),
    FixedPointType.Haneman: FixedPoint(name: '跳満', point: 3000),
    FixedPointType.Baiman: FixedPoint(name: '倍満', point: 4000),
    FixedPointType.Sanbaiman: FixedPoint(name: '三倍満', point: 6000),
    FixedPointType.Yakuman: FixedPoint(name: '役満', point: 8000),
  };

  /// 点数
  FixedPoint get detail => details[this];
}
