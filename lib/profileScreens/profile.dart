import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Auth/authController.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: Stack(
          children: [
            bluecon(),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: settingsw(),
            )
          ],
        ),
      ),
    );
  }
}

class settingsw extends StatelessWidget {
  const settingsw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children:  [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 12),
                  child: Text(
                    'Account overview',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )),
            ListItem(
              icon: 'Image/profile.png',
              text: 'Profile Settings',
              backgroundColor: Color(0xFFF0F9FF),
              rue: '/profilesett',
            ),
            ListItem(
              icon: 'Image/settings.png',
              text: 'Privacy',
              backgroundColor: Color(0xFFFFFBF1),
              rue: '/pr',
            ),
            ListItem(
              icon: 'Image/help.png',
              text: 'Help',
              backgroundColor: Color(0xFFF4FFF3),
              rue: '/hlp',
            ),
            ListItem(
              icon: 'Image/aboutus.png',
              text: 'About us',
              backgroundColor: Color(0xFFFFF6FF),
              rue: '/abtus',
            ),
           /* ListItem(
              icon: 'Image/logout.png',
              text: 'Log Out',
              backgroundColor: Color(0xFFFFF5F5),
              rue: '/login',
            ),*/
             Padding(
      padding:  EdgeInsets.only(top: 2),
      child: ListTile(
        leading: InkWell(
          child: Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: Color(0xFFFFF5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'Image/logout.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Text(
          "Log Out",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
        await AuthService().signout( 
          context: context
        );
      },
      ),
    )
          ],
        ),
      ),
    );
  }
}

class bluecon extends StatelessWidget {
  const bluecon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff57CDFF), Color(0xFF4285F4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage('Image/isradrf.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3D90CB),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.edit,
                      size: 16, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "IsraaDrf",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inst');
              },
              child: Text(
                'Click To Recalibrate',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 199, 226, 228),
                ),
              )),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String icon;
  final String rue;
  final String text;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const ListItem({
    super.key,
    required this.rue,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: ListTile(
        leading: InkWell(
          child: Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          print('IT WOOOOORRRKSSB!');
          Navigator.pushNamed(context, rue);
        },
      ),
    );
  }
}
