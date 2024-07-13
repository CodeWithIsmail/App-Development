// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:health_tracker/all.dart';

class About extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x5CDDB8FF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/img1.jpg'),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Ismail Hossain',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Playwrite',
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Newfont',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                onTap: () => launch('mailto:@gmail.com'),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 24,
                    color: Colors.blue.shade900,
                  ),
                  title: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                onTap: () => launch('tel:015377'),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 24,
                    color: Colors.blue.shade900,
                  ),
                  title: Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
              child: GestureDetector(
                onTap: () => launch('https://github.com/CodeWithIsmail'),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12,
                    child: SvgPicture.asset(
                      'icons/github.svg',
                      color: Colors.blue.shade900,
                    ),
                  ),
                  title: Text(
                    'Connect on Github',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: GestureDetector(
                onTap: () => launch('https://www.linkedin.com/in/ismail360/'),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'icons/lin.svg',
                      color: Colors.blue.shade900,
                    ),
                  ),
                  title: Text(
                    'Connect on LinkedIn',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ], // children
        ),
      ),
    );
  }
}
