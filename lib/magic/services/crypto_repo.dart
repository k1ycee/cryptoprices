import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'package:crypto_prices/magic/services/crypto_call.dart';

// This class would be used to provide data from the main api call to the bloc that am using for state management


class CryptRepo{
  CryptoCall _call = CryptoCall();
  Future<List<Crypto>> pushCrypto() => _call.fetchCrypto();
}