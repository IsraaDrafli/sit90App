import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/Profile.dart';
import 'package:sit90/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home.dart';

final Color theblue = Color(0xFF57CDFF);

class Head extends StatelessWidget {
  final String txt;
  final VoidCallback onpreesed;
  Head(this.txt, this.onpreesed);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            enableFeedback: false,
            constraints: BoxConstraints(),
            padding: EdgeInsets.only(right: 2, left: 0),
            onPressed: onpreesed,
            icon: Icon(size: 32, Icons.arrow_back_rounded)),
        Text(
          txt,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class REcontainer extends StatelessWidget {
  final Color color;
  final bool shadd;
  const REcontainer(this.color, this.shadd);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.26,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: shadd
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ]
            : [],
        color: color,
      ),
    );
  }
}

class SetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const SetButton(this.onPressed, this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Color(0xFFBCEBFF), theblue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Soft shadow
                blurRadius: 8,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.33, 51),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeWidg extends StatelessWidget {
  HomeWidg({super.key});
  final bool notification = true;
  final Controller _calendarController = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'Sit',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '90',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold, color: theblue),
              )
            ])),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  notification
                      ? 'Image/notification.png'
                      : 'Image/notification1.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ))
          ],
        ),
        Obx(
          () => TableCalendar(
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(126, 126, 126, 1)),
              weekendStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(126, 126, 126, 1)),
            ),
            calendarStyle: CalendarStyle(
              tablePadding: EdgeInsets.zero,
              todayTextStyle: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              defaultTextStyle: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              selectedTextStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                  color: Colors.black),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theblue,
              ),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theblue),
                //color: const Color.fromARGB(0, 0, 0, 0),
              ),
            ),
            calendarFormat: CalendarFormat.week,
            rowHeight: 52,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                formatButtonShowsNext: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleCentered: false,
                titleTextStyle: TextStyle(
                    color: Color.fromRGBO(126, 126, 126, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins')),
            focusedDay: _calendarController.focusedDay.value,
            firstDay: DateTime.utc(2005, 01, 15),
            lastDay: DateTime.utc(2035, 01, 01),
            selectedDayPredicate: (day) {
              return isSameDay(_calendarController.selectedDay.value, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              _calendarController.selectedDay.value = selectedDay;
              _calendarController.focusedDay.value = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final isSelectedDay =
                    isSameDay(_calendarController.selectedDay.value, day);
                final isToday = isSameDay(DateTime.now(), day);

                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelectedDay
                        ? Color.fromARGB(255, 21, 2, 2)
                        : (isToday
                            ? Color.fromARGB(255, 21, 2, 2)
                            : Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 21,
                        color: isSelectedDay
                            ? Colors.black
                            : (isToday ? Colors.black : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Controller extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final Controller controller = Get.put(Controller());
  final List<Widget> pages = [HomePage(), ChartsPage(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 1,
          unselectedFontSize: 1,
          enableFeedback: false,
          currentIndex: controller.selectedIndex.value,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          onTap: controller.changePage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 0
                            ? Color.fromRGBO(129, 212, 254, 0.2)
                            : Colors.transparent,
                        shape: BoxShape.circle),
                    child: Image.asset('Image/home.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 1
                            ? Color.fromRGBO(129, 212, 254, 0.2)
                            : Colors.transparent,
                        shape: BoxShape.circle),
                    child: Image.asset('Image/statistics icon.png')),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 2
                            ? Color.fromRGBO(129, 212, 254, 0.2)
                            : Colors.transparent,
                        shape: BoxShape.circle),
                    child: Image.asset('Image/profile.png')),
                label: 'Home'),
          ],
        ),
      ),
    );
  }
}

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(188, 235, 255, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
