import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flyoo/l10n/generated/app_localizations.dart';
import 'package:flyoo/providers/account_provider.dart';
import 'package:flyoo/providers/endpoints_provider.dart';
import 'package:flyoo/providers/settings_provider.dart';
import 'package:flyoo/screens/home_screen.dart';
import 'package:flyoo/screens/settings_screen.dart';
import 'package:flyoo/screens/workspace_screen.dart';
import 'package:flyoo/services/persistence/database_helper.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // Ensure flutter widgets loaded correctly
  WidgetsFlutterBinding.ensureInitialized();

  // Shared preferences initialize
  final prefs = await SharedPreferences.getInstance();

  // Init database model for different OS
  // Android has it's own ways to handle with database factory, so when this
  // software running in Android, it's no need to modify `databaseFactory`
  if (Platform.isLinux || Platform.isWindows) {
    databaseFactory = databaseFactoryFfi;
  }

  // The function [runApp] needs more attention, when develop some services
  // and some logical things should run before the [runApp].
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider(prefs)),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => EndpointsProvider()),
      ],
      child: const MainApp(),
    ),
  );

  // Immersive status bar and navigation bar
  // Note: Everyone should save this code to the storage of code snippet :)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

/// Global Database object ! DON'T MODIFY IT UNLESS YOU KNOW WHAT ARE YOU DOING
final DatabaseHelper databaseHelper = DatabaseHelper();

/// Global logger
final logger = Logger();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Variable `_pages` contains constructors of pages
  final List<Widget> _pages = [
    HomeScreen(),
    WorkspaceScreen(),
    SettingsScreen(),
  ];

  // The page controller controls the change of each page, I called pages as
  // screen in the source file
  final PageController _pageController = PageController();
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      // Do not show a debug banner when testing
      debugShowCheckedModeBanner: false,

      // Locale
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: () {
        final parts = settingsProvider.languageCode.split('-');
        return parts.length == 2
            ? Locale(parts[0], parts[1])
            : Locale(parts[0]);
      }(),

      // Defines light and dark themes
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
          brightness: Brightness.dark,
        ),
      ),

      // Dark theme or Light theme swither is defined in the settings page
      themeMode: settingsProvider.themeMode,

      home: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth > 800;

          return Scaffold(
            body: Row(
              children: [
                if (isLargeScreen)
                  NavigationRail(
                    backgroundColor:
                        Theme.of(context).colorScheme.onInverseSurface,
                    elevation: 4,
                    selectedIndex: _selectedPageIndex,
                    labelType: NavigationRailLabelType.all,
                    onDestinationSelected: _onItemTapped,
                    destinations: [
                      NavigationRailDestination(
                        icon: const Icon(Icons.dashboard),
                        label: Text(AppLocalizations.of(context)!.home),
                      ),

                      NavigationRailDestination(
                        icon: const Icon(Icons.work),
                        label: Text(AppLocalizations.of(context)!.workspace),
                      ),

                      NavigationRailDestination(
                        icon: const Icon(Icons.settings),
                        label: Text(AppLocalizations.of(context)!.settings),
                      ),
                    ],
                  ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _pages,
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                isLargeScreen
                    ? null
                    : NavigationBar(
                      selectedIndex: _selectedPageIndex,
                      onDestinationSelected: _onItemTapped,
                      destinations: [
                        NavigationDestination(
                          icon: Icon(Icons.dashboard),
                          label: AppLocalizations.of(context)!.home,
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.work),
                          label: AppLocalizations.of(context)!.workspace,
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.settings),
                          label: AppLocalizations.of(context)!.settings,
                        ),
                      ],
                    ),
          );
        },
      ),
    );
  }

  /// Handle click events for the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 00),
        curve: Curves.easeInOut,
      );
    });
  }
}
