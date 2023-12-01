import 'package:equatable/equatable.dart';
import 'package:urlpocket/model/data/url_shrink.dart';

abstract class ShrinkUiState extends Equatable {}

class ShrinkInitialUiState extends ShrinkUiState {
  @override
  List<Object?> get props => [];
}

class ShrinkLoadingUiState extends ShrinkUiState {
  @override
  List<Object?> get props => [];
}

class ShrinkResultUiState extends ShrinkUiState {
  ShrinkResultUiState(this.urlShrink);
  final UrlShrink? urlShrink;

  @override
  List<Object?> get props => [urlShrink];
}

class ShrinkUnavailableUiState extends ShrinkUiState {
  @override
  List<Object> get props => [];
}
