import 'package:veda_learn/features/course/domain/entity/course_entity.dart';

import 'package:hive_flutter/adapters.dart';


import 'package:veda_learn/app/constant/hive/hive_table_constant.dart';

part 'course_hive_model.g.dart';


@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String language;

  @HiveField(2)
  String description;

  @HiveField(3)
  String flagPath;


  CourseHiveModel({
    this.id,
    required this.language,
    required this.description,
    required this.flagPath,
    
  });

  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
      id: entity.id,
      language: entity.language,
      description: entity.description,
      flagPath: entity.flagPath,
     
    );
  }

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      language: language,
      description: description,
      flagPath: flagPath,
     
    );
  }
}
