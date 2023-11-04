import 'package:flutter_riverpod/flutter_riverpod.dart';
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(this.ref) : super(0);

  final Ref ref;

  Future<void> increment() async {
    state++;
  }

  Future<void> decrement() async {
    state--;
  }
 }

 final counterStateProvider = StateNotifierProvider<CounterNotifier, int >((ref) {
  return CounterNotifier(ref);
 });