import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.green,
  //       body: SafeArea(
  //         child: Container(
  //           child: Text('Hello world',
  //             style: TextStyle(color:Colors.yellowAccent,fontSize: 20,fontStyle:FontStyle.italic),
  //           ),
  //           height: 200,
  //           width: 300,
  //           color: Colors.blueAccent,
  //           margin: EdgeInsets.all(50),
  //           padding: EdgeInsets.all(10),
  //           // alignment: Alignment.center,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.green,
  //       body: SafeArea(
  //           child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Container(
  //             width: 200,
  //             height: 100,
  //             color: Colors.lightBlueAccent,
  //             child: Text(
  //               'container 1',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Container(
  //             child: Text(
  //               'container 2',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             width: 200,
  //             height: 100,
  //             color: Colors.blueAccent,
  //           )
  //         ],
  //       )),
  //     ),
  //   );
  // }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.green,
  //       body: SafeArea(
  //           child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Container(
  //             width: 200,
  //             height: 200,
  //             color: Colors.lightBlueAccent,
  //             child: Text(
  //               'container 1',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           Container(
  //             child: Text(
  //               'container 2',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             width: 200,
  //             height: 200,
  //             color: Colors.blueAccent,
  //           )
  //         ],
  //       )),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              color: Colors.red,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Color(0xE3E2DD9B),
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              color: Colors.blue,
            )
          ],
        )),
      ),
    );
  }
}
