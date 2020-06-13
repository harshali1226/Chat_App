import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  final String userName;
  final String userImage;
  MessageBubble(this.message, this.userName, this.userImage ,this.isMe, {this.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
             Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[ 
              Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12)
                        ),
             color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          width: 170,
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                   userName,
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
            Text(
              message,
              style: TextStyle(
                color: isMe 
                ? Colors.black 
                : Theme.of(context).accentTextTheme.title.color
                ),
                textAlign: isMe ? TextAlign.end : TextAlign.start
           ,)
          ]
          ),
          
        ),
          ]
      ),
       Positioned(
         top: 0,
         left: isMe ? null : 160,
         right: isMe ? 160 : null,
         child: CircleAvatar(
         backgroundImage: NetworkImage(userImage), 
       ))
          ],
          overflow: Overflow.visible,
    );
   
  }
}