import 'package:flutter/material.dart';
import 'package:sit90/data.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

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
                topBar(isss: 'Privacy',
                img: 'Image/white.png'),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et ligula quis quam iaculis varius sed sit amet eros. Aliquam et nisi in urna fermentum ullamcorper sit amet a ligula. Donec auctor at quam ac euismod. Quisque iaculis metus ac tempor elementum. Ut vel pharetra felis. Curabitur auctor sollicitudin turpis, maximus pulvinar odio maximus in. Cras at auctor enim. Quisque suscipit rutrum lacus, eget tempus velit finibus id. Cras dapibus egestas est. Quisque sed tempor diam, id finibus nunc.Nullam ac mattis ex, at elementum lectus. Pellentesque suscipit vehicula pulvinar. Sed molestie fermentum est. Pellentesque vitae pretium ante. Etiam feugiat justo at eros pretium finibus. Aliquam porta blandit augue faucibus venenatis. Integer luctus maximus massa. Donec velit metus, tristique et neque eu, mattis vulputate arcu. In varius diam massa, non lacinia tellus pretium ac.Nunc porta volutpat ligula tincidunt volutpat. Nulla eu sodales sem. Pellentesque ac auctor nisi, molestie sollicitudin metus."),
                )
                
                 
              ],
              
                    ),
          )
      
      ),
    )
     ) );
  }
}