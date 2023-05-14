import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'connectivity_state.freezed.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({required bool isNetworkActive}) =
      _ConnectivityState;
  factory ConnectivityState.empaty() =>
      const ConnectivityState(isNetworkActive: false);
}
