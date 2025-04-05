import '../../model/index.dart';

abstract class CryptoState{}

final class InitialCryptoState extends CryptoState{}

final class LoadingCryptoState extends CryptoState{}

final class LoadedCryptoState extends CryptoState{
  final List<CryptoModel> cryptoData;
  LoadedCryptoState(this.cryptoData);
}

final class ErrorCryptoState extends CryptoState{
  final String errorMsg;
  ErrorCryptoState(this.errorMsg);
}