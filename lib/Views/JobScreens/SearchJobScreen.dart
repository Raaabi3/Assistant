import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controller/JobController.dart';
import 'JobListScreen.dart';
import '../../Widgets/Jobwidgets/CustomIconButton.dart';
import '../../Widgets/Jobwidgets/CustomSearchbar.dart';
import '../../Widgets/Jobwidgets/SearchFunctions.dart';

class Searchjobscreen extends StatefulWidget {
  const Searchjobscreen({super.key});

  @override
  State<Searchjobscreen> createState() => _SearchjobscreenState();
}

class _SearchjobscreenState extends State<Searchjobscreen> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch(BuildContext context) {
    final jobController = Provider.of<JobController>(context, listen: false);
    String query = _searchController.text.trim();
    
    if (query.isNotEmpty) {
      jobController.fetchJobs(query, 1, 1, 'tn', 'all');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => JobListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSearchBar(
                controller: _searchController,
                onSubmitted: (value) => _performSearch(context),
              ),
              CustomIconButton(
                icon: Icons.search_outlined,
                onPressed: () => _performSearch(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
