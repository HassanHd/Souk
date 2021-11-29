import 'package:path_provider/path_provider.dart';
import 'package:souk/models/CartModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;
class HelperCart{
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }
  initialDB() async {
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path, ".db");
    var mydb = await openDatabase(path, version: 11, onCreate: _onCreate);
    return mydb;
  }
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,product_id	varchar NOT NULL UNIQUE,quantity int NOT NULL,path_image TEXT NOT NULL,price varchar NOT NULL,name varchar NOT NULL)');
    print("cart Table Created");
  }

  Future<int> insertdb(Map<String, dynamic> dats) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.insert("cart", dats);
    return reselt;
  }

  // chack(String product_id)async{
  //   Database? db_clint = await db;
  //   var reselt = await db_clint!.rawUpdate('SELECT product_id From');
  // }

  Future<int> deleteProduct(String product_id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate('DELETE FROM cart WHERE product_id="$product_id"');
    return reselt;
  }

  Future<int> deleteAllProduct() async {
    Database? db_clint = await db;
    var reselt = await db_clint!.rawUpdate('DELETE FROM cart');
    return reselt;
  }
  Future<int> updateproduct(double quantity , String product_id) async {
    Database? db_clint = await db;
    var reselt =
    await db_clint!.rawUpdate('UPDATE cart SET quantity="$quantity"WHERE product_id="$product_id"');
    return reselt;
  }

  Future <List<cartModel>>getdata() async{
    Database? db_Clint=await db;
    List<cartModel>list=[];
    var reselt=await db_Clint!.query("cart");
    print(reselt);
    for(var i in reselt){
      cartModel model=cartModel(product_id: i["product_id"],quantity:i["quantity"],name:i["name"],path_image:i["path_image"] ,price: i["price"]  );
      list.add(model);
    }
    return list;
  }


  Future<List> getSingelRow(int product_id) async {
    Database? db_clint = await db;
    var reselt = await db_clint!.query('cart', where: 'product_id="$product_id"');

    return reselt;
  }





}