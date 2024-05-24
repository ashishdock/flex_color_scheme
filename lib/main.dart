import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme_demo/theme_mode_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModeNotifier())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeMode? themeMode;
  const MyApp({super.key, this.themeMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
          scheme: context.watch<ThemeModeNotifier>().usedScheme,
          useMaterial3: true),
      darkTheme: FlexThemeData.dark(
          scheme: context.watch<ThemeModeNotifier>().usedScheme,
          useMaterial3: true),
      themeMode: context.watch<ThemeModeNotifier>().themeMode,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isDarkEnabled = false; // Moved here to be part of widget's state
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool isDarkEnabled = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        actions: [
          // const Text("Dark Mode"),
          // Switch(
          //   value: isDarkEnabled,
          //   onChanged: (value) {
          //     setState(() {
          //       isDarkEnabled = value;
          //     });
          //     if (value) {
          //       // Enable Dark Mode
          //       context.read<ThemeModeNotifier>().themeMode = ThemeMode.dark;
          //     } else {
          //       // Enable Light Mode
          //       context.read<ThemeModeNotifier>().themeMode = ThemeMode.light;
          //     }
          //   },
          // ),
          IconButton(
            onPressed: () {
              final themeNotifier = context.read<ThemeModeNotifier>();
              final currentMode = themeNotifier.themeMode;
              themeNotifier.themeMode = currentMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
            icon: Icon(
              context.watch<ThemeModeNotifier>().themeMode == ThemeMode.dark
                  ? Icons.light_mode_rounded // Use a sun icon when in dark mode
                  : Icons
                      .dark_mode_rounded, // Use a moon icon when in light mode
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
                  FlexScheme.aquaBlue,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: const Text(
                "Change to Aqua Blue",
                // style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
                  FlexScheme.pinkM3,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: const Text(
                "Change to Pink",
                // style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
                  FlexScheme.greyLaw,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              ),
              child: const Text(
                "Change to Green Law",
                // style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'You have pushed the button this many times:',
              // style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       ElevatedButton(
      //         onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
      //             FlexScheme.aquaBlue,
      //         child: const Text("Change to Aqua Blue"),
      //       ),
      //       ElevatedButton(
      //         onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
      //             FlexScheme.pinkM3,
      //         child: const Text("Change to Pink"),
      //       ),
      //       ElevatedButton(
      //         onPressed: () => context.read<ThemeModeNotifier>().usedScheme =
      //             FlexScheme.greyLaw,
      //         child: const Text("Change to Green Law"),
      //       ),
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
