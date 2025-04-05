import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyptopulse/bloc/crypto_bloc/index.dart';
import '../../model/index.dart';
import '../../repository/crypto_repository.dart';


class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository cryptoRepository; // instance of repo class

  List<CryptoModel> fetchedCryptoData = []; // temp list to store once fetch data

  CryptoBloc({required this.cryptoRepository}):super(InitialCryptoState()){
    on<FetchCryptoData>(fetchCryptoData);
  }

  /// function to fetch crypto data
  Future<void> fetchCryptoData(FetchCryptoData event, Emitter<CryptoState> emit) async {
    if (fetchedCryptoData.isNotEmpty){ // it will reduce our api call as we already store data in temp list
      emit(LoadedCryptoState(fetchedCryptoData));
      return;
    }

    emit(LoadingCryptoState());
    try {// this is for the first time api call
      final List<CryptoModel> cryptoData = await cryptoRepository.fetchAllProducts();
      if (cryptoData.isNotEmpty) {
        fetchedCryptoData = cryptoData; // this will store data in temp list that we create above
        emit(LoadedCryptoState(cryptoData));
      } else {
        emit(ErrorCryptoState("no data"));
      }
    } catch (e) {
      emit(ErrorCryptoState("error ${e.toString()}"));
    }
  }
}