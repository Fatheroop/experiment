import 'package:flutter/material.dart';
import 'package:code_forge/code_forge.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final CodeForgeController _controller = CodeForgeController();
  final UndoRedoController _undoRedoController = UndoRedoController();
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ready = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _ready
            ? CodeForge(
                filePath: "D:\\Flutter projects\\experiment\\lib\\main.dart",
                controller: _controller,
                undoController: _undoRedoController,
              )
            : const Center(child: SizedBox()),
      ),
    );
  }
}
