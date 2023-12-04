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
                controller: jobProvider.jobScrollController,
                itemCount: jobProvider.jobs.length,
                itemBuilder: (context, index) {
                  final Job job = jobProvider.jobs[index];
                  return Item(
                    data: job,
                    onDeletePressed: () => jobProvider.deleteJob(job.id!),
                    onEditPressed: () => _editJob(job, context, jobProvider),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addJob(context, jobProvider),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addJob(BuildContext context, JobProvider jobProvider) {
    showDialog(
        context: context,
        builder: (context) {
          String title = '';
          String description = '';
          return AlertDialog(
            title: const Text('Nuevo Trabajo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    onChanged: (value) {
                      title = value;
                    },
                    decoration: const InputDecoration(labelText: 'Trabajo'),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      description = value;
                    },
                    decoration: const InputDecoration(labelText: 'Descripción'),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  jobProvider
                      .addJob(Job(title: title, description: description));
                  Navigator.of(context).pop();
                },
                child: const Text('Agregar'),
              ),
            ],
          );
        });
  }

  void _editJob(Job job, context, JobProvider jobProvider) {
    final TextEditingController titleController =
        TextEditingController(text: job.title);
    final TextEditingController descriptionController =
        TextEditingController(text: job.description);
    showDialog(
        context: context,
        builder: (context) {
          String title = job.title;
          String description = job.description;
          return AlertDialog(
            title: const Text('Editar Trabajo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: titleController,
                    onChanged: (value) {
                      title = value;
                    },
                    decoration: const InputDecoration(labelText: 'Trabajo'),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      description = value;
                    },
                    decoration: const InputDecoration(labelText: 'Descripción'),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  jobProvider.updateJob(
                      Job(id: job.id, title: title, description: description));
                  Navigator.of(context).pop();
                },
                child: const Text('Actualizar'),
              ),
            ],
          );
        });
  }
}
