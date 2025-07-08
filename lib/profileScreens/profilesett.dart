import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';

class Profilesett extends StatelessWidget {
  const Profilesett({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientScaffold(child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(offset: Offset(0, 1),
              blurRadius: 2,
                color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.5)
              )
            ]
          ),
          
          height: MediaQuery.of(context).size.height*0.95,
          width: MediaQuery.of(context).size.width*0.86,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                topBar(isss: 'Profile Settings',
                img: 'Image/done.png',),
                SizedBox(
                  height: 10,
            
                ),
                Container(
                  height: 112,
                  width: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color.fromARGB(255, 124, 188, 240),
                ),
                ),
                SizedBox(
                  height: 10,),
                  TextButton(onPressed: () {
                    
                  }, child: Text('Change your Profile Picture', style: GoogleFonts.poppins(fontSize: 12, color: Colors.blueAccent),)),
                inputField(label: 'Name',hint: 'Change your name'),
                SizedBox(
                  height: 10,),
                inputField(label: 'Email',hint: 'Change your email',),
                SizedBox(
                  height: 10,),
                inputField(label: 'Phone number',hint: 'Change your phone number',),
                SizedBox(
                height: 10,),
                inputField(label: 'Birth Date',hint: '15/01/2004',),
                SizedBox(
                height: 10,),
            
              ],
            ),
          )
        
        ),
      )
      ),
    );
  }
}

class inputField extends StatelessWidget {
  final String label;
  final String hint;
   inputField({required this.label,required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: GoogleFonts.poppins(
            fontSize: 12,color: const Color.fromARGB(255, 93, 93, 93)),),
          SizedBox(height: 9,),
              TextField(
                
                decoration: InputDecoration(hintText: hint,hintStyle: TextStyle(fontSize: 12),
                // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: const Color.fromARGB(255, 176, 175, 175))),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: const Color.fromARGB(255, 176, 175, 175)
                    
                  )),
      
              ))
        ],
      ),
    );
  }
}

