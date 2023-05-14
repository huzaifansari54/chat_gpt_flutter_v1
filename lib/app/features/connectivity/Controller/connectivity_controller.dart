import 'dart:async';
import 'package:chat_gpt_flutter/app/Services/Connection/connection_service.dart';
import 'package:chat_gpt_flutter/app/features/connectivity/states/connectivity_state.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

final connectivityProvider =
    StateNotifierProvider<ConnectivityStateController, ConnectivityState>(
        ((ref) {
  return ConnectivityStateController();
}));

@lazySingleton
class ConnectivityStateController extends StateNotifier<ConnectivityState> {
  ConnectivityStateController() : super(ConnectivityState.empaty()) {
    connectionsService = getIt<ConnectionsService>();
    connectionSubscription =
        connectionsService.connection().listen(_listenCobbectivity);
  }
  late final IConnectionsService connectionsService;
  late StreamSubscription connectionSubscription;

  @override
  void dispose() {
    connectionSubscription.cancel();
    super.dispose();
  }

  void checkInternetConnection() {
    connectionsService.connection().listen(_listenCobbectivity);
  }

  Future<void> _listenCobbectivity(
      ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      state = state.copyWith(isNetworkActive: true);
    } else {
      state = state.copyWith(isNetworkActive: false);
    }
  }
}
