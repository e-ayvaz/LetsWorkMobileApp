import 'package:mongo_dart/mongo_dart.dart';
import 'package:work/model/user.dart';
import 'package:work/model/work.dart';

class MongoDatabase {
  static var db, workCollection;
  static connect() async {
    db = await Db.create(
        "mongodb+srv://test:DLrYmTVlZdg7IkwZ@cluster0.qu7oo.mongodb.net/mydatabase?retryWrites=true&w=majority");
    await db.open();
    workCollection = db.collection("works");
  }

  static Future<List<Map<String, dynamic>>> getData() async {
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
