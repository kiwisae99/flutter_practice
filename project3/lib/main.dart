import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/counter_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen()
      );
  }
}

class CounterScreen extends ConsumerWidget{
  const CounterScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Riverpod'),
      
      ),
      body: Center(
        child: Text('$count', style: TextStyle(fontSize: 32),),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () => ref.read(counterStateProvider.notifier).increment(), child: const Icon(Icons.add),),
          SizedBox(height: 8,),
          FloatingActionButton(onPressed: ()=> ref.read(counterStateProvider.notifier).decrement(), child: const  Icon(Icons.remove),)
        ],
      ),
    );
  }


}
