import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/provider/providers.dart';
import 'package:riverpod_explore/welcome_widget2.dart';

class WelcomeWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeString = ref.watch(welcomeProvider);

    return MaterialApp(
      title: 'Riverpod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(welcomeString,),
                TextButton(
                  child: Text("Send To"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeWidget2()),);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}