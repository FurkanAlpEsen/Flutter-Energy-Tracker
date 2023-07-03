import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<ChartData> chartData = [
    ChartData('Generator 1', 25),
    ChartData('Generator 2', 31 ),
    ChartData('Generator 3', 34 ),
    ChartData('Others', 10)
  ];

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Container(
          child: SfCircularChart(
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap,),
            title: ChartTitle(text: 'All production generator volumes'),
              // Enables the tooltip for all the series in chart
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                // Initialize line series
                PieSeries<ChartData, String>(
                  dataLabelSettings: DataLabelSettings(isVisible : true),
                    // Enables the tooltip for individual series
                    enableTooltip: true,
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    // pointColorMapper: (ChartData data, _) => data.color, 
                    ),
              ]),
              
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y );
  final String x;
  final double y;
  // final Color color;
}
