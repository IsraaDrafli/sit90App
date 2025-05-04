import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isoffline = true;
    return SafeArea(
      child: GradientScaffold(
        child: Padding(
          padding: EdgeInsets.only(left: 19, right: 19, top: 19),
          child: SingleChildScrollView(
            child: Column(children: [
              HomeWidg(),
              isoffline
                  ? mycontainer(
                      Color(0xFF9BCF53), 'Track your poster improvement', () {
                      Get.find<Controller>().changePage(1);
                    }, 'See Statistics')
                  : offline(),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    'Exercices',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff9FA2AE)),
                      ))
                ],
              ),
              mycontainer(theblue, 'First set of exercises', () {}, 'Start'),
              mycontainer(theblue, 'Second set of exercises', () {}, 'Start'),
              SizedBox(
                height: 19,
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class mycontainer extends StatelessWidget {
  final Color color;
  final String txt;
  final String butttxt;
  final VoidCallback onpressed;
  mycontainer(this.color, this.txt, this.onpressed, this.butttxt);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 19),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.24,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style: GoogleFonts.overpass(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: onpressed,
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(96, 46),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    butttxt,
                    style: GoogleFonts.overpass(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: theblue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class offline extends StatelessWidget {
  const offline({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 7),
      child: Container(
        height: h * 0.37,
        width: w * 0.85,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 215, 212, 212),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(1, 1),
              ),
            ],
            color: Color.fromRGBO(242, 238, 238, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Uh-oh! Sit90 is out of sync',
                style: GoogleFonts.overpass(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 73, 73, 1)),
              ),
              Row(
                children: [
                  Container(
                    height: h * 0.16,
                    width: w * 0.45,
                    child: Text(
                      'Connect your device to track your posture ',
                      maxLines: 3,
                      style: GoogleFonts.overpass(
                        color: Color.fromRGBO(159, 162, 174, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset('Image/Group 10.png')
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(155, 207, 83, 1),
                      minimumSize: Size(121, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    'Connect',
                    style: GoogleFonts.overpass(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
