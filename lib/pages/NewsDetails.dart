//Now let's create the article details page

import 'package:NewsApp/model/Result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticlePage extends StatelessWidget {
  final Result article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('dd MMM yyyy')
        .format(article.publishedDate);
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage('https://t4.ftcdn.net/jpg/03/18/27/83/360_F_318278322_5XZE9O10xz8mpundHqGBDzukYfw9HOoD.jpg'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    article.byline,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.date_range),
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.resultAbstract,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
