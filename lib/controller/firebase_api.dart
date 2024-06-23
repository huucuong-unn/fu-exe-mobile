import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tortee/main.dart';

class FirebaseApi {
  //create an instance pf firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initializeNotifications() async {
    //request permission to send notifications
    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();
    //print the settings
    print('User granted permission: ${settings.authorizationStatus}');
    print('token firebase: ' + fCMToken.toString());

    initPushNotifications();
  }

  void handleMessages(RemoteMessage? message) {
    //handle the message when the app is in the foreground
    if (message == null) return;
    navigatorKey.currentState!.pushNamed('/notification', arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
