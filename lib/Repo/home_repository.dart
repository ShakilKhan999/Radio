import 'package:http/http.dart' as http;
import 'package:relaks_media/global/constants.dart';
import 'package:relaks_media/global/shared_preference_helper.dart';
import 'package:relaks_media/models/audio_post_response.dart';
import 'package:relaks_media/models/user_audio_response.dart';

class HomeRepository {
  Future<UserAudioResponse> getUserSubscribedAudio() async {
    String? userToken = await SharedPreferenceHelper().getString(key: token);
    var headers = {'Authorization': 'Bearer $userToken'};
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'http://16.171.2.83/api/v1/posting/audio_posting_subscription/get_list_by_user/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return userAudioResponseFromJson(await response.stream.bytesToString());
    // print(await response.stream.bytesToString());
    // }
  }

  Future<AudioPostResponse> subscribeAudio({required int audioId}) async {
    int? userId = await SharedPreferenceHelper().getInt(key: id);
    String? userToken = await SharedPreferenceHelper().getString(key: token);
    var headers = {'Authorization': 'Bearer $userToken'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://16.171.2.83/api/v1/posting/audio_posting_subscription/create/'));
    request.fields.addAll(
        {'user': userId.toString(), 'audio_posting': audioId.toString()});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return audioPostResponseFromJson(await response.stream.bytesToString());
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
  }
}
