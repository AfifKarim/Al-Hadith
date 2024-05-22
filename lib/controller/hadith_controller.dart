import 'package:alhadith/controller/section_controller.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../data/db_helper/dbhelper.dart';
import '../data/model/model_hadith.dart';

class HadithQueryController extends GetxController {
  late Future<Database> database;
  List<Map<String, dynamic>> results = [];
  late List<Hadith> hadithList = [];

  bool loader = false;

  Future<void> hadithQuery(
      {required int bookId, required int chapterId}) async {
    database = DbHelperController().initializeDatabase();
    loader = true;
    final db = await database;

    results = await db.query(
      'hadith',
      where: 'book_id = ? AND chapter_id = ?',
      whereArgs: [bookId, chapterId],
    );
    loader = false;
    update();

    print(results);
    for (Map<String, dynamic> row in results) {
      Hadith hadith = Hadith(
          chapterId: row['chapter_id'],
          bookId: row['book_id'],
          bookName: row['book_name'],
          sectionId: row['section_id'],
          narrator: row['narrator'],
          bn: row['bn'],
          ar: row['ar'],
          arDiacless: row['ar_diacless'],
          note: row['note'],
          gradeId: row['grade_id'],
          grade: row['grade'],
          gradeColor: row['grade_color'],
          hadithId: row['hadith_id']);
      hadithList.add(hadith);
    }
    update();
  }
  Future<void> loadData({required int bookId,required int chapterId}) async {
    loader = true ;
    await Get.find<HadithQueryController>()
        .hadithQuery(bookId: bookId, chapterId: chapterId);
    await Get.find<SectionQueryController>()
        .sectionQuery(bookId:bookId);
    loader = false ;
    update();
  }
}
