import 'package:mongo_dart/mongo_dart.dart';
import 'package:work/model/work.dart';
import 'package:work/dbHelper/constant.dart';

class MongoDatabase {
  static var db, workCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    workCollection = db.collection(WORK_COLLECTION);
  }

  static Future<List<Map<String,dynamic>>>getData() async {
    final works = await workCollection.find().toList();
    return works;
  }
  static Future<List<Map<String, dynamic>>> getDocuments() async {
    final works = await workCollection.find().toList();
    return works;
  }
  static insert(Work work) async {
    await workCollection.insertAll([work.toJson()]);
  }
  static update(Work work) async {
    var u = await workCollection.findOne({"_id": work.id});
    await workCollection.save(u);
  }
  
}
