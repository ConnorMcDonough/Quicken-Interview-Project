part of 'webbloc_bloc.dart';

@immutable
abstract class WebblocState {
  const WebblocState();
}

class Initial extends WebblocState {
  const Initial();
}

class Loading extends WebblocState {
  const Loading();
}

class Loaded extends WebblocState {
  final List<Data> data;
  const Loaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Loaded && listEquals(o.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class Error extends WebblocState {
  final String message;
  const Error(this.message);
}
