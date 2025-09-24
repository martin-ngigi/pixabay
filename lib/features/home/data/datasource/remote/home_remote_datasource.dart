import 'package:pixabay/core/utils/constants.dart';
import 'package:pixabay/core/utils/http_util.dart';

class HomeRemoteSource{
  getHomeData( String query ){
    var response = HttpUtil().get(
      "${Constants.homeDataURL}&q=$query&image_type=photo&order=popular&per_page=20"
    );
    return response;
  }
}