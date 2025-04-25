import 'package:flutter/material.dart';

class QuestionnaireModel {
  final String? name;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? dob;
  final String? gender;

  const QuestionnaireModel({
    this.name,
    this.username,
    this.email,
    this.phoneNumber,
    this.dob,
    this.gender,
  });

  QuestionnaireModel copyWith({
    String? name,
    String? username,
    String? email,
    String? phoneNumber,
    String? dob,
    String? gender,
  }) {
    return QuestionnaireModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
    );
  }
}

enum Gender { male, female, others } 