import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/hadith_controller.dart';
import '../../controller/section_controller.dart';
import '../../data/model/model_hadith.dart';
import '../style/colors.dart';
import '../widget/chapter_details.dart';
import '../widget/hadith_part.dart';
import '../widget/hadith_ref_tile.dart';
import '../widget/my_app_bar.dart';

class HadithPageScreen extends StatefulWidget {
  final String bookName;
  final String chapterName;
  final String iconLetter;
  final int bookId;
  final int chapterId;

  const HadithPageScreen(
      {super.key,
      required this.bookName,
      required this.chapterName,
      required this.bookId,
      required this.chapterId,
      required this.iconLetter});

  @override
  State<HadithPageScreen> createState() => _HadithPageScreenState();
}

class _HadithPageScreenState extends State<HadithPageScreen> {
  @override
  initState() {
    Get.find<HadithQueryController>()
        .loadData(bookId: widget.bookId, chapterId: widget.chapterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.bookName, subtitle: widget.chapterName),
      body: Stack(
        children: [
          Container(
            height: 20,
            color: greenColor,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: bodyBackGroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GetBuilder<HadithQueryController>(
                  builder: (hadithQueryController) {
                return Visibility(
                  visible: hadithQueryController.loader == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                    itemCount: hadithQueryController.hadithList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == hadithQueryController.hadithList.length) {
                        return Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(
                                      thickness: 2, color: bodyBackGroundColor),
                                ),
                                Text('ফুটনোট:',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                const SizedBox(height: 5),
                                Text(
                                    hadithQueryController
                                        .hadithList[index - 1].note,
                                    style:
                                        Theme.of(context).textTheme.labelSmall)
                              ],
                            ),
                          ),
                        );
                      }

                      Hadith hadith = hadithQueryController.hadithList[index];
                      Get.find<SectionQueryController>()
                          .sectionQuery(bookId: widget.bookId);

                      final sectionList =
                          Get.find<SectionQueryController>().sectionList;
                      final section = sectionList.isNotEmpty
                          ? sectionList[index % sectionList.length]
                          : null;

                      return Column(
                        children: [
                          index == 0
                              ? const SizedBox(height: 0)
                              : const SizedBox(height: 20),
                          ChapterDetailsContainer(
                              chapterTitle: section?.number ?? '',
                              chapterIntro:
                                  index == 0 ? section?.title ?? '' : '',
                              quranVerse: section?.preface ?? ''),
                          const SizedBox(height: 10),
                          Container(
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HadithRefTile(
                                  iconLetter: widget.iconLetter,
                                  bookName: widget.bookName,
                                  hadithNumber: hadith.hadithId,
                                  hadithCategory: hadith.grade,
                                  categoryColor: hadith.gradeColor,
                                ),
                                const SizedBox(height: 3),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: HadithPart(
                                    describer: hadith.narrator,
                                    arabicText: hadith.ar,
                                    bengaliText: hadith.bn,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
