import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'package:crypto_prices/magic/services/crypto_repo.dart';
import 'package:equatable/equatable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptRepo cryptRepo;

  CryptoBloc({this.cryptRepo});
  
  @override
  CryptoState get initialState => CryptoInitial();

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is FetchCrypto){
      yield CryptoInitial();
      try{
        final List<Crypto> tang = await cryptRepo.pushCrypto();
        yield CryptoLoaded(crypto: tang);
      }
      catch(_){
        CryptoError();
      }
    }
  }
}
