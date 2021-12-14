import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/future_provider/fake_weather_provider.dart';
import 'package:riverpod_explore/provider/counter_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MyHomePage2(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final responseValue = ref.watch(fakeWeatherResponseProvider("Dhaka"));
                final responseAutoDisposeValue = ref.watch(fakeWeatherResponseAutoDisposeProvider("Dhaka"));

                // return responseValue.map(
                //   data: (data) => Text("${data.value}"),
                //   error: (error) => Text("Error: ${error.error.toString()}"),
                //   loading: (loading) => CircularProgressIndicator(),
                // );

                return Column(
                  children: [
                    responseValue.when(
                      loading: () => CircularProgressIndicator(),
                      error: (error, stackTrace) => Text("Error: ${error.toString()}"),
                      data: (data) => Text(
                        "$data",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),

                    SizedBox(height: 12,),

                    responseAutoDisposeValue.when(
                      loading: () => CircularProgressIndicator(),
                      error: (error, stackTrace) => Text("Error: ${error.toString()}"),
                      data: (data) => Text(
                        "$data",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(counterProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${provider.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeWidget()),);
            ref.read(counterProvider).incrementValue();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  final String title;

  MyHomePage2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                final counterNotifier = ref.watch(counterProvider);

                return Text(
                  '${counterNotifier.value  }',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeWidget()),);
              ref.read(counterProvider).incrementValue();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      )
    );
  }
}
