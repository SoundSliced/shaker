import 'package:flutter/material.dart';
import 'package:shaker/shaker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shaker Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ShakerExamplePage(),
    );
  }
}

class ShakerExamplePage extends StatefulWidget {
  const ShakerExamplePage({super.key});

  @override
  State<ShakerExamplePage> createState() => _ShakerExamplePageState();
}

class _ShakerExamplePageState extends State<ShakerExamplePage> {
  bool _isShaking = false;

  void _triggerShake({bool autoReset = true}) {
    setState(() {
      _isShaking = true;
    });

    // Reset shake state after animation completes
    if (autoReset) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) {
          setState(() {
            _isShaking = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shaker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap the button to shake the icon:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Shaker(
              isShaking: _isShaking,
              child: Icon(
                Icons.favorite,
                size: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _triggerShake,
              child: const Text('Shake It!'),
            ),
            const SizedBox(height: 60),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              'Custom shake with different parameters:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Shaker(
              isShaking: _isShaking,
              duration: const Duration(milliseconds: 800),
              hz: 6,
              rotation: -0.05,
              offset: const Offset(0.3, 0.3),
              curve: Curves.bounceInOut,
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Custom shake completed!')),
                );
                //reset shake state
                setState(() {
                  _isShaking = false;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'BOX',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
