import 'package:flutter/material.dart';
import '../../Model/Job.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.jobTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              job.employerLogo != null
                  ? Image.network(job.employerLogo!)
                  : Icon(Icons.business, size: 100),
              SizedBox(height: 16),
              Text(
                'Job Title: ${job.jobTitle}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Employer: ${job.employerName}'),
              SizedBox(height: 8),
              Text('Location: ${job.jobLocation}'),
              SizedBox(height: 8),
              Text('Description:'),
              SizedBox(height: 8),
              Text(job.jobDescription),
              SizedBox(height: 8),
              Text('Remote: ${job.jobIsRemote ? 'Yes' : 'No'}'),
              SizedBox(height: 8),
              job.jobPostedAt != null
                  ? Text('Posted on: ${job.jobPostedAt}')
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
