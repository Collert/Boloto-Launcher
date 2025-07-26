import 'package:flutter/material.dart';
import 'package:lib_boloto_launcher/theme/boloto_theme.dart';
import 'l10n/app_localizations.dart';
import 'components/modpack_item.dart';
import 'package:window_manager/window_manager.dart';
import 'components/modpack_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.setTitle('Boloto Launcher');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boloto Launcher',
      theme: BolotoTheme.theme,
      home: const MyHomePage(title: 'Boloto Launcher'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  int _selectedModpackIndex = 0;

  void _onModpackSelected(int index) {
    setState(() {
      _selectedModpackIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT COLUMN - Navigation menu
          Container(
            width: 200, // Adjust to taste
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                // Modpack selector list
                Expanded(
                  child: ListView(
                    children: [
                      // Repeat for each modpack
                      ModpackItem(
                        name: "Echoes Untamed",
                        selected: _selectedModpackIndex,
                        index: 0,
                        onTap: _onModpackSelected,
                        imagePath: "assets/images/echoes_icon.png",
                        description:
                            "A thrilling adventure awaits in Echoes Untamed. Explore vast worlds, conquer challenges, and uncover secrets. Join the journey today!",
                      ),
                      ModpackItem(
                        name: "Modpack 2",
                        selected: _selectedModpackIndex,
                        index: 1,
                        onTap: _onModpackSelected,
                        imagePath: "assets/images/echoes_bg.png",
                        description: "Experience the wonders of Modpack 2.",
                      ),
                      ModpackItem(
                        name: "More soon...",
                        selected: _selectedModpackIndex,
                        index: 1000,
                        onTap: _onModpackSelected,
                        isClickable: false,
                        description: "More content coming soon...",
                      ),
                    ],
                  ),
                ),
                // Bottom icon row
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.settings, color: Colors.white),
                      Icon(Icons.help_outline, color: Colors.white),
                      Icon(Icons.bug_report, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // RIGHT COLUMN - Main content
          ModpackPage(
            title: "Echoes Untamed",
            description:
                "A thrilling adventure awaits in Echoes Untamed. Explore vast worlds, conquer challenges, and uncover secrets. Join the journey today!",
            logoPath: "assets/images/echoes_logo.png",
            backgroundImagePath: "assets/images/echoes_bg.png",
          ),
        ],
      ),
    );
  }
}
