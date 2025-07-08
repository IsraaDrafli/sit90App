import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class PostureController extends GetxController {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  var weeklyGoodPercentage = 0.0.obs;
  var loading = true.obs;
  var dailyGoodMinutes = <String, int>{}.obs;
  var postureStatement1 = ''.obs;
  var postureStatement2 = ''.obs;
  var todayTotalMinutes = 0.obs;
  var todayGoodMinutes = 0.obs;
  var yesterdayTotalMin = 0.obs;
  var todayGoodPercentage = 0.0.obs;
  var todayesterdayPercentage = 0.0.obs;
  bool up = true;
  Timer? _timer;

  Future<void> fetchWeeklyProgress() async {
    int totalMinutesInWeek = 0;
    int goodMinutesInWeek = 0;

    dailyGoodMinutes.clear();

    DateTime now = DateTime.now();
    int currentWeekday = now.weekday; // 1=Monday, 7=Sunday
    DateTime startOfWeek =
        now.subtract(Duration(days: currentWeekday % 7)); // Sunday

    String userId = "user123";

    for (int i = 0; i < 7; i++) {
      DateTime day = startOfWeek.add(Duration(days: i));
      String dateKey = DateFormat('yyyy-MM-dd').format(day);
      String dayName = DateFormat('EEE').format(day); // Mon, Tue, etc.
      int goodMinutes = 0;

      final daySnapshot = await _database.child('users/$userId/$dateKey').get();

      if (daySnapshot.exists) {
        for (final timeEntry in daySnapshot.children) {
          totalMinutesInWeek++;
          if (timeEntry.value == 'good') {
            goodMinutesInWeek++;
            goodMinutes++;
          }
        }
      }

      dailyGoodMinutes[dayName] = goodMinutes;

      // Only count days from Sunday up to today
      if (day.isAfter(now)) {
        dailyGoodMinutes[dayName] = 0;
        continue;
      }
    }

    if (totalMinutesInWeek > 0) {
      weeklyGoodPercentage.value =
          (goodMinutesInWeek / totalMinutesInWeek) * 100;
    } else {
      weeklyGoodPercentage.value = 0.0;
    }

    await fetchTodayData(userId);

    loading.value = false;
  }

  Future<void> fetchTodayData(String userId) async {
    DateTime now = DateTime.now();
    String todayKey = DateFormat('yyyy-MM-dd').format(now);
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    String yesterdayKey = DateFormat('yyyy-MM-dd').format(yesterday);

    todayGoodMinutes.value = 0;
    final yesterdaySnapshot =
        await _database.child('users/$userId/$yesterdayKey').get();
    final todaySnapshot =
        await _database.child('users/$userId/$todayKey').get();

    if (todaySnapshot.exists) {
      for (final timeEntry in todaySnapshot.children) {
        todayTotalMinutes++;
        if (timeEntry.value == 'good') {
          todayGoodMinutes++;
        }
      }
    }
    if (yesterdaySnapshot.exists) {
      for (final timeEntry in yesterdaySnapshot.children) {
        yesterdayTotalMin++;
      }
    }
    if (yesterdayTotalMin > 0) {
      if (todayTotalMinutes.value >= yesterdayTotalMin.value) {
        todayesterdayPercentage.value = double.parse(
          ((yesterdayTotalMin.value / todayTotalMinutes.value) * 100)
              .toStringAsFixed(2),
        );
        up = true;
      } else {
        todayesterdayPercentage.value = double.parse(
          ((todayTotalMinutes.value / yesterdayTotalMin.value) * 100)
              .toStringAsFixed(2),
        );
        up = false;
      }
    } else {
      todayesterdayPercentage.value = 0;
    }

    if (todayTotalMinutes.value > 0) {
      todayGoodPercentage.value =
          (todayGoodMinutes.value / todayTotalMinutes.value) * 100;
    } else {
      todayGoodPercentage.value = 0.0;
    }

    // Statement
    if (todayGoodPercentage.value > 60.0) {
      postureStatement1.value = "Good";
      postureStatement2.value = "Keep it up!";
    } else if (todayGoodPercentage.value >= 40.0) {
      postureStatement1.value = "Fair";
      postureStatement2.value = "Stay Focused!";
    } else {
      postureStatement1.value = "Poor";
      postureStatement2.value = "You got this!";
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchWeeklyProgress();
    // Auto-refresh every 60 seconds
    _timer = Timer.periodic(Duration(seconds: 60), (timer) {
      fetchWeeklyProgress();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String formatMinutes(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return "${hours}h ${minutes}min";
  }

  Color StatmentColor() {
    if (todayGoodPercentage.value > 60.0) {
      return Colors.white; // Good posture
    } else if (40.0 <= todayGoodPercentage.value) {
      return Color.fromRGBO(151, 71, 255, 1);
    } else {
      return Colors.red; // Bad posture
    }
  }

  IconData UpDownIcon() {
    if (up) {
      return Icons.arrow_circle_up_outlined;
    } else {
      return Icons.arrow_circle_down_outlined;
    }
  }

  Image StatmentIcon() {
    if (todayGoodPercentage.value > 60.0) {
      return Image.asset('Image/gridicons_status.png'); // Good posture
    } else if (40.0 <= todayGoodPercentage.value) {
      return Image.asset('Image/gridicons_status (1).png');
    } else {
      return Image.asset('Image/gridicons_status (2).png'); // Bad posture
    }
  }
}
