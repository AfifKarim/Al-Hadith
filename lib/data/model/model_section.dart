class Section {
  final int id;

  final int bookId;

  final String bookName;

  final int chapterId;

  final int sectionId;

  final String title;

  final String preface;

  final String number;

  Section(
      {required this.id,
      required this.bookId,
      required this.bookName,
      required this.chapterId,
      required this.sectionId,
      required this.title,
      required this.preface,
      required this.number});
}
