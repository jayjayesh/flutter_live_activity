import 'package:flutter/material.dart';
import 'package:flutter_live_activity/commen/constants.dart';
import 'package:live_activities/live_activities.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _liveActivitiesPlugin = LiveActivities();
String? activityId;
var teamResponseList = [teamResponseJson1, teamResponseJson2, teamResponseJson3];
var indexPointer = 0;

  
  @override
  void initState() {
    super.initState();
   _initialiseLiveActivity();
  }

   @override
  void dispose() {
    _liveActivitiesPlugin.dispose();
    super.dispose();
  }

  void _initialiseLiveActivity() async{
  indexPointer++;
  ///
 _liveActivitiesPlugin.init(appGroupId: "group.flutterLiveActivityAppGroup");
    if(activityId != null){
      _liveActivitiesPlugin.updateActivity(activityId!, teamResponseList[indexPointer]);
    }else{
      indexPointer = 0;
      activityId = await _liveActivitiesPlugin.createActivity(teamResponseList[indexPointer]);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Push the button to Update Live Activity',
            ),        
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _initialiseLiveActivity,
        child: const Icon(Icons.add),
      ), 
    );
  }
}
