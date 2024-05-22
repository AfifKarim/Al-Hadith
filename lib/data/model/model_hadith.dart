class Hadith {
  final int hadithId;

  final int bookId;

  final String bookName;

  final int chapterId;

  final int sectionId;

  final String narrator;

  final String bn;

  final String ar;

  final String arDiacless;

  final String note;

  final int gradeId;

  final String grade;

  final String gradeColor;

  Hadith(
      {required this.hadithId,
      required this.bookId,
      required this.bookName,
      required this.chapterId,
      required this.sectionId,
      required this.narrator,
      required this.bn,
      required this.ar,
      required this.arDiacless,
      required this.note,
      required this.gradeId,
      required this.grade,
      required this.gradeColor});
}
