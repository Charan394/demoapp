import 'package:flutter/material.dart';
import 'package:sample/features/bloc/sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/widgets/sampleList.dart';
import 'package:sample/features/widgets/sample_button.dart';

class Landingview extends StatelessWidget {
  const Landingview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const SampleAppList(),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            context.read<SampleBloc>().add(SampleEvent());
          },
          child: Text('refresh'),
        ),
      ),
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
        if (state.status.isLoading || state.status.isInitial) {
          return Center(
            child: SampleButton(
              text: 'fetch data',
              isLoading: state.status.isLoading,
              onPressed: () {
                context.read<SampleBloc>().add(SampleEvent());
              },
            ),
          );
        } else if (state.status.isError) {
          return Center(child: Text('Something went wrong '));
        }
        return SampleListView(data: state.data);
      },
    );
  }
}
