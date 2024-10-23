import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  Map<String,String> FromValues = {"email": "","password": ""};
  bool Loading = false;
  InputOnChange(MapKey, Textvalue){
    setState(() {
      FromValues.update(MapKey, (value) => Textvalue);
    });
  }
  FormOnSubmit() async{
    if(FromValues['email']!.length==0){
      ErrorToast('email Required !');
    }
    else if(FromValues['password']!.length==0){
      ErrorToast('password Required !');
    }
    else{
      setState(() {
        Loading=true;
      });
      bool res = await LoginRequest(FromValues);
      if(res==true){
          Navigator.pushNamedAndRemoveUntil(context, "/",(route)=>false);
      }
      else{
        setState(() {
          Loading=false;
        });
      }

    }
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
           child: Loading?(Center(child: CircularProgressIndicator(),)):(
           SingleChildScrollView(
             padding: EdgeInsets.all(30),
             child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Get Started With",style: Head1Text(colorDarkBlue)),
               SizedBox(height: 1,),
               Text("Learn With eayaz",style: Head6Text(colorLightGray),),
               SizedBox(height: 20,),
               TextFormField(decoration: AppInputDecoration("E-mail Address"),
                 onChanged: (Textvalue){
                   InputOnChange("email",Textvalue);
                 },
               ),
               SizedBox(height: 20,),
               TextFormField(decoration: AppInputDecoration("Password"),
                 onChanged: (Textvalue){
                   InputOnChange("password",Textvalue);
                 },
               ),
               SizedBox(height: 20,),
               Container(
                 child: ElevatedButton(onPressed: (){
                   FormOnSubmit();
                 },
                   child: SuccessButtonChild("Login"),
                   style: AppButtonStyle(),
                 ),
               ),
               SizedBox(height: 20),
               Container(
                 alignment: Alignment.center,
                 child: Column(
                   children: [
                     SizedBox(height: 20,),
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, "/emailVerification");
                       },
                       child: Text("Forget Password?",style: Head6Text(colorLightGray),),
                     ),
                     SizedBox(height: 15,),
                     
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, "/registration");
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("Don't have a account?",style: Head6Text(colorDarkBlue),),
                           Text("Sign Up",style: Head6Text(colorGreen),)
                         ],
                       ),
                     )
                   ],
                 ),
               )

             ],
           ),
           )
           ),
          )
        ],
      ),
    );
  }
}
