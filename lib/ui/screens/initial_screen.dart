import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/books_controller.dart';
import '../../data/model/model_books.dart';
import '../../utilils/utilities.dart';
import '../style/colors.dart';
import '../widget/leading_tile_icon.dart';
import 'chapter_screen.dart';

class InitialPageScreen extends StatefulWidget {
  const InitialPageScreen({super.key});

  @override
  State<InitialPageScreen> createState() => _InitialPageScreenState();
}

class _InitialPageScreenState extends State<InitialPageScreen> {
  @override
  void initState() {
    Get.find<BooksQueryController>().bookList.clear();
    Get.find<BooksQueryController>().booksQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text('আল হাদিস',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white, )))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('সব হাদিসের বই ',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(child: GetBuilder<BooksQueryController>(
                builder: (booksQueryController) {
              return Visibility(
                replacement:
                    const Center(child: CircularProgressIndicator(color: greenColor)),
                visible: booksQueryController.loader == false,
                child: ListView.separated(
                  itemCount: booksQueryController.bookList.length,
                  itemBuilder: (context, index) {
                    Books book = booksQueryController.bookList[index];
                    return ListTile(
                      leading: leadingTileIcon(
                          iconColor: Colors.green, text: book.abvrCode),
                      tileColor: Colors.white,
                      title: Text(book.title,
                          style: Theme.of(context).textTheme.labelMedium),
                      subtitle: Text(book.titleAr,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontFamily: 'kfgq')),
                      trailing: Column(children: [
                        const SizedBox(height: 5),
                        Text(convertToBengaliNumber(book.numberOfHadith.toString()),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontSize: 18)),
                        const SizedBox(height: 5),
                        Text('হাদিস',
                            style: Theme.of(context).textTheme.labelSmall)
                      ]),
                      onTap: () {
                        Get.to(ChapterPageScreen(book: book));
                      },
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
