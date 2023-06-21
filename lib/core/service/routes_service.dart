import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../constants/consts.dart';
import '../database/db.provider.dart';

class RoutesService {
  var newToken = '';
  var key = r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';

  Future getApprove() async {
    final token = await DatabaseProvider().getToken();
    final url =
        'https://ct.versaflow.io/erp_api/getapproutes?key=$key&api_token=$token';

    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final endpoint = Uri.parse(url);
    Response response = await get(
      endpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final res = json.decode(response.body);
    print(res['routes']['approvals']['access']);
    return res['routes']['approvals']['route'];
  }

  Future<dynamic> getAdminFlow() async {
    final token = await DatabaseProvider().getToken();
    final url =
        'https://ct.versaflow.io/erp_api/getapproutes?key=$key&api_token=$token';

    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final endpoint = Uri.parse(url);
    Response response = await get(
      endpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final res = json.decode(response.body);
    // print(res['routes']['adminflow']['route']);
    String adminFlow = res['routes']['adminflow']['route'];
    return adminFlow;
  }

  Future getProjects() async {
    final token = await DatabaseProvider().getToken();
    final url =
        'https://ct.versaflow.io/erp_api/getapproutes?key=$key&api_token=$token';

    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final endpoint = Uri.parse(url);
    Response response = await get(
      endpoint,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    final res = json.decode(response.body);
    print(res['routes']['projectsflow']['route']);
    return res['routes']['projectsflow']['route'];
  }

  // Future fetchAlbum() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Album.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
}

// 060 300 2816
