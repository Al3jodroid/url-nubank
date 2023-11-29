import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlpocket/states/url_list_state.dart';

class UrlCubit extends Cubit<UrlListState> {
  UrlCubit() : super(InitialUrlListState());
}
