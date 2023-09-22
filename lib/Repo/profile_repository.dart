
import 'package:http/http.dart' as http;
import 'package:relaks_media/global/constants.dart';
class ProfileRepository {

  editProfile({required String name, required String file}) async {
    var headers = {
      'Authorization': 'Bearer 0b104116364581cc372075ca1ed028f6903c0036'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}api/v1/profile_update/'));
    request.fields.addAll({
      'name': name
    });
    request.files.add(await http.MultipartFile.fromPath('avatar', file));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
}