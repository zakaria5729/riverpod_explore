import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/provider/providers.dart';

class WelcomeWidget2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Riverpod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final welcomeString2 = ref.watch(welcomeProvider2);

              return Text(welcomeString2,);
            },
          )
        ),
      ),
    );
  }
}
