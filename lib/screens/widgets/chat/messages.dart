import 'package:chat_app/screens/widgets/chat/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data.documents;
        return ListView.builder(
          reverse: true,
          itemCount: chatSnapshot.data.documents.length,
          itemBuilder: (ctx4, index) => MessageBubble(
            chatDocs[index].get('text'),
            chatDocs[index].get('userId') ==
                FirebaseAuth.instance.currentUser.uid,
            chatDocs[index].get('username'),
            chatDocs[index].get('userImage'),
            key: ValueKey(chatDocs[index].documentID),
          ),
        );
      },
    );
  }
}
