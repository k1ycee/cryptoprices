import 'package:crypto_prices/magic/model/crypto_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoCall{
  // declaring the api url as a global string so it can be used anywhere in the class making it a bit drier
  String url = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
// This function makes the Api call and within it I then selected the data i want to parse to the UI
  Future <List<Crypto>> fetchCrypto()async{
    final call = await http.get(url);
    final res = jsonDecode(call.body) as List;
    if (call.statusCode == 200){
      return res.map((crypt){
        // This is where I select what to pass to the UI 
        return Crypto(
          name: crypt['name'],
          priceUsd: crypt['price_usd'],
          percentChange1H: crypt['percent_change_1h'],
          symbol: crypt['symbol']
        );
      }).toList();
    } 
    else{
      throw Exception("Couldn't fetch Crypto's");
    }
  }
}