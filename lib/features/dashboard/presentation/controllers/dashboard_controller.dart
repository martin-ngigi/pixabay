import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay/features/dashboard/domain/entities/menu_item.dart';

class DashboardController extends Cubit<int>{
  DashboardController(super.initialState);

  late MenuItem currentMenuItem;

  updateCurrentMenuItem(MenuItem value){
    currentMenuItem = value;
    emit(state > 0 ? 0 : 1);
  }
}