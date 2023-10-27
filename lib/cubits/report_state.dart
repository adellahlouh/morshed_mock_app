part of 'report_cubit.dart';

enum ReportStateStatus {
  initial,
  loading,
  successfulCalls,
  allCalls,
  pendingCalls,
  refresh,
  failed
}

class ReportState {
  final ReportStateStatus? status;
  final List<StdModel> allCalls;
  final List<StdModel> successfulCalls;
  final List<StdModel> pendingCalls;

  const ReportState._({
    this.status,
    this.allCalls = const [],
    this.successfulCalls = const [],
    this.pendingCalls = const [],
  });

  static const ReportState initial = ReportState._(
    status: ReportStateStatus.initial,
    allCalls: [],
    successfulCalls: [],
    pendingCalls: [],
  );

  ReportState loading() => copyWith(status: ReportStateStatus.loading);

  ReportState error() => copyWith(status: ReportStateStatus.failed);

  // ReportState success() => copyWith(
  //   status: ReportStateStatus.success,
  // );

  ReportState refresh() => copyWith(status: ReportStateStatus.refresh);

  ReportState copyWith({
    ReportStateStatus? status,
    List<StdModel>? allCalls,
    List<StdModel>? successfulCalls,
    List<StdModel>? pendingCalls,
  }) {
    return ReportState._(
      status: status ?? this.status,
      allCalls: allCalls ?? this.allCalls,
      successfulCalls: successfulCalls ?? this.successfulCalls,
      pendingCalls: pendingCalls ?? this.pendingCalls,
    );
  }

  @override
  String toString() => "ReportState: status is $status";
}
