import 'package:flutter/material.dart';

import '../../Style/style.dart';
import '../../api/apiClient.dart';
import '../../utility/utility.dart';

class Profileupdatescreen extends StatefulWidget {
  const Profileupdatescreen({super.key});

  @override
  State<Profileupdatescreen> createState() => _ProfileupdatescreenState();
}

class _ProfileupdatescreenState extends State<Profileupdatescreen> {


  Map<String,String> FormValues={"email":"", "firstName":"","lastName":"","mobile":"","password":""};
  bool Loading=false;

  @override
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? email= await ReadUserData("email");
    String? firstName= await ReadUserData("firstName");
    String? lastName= await ReadUserData("lastName");
    String? mobile= await ReadUserData("mobile");
    String? password= await ReadUserData("password");
    InputOnChange("email", email);
    InputOnChange("firstName", firstName);
    InputOnChange("lastName", lastName);
    InputOnChange("mobile", mobile);
    InputOnChange("password", password);
  }

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('email Required !');
    }
    else if(FormValues['firstName']!.length==0){
      ErrorToast('firstName Required !');
    }
    else if(FormValues['lastName']!.length==0){
      ErrorToast('lastName Required !');
    }
    else if(FormValues['mobile']!.length==0){
      ErrorToast('mobile Required !');
    }
    else if(FormValues['password']!.length==0){
      ErrorToast('password Required !');
    }
    else{
      setState(() {Loading=true;});
      bool res=await ProfileUpdateRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      else{
        setState(() {Loading=false;});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Update"),backgroundColor: Colors.green,),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("email",Textvalue);
                    },
                    decoration: AppInputDecoration("email"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("firstName",Textvalue);
                    },
                    decoration: AppInputDecoration("firstName"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("lastName",Textvalue);
                    },
                    decoration: AppInputDecoration("lastName"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("mobile",Textvalue);
                    },
                    decoration: AppInputDecoration("mobile"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("password",Textvalue);
                    },
                    decoration: AppInputDecoration("password"),
                  ),
                  SizedBox(height: 20),
                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Confirm'),
                    onPressed: (){
                      FormOnSubmit();
                    },
                  ),)
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}