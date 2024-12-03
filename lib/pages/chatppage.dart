import 'package:chatapp/auth/authsevice.dart';
import 'package:chatapp/componets/chatbubble.dart';
import 'package:chatapp/componets/mytextfielfd.dart';
import 'package:chatapp/sevices/chat/chatservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatppage extends StatefulWidget {
  final String receiveremail;
  final String receiverID;
   Chatppage({super.key,
   required this.receiverID,
  required this.receiveremail});

  @override
  State<Chatppage> createState() => _ChatppageState();
}

class _ChatppageState extends State<Chatppage> {
//text controller
final TextEditingController _messagecontroller=TextEditingController();

//chat and auth services
final Chatservices _chatservices=Chatservices();

final Authservice _authservice=Authservice();
//for text field focus
FocusNode myfocusNode=FocusNode();
@override
  void initState(){
    super.initState();

    //add listner to focus node
    myfocusNode.addListener((){
      if(myfocusNode.hasFocus){
        //cause a delay sot that the keyboard has time to show up
        //then the amount of reaming space will be calucted
        //then scroll down
        Future.delayed(
          const Duration(milliseconds: 100),
          ()=>scrollDown(),
        );
      }
    });
//wait a bit for listveiw to be cuit then scroll to buttom
Future.delayed(const Duration(milliseconds: 100),
()=>scrollDown(),
);

  }

  @override
  void dispose(){
    myfocusNode.dispose();
    _messagecontroller.dispose();
    super.dispose();
  }
 //sccroll controller 
 final ScrollController _scrollController = ScrollController();
 void scrollDown(){
  _scrollController.animateTo(_scrollController.position.maxScrollExtent, 
  duration: const Duration(seconds: 1), 
  curve: Curves.fastOutSlowIn);
 }
  
//send messages 
void sendMessage() async{
  //if there is something inside the textfield
  if(_messagecontroller.text.isNotEmpty){
//send the messages
await _chatservices.sendMessage(widget.receiverID,_messagecontroller.text );
//clear text controller
_messagecontroller.clear();
  }
}

  @override
  Widget build(BuildContext context) {
        // Extract username from email
    String username = widget.receiveremail.split('@')[0];
    return  Scaffold(
      
      appBar: AppBar(title: Text(username,style:const TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
      backgroundColor: Colors.green.shade300,

      foregroundColor: Colors.black,),
      body: Column(
        children: [
          //display all the messages 
          Expanded(child: _buildMessagesList(),
          ),
          //user input 
          _builduserInput()
        ],
      ),
    );
  }

  Widget _buildMessagesList(){
    String senderId = _authservice.getCurrentuser()!.uid;
    return StreamBuilder(
    stream: _chatservices.getMessages(widget.receiverID, senderId),
     builder: (context,snapshot){
        if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      }

      // Loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      // Check if snapshot has data
      if (!snapshot.hasData) {
        return const Center(child: Text("No users found"));
      }
      //return list veiw
      return ListView(
        controller: _scrollController,
        children: snapshot.data!.docs.map((doc)=>_buildMessagesItem(doc)).toList(),
      );

     },
     );
  }

  //build messge item
  Widget _buildMessagesItem(DocumentSnapshot doc){
    Map<String,dynamic>data=doc.data() as Map<String ,dynamic>;
//is curent user
bool isCurrentUser = data['senderId'] == _authservice.getCurrentuser()!.uid;
//align message to the right if sender is the current user otherwise left
var alignment=
isCurrentUser? Alignment.centerRight:Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
         isCurrentUser? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Chatbubble(message: data["message"],
           isCurrentUser: isCurrentUser
           )
        ],
      )
      );
  }

  //build message input 
  Widget _builduserInput(){
    return Row(
      children: [
        //textfield should take up mst of the space
        Expanded(child: Mytextfielfd(controller: _messagecontroller,
        focusNode: myfocusNode,
        hintText: "Type a Message ",
        obscureText: false,
        )
        ),
        Container(
          decoration:BoxDecoration(color: Colors.yellow[300],
          shape: BoxShape.circle) ,
          margin: const EdgeInsets.only(right: 25),
          child: IconButton(onPressed: sendMessage, icon:const  Icon(Icons.arrow_upward),
          color: Colors.black,
          )
          )
      ],
    );

  }
}