import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeModel(prefs),
      child: const NeonApp(),
    ),
  );
}

class ThemeModel extends ChangeNotifier {
  final SharedPreferences _prefs;
  ThemeModel(this._prefs);
  bool get dark => _prefs.getBool('dark') ?? true;
  Color get accent => Color(_prefs.getInt('accent') ?? 0xFF7B61FF);
  void toggle() {
    _prefs.setBool('dark', !dark);
    notifyListeners();
  }
  void setAccent(Color c) {
    _prefs.setInt('accent', c.value);
    notifyListeners();
  }
}

class NeonApp extends StatelessWidget {
  const NeonApp({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ThemeModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neon Shadow VPN',
      theme: ThemeData(
        colorSchemeSeed: model.accent,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: model.accent,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: model.dark ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
