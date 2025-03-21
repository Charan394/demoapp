import 'package:flutter/material.dart';
import 'package:sample/features/api_models.dart/sample_model.dart';

class SampleListView extends StatelessWidget {
  final List<SampleResponse> data;

  const SampleListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item.body),
            leading: CircleAvatar(child: Text(item.id.toString())),
          ),
        );
      },
    );
  }
}
