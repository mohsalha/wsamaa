import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wsamaa_project/cubit/app_cubit.dart';
import 'package:wsamaa_project/cubit/app_state.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text('${cubit.title.elementAt(cubit.currentIndex)}'),

              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 8,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeStateCubit(index);
                },
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'A',
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'b',
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'الرئيسية',

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'التصنيقات'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more), label: 'المزيد'),
                ],
              ),
              body: cubit.screen.elementAt(cubit.currentIndex),
            ),
          );
        },
      ),
    );
  }
}
