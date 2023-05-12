class CandidateStatus {
  final int id;
  final String status;
  final String jobTitle;
  final String companyName;
  final String industry;

  CandidateStatus(
      {required this.id,
      required this.status,
      required this.jobTitle,
      required this.companyName,
      required this.industry});

  factory CandidateStatus.fromJson(Map<String, dynamic> json) {
    return CandidateStatus(
        id: json['id'],
        status: json['status'],
        jobTitle: json['job_title'],
        companyName: json['company_name'],
        industry: json['industry']);
  }
}
