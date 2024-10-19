import 'package:flutter/material.dart';

import '../../domain/card_data.dart';
import '../details_page/details_card_page.dart';
import 'card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _color = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(widget.title),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      CardData(
        'Мейн-кун',
        description: 'Ласковый гигант с серьезным взглядом',
        imageUrl:
        'https://zooqi.by/social/cache/image_attachment_gallery/attachment-image/375/3884_15453859757787.jpg?1644402262',
      ),
      CardData(
       'Сиамская кошка',
        description: 'Грациозные восточные красавцы и красавицы выделяются особым изяществом и темпераментным характером.',
        imageUrl:
        'https://siameseofday.com/wp-content/uploads/2019/08/resting-siamese-cat.jpg',
      ),
      CardData(
        'Русская голубая',
        description: 'Порода выделяется серебристо-голубым окрасом и пронзительными зелеными глазами.',
        imageUrl:
        'https://i.pinimg.com/originals/a4/5d/25/a45d254035b639b1b84df109ef7c5230.jpg',
      ),
      CardData(
        'Невская маскарадная',
        description: 'Обаятельные «сибиряки» с «сиамским» окрасом, шикарной гипоаллергенной «шубкой» и покладистым нравом.',
        imageUrl:
        'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_651fcc86eda1866457e456ca_651fe3dcba0cd677bb1d776c/scale_1200',
      ),
      CardData(
        'Канадский сфинкс',
        description: '«Чудо природы»: в них действительно есть что-то загадочное и завораживающее.',
        imageUrl:
        'https://i.pinimg.com/originals/12/84/07/1284076693de06bd79d61f69377d25d7.jpg',
      ),
      CardData(
        'Норвежская лесная кошка',
        description: 'Порода похожа на «маленьких рысей», что неудивительно – ведь «норвежки» произошли от диких котов.',
        imageUrl:
        'https://avatars.mds.yandex.net/i?id=dfac79e94af8a46c3271512e983231d1_l-12450907-images-thumbs&n=13',
      ),
      CardData(
        'Нибелунг',
        description: 'Редкая и красивая порода длинношерстных кошек, «шубка» которых имеет голубой цвет.',
        imageUrl:
        'https://news.itmo.ru/images/news/big/868004.jpg',
      ),
      CardData(
        'Бенгальская кошка',
        description: 'Это активные, игривые и общительные питомцы.',
        imageUrl:
        'https://avatars.dzeninfra.ru/get-zen_doc/9723921/pub_645cf4f796ec39533e304be6_645cfa90a62c3f2abc449a5a/scale_1200',
      ),
      CardData(
        'Бурмилла',
        description: 'Сравнительно молодая порода кошек, выведенная в Великобритании.',
        imageUrl:
        'https://avatars.mds.yandex.net/i?id=adcb7d8dbc7eaef639d5d713d8a952d4_l-3573407-images-thumbs&n=13',
      ),
      CardData(
        'Корниш-рекс',
        description: 'Изысканная порода кошек с очень мягкой и кучерявой шерстью.',
        imageUrl:
        'https://koshka.top/uploads/posts/2021-12/1639051398_66-koshka-top-p-kornish-reks-belaya-81.jpg',
      ),
      CardData(
        'Рагамаффин',
        description: 'Ближайший родственник рэгдолла, удачно объединивший в себе гены беспородных кошек и персов.',
        imageUrl:
        'https://i.pinimg.com/originals/ee/41/8b/ee418b026f6bf9bbe20bef07ccbd01e2.jpg',
      ),
      CardData(
        'Шотландская вислоухая кошка',
        description: 'Одна из самых молодых пород. Ее отличают неповторимый внешний вид, грациозность и высокий уровень интеллекта.',
        imageUrl:
        'https://i.pinimg.com/originals/30/ae/63/30ae63e36eeb2ad2608ede1e16ab5e7f.jpg',
      ),
    ];

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data
              .map((data) => MyCard.fromData(
            data,
            onLike: (String title, bool isLiked) =>
                _showSnackBar(context, title, isLiked),
            onTap: () => _navigateToDetails(context, data),
          ))
              .toList(),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          '$title is ${isLiked ? 'liked' : 'disliked'}!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }

  void _navigateToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsCardPage(data)),
    );
  }
}