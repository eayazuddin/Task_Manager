import 'package:flutter/material.dart';
import '../style/style.dart';
import '../utility/utility.dart';

AppBar TaskAppBar(context,ProfileData){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${ProfileData['firstName']} ${ProfileData['lastName']}',style: Head3Text(colorWhite),),
              Text(ProfileData['email'],style: Head7Text(colorWhite),)
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, "/taskCreate");
          },
          icon: Icon(Icons.add_circle_outline,color: Colors.white,)
      ),
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, "/profileUpdate");
          },
          icon: Icon(Icons.person,color: Colors.white,)
      ),
      IconButton(
          onPressed: () async {
            await RemoveToken();
            Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);

          },
          icon: Icon(Icons.output,color: Colors.white,)
      )
    ],

  );
}