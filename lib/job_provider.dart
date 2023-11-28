import 'package:flutter/material.dart';
import 'package:jobs_app/job.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobProvider extends ChangeNotifier {
  List<Job> _jobs = [];
  List<Job> get jobs => _jobs;

  JobProvider() {
    _fetchJobs();
  }
  Future<void> _fetchJobs() async {
    const String url = 'https://api-jobs-production.up.railway.app/api/jobs';
    //conectarse con el servidor
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //parsear los datos
      _jobs = (json.decode(response.body) as List)
          .map((data) => Job.fromJson(data))
          .toList();
    } else {
      throw Exception('Fallo la conexion');
    }
  }
}
