import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DbHelperController extends GetxController {
  Future<Database> initializeDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "hadith_db.db"); // Update with your file name

    // Check if the database exists
    bool exists = await databaseExists(path);

    if (!exists) {
      // If database is absent, copy from assets
      print("Copying database from assets...");

      // Read database as a byte array
      ByteData data = await rootBundle.load('assets/database/hadith_db.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Get parent directory (create if necessary)
      await Directory(dirname(path)).create(recursive: true);

      // Write database to the main app directory
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // Open the database
    // queryData();
    return await openDatabase(path);
  }
}
