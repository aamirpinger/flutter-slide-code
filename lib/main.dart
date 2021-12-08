import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// To create a StateNotifier you first need to create class/model to hold the state
class MyState {
  MyState({required this.value});

  final String value;

  MyState copyWith(String? newValue) {
    return MyState(value: newValue ?? value);
  }
}

class MyValue extends StateNotifier<MyState> {
  MyValue() : super(MyState(value: 'This is initial state.'));

  // assign state a new value, in the following case new MyState instance.
  // we can also directly return MyState instance instead of state.copyWith
  void update(String newValue) => state = state.copyWith(newValue);

  // we can many methods to help state manipulation
}

final valueProvider =
    StateNotifierProvider<MyValue, MyState>((ref) => MyValue());

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
    ref.listen<MyState>(valueProvider, (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "State changed, old value: ${previous?.value}, new value ${current.value}",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Colors.red,
        ),
      );
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ref.read(valueProvider.notifier).state.value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          child: Text("Change value"),
          onPressed: () {
            ref
                .read(valueProvider.notifier)
                .update("Hello from State Notifier Provider.");
          },
        )
      ],
    );
  }
}
