import 'package:flutter/material.dart';

void main() {
  runApp(BolotoLauncherApp());
}

class BolotoLauncherApp extends StatelessWidget {
  const BolotoLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boloto Launcher',
      theme: ThemeData.dark(),
      home: LauncherHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LauncherHomePage extends StatefulWidget {
  const LauncherHomePage({super.key});

  @override
  _LauncherHomePageState createState() => _LauncherHomePageState();
}

class _LauncherHomePageState extends State<LauncherHomePage> {
  String status = "Checking for updates...";

  @override
  void initState() {
    super.initState();
    // TODO: Add update check here
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        status = "Up to date!";
      });
    });
  }

  void launchGame() {
    setState(() {
      status = "Launching game...";
    });
    // TODO: Run java process
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 500,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Boloto Launcher 🐸',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(status),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: launchGame,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text('Play', style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
