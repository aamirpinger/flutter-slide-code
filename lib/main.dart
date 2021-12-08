import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalValueProvider = Provider<String>((ref) => "Hello from Provider");

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Parent(),
          ),
        ),
      ),
    ),
  );
}

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirstChild();
  }
}

class FirstChild extends StatelessWidget {
  const FirstChild();

  @override
  Widget build(BuildContext context) {
    return GrandChild();
  }
}

class GrandChild extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(globalValueProvider),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48,
        color: Colors.red,
      ),
    );
  }
}
