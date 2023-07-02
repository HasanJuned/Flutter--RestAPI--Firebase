import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'main.dart';

class FCMUtils {
  String? mToken;
  //final FlutterLocalNotificationsPlugin fl
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future initialize() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      messageHandler(message);
    }

    FirebaseMessaging.onMessage.listen(messageHandler);

    /// foreground message
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    /// background message

    getToken();
    // listenToTopic();
  }

  Future<void> messageHandler(RemoteMessage message) async {
    log(message.notification?.title ?? 'Null title');
    log(message.notification?.body ?? 'Null body');
  }

  /// Send notification to just one user personally (Use it when authentication is present in your app)
  Future<void> getToken() async {
    final String? token = await FirebaseMessaging.instance.getToken();
    mToken = token;
    saveToken(token.toString());
    log(token ?? '');
  }
  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection('userToken').doc('user1').set(
      {
        'token': token,
      },
    );
  }
// /// Send notification to a 'group of members' who are subscribed on a particular topic
// Future<void> listenToTopic() async {
//   await firebaseMessaging.subscribeToTopic('hasan');
//   // await _firebaseMessaging.unsubscribeFromTopic('hasan');
//
// }
}
