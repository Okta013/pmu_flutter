import 'package:flutter/material.dart';

import '../../domain/card_data.dart';
import '../details_page/details_page.dart';
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
        'Великолепный кот',
        description: 'Описание карточки с великолепным котом',
        imageUrl:
        'https://i.pinimg.com/originals/e7/17/fd/e717fda07a2e5a8fecaa22dc41db19a5.jpg',
      ),
      CardData(
       'Великолепный кот 2',
        description: 'Описание карточки с великолепным котом 2',
        imageUrl:
        'https://i.pinimg.com/originals/09/4e/e0/094ee0d312d6fb870f22e4e57a69bdd7.jpg',
      ),
      CardData(
        'Великолепный кот 3',
        description: 'Описание карточки с великолепным котом 3',
        imageUrl:
        'https://i.pinimg.com/736x/4a/ad/a7/4aada7610c2007931039b3c6a26e63fd.jpg',
      ),
      CardData(
        'Великолепный кот 4',
        description: 'Описание карточки с великолепным котом 4',
        imageUrl:
        'https://i.pinimg.com/originals/fb/68/bf/fb68bfaffe1cf626aaf27917b6671523.jpg',
      ),
      CardData(
        'Великолепный кот 5',
        description: 'Описание карточки с великолепным котом 5',
        imageUrl:
        'https://a.d-cd.net/5720dees-1920.jpg',
      ),
      CardData(
        'Великолепный кот 6',
        description: 'Описание карточки с великолепным котом 6',
        imageUrl:
        'https://cdnn1.img.crimea.ria.ru/img/111859/14/1118591434_0:0:1920:1280_1920x0_80_0_0_a36cf4c810dabd762997ac2a5284e8b6.jpg',
      ),
      CardData(
        'Великолепный кот 7',
        description: 'Описание карточки с великолепным котом 7',
        imageUrl:
        'https://news.itmo.ru/images/news/big/868004.jpg',
      ),
      CardData(
        'Великолепный кот 8',
        description: 'Описание карточки с великолепным котом 8',
        imageUrl:
        'https://thepics.top/images/9320.jpg',
      ),
      CardData(
        'Великолепный кот 9',
        description: 'Описание карточки с великолепным котом 9',
        imageUrl:
        'https://i.pinimg.com/originals/b2/83/55/b2835533ca3ac6eb4beb4bdd2e5a364c.jpg',
      ),
      CardData(
        'Великолепный кот 10',
        description: 'Описание карточки с великолепным котом 10',
        imageUrl:
        'https://avatars.mds.yandex.net/i?id=bcbfc7ffe1d4323f092954c149b13f1a_l-12752555-images-thumbs&n=13',
      ),
      CardData(
        'Великолепный кот 11',
        description: 'Описание карточки с великолепным котом 11',
        imageUrl:
        'https://pazlyigra.ru/uploads/posts/2022-04/kot-kotia-pushistyi-zelenye-glaza-krupnyi-plan-morda-portret.jpg',
      ),
      CardData(
        'Великолепный кот 12',
        description: 'Описание карточки с великолепным котом 12',
        imageUrl:
        'https://avatars.mds.yandex.net/i?id=258ff88bde22b0eb75c6a4b65a745c20_l-5347526-images-thumbs&n=13',
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
      MaterialPageRoute(builder: (context) => DetailsPage(data)),
    );
  }
}