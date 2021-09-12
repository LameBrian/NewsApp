import 'package:NewsApp/model/Result.dart';
import 'package:NewsApp/pages/NewsDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget customListTile(Result article, BuildContext context) {
  var formattedTime = DateFormat('dd MMM yyyy')
      .format(article.publishedDate);
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(

      height: 90,
      margin: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  'https://t4.ftcdn.net/jpg/03/18/27/83/360_F_318278322_5XZE9O10xz8mpundHqGBDzukYfw9HOoD.jpg',
                  //mediaMetadatum.url,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),

                Row(
                  children: [
                    Icon(Icons.person),
                    Expanded(
                      child: Text(
                        article.byline,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.date_range),
                    Text(formattedTime,
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),

              ],
            ),
          ),
        ],
      ),

    ),
  );
}
