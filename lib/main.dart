import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FCM Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.subscribeToTopic("messaging");

    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
    });

    FirebaseMessaging.onMessage.listen((message) {
      final type = message.data['type'] ?? 'regular';
      final body = message.notification?.body ?? 'No message';
      final imageUrl = message.notification?.android?.imageUrl ??
                       message.notification?.apple?.imageUrl;

      setState(() {
        notifications.add({
          'type': type,
          'message': body,
          'image': imageUrl ?? '',
        });
      });

      _showNotificationDialog(type, body, imageUrl);
    });
  }

  void _showNotificationDialog(String type, String body, String? imageUrl) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: type == 'important' ? Colors.redAccent : Colors.blueAccent,
        title: Text(type == 'important' ? '🚨 Important' : '🔔 Regular', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(body, style: TextStyle(color: Colors.white)),
            if (imageUrl != null && imageUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image.network(imageUrl),
              ),
          ],
        ),
        actions: [
          TextButton(child: Text("Close", style: TextStyle(color: Colors.white)), onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("FCM Notifications")),
        body: Center(child: Text("Send a message")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.history),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HistoryPage(notifications: notifications)),
            );
          },
        ),
      );
}

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> notifications;

  HistoryPage({required this.notifications});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Notification History")),
        body: notifications.isEmpty
            ? Center(child: Text("No notifications yet."))
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (_, i) {
                  final note = notifications[i];
                  final type = note['type'] ?? 'regular';
                  return ListTile(
                    leading: Icon(
                      type == 'important' ? Icons.warning : Icons.notifications,
                      color: type == 'important' ? Colors.red : Colors.blue,
                    ),
                    title: Text(note['message'] ?? ''),
                    subtitle: Text(
                      "Type: ${type == 'important' ? 'Important' : 'Regular'}",
                      style: TextStyle(
                        color: type == 'important' ? Colors.red : Colors.blue,
                      ),
                    ),
                    trailing: note['image'] != null && note['image']!.isNotEmpty
                        ? Image.network(
                            note['image']!,
                            height: 50,
                          )
                        : null,
                  );
                },
              ),
      );
}
