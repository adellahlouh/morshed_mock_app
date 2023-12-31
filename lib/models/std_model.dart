import 'package:flutter/material.dart';
import 'package:morshed_mock_app/colors.dart';

enum OnboardingStatus  { onboard, followup , all}


enum CallStatus {
  success(AppColors.kPositive),
  pending(AppColors.kPrimarySecondColor),
  failed(AppColors.kNegative);

  final Color color;
  const CallStatus(this.color);
}

class StdModel {
  final int id;

  final OnboardingStatus onboardingStatus;

  final String fullName;

  final String email;

  final String phoneNumber;

  final DateTime lastContacted;

  final String topSubject;

  final String worstSubject;

  final DateTime lastActiveDate;
  final DateTime lastDateCalled;

  final String programName;

  final CallStatus callStatus;

  StdModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.lastContacted,
    required this.onboardingStatus,
    required this.topSubject,
    required this.worstSubject,
    required this.lastActiveDate,
    required this.lastDateCalled,
    required this.programName,
    required this.callStatus,
  });
}
