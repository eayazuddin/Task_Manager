import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';
class Emailverificationscreen extends StatefulWidget {
  const Emailverificationscreen({super.key});

  @override
  State<Emailverificationscreen> createState() => _EmailverificationscreenState();
}
class _EmailverificationscreenState extends State<Emailverificationscreen> {

  Map<String,String> FormValues={"email":""};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('Email Required !');
    }
    else{
      setState((){Loading=true;});
      bool res=await VerifyEmailRequest(FormValues['email']);
      if(res==true){
        Navigator.pushNamed(context, "/pinVerification");
      }
      else{
        setState(() {Loading=false;});
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
              child: Loading?(Center(child: CircularProgressIndicator())):(
                  SingleChildScrollView(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Email Address", style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 1),
                        Text("A 6 digit verification pin will send to your email address", style: Head6Text(colorLightGray)),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue){
                            InputOnChange("email",Textvalue);
                          },
                          decoration: AppInputDecoration("Email Address"),
                        ),
                        SizedBox(height: 20),
                        Container(child: ElevatedButton(
                          style: AppButtonStyle(),
                          child: SuccessButtonChild('Next'),
                          onPressed: (){
                            FormOnSubmit();
                          },
                        ),)
                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}