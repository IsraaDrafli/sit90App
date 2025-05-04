import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: Column(
          children: [
            Container(
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
                  const SizedBox(height: 40),
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
                              size: 16,
                              color: Color.fromARGB(255, 255, 255, 255)),
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
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    ListItem(
                      icon: 'Image/user.png',
                      text: 'Profile Settings',
                      backgroundColor: Color(0xFFF0F9FF),
                    ),
                    ListItem(
                      icon: 'Image/settings.png',
                      text: 'App Settings',
                      backgroundColor: Color(0xFFFFFBF1),
                    ),
                    ListItem(
                      icon: 'Image/help.png',
                      text: 'Help',
                      backgroundColor: Color(0xFFF4FFF3),
                    ),
                    ListItem(
                      icon: 'Image/aboutus.png',
                      text: 'About us',
                      backgroundColor: Color(0xFFFFF6FF),
                    ),
                    ListItem(
                      icon: 'Image/logout.png',
                      text: 'Log Out',
                      backgroundColor: Color(0xFFFFF5F5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String icon;
  final String text;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const ListItem({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
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
      title: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
