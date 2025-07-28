import 'package:flutter/material.dart';
import 'package:lib_boloto_launcher/main-content.dart';
import 'package:lib_boloto_launcher/theme/boloto_theme.dart';
import 'l10n/app_localizations.dart';
import 'components/modpack/modpack_item.dart';
import 'package:window_manager/window_manager.dart';
import 'components/modpack/modpack_page.dart';
import 'package:lib_boloto_launcher/hover-box.dart';
import 'package:lib_boloto_launcher/components/settings/settings-page.dart';
import "package:lib_boloto_launcher/pages.dart";

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

  PageType currentPage = PageType.echoes;

  void selectPage(PageType page) {
    setState(() {
      currentPage = page;
    });
  }

  Widget _buildCurrentPage() {
    Widget child;
    switch (currentPage) {
      case PageType.settings:
        child = const SettingsPage();
        break;
      case PageType.echoes:
        child = const ModpackPage(page: PageType.echoes);
        break;
      default:
        child = const Center(child: Text('Page not found'));
    }
    // Wrap with KeyedSubtree to ensure AnimatedSwitcher detects changes
    return KeyedSubtree(key: ValueKey(currentPage), child: child);
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
                        selected: currentPage,
                        page: PageType.echoes,
                        onTap: selectPage,
                        imagePath: "assets/images/echoes_icon.png",
                      ),
                      ModpackItem(
                        name: "Modpack 2",
                        selected: currentPage,
                        page: PageType.modpack2,
                        onTap: selectPage,
                        imagePath: "assets/images/echoes_bg.png",
                      ),
                      ModpackItem(
                        name: "More soon...",
                        selected: currentPage,
                        page: PageType.moreSoon,
                        onTap: selectPage,
                        isClickable: false,
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
                      HoverBox(
                        child: OutlinedButton(
                          onPressed: () {
                            selectPage(PageType.settings);
                          },

                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Icon(
                            Icons.settings,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                      HoverBox(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle settings action
                          },

                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Icon(
                            Icons.help_outline,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                      HoverBox(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle settings action
                          },

                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Icon(
                            Icons.bug_report,
                            size: 20,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // RIGHT COLUMN - Main content
          Expanded(child: MainContent(child: _buildCurrentPage())),
        ],
      ),
    );
  }
}
