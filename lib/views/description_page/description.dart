import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(tag: 1,
            child: Container(
              height: 400,width: 500,
              color: Colors.white,
              child: Image.asset("assets/images/1.png"),
            ),
          )
        ],
      ),
    );
  }
}

// void main(){
//   runApp(MaterialApp(
//     home: Description(),
//   ));
// }
