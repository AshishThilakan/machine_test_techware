import 'package:machine_test_techware/models/employee.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Employee>?> getEmployees() async {
    var client = http.Client();
    
    var uri = Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986');
    var response = await client.get(uri);
    if (response.statusCode == 200)
      {
        var json = response.body;
        return employeeFromJson(json);
      }
  }
}