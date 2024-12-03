import 'package:chatapp/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chatservices{
  //get instances of firesotre

final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
final FirebaseAuth _auth=FirebaseAuth.instance;

  //get user stream
/*
List<map<string,dynamics>=
[
  {
    'email':xyz
    'pasword":sdfew
  },
  {
    'email':xyz
    'pasword':xyz
  }
]
we save save data in a list of maps with strings!

*/
Stream<List<Map<String,dynamic>>> getUserStream(){
return _firebaseFirestore.collection("users").snapshots().map((snapshot){
  return snapshot.docs.map((doc){
    //go through each individual use
    final user=doc.data();
    //return user
    return user;
  }).toList();
});
}

  //send messgaes
  Future<void>sendMessage(String receiverID,message) async{
    //get current user info
final String currentUserID=_auth.currentUser!.uid;
final String currentUserEmail=_auth.currentUser!.email!;
final Timestamp timestamp = Timestamp.now();

    //create a new messge
Message newMessage=Message(
  senderId: currentUserID,
    senderemail: currentUserEmail,
 receiverID: receiverID,
  message: message, 
   timestamp: timestamp);

    //construct a chat room id for each user
    List<String >ids=[currentUserID,receiverID];
    ids.sort();//sort the ids making sure no two gorups won =t have ssame id
    String chatroomId = ids.join('_');


    //add new messags to database
    await _firebaseFirestore
    .collection("chat_rooms")
    .doc(chatroomId)
    .collection("messages")
    .add(newMessage.toMap());


  }

  //get messages
  Stream<QuerySnapshot>getMessages(String userId,String otherUserId) {
    //construct chat room id for two diffferent users
    List<String> ids=[userId , otherUserId];
    ids.sort();
    String chatroomId = ids.join('_');
    return  _firebaseFirestore.collection('chat_rooms')
    .doc(chatroomId)
    .collection("messages")
    .orderBy('timestamp',descending: false)
    .snapshots();
  }

}