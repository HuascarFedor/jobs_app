import 'package:flutter/material.dart';
import 'package:jobs_app/item.dart';
import 'package:jobs_app/job.dart';
import 'package:jobs_app/job_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = context.watch<JobProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Ofertas de Trabajo')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: jobProvider.jobs.length,
                itemBuilder: (context, index) {
                  final Job job = jobProvider.jobs[index];
                  return Item(data: job);
                }),
          ),
        ],
      ),
    );
  }
}
