import 'package:flutter/material.dart';
import 'package:task_manager/screen/profile/profileUpdateScreen.dart';
import 'package:task_manager/screen/task/createTaskScreen.dart';
import 'package:task_manager/screen/task/homeScreen.dart';
import 'package:task_manager/utility/utility.dart';
import 'screen/onboarding/emailVerificationScreen.dart';
import 'screen/onboarding/loginScreen.dart';
import 'screen/onboarding/pinVerificationScreen.dart';
import 'screen/onboarding/registrationScreen.dart';
import 'screen/onboarding/setPasswordScreen.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();
   String? token = await ReadUserData("token");
   if(token==null){
     runApp(MyApp('/login'));
   }
   else{
     runApp(MyApp("/"));
     // runApp(MyApp('/login'));
   }

}

class MyApp extends StatelessWidget {
   final String FirstRoute;
   MyApp(this.FirstRoute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      debugShowCheckedModeBanner: false,
      initialRoute: FirstRoute,
      routes: {
        "/":(context) => Homescreen(),
        "/login":(context) => Loginscreen(),
        "/registration":(context) => Registrationscreen(),
        "/pinVerification":(context) => Pinverificationscreen(),
        "/emailVerification":(context) => Emailverificationscreen(),
        "/setPassword":(context) => Setpasswordscreen(),
        "/taskCreate":(context) => Createtaskscreen(),
        "/profileUpdate":(context) => Profileupdatescreen(),

      },
    );
  }
}

