import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sit90/data.dart';

class Helpp extends StatelessWidget {
  const Helpp({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(child: Center(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBar(isss: 'Help & Support',
                img: 'Image/white.png'),
                SizedBox(
                  height: 30,
                ),
                inputField(label: 'Email', hint: 'Example@example.com'),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Question type'),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    // keyboardType: TextInputType.multiline,
                    // minLines: 1,
                    // maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 200, top: 0,left: 10),
                      hintText: "What are your thoughts...",hintStyle: TextStyle(fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: const Color.fromARGB(255, 176, 175, 175)
                      
                    ))
                    ),
                  
                  ),
                ),
                SizedBox(height: 15,),
                 SetButton(() {}, 'Submit')
            
                 
              ],
              
                    ),
          )
      
      ),
    )
     ) );
  }
}