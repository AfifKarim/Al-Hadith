import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../data/db_helper/dbhelper.dart';
import '../data/model/model_section.dart';

class SectionQueryController extends GetxController {
  late Future<Database> database;
  List<Map<String, dynamic>> results = [];
  late List<Section> sectionList = [];

  Future<void> sectionQuery({required int bookId}) async {
    database = DbHelperController().initializeDatabase();
    final db = await database;
    results = await db.query(
      'section',
      where: 'book_id = ?',
      whereArgs: [bookId],
    );

    for (Map<String, dynamic> row in results) {
      Section section = Section(
          id: row['id'],
          chapterId: row['chapter_id'],
          bookId: row['book_id'],
          title: row['title'],
          number: row['number'],
          bookName: row['book_name'],
          sectionId: row['section_id'],
          preface: row['preface']);
      sectionList.add(section);
    }
    update();
  }
}
