import 'package:chat_app/screens/widgets/chat/messages.dart';
import 'package:chat_app/screens/widgets/chat/new_messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterChat'), actions: [
        DropdownButton(
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          },
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryColor,
          ),
          items: [
            DropdownMenuItem(
              value: 'logout',
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Logout'),
                  ],
                ),
              ),
            )
          ],
        )
      ]),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance
      //         .collection('chats/Wy8HgMOnLwrk964GfaRl/messages')
      //         .snapshots(),
      //     builder: (ctx, streamSnapshot) {
      //       if (streamSnapshot.connectionState == ConnectionState.waiting)
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       final documents = streamSnapshot.data.documents;
      //       return ListView.builder(
      //         itemCount: documents.length,
      //         itemBuilder: (ctx, index) => Container(
      //           padding: EdgeInsets.all(8),
      //           child: Text(documents[index].get('text')),
      //         ),
      //       );
      //     }),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            Container(child: NewMessage()),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     FirebaseFirestore.instance
      //         .collection('chats/Wy8HgMOnLwrk964GfaRl/messages')
      //         .add({'text': 'This was added now'});
      //   },
      // ),
    );
  }
}
