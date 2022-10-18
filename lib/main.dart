import 'package:flutter/material.dart';
import 'package:musicplayer/provider/homeProvider.dart';
import 'package:musicplayer/view/homeScreen.dart';
import 'package:musicplayer/view/listScreen.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ListenableProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
          'list': (context) => const ListScreen(),
        },
      ),
    ),
  );
}