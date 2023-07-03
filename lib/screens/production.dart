import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductionVolumePage extends StatefulWidget {
  ProductionVolumePage({super.key});

  @override
  State<ProductionVolumePage> createState() => _ProductionVolumePageState();
}

class _ProductionVolumePageState extends State<ProductionVolumePage> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

  final List<ChartData> chartData = [
    ChartData('Tank 1', 34, Colors.blue),
    ChartData('Tank 2', 37, Colors.green),
    ChartData('Tank 3', 56, Colors.red),
    ChartData('Tank 4', 62, Colors.deepOrange),
    ChartData(
      'Tank 5',
      44, Colors.brown
    )
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _selectionBehavior = SelectionBehavior(
        // Enables the selection
        enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Production Volumes'),
      ),
      body: Center(
        child: Container(
          height: 550,
          width: 340,
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              // backgroundColor: Colors.grey
            ),
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Tank Percentage %'),
            // Enables the tooltip for all the series in chart
            tooltipBehavior: _tooltipBehavior,
            enableAxisAnimation: true,
            // loadMoreIndicatorBuilder:
            //     (BuildContext context, ChartSwipeDirection direction) =>
            //         getLoadMoreViewBuilder(context, direction),
            series: <ChartSeries<ChartData, String>>[
              ColumnSeries(
                markerSettings: MarkerSettings(isVisible: true),
                dataLabelSettings: DataLabelSettings(isVisible: true,
                useSeriesColor: true,
                labelAlignment: ChartDataLabelAlignment.top,
                
                ),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => data.x,
                pointColorMapper: (ChartData data, _) => data.color,
                selectionBehavior: _selectionBehavior
              )
            ],
          ),
        ),
      ),
    );
  }

//   Widget getLoadMoreViewBuilder(
//       BuildContext context, ChartSwipeDirection direction) {
//     if (direction == ChartSwipeDirection.end) {
//       return FutureBuilder<String>(
//         future: _updateData(),

//         /// Adding data by updateDataSource method
//         builder: (BuildContext futureContext, AsyncSnapshot<String> snapShot) {
//           return snapShot.connectionState != ConnectionState.done
//               ? const CircularProgressIndicator()
//               : SizedBox.fromSize(size: Size.zero);
//         },
//       );
//     } else {
//       return SizedBox.fromSize(size: Size.zero);
//     }
//   }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
