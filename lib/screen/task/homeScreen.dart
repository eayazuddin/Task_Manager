import 'package:flutter/material.dart';
import 'package:task_manager/Component/TaskAppBar.dart';
import 'package:task_manager/Component/cancelTaskList.dart';
import 'package:task_manager/Component/progressTaskList.dart';
import '../../Component/appBottomNav.dart';
import '../../Component/completeTaskList.dart';
import '../../Component/newTaskList.dart';
import '../../utility/utility.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int TabIndex=0;

  Map<String,String> ProfileData={"email":"","firstName":"","lastName":""};

  onItemTap(index){
    setState(() {
      TabIndex=index;
    });
  }

  final WidgetOptions=[
     Newtasklist(),
     Progresstasklist(),
     Completetasklist(),
     Canceltasklist()
  ];

  ReadAppBarData() async {
    String? email= await ReadUserData('email');
    String? firstName= await ReadUserData('firstName');
    String? lastName= await ReadUserData('lastName');
    setState(() {
      ProfileData={"email":'$email',"firstName":'$firstName',"lastName":'$lastName'};
    });
  }

  @override
  void initState() {
    ReadAppBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: WidgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTap),
    );
  }
}
