import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:local_first/Utility/app_font_style.dart';
import 'package:local_first/Utility/utility_export.dart';

import '../Utility/colors_utility.dart';

class BarChartSample2 extends StatefulWidget {
  String flag;

  BarChartSample2({super.key, required this.flag});

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    var barGroup1;
    var barGroup2;
    var barGroup3;
    var barGroup4;
    var barGroup5;
    var barGroup6;
    var barGroup7;
    if (widget.flag == 'chart1') {
      barGroup1 = makeGroupData(0, 5, 12);
      barGroup2 = makeGroupData(1, 8, 12);
      barGroup3 = makeGroupData(2, 11, 5);
      barGroup4 = makeGroupData(3, 10, 16);
      barGroup5 = makeGroupData(4, 12, 6);
      barGroup6 = makeGroupData(5, 16, 1.5);
      barGroup7 = makeGroupData(6, 10, 1.5);
    } else {
      barGroup1 = makeGroupData(0, 5, 12);
      barGroup2 = makeGroupData(1, 10, 12);
      barGroup3 = makeGroupData(2, 20, 10);
      barGroup4 = makeGroupData(3, 30, 16);
      barGroup5 = makeGroupData(4, 40, 6);
      barGroup6 = makeGroupData(5, 45, 12);
      barGroup7 = makeGroupData(6, 55, 16);
    }

    final items = <BarChartGroupData>[
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: widget.flag == 'chart1' ? EdgeInsets.zero : const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            widget.flag == 'chart1'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '+10.2%',
                        style: AppFontStyle.blackOpenSans16W600.copyWith(color: liteGreen),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'vs Previous Monday',
                        style: AppFontStyle.greyOpenSans12W400,
                      ),
                    ],
                  ).paddingOnly(top: 10, left: 18)
                : const SizedBox(),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: widget.flag == 'chart1' ? 20 : 60,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                              return rod.copyWith(toY: avg, color: colorPrimary);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: widget.flag == 'chart1' ? false : true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: FlGridData(
                    show: widget.flag == 'chart1' ? false : true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(color: offWhite, strokeWidth: 1);
                    },
                  ),
                ),
              ),
            ),
            height14,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: widget.flag == 'chart1' ? darkPurple : litePink,
                          borderRadius: const BorderRadius.all(Radius.circular(100))),
                    ),
                    customWidth(06),
                    Text(
                      widget.flag == 'chart1' ? 'Sell' : 'Deposit',
                      style: AppFontStyle.blackOpenSans12W500,
                    )
                  ],
                ),
                width14,
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: widget.flag == 'chart1' ? orange : darkPurple,
                          borderRadius: const BorderRadius.all(Radius.circular(100))),
                    ),
                    customWidth(06),
                    Text(
                      widget.flag == 'chart1' ? 'Buy' : 'Withdraw',
                      style: AppFontStyle.blackOpenSans12W500,
                    )
                  ],
                ),
              ],
            ),
            height14,
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;
    if (widget.flag == 'chart1') {
      if (value == 0) {
        text = '1K';
      } else if (value == 10) {
        text = '5K';
      } else {
        return Container();
      }
    } else {
      if (value == 0) {
        text = '0';
      } else if (value == 10) {
        text = '100';
      } else if (value == 20) {
        text = '200';
      } else if (value == 30) {
        text = '300';
      } else if (value == 40) {
        text = '400';
      } else if (value == 50) {
        text = '500';
      } else {
        return Container();
      }
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: AppFontStyle.greyOpenSans12W400),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: AppFontStyle.greyOpenSans14W400,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.flag == 'chart1' ? orange : darkPurple,
          width: widget.flag == 'chart1' ? 10 : 7,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.flag == 'chart1' ? darkPurple : litePink,
          width: widget.flag == 'chart1' ? 10 : 7,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
