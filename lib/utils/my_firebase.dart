import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mopay_ewallet/bloc/store.dart';
import 'package:mopay_ewallet/main.dart';
import 'package:mopay_ewallet/pages/pin_code/insert_pin.dart';
import 'package:mopay_ewallet/pages/transaction/payment/travellingo_payment_detail.dart';
import 'package:mopay_ewallet/utils/firebase_options.dart';
import 'package:mopay_ewallet/utils/transition.dart';

class MyFirebase {
  static const channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  static const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();
  static const InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  static Future<void> initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    final token = await FirebaseMessaging.instance.getToken();

    if (token != null) {
      if (kDebugMode) {
        print('Firebase Messaging Token: $token');
      }
      Store.setFirebaseMessagingToken(token);
    }

    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        showNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(onNotificationClickFirebase);

    FirebaseMessaging.instance
        .getInitialMessage()
        .then(onNotificationClickFirebase);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onNotificationClick,
      onDidReceiveNotificationResponse: onNotificationClick,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    showNotification(message);
  }

  static void showNotification(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;
    final payload = jsonDecode(notification?.body ?? "{}");

    final title = notification?.title;
    if (payload != null) {
      final message = payload['message'];
      final pendingPaymentId = payload['pendingPaymentId'];

      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'app_icon',
        ),
      );

      flutterLocalNotificationsPlugin.show(
        pendingPaymentId.hashCode,
        title,
        message,
        notificationDetails,
        payload: jsonEncode(payload),
      );
    }
  }

  @pragma('vm:entry-point')
  static void onNotificationClick(
      NotificationResponse notificationResponse) async {
    final payload = notificationResponse.payload;
    if (payload == null) return;
    print("foreground notif payload : $payload");
    final data = jsonDecode(payload);

    final travellingoId = data['pendingPaymentId'];

    if (travellingoId != null) {
      bool isAppRunning = navigatorKey.currentState?.overlay?.context != null;

      if (isAppRunning) {
        navigatorKey.currentState?.push(slideInFromBottom(
          TravellingoPaymentDetail(
            transactionId: travellingoId,
          ),
        ));
        return;
      }

      DateTime lastPinEnter = await Store.getLastPinEnter();

      Duration diff = DateTime.now().difference(lastPinEnter);
      if (diff.inMinutes >= 5) {
        await Store.removeLastPinEnter();
        bool? isPinValid = await navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => const InsertPin(),
          ),
        );

        if (isPinValid == null || !isPinValid) {
          navigatorKey.currentState
              ?.pushNamedAndRemoveUntil('/login', (route) => false);
        }
        return;
      }

      navigatorKey.currentState?.push(slideInFromBottom(
        TravellingoPaymentDetail(
          transactionId: travellingoId,
        ),
      ));
    }
    // Handle notification response
  }

  @pragma('vm:entry-point')
  static Future<void> onNotificationClickFirebase(
      RemoteMessage? message) async {
    final payload = message?.data;
    if (payload == null) return;

    print("background notif payload : $payload");
    final travellingoId = payload['pendingPaymentId'];

    if (travellingoId != null) {
      DateTime lastPinEnter = await Store.getLastPinEnter();

      Duration diff = DateTime.now().difference(lastPinEnter);
      if (diff.inMinutes >= 5) {
        await Store.removeLastPinEnter();
        bool? isPinValid = await navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => const InsertPin(),
          ),
        );

        if (isPinValid == null || !isPinValid) {
          navigatorKey.currentState
              ?.pushNamedAndRemoveUntil('/login', (route) => false);
        }
        return;
      }

      navigatorKey.currentState?.push(slideInFromBottom(
        TravellingoPaymentDetail(
          transactionId: travellingoId,
        ),
      ));
    }
    // Handle notification response
  }
}
