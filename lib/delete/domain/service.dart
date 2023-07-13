// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class DeleteService {
  Future<void> deleteUser(int userId) async {
    final url = 'https://dev-njhg2de2v1cq4mn.api.raw-labs.com/your/endpoint/2/$userId';
    
    try {
      final response = await http.delete(Uri.parse(url));
      
      if (response.statusCode == 200) {
        print('User deleted successfully');
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting user: $error');
    }
  }
}
