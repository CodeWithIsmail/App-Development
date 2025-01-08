import '../ImportAll.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Playwrite',
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                const Image(
                  image: AssetImage('images/moneymate.png'),
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'MoneyMate',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Playwrite',
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Your personal finance tracker',
                  style: TextStyle(
                    fontFamily: 'Playwrite',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Developed by ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const Text(
                      'CodeWithIsmail',
                      style: TextStyle(
                        fontFamily: 'Newfont',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'App Version: ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const Text(
                      '1.0.1',
                      style: TextStyle(
                        fontFamily: 'Newfont',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Easily and effectively manage your finances with MoneyMate. Track your income and expenses, visualize spending trends with intuitive bar charts, and gain insights into your financial habits. Designed for ease of use and clarity, MoneyMate helps you stay on top of your budget and make informed financial decisions.\n\nIn Future, more features and functionalities will be added!',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse(
                          'https://github.com/CodeWithIsmail/MoneyMate/issues'),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Image(
                          image: const AssetImage('images/warning.png'),
                          width: 20,
                          height: 20,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      title: const Text(
                        'Report issue on Github',
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
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse('mailto:bsse1433@iit.du.ac.bd'),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 24,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text(
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
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse('https://github.com/CodeWithIsmail'),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: SvgPicture.asset(
                          'icons/github.svg',
                          color: Colors.blue.shade900,
                        ),
                      ),
                      title: const Text(
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
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse('https://www.linkedin.com/in/ismail360/'),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          'icons/lin.svg',
                          color: Colors.blue.shade900,
                        ),
                      ),
                      title: const Text(
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
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Share.share(
                        'MoneyMate - Your personal finance tracker: https://drive.google.com/drive/folders/13c-7-YRVFfKpnn3S_aKD4Pb378Prd-9S?usp=sharing',
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: const AssetImage('images/share(3).png'),
                          width: 20,
                          height: 20,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      title: const Text(
                        'Share app',
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
        ),
      ),
    );
  }
}
