import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: message.notification == null ? 0 : 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(message.notification!.title!),
            subtitle: Text(message.notification!.body!),
          );
        },
      ),
    );
  }
}
