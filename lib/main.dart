import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalValueProvider =
    StateProvider<String>((ref) => "Hello from Provider");

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
    ref.listen<String>(globalValueProvider, (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("State changed, old value: $previous, new value $current"),
          backgroundColor: Colors.red,
        ),
      );
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ref.watch(globalValueProvider),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          child: Text("Change value"),
          onPressed: () {
            ref.read(globalValueProvider.notifier).state =
                "Hello from Aamir Pinger.";
          },
        )
      ],
    );
  }
}
