import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';   // уже объявлен выше

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool connected = false;
  void toggle() => setState(() => connected = !connected);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ThemeModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Shadow VPN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.palette),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Accent color'),
                content: SizedBox(
                  width: 200,
                  height: 200,
                  child: BlockPicker(
                    pickerColor: model.accent,
                    onColorChanged: model.setAccent,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(model.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: model.toggle,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeonButton(
              onTap: toggle,
              active: connected,
            ),
            const SizedBox(height: 24),
            Text(
              connected ? 'Connected' : 'Disconnected',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
