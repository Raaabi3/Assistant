/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/JobController.dart';
import '../Model/Job.dart';

class JobHistoryScreen extends StatefulWidget {
  @override
  _JobHistoryScreenState createState() => _JobHistoryScreenState();
}

class _JobHistoryScreenState extends State<JobHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<JobController>(context, listen: false).loadJobHistory();
  }

  @override
  Widget build(BuildContext context) {
    final jobController = Provider.of<JobController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Job Search History")),
      body: jobController.jobHistory.isEmpty
          ? Center(child: Text("No job history available"))
          : ListView.builder(
              itemCount: jobController.jobHistory.length,
              itemBuilder: (context, index) {
                final Job job = jobController.jobHistory[index];
                return ListTile(
                  leading: job.employerLogo != null
                      ? Image.network(job.employerLogo!)
                      : Icon(Icons.business),
                  title: Text(job.jobTitle),
                  subtitle: Text(job.employerName),
                );
              },
            ),
    );
  }
}
*/