abstract class AppState{}

class InitState extends AppState{}

class ChangeState extends AppState{

  final int index;
  ChangeState(this.index);

}