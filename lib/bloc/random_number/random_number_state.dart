part of 'random_number_bloc.dart';

class RandomNumberState extends Equatable {
  RandomNumberState(this.number);
  int number;

  @override
  List<Object> get props => [number];
  Map<String, dynamic> toMap() {
    return {
      "counter": number,
    };
  }

  factory RandomNumberState.fromMap(Map<String, dynamic> map) {
    return RandomNumberState(map["counter"].toInt() ?? 0);
  }
}

class RandomNumberInitial extends RandomNumberState {
  RandomNumberInitial(super.number);
}

class RandomNumberLoading extends RandomNumberState {
  RandomNumberLoading(super.number);
}

class RandomNumberFinish extends RandomNumberState {
  RandomNumberFinish(super.number);
}

class RandomNumberError extends RandomNumberState {
  RandomNumberError(super.number, this.error);
  String error;
}
