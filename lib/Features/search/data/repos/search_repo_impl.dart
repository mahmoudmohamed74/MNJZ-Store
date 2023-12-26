// import 'package:dio/dio.dart';
// import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
// import 'package:epic_minds/Features/search/data/models/search_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:epic_minds/Features/search/data/repos/search_repo.dart';
// import 'package:epic_minds/core/errors/failure.dart';
// import 'package:epic_minds/core/utils/api_service.dart';

// class SearchRepoImpl implements SearchRepo {
//   final ApiService apiService;

//   SearchRepoImpl(this.apiService);
//   @override
//   Future<Either<Failure, List<SearchModel>>> getSearchByName({
//     required String bookName,
//   }) async {
//     try {
//       var data = await apiService.get(
//         endPoint:
//             'volumes?Filtering=free-ebooks&Sorting=relevance &q=$bookName',
//       );

//       List<SearchModel> books = [];
//       for (var item in data['items']) {
//         try {
//           books.add(
//             SearchModel.fromBookModel(
//               BookModel.fromJson(item),
//             ),
//           );
//         } catch (e) {
//           print(e.toString());
//         }
//       }

//       return right(books);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
