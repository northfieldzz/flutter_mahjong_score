import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base.dart';
import 'fixed.dart';
import 'score.dart';

class PointSelector extends StatelessWidget {
  final bool isHost;
  final bool isPicked;
  final int noMoreReaderCount;
  final List<int> hus = [20, 25, 30, 40, 50, 60, 70];
  final List<int> hons = [1, 2, 3, 4];
  final List<int> specialHans = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  PointSelector({
    this.isHost,
    this.isPicked,
    this.noMoreReaderCount,
  });

  String get playerGrade => isHost ? '親' : '子';

  String get finishMethod => isPicked ? 'ツモ' : 'ロン';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Point')),
      body: Column(
        children: [
          Text('$playerGrade  $finishMethod'),
          MahjongPointTable(
            isHost: isHost,
            isPicked: isPicked,
            noMoreReaderCount: noMoreReaderCount,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: FixedPointType.values.length,
              itemBuilder: (context, i) {
                final score = Score(
                  abstractPoint: FixedPointType.values[i].detail,
                  isHost: isHost,
                  isPicked: isPicked,
                  noMoreReaderCount: noMoreReaderCount,
                );
                return ListTile(
                  title: Text(score.toString()),
                  onTap: () => Navigator.pop(context, score),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MahjongPointTable extends StatelessWidget {
  final bool isHost;
  final bool isPicked;
  final int noMoreReaderCount;
  final List<int> hus = [20, 25, 30, 40, 50, 60, 70];
  final List<int> fans = [1, 2, 3, 4];
  final List<int> specialHans = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  MahjongPointTable({
    this.isHost,
    this.isPicked,
    this.noMoreReaderCount,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            _buildHeaderCell('符\\翻'),
            ...List.generate(
              fans.length,
              (i) => _buildHeaderCell('${fans[i].toString()}'),
            ),
          ],
        ),
        ...List.generate(hus.length, (index) {
          final hu = hus[index];
          return TableRow(
            children: [
              _buildBodyCell('$hu'),
              ...List.generate(fans.length, (index) {
                final score = Score(
                  abstractPoint: BasePoint(hu: hu, fan: fans[index]),
                  isHost: isHost,
                  isPicked: isPicked,
                  noMoreReaderCount: noMoreReaderCount,
                );
                if (score.isNotDisplay) {
                  return Container();
                }
                return GestureDetector(
                  child: _buildBodyCell(score.toString()),
                  onTap: () => Navigator.pop(context, score),
                );
              }),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildHeaderCell(String label) {
    return Container(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: Center(child: Text(label, textAlign: TextAlign.center)),
    );
  }

  Widget _buildBodyCell(String label) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Center(child: Text(label, textAlign: TextAlign.center)),
    );
  }
}
