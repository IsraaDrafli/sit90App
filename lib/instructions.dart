import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:sit90/calibration.dart';
import 'data.dart';

class instructionsPage extends StatelessWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  final List<Map<String, String>> _steps = const [
    {
      'image': 'Image/inst1.png',
      'title': 'Wear and adjust the device',
      'subtitle': "Put on the posture corrector as though you're wearing a vest and adjust the shoulder straps for maximum support",
    },
    {
      'image': 'Image/inst2.png',
      'title': 'Center the sensor',
      'subtitle': 'Ensure the sensor is centered on your spin and facing outwards',
    },
    {
      'image': 'Image/inst3.png',
      'title': 'Check fit and alignment',
      'subtitle': 'Sit uprigth with feet flat and knees at 90°',
    },
  ];

  instructionsPage({super.key});

  void _nextPage() {
    if (_currentPage.value < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 29,
              ),
              Head('Wear it properly',(){Navigator.pop(context);}),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  //up bar
                  REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                  Spacer(),
                  REcontainer(theblue, true),
                  Spacer(),
                  REcontainer(Color.fromARGB(236, 233, 231, 231), false),
                ],
                
              ),
          //big title
          SizedBox(height: 40,),
            Text(
                'Setup your sit90 correctly',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              
          
              // Page content
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _steps.length,
                  onPageChanged: (index) => _currentPage.value = index,
                  itemBuilder: (context, index) {
                    final step = _steps[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          step['image']!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20,),
                         // Dot indicators
              ValueListenableBuilder<int>(
                valueListenable: _currentPage,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_steps.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: value == index ? Colors.lightBlue : Colors.grey[400],
                        ),
                      );
                    }),
                  );
                },
              ),
              const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            step['title']!,
                            style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            step['subtitle']!,
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400, color: Colors.grey[700]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          
             
          
              // Next button
             ValueListenableBuilder<int>(
  valueListenable: _currentPage,
  builder: (context, value, _) {
    final isLastPage = value == _steps.length - 1;
    return SetButton(
      () {
        if (isLastPage) {
          Navigator.pushNamed(context, '/calibration');
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      isLastPage ? 'Calibrate' : 'Next',
    );
  },
),
              
            ],
          ),
        ),
      ),
    );
  }
}
