import 'dart:core';

import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crypto_prices/magic/model/crypto_model.dart';

class CryptMemory{
  static Database _database;
  static final CryptMemory cryptMemory = CryptMemory._();
  CryptMemory._();


  // String symbol = "symbol";
  // String name = "name";
  // String priceUsd = "price_usd";
  // String percentChange1H = "percent_change_1h";
  // String id = "id";


  // CryptMemory._createInstance();

  // factory CryptMemory(){
  //   if (_database == null){
  //     cryptMemory = CryptMemory._createInstance();
  //   }
  //   return cryptMemory;
  // }


  Future<Database> get database async{
    // here i'm trying to get a database if it exists 
    if(_database != null) return _database;

    _database = await initCrypt();


    return _database;
  }

  Future<Database> initCrypt() async{

    Directory cryptDir = await getApplicationDocumentsDirectory();
    //Get the directory path for both android and IOS to store database
    String path = join(cryptDir.path,'cryptnesia.db');
    //open/create the database at a given path
    // var cryptbase = await openDatabase(path, version: 1, onCreate: _createCrypt);

    // return cryptbase;
    return await openDatabase(path, version: 1, onOpen: (cryptMemory){},
       onCreate: (Database cr, int version) async{
         await cr.execute(
           "CREATE TABLE Crypto("
           'id TEXT,'
           'name TEXT,'
           'price_usd TEXT,'
           'percent_change_1h TEXT,'
           'symbol TEXT,'
           'price_btc TEXT,'
           'rank TEXT,'
           'market_cap_usd TEXT,'
           'available_supply TEXT,'
           'total_supply TEXT,'
           'max_supply TEXT,'
           'percent_change_24h TEXT,'
           'percent_change_7d TEXT,'
           'last_updated TEXT'
        ")");
      });
   }

  //  void _createCrypt(Database db, int newVersion) async{

  //    await db.execute(
  //      'CREATE TABLE $id($name TEXT $percentChange1H TEXT $priceUsd TEXT $symbol TEXT)'
  //    );

  //  }

  //  Future<List<Map<String, dynamic>>> getUserCrypts() async{
  //    Database db = await this.database;
  //    var result = await db.query(id);
  //    return result;
  //  }

  createCrypts(Crypto dCrypto) async{
    await deleteCrypts();
    final db = await database;
    final crypRes = await db.insert('Crypto', dCrypto.toJson());
    return crypRes;
  }

  Future<int> deleteCrypts() async{
    final cryp = await database;
    final crypRes = cryp.rawDelete('DELETE FROM Crypto');
    return crypRes;
  }

  Future<List<Crypto>> fetchMemCrypto() async {
    final cryp = await database;
    final crypRes =  await cryp.rawQuery("SELECT * FROM CRYPTO");
    
    List<Crypto> list = 
      crypRes.isNotEmpty ? crypRes.map((c) => Crypto.fromJson(c)).toList() : [];
    
    
    return list;
  }
}

