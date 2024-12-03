import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String senderemail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.receiverID,
    required this.message,
    required this.senderemail,
    required this.timestamp
  });

  //convert to a map
  Map<String,dynamic>toMap(){
    return{
      'senderId':senderId,
      'senderEmail':receiverID,
      'receiverId':receiverID,
      'message':message,
      'timestamp':timestamp
    };
  }


}