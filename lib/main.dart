import 'package:ecommerce_riverpod_firebase/const/img_icon_const.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:svg_flutter/svg.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(builder: (context, ref, _) {
              final count = ref.watch(counterValue);
              return Text(
                count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            SvgPicture.asset(AppImgIcon.demoAppImg, height: 200),
          ],
        ),
      ),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  ref.watch(counterValue.notifier).update((state) => ++state),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () =>
                  ref.watch(counterValue.notifier).update((state) => 0),
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final counterValue = StateProvider<int>((ref) => 0);
