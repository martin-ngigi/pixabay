import 'package:pixabay/features/home/data/datasource/remote/home_remote_datasource.dart';
import 'package:pixabay/features/home/domain/repositories/get_home_data_repository.dart';

class HomeRepositoryImpl implements GetHomeDatRepository {
  HomeRemoteSource homeRemoteSource = HomeRemoteSource();
  @override
  Future<dynamic> getHomeData(String query) async {
    return homeRemoteSource.getHomeData(query);
  }
}