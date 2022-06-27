import 'package:mongo_dart/mongo_dart.dart';
import 'package:work/model/user.dart';
  
const MONGO_CONN_URL= "mongodb+srv://test:DLrYmTVlZdg7IkwZ@cluster0.qu7oo.mongodb.net/mydatabase?retryWrites=true&w=majority";
const MONGO_DB_NAME= "letswork";
const USER_COLLECTION = "user"; 

class MongoDatabase {
  static var db, userCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
   
      final users = await userCollection.find().toList();
      return users;
    }  
  

  static insert(User user) async {
    await userCollection.insertAll([user.toMap()]);
  }

  static update(User user) async {
    var u = await userCollection.findOne({"_id": user.id});
    u["name"] = user.name;
    u["email"] = user.email;
    u["password"] = user.password;
    u["confirmPassword"] = user.confirmPassword;
    u["university"] = user.university;
    u["department"] = user.department;
    await userCollection.save(u);
  }

   
} 