import 'package:studymate/ImportAll.dart';

class DailyPlannerScreen extends StatefulWidget {
  const DailyPlannerScreen({super.key});

  @override
  State<DailyPlannerScreen> createState() => _DailyPlannerScreenState();
}

class _DailyPlannerScreenState extends State<DailyPlannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          FloatingActionButton(
            elevation: 5,
            child: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {},
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
