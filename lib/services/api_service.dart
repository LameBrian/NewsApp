import 'dart:convert';
import 'package:NewsApp/model/Result.dart';
import 'package:http/http.dart';

// this class will allow us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint
  final endPointUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=nRW6rEzvqMuICySxt53onyx6pWCGnywE";

  //Now let's create the http request function
  Future<List<Result>> getArticle() async {
    Response res = await get(endPointUrl);

    //first of all let's check that we got a 200 status code: this mean that the request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['results'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Result> articles =
          body.map((dynamic item) => Result.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
