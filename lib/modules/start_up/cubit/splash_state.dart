// part of 'startup_cubit.dart';

import 'package:equatable/equatable.dart';

enum Status {
  none,
  success,
}

class StartupState extends Equatable {
  final Status status;

  const StartupState({required this.status});

  factory StartupState.initial() {
    return const StartupState(
      status: Status.none,
    );
  }

  StartupState copyWith({
    Status? status,
  }) {
    return StartupState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
