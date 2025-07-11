import '../imports.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  final List<Api> _apiList = [];
  String? _errorMessage;

  List<Api> get apiList => _apiList;
  String? get errorMessage => _errorMessage;

  // API CALL

  Future<void> getData(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if (response.statusCode == 200) {
        List<dynamic> listData = json.decode(response.body);
        _apiList.clear();

        // print(listData);

        for (int index = 0; index < listData.length; index++) {
          // print(listData[index]['id']);
          // _apiList.add(listData[index]['id']);
          Map<String, dynamic> jsonMap = listData[index] as Map<String, dynamic>;
          Api apiItem = Api.fromJson(jsonMap);
          _apiList.add(apiItem);
        }
        print(_apiList);
      } else {
        print('Error fetching data man');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
