// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectData {
  final String projectName;
  final String projectDesc;

  ProjectData({
    required this.projectName,
    required this.projectDesc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectName': projectName,
      'projectDesc': projectDesc,
    };
  }

  factory ProjectData.fromMap(Map<String, dynamic> map) {
    return ProjectData(
      projectName: map['projectName'] as String ?? '',
      projectDesc: map['projectDesc'] as String ?? '',
      //       projectName: map['projectName'] != null
      //     ? map['projectName'].toString()
      //     : '', // Convert to string if not null
      // projectDesc:
      //     map['projectDesc'] != null ? map['projectDesc'].toString() : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectData.fromJson(String source) =>
      ProjectData.fromMap(json.decode(source) as Map<String, dynamic>);
}
