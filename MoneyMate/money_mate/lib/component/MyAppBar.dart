import '../ImportAll.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final String uname = getCurrentUser() ?? "";
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade100,
          child: Image.asset('images/moneymate.png'),
        ),
      ),
      leadingWidth: 50,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MoneyMate',
            style: welcomeTextStyle,
          ),
          Text(
            uname,
            style: NameTextStyle,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOrRegistration(),
              ),
            );
          },
          icon: const Icon(
            Icons.logout_outlined,
            size: 23,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InfoScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.info_outline_rounded,
            size: 23,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const MyAppBar({super.key});
}
