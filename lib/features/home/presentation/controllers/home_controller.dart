import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/home/data/models/pixabay_response_model.dart';
import 'package:pixabay/features/home/data/repositories/home_repository_impl.dart';
import 'package:pixabay/features/home/domain/use_cases/home_usecases.dart';

class HomeController extends Cubit<int>{
  HomeController(super.initialState);
  final HomeUseCases homeUseCases = HomeUseCases(repository: HomeRepositoryImpl());
  List<Hits> hits = <Hits>[];
  bool isLoading = false;
  String errorMessage = "";

  Future<void> fetchHomeData( String query) async {
    updateLoadingBar(true);
    //return;

    try {
      final response = await homeUseCases.executeGetHomeData(query);

      if(response.statusCode == 200) {
        PixabayResponseModel pixabayResponseModel = PixabayResponseModel.fromJson(response.data);
        if (pixabayResponseModel.hits != null ){
          hits = pixabayResponseModel.hits!;
        }
      }
      else {
        errorMessage = "Failed to fetch data. Please try again.";
      }
      print("Home data: $response");
      emit(state > 0 ? 0 : 1);
    }
    catch (e) {
      print("Error fetching home data: $e");
      errorMessage = "Failed to fetch data. Please try again.";
    }

    updateLoadingBar(false);

  }

  updateLoadingBar(bool value){
    isLoading = value;
    emit(state > 0 ? 0 : 1);
  }
}