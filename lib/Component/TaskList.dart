
import 'package:flutter/material.dart';
import '../style/style.dart';

ListView TaskList(TaskItems,DeleteItem,StatusChange){
  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context, index){
        Color statusColor=colorGreen;
        if(TaskItems[index]['status']=="New"){
          statusColor=colorBlue;
        }
        else if(TaskItems[index]['status']=="Progress"){
          statusColor=colorOrange;
        }
        else if(TaskItems[index]['status']=="Canceled"){
          statusColor=colorRed;
        }
        return Card(
         child: ItemSizedBox(
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(TaskItems[index]["title"],style: Head6Text(colorLightGray),),
               Text(TaskItems[index]["description"],style: Head6Text(colorLightGray),),
               Text(TaskItems[index]["createdDate"],style: Head7Text(colorLightGray),),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   StatusChild(TaskItems[index]['status'],statusColor),
                   Container(
                     child: Row(
                       children: [
                         SizedBox(width: 50,height:30,child:ElevatedButton(onPressed:(){
                           StatusChange(TaskItems[index]['_id']);
                         },child: Icon(Icons.edit_location_alt_outlined,size: 16),style:AppStatusButtonStyle(colorOrange))),


                         SizedBox(width: 10),

                         SizedBox(width: 50,height: 30,child: ElevatedButton( onPressed:(){
                           DeleteItem(TaskItems[index]['_id']);
                         }, child: Icon(Icons.delete_outlined,size: 16),style:AppStatusButtonStyle(colorRed)))
                       ],
                     ),
                   )
                 ],
               )
             ],

           )
         ),
        );
      }
      );
}