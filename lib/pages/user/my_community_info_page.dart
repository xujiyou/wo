import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linli/plugins/charts/charts.dart';

class MyCommunityInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCommunityInfoPageState();
}

class _MyCommunityInfoPageState extends State<MyCommunityInfoPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          SizedBox(height: 36.0,),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.chevron_left),
              ),
              SizedBox(width: 12.0),
              Container(
                child: Text("国韵村", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti")),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.4))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("物业公司：", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
                SizedBox(height: 4.0),
                Text("某某物业公司", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 12.0),
              ],
            )
          ),
          SizedBox(height: 20.0),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.4))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("物业公司电话：", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
                  SizedBox(height: 4.0),
                  Text("86-123456，86-654321，86-987654", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 12.0),
                ],
              )
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: theme.dividerColor, width: 0.4))
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("栋数", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
                        SizedBox(height: 4.0),
                        Text("12", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0,),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("户数", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
                        SizedBox(height: 4.0),
                        Text("7000", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.0,),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("建成时间", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
                        SizedBox(height: 4.0),
                        Text("2019-10-12", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("入住率", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
          ),
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.width - 64) * 0.66,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: SfCircularChart(
              legend: Legend(isVisible: true),
              series: getPieSeries(true),
            )
          ),
          SizedBox(height: 12.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            height: 0.4,
            color: theme.dividerColor,
          ),

          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("房价趋势", style: TextStyle(color: theme.dividerColor, fontSize: 14.0),),
          ),
          SizedBox(height: 12.0),
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: SfCartesianChart(
                legend: Legend(isVisible: false),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  dateFormat: DateFormat("yyyy-MM"),
                  title: AxisTitle(text: '日期'),
                ),
                primaryYAxis: NumericAxis(
                    title: AxisTitle(text: '价格(单位：万元)'),
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(size: 0)),
                series: getLineSeries(true),
                tooltipBehavior: TooltipBehavior(enable: true),
              )
          ),
          SizedBox(height: 12.0),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  List<PieSeries<_PieData, String>> getPieSeries(bool isTileView) {
    final List<_PieData> pieData = <_PieData>[
      _PieData('已入住', 60, '已入住 \n 60%'),
      _PieData('未入住', 40, '未入住 \n 40%'),
    ];
    return <PieSeries<_PieData, String>>[
      PieSeries<_PieData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: pieData,
          xValueMapper: (_PieData data, _) => data.xData,
          yValueMapper: (_PieData data, _) => data.yData,
          dataLabelMapper: (_PieData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: DataLabelSettings(isVisible: true)),
    ];
  }

  List<LineSeries<_ChartNumeric, DateTime>> getLineSeries(bool isTileView) {
    final List<_ChartNumeric> chartData = <_ChartNumeric>[
      _ChartNumeric(DateTime(2018, 3, 0, 0, 0), 1.1),
      _ChartNumeric(DateTime(2018, 4, 0, 0, 0), 1.2),
      _ChartNumeric(DateTime(2018, 5, 0, 0, 0), 1.3),
      _ChartNumeric(DateTime(2018, 6, 0, 0, 0), 1.4),
      _ChartNumeric(DateTime(2018, 7, 0, 0, 0), 1.5),
      _ChartNumeric(DateTime(2018, 8, 0, 0, 0), 1.6),
      _ChartNumeric(DateTime(2018, 9, 0, 0, 0), 1.7),
    ];
    return <LineSeries<_ChartNumeric, DateTime>>[
      LineSeries<_ChartNumeric, DateTime>(
        dataSource: chartData,
        xValueMapper: (_ChartNumeric sales, _) => sales.x,
        yValueMapper: (_ChartNumeric sales, _) => sales.y1,
        width: 2,
        name: '房价',
        markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.pentagon),
      ),
    ];
  }

}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}

class _ChartNumeric {
  _ChartNumeric(this.x, this.y1);
  final DateTime x;
  final double y1;
}