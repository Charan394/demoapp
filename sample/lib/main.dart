import 'package:flutter/material.dart';
import 'package:sample/features/bloc/sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/view/sample.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: Landingview(),
    );
  }
}
