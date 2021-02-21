import 'dart:math';

import 'abstract.dart';
import 'fixed.dart';

/// 基底ポイント
///
/// 符、翻から求めた点計算の基底となるポイント
class BasePoint extends AbstractPoint {
  BasePoint({int hu, int fan}) : super(hu: hu, fan: fan);

  @override
  num get point {
    var _hu = hu;

    // 平和、七対子の符は切り上げを無視
    if (_hu != 20 && _hu != 25) {
      _hu = (_hu / 10).ceil() * 10;
    }

    // メインの点数計算式
    var _point = _hu * 4 * pow(2, fan);

    // 満貫になる点数は満貫の固定値点数を与える
    if (_point >= 2240) {
      _point = FixedPointType.Mangan.detail.point;
    }

    // 翻で固定値点数になる場合は固定値点数に置き換える
    if (6 <= fan && fan <= 7) {
      _point = FixedPointType.Haneman.detail.point;
    } else if (8 <= fan && fan <= 10) {
      _point = FixedPointType.Baiman.detail.point;
    } else if (11 <= fan && fan <= 12) {
      _point = FixedPointType.Sanbaiman.detail.point;
    } else if (13 <= fan) {
      _point = FixedPointType.Yakuman.detail.point;
    }
    return _point;
  }
}
