// import 'package:bloc/bloc.dart';
// import 'package:epic_minds/Features/search/data/models/search_model.dart';
// import 'package:epic_minds/Features/search/data/repos/search_repo.dart';
// import 'package:equatable/equatable.dart';

// part 'search_state.dart';

// class SearchCubit extends Cubit<SearchState> {
//   final SearchRepo _searchRepoImpl;
//   SearchCubit(this._searchRepoImpl) : super(SearchInitial());

//   Future<void> getSearchByName({required String bookName}) async {
//     emit(SearchLoadingState());
//     var result = await _searchRepoImpl.getSearchByName(bookName: bookName);
//     result.fold(
//       (failure) {
//         emit(SearchErrorState(errMessage: failure.errorMessage));
//       },
//       (books) {
//         emit(SearchSuccessState(booksList: books));
//       },
//     );
//   }
// }
