import 'package:bloc/bloc.dart';
import 'package:morshed_mock_app/constants.dart';
import 'package:morshed_mock_app/std_model.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportState.initial);

  void getAllCalls() {
    emit(state.loading());
    try {
      final allCalls = stdModelList;
      emit(
        state.copyWith(
          allCalls: allCalls,
          successfulCalls: allCalls
              .where(
                (e) => e.callStatus == CallStatus.success,
              )
              .toList(),
          pendingCalls: allCalls
              .where(
                (e) => e.callStatus == CallStatus.pending,
              )
              .toList(),
        ),
      );

      emit(state.copyWith(status: ReportStateStatus.allCalls));
    } catch (e) {
      emit(state.error());
    }
  }

  void getSuccessfulCalls() {
    emit(state.loading());
    try {
      final successfulCalls = stdModelList
          .where((e) => e.callStatus == CallStatus.success)
          .toList();
      emit(state.copyWith(
        pendingCalls: successfulCalls,
      ));

      emit(state.copyWith(status: ReportStateStatus.successfulCalls));
    } catch (e) {
      emit(state.error());
    }
  }

  void getPendingCalls() {
    emit(state.loading());
    try {
      final pendingCalls = stdModelList
          .where(
            (e) => e.callStatus == CallStatus.pending,
          )
          .toList();

      emit(
        state.copyWith(
          pendingCalls: pendingCalls,
        ),
      );

      emit(state.copyWith(status: ReportStateStatus.pendingCalls));
    } catch (e) {
      emit(state.error());
    }
  }
}
