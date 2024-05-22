import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/chapter_controller.dart';
import '../../data/model/model_books.dart';
import '../../data/model/model_chapter.dart';
import '../../utilils/utilities.dart';
import '../style/colors.dart';
import '../widget/leading_tile_icon.dart';
import '../widget/my_app_bar.dart';
import 'hadith_screen.dart';

class ChapterPageScreen extends StatefulWidget {
  final Books book;

  const ChapterPageScreen({super.key, required this.book});

  @override
  State<ChapterPageScreen> createState() => _ChapterPageScreenState();
}

class _ChapterPageScreenState extends State<ChapterPageScreen> {
  @override
  void initState() {
    Get.find<ChapterQueryController>().chapterList.clear();
    Get.find<ChapterQueryController>().chapterQuery(bookId: widget.book.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: widget.book.title,
          subtitle:
              '${convertToBengaliNumber(widget.book.numberOfHadith.toString())} টি হাদিস'),
      body:
          GetBuilder<ChapterQueryController>(builder: (chapterQueryController) {
        return ListView.separated(
            itemBuilder: (context, index) {
              Chapter chapter = chapterQueryController.chapterList[index];
              return Visibility(
                visible: chapterQueryController.loader == false,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: leadingTileIcon(
                        iconColor: greenColor,
                        text: convertToBengaliNumber((index + 1).toString())),
                    tileColor: Colors.white,
                    title: Text(chapter.title,
                        style: Theme.of(context).textTheme.labelMedium),
                    subtitle: Text('হাদিসের রেঞ্জ : ${chapter.hadithRange}',
                        style: Theme.of(context).textTheme.labelSmall),
                    onTap: () {
                      Get.to(HadithPageScreen(
                        bookName: widget.book.title,
                        chapterName: chapter.title,
                        bookId: widget.book.id,
                        chapterId: chapter.chapterId, iconLetter: widget.book.abvrCode,
                      ));
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const Divider();
            },
            itemCount: chapterQueryController.chapterList.length);
      }),
      // Other Scaffold contents
    );
  }
}
