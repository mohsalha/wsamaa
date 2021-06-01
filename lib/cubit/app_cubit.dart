import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wsamaa_project/cubit/app_state.dart';
import 'package:wsamaa_project/screens/categories_screen.dart';
import 'package:wsamaa_project/screens/home_screen.dart';
import 'package:wsamaa_project/screens/more_screen/more_screen.dart';


class AppCubit extends Cubit<AppState>{
  AppCubit() : super(InitState());
  static AppCubit get( context)=>BlocProvider.of(context);


  List screen = [
    HomeScreen(),
    CategoriesScreen(),
    SittingScreen(),
  ];

  List title = [
    'الرئيسية',
    'التصنيفات',
    'المزيد'
  ];
int currentIndex = 0;
void changeStateCubit(int index){
  currentIndex = index;
  emit(ChangeState(index));
}


}