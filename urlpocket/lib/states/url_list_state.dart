import 'package:equatable/equatable.dart';

abstract class UrlShrinkState extends Equatable {}

class UrlShrinkInitialState extends UrlListState {
  @override
  List<Object?> get props => [];
}

class UrlShrinkLoadingState extends UrlListState {
  @override
  List<Object?> get props => [];
}

class UrlShrinkResultState extends UrlListState {
  UrlShrinkResultState(this.urlShrink, this.alreadyExisted);

  final String urlShrink;
  final bool alreadyExisted;

  @override
  List<Object?> get props => [urlShrink, alreadyExisted];
}

class UrlShrinkUnavailableState extends UrlListState {
  @override
  List<Object> get props => [];
}
