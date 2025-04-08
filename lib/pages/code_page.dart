import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:dart_eval/dart_eval.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  late final CodeController _codeController;
  bool _isDark = true;

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: _initialCode,
      language: dart,
      analyzer: DartPadAnalyzer(), // real‑time Dart errors
    );
  }

  static const String _initialCode = '''
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello Flutter!')),
      body: Center(
        child: Text(
          'Edit this code and tap ▶️ to run.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
''';

  Future<void> _runCode() async {
    final source = _codeController.text;

    try {
      // 1) Compile
      final compiler = Compiler();
      compiler.addPlugin(flutterEvalPlugin);
      final program = compiler.compile({
        'playground': {'main.dart': source},
      });

      // 2) Load into runtime
      final runtime = Runtime.ofProgram(program);
      runtime.addPlugin(flutterEvalPlugin);
      runtime.setup();

      // 3) Execute the PreviewWidget constructor
      final result = runtime.executeLib(
        'package:playground/main.dart',
        'PreviewWidget.',
        [], // no constructor args
      );

      if (result is $Value && result.$value is Widget) {
        final widget = result.$value as Widget;
        // 4) Push a preview screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  appBar: AppBar(title: const Text('Preview')),
                  body: SafeArea(child: widget),
                ),
          ),
        );
      } else {
        throw Exception('Did not return a Widget');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error running code:\n$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMap = _isDark ? monokaiSublimeTheme : githubTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Code Editor'),
        backgroundColor: _isDark ? Colors.black87 : Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Run code',
            onPressed: _runCode,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CodeTheme(
        data: CodeThemeData(styles: themeMap),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: CodeField(
            controller: _codeController,
            textStyle: const TextStyle(
              fontFamily: 'SourceCodePro',
              fontSize: 14,
              height: 1.5,
            ),
            gutterStyle: const GutterStyle(
              showLineNumbers: true,
              showFoldingHandles: true,
              showErrors: true,
            ),
          ),
        ),
      ),
    );
  }
}
