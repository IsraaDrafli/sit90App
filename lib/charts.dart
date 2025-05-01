import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'logic.dart';

class ChartsPage extends StatelessWidget {
  final PostureController controller = Get.put(PostureController());

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 19, left: 19, right: 19),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeWidg(),
                  Row(
                    children: [
                      Text(
                        'Statistics',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Spacer()
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFBCEBFF), theblue],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Weekly Progress',
                                maxLines: 2,
                                style: GoogleFonts.overpass(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                              Text(
                                'Your weekly report',
                                maxLines: 2,
                                style: GoogleFonts.overpass(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        CircularProgress(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TodayStatus(
                          "Today's Posture Status",
                          Text(
                            controller.postureStatement1.value,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: controller.StatmentColor()),
                          ),
                          Text(
                            controller.postureStatement2.value,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(118, 41, 217, 1)),
                          ),
                          Color.fromRGBO(197, 186, 255, 1),
                          controller.StatmentIcon()),
                      Spacer(),
                      TodayStatus(
                        'Total Time Worn Today',
                        Text(
                          "${controller.formatMinutes(controller.todayTotalMinutes.value)}",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              color: Color.fromRGBO(118, 41, 217, 1),
                            ),
                            Text(
                              '+3.9%',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(118, 41, 217, 1)),
                            )
                          ],
                        ),
                        Color.fromRGBO(196, 217, 255, 1),
                        Icon(
                          Icons.watch_later_outlined,
                          size: 31,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 188, 185, 185),
                              blurRadius: 1,
                              spreadRadius: 1)
                        ],
                        color: Colors.white,
                      ),
                      child: Chart()),
                  SizedBox(
                    height: 19,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

class CircularProgress extends StatelessWidget {
  final PostureController postureController = Get.put(PostureController());

  CircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      reverse: true,
      radius: 49.0,
      lineWidth: 13.0,
      animation: true,
      animationDuration: 1500,
      percent: postureController.weeklyGoodPercentage.value / 100,
      center: Text(
        "${postureController.weeklyGoodPercentage.value.toInt()}%",
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 17, color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey.shade300,
      progressColor: Colors.white,
    );
  }
}

class Chart extends StatelessWidget {
  final PostureController postureController = Get.put(PostureController());

  Chart({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateFormat.EEEE().format(DateTime.now());
    final List<ChartData> chartData =
        postureController.dailyGoodMinutes.entries.map((entry) {
      final isToday = entry.key.toLowerCase() == today.toLowerCase();
      return ChartData(entry.key, entry.value, isToday);
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.89,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            final label = details.text;
            final isTodayLabel = label.toLowerCase() == today.toLowerCase();
            return ChartAxisLabel(
              label,
              TextStyle(
                fontWeight: isTodayLabel ? FontWeight.bold : FontWeight.normal,
                color: isTodayLabel
                    ? Color.fromRGBO(69, 68, 89, 1)
                    : Color.fromRGBO(176, 159, 255, 1),
              ),
            );
          },
        ),
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            borderWidth: 1,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.value,
            pointColorMapper: (ChartData data, _) => data.istoday
                ? Color.fromARGB(255, 131, 109, 242)
                : Color.fromRGBO(184, 169, 250, 1),
            borderRadius: BorderRadius.circular(10),
            width: 0.5,
            spacing: 0.2,
          ),
        ],
      ),
    );
  }
} 
class ChartData {
  final String day;
  final int value;
  final bool istoday;

  ChartData(this.day, this.value, this.istoday);
}

class TodayStatus extends StatelessWidget {
  final String txt1;
  final Widget txt2;
  final Widget last;
  final Color color;
  final Widget icon;
  TodayStatus(this.txt1, this.txt2, this.last, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.all(14),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.08,
                child: Text(
                  maxLines: 3,
                  txt1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              icon
            ],
          ),
          SizedBox(
            height: 11,
          ),
          txt2,
          last,
        ],
      ),
    );
  }
}
