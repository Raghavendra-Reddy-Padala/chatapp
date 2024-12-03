import 'package:chatapp/auth/authsevice.dart';
import 'package:chatapp/componets/usertile.dart';
import 'package:chatapp/componets/mydrawer.dart';
import 'package:chatapp/pages/chatppage.dart';
import 'package:chatapp/sevices/chat/chatservices.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  //chat and auth sevices
  final Chatservices _chatservices = Chatservices();
  final Authservice _authservice = Authservice();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title:const  Text("Home",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
        ),
        drawer:const  Mydrawer(),
        body: _buildUserList(),
    );
  }


  //build a list of user except the currect user logged in
  // Widget _buildUserList(){
  //   return StreamBuilder(stream: _chatservices.getUserStream(),
  //    builder: (context,snapshot){
  //     //error
  //     if(snapshot.hasError){
  //       return const Text("Error");
  //     }
  //     //loading
  //     if(snapshot.connectionState==ConnectionState.waiting){
  //       return const Text("Loading");
  //     }

  //     //return listveiw
  //     return ListView(
  //       children: snapshot.data!.map<Widget>
  //       ((userdata)=>_buildUserListItem(userdata,context)).toList(),
  //     );
  //    },
  //    );
  // }
Widget _buildUserList() {
  return StreamBuilder(
    stream: _chatservices.getUserStream(),
    builder: (context, snapshot) {
      // Error
      if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      }

      // Loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      // Check if snapshot has data
      if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Center(child: Text("No users found"));
      }

      // Return ListView
      return ListView(
        children: snapshot.data!.map<Widget>((userdata) => _buildUserListItem(userdata, context)).toList(),
      );
    },
  );
}

  //build individual list title fro user
  Widget _buildUserListItem(
    Map<String,dynamic>userdata,BuildContext context){
      //display all users except curect user
      if(userdata['email']!=_authservice.getCurrentuser()!.email){
    return Usertile(
      text: userdata['email'],
      onTap: (){
        //tapped on auser -> go to chat page
        Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context)=>Chatppage(
            receiveremail: userdata["email"],
            receiverID: userdata["uid"],
            )
            )
            );
      },
    );
      }else{
      return  Container();
      }
  }

}