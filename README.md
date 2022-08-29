# mahjong_score
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fnorthfieldzz%2Fflutter_mahjong_score.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fnorthfieldzz%2Fflutter_mahjong_score?ref=badge_shield)


It is a package that calculates the score of Mahjong.
Scores are calculated based on "hu" and "fan".
It should be noted that this package does not distribute points to each player, so you need to implement it yourself.

## Usage

### BasePoint class
‘BasePoint’ is a class that handles the base points of points calculated by ‘hu’ and ‘fan’.

```dart
import 'package:mahjong_score/score.dart';

final basePoint = BasePoint(hu: 30, fan: 4);
```
|Argument|description|
|---|---|
|hu|符点数　int|
|fan|翻点数　int|

### FixedPoint class
‘FixedPoint’ deals with base points such as ‘Mangan’ and ‘Yakuman’ that do not calculate ‘hu’ and ‘fan’.
You can get an instance from the FixedPointType defined in the Enum.

```dart
import 'package:mahjong_score/score.dart';

final fixed = FixedPointType.value;
final mangan = FixedPointType.Mangan.detail;
```

### Score class
The ‘Score’ class is from the calculated base point
We will handle the points to be finally handed over in consideration of the way the game ended.

```dart
import 'package:mahjong_score/score.dart';

final score = Score(
  abstractPoint: basePoint,
  isHost: false,
  isPicked: false,
  consecutivelyConut: 0,
);
```

|Argument|description|
|---|---|
|abstractPoint|Class that inherits abstractPoint|
|isHost|Whether the winner is a parent|
|isPicked|The winner end with'Tsumo'|
|consecutivelyCount|Number of consecutive Hosts|

## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fnorthfieldzz%2Fflutter_mahjong_score.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fnorthfieldzz%2Fflutter_mahjong_score?ref=badge_large)