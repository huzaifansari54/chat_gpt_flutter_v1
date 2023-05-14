import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class IConnectionsService {
  Stream<ConnectivityResult> connection();
}

@injectable
@LazySingleton(as: IConnectionsService)
class ConnectionsService extends IConnectionsService {
  final Connectivity connectivity = getIt<Connectivity>();

  @override
  Stream<ConnectivityResult> connection() {
    return connectivity.onConnectivityChanged.map((event) {
      if (event == ConnectivityResult.wifi) {
        return ConnectivityResult.wifi;
      } else if (event == ConnectivityResult.mobile) {
        return ConnectivityResult.mobile;
      } else {
        return ConnectivityResult.none;
      }
    });
  }
}
