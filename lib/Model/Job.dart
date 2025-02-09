class Job {
  final String jobId;
  final String jobTitle;
  final String employerName;
  final String? employerLogo;
  final String? employerWebsite;
  final String jobDescription;
  final bool jobIsRemote;
  final String jobLocation;
  final String? jobPostedAt;

  Job({
    required this.jobId,
    required this.jobTitle,
    required this.employerName,
    this.employerLogo,
    this.employerWebsite,
    required this.jobDescription,
    required this.jobIsRemote,
    required this.jobLocation,
    this.jobPostedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobId: json['job_id'],
      jobTitle: json['job_title'],
      employerName: json['employer_name'],
      employerLogo: json['employer_logo'],
      employerWebsite: json['employer_website'],
      jobDescription: json['job_description'],
      jobIsRemote: json['job_is_remote'],
      jobLocation: json['job_location'],
      jobPostedAt: json['job_posted_at'],
    );
  }

  // Define toJson() method to convert Job to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'job_title': jobTitle,
      'employer_name': employerName,
      'employer_logo': employerLogo,
      'employer_website': employerWebsite,
      'job_description': jobDescription,
      'job_is_remote': jobIsRemote,
      'job_location': jobLocation,
      'job_posted_at': jobPostedAt,
    };
  }
}
