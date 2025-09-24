import 'package:pixabay/features/home/data/repositories/home_repository_impl.dart';
import 'package:pixabay/features/home/domain/repositories/get_home_data_repository.dart';

class HomeUseCases{
  final GetHomeDatRepository repository;

  HomeUseCases({required this.repository});

  Future<dynamic> executeGetHomeData(String query) {
    return repository.getHomeData(query);
  }
}