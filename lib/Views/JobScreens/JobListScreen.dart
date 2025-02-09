import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controller/JobController.dart';
import 'JobDetailScreen.dart'; // Import the JobDetailScreen

class JobListScreen extends StatefulWidget {
  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  @override
  Widget build(BuildContext context) {
    final jobController = Provider.of<JobController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Jobs"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: jobController.isLoading
          ? Center(child: CircularProgressIndicator())
          : jobController.jobResponse?.data.isNotEmpty == true
              ? ListView.builder(
                  itemCount: jobController.jobResponse!.data.length,
                  itemBuilder: (context, index) {
                    final job = jobController.jobResponse!.data[index];
                    return ListTile(
                      leading: job.employerLogo != null
                          ? Image.network(job.employerLogo!)
                          : Icon(Icons.business),
                      title: Text(job.jobTitle),
                      subtitle: Text(job.employerName),
                      onTap: () {
                        // Navigate to JobDetailScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailScreen(job: job),
                          ),
                        );
                      },
                    );
                  },
                )
              : Center(child: Text("No jobs found")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          jobController.fetchJobs('developer jobs in chicago', 1, 1, 'us', 'all');
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
