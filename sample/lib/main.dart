import 'package:flutter/material.dart';
import 'package:sample/features/bloc/sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/widgets/sampleList.dart';
import 'package:sample/features/widgets/sample_button.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: MaterialApp(home: Scaffold(body: const SampleAppList())),
    );
  }
}

class SampleAppList extends StatelessWidget {
  const SampleAppList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SampleBloc, SampleState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if(state.status.isLoading){return Center(
          child: SampleButton(text: 'fetch data', isLoading: state.status.isLoading, onPressed: () {
            context.read<SampleBloc>().add(SampleEvent());
            },),
        );
          
          }else if(state.status.isError){
            return Center(child: Text('Something went wrong '));
          
          }
        return SampleListView(data: state.data,);
      },
    );
  }
}
