import 'package:movie_bloc/src/model/movie.dart';
import 'package:movie_bloc/src/model/trailer.dart';

import 'endpoint.dart';

class TMDBApi {
  Future<MovieResponse> getNowPlayingMovies() async {
    var response = await Config.instance()
        .get('/now_playing', queryParameters: {"api_key": API_KEY});

    return MovieResponse.fromJSON(response.data);
  }

  Future<List<Trailer>> getTrailersByMovieId(int movieId) async {
    List<Trailer> trailers = [];

    var response = await Config.instance()
        .get('/$movieId/videos', queryParameters: {"api_key": API_KEY});

    response.data.forEach((trailer) => trailers.add(Trailer.fromJson(trailer)));

    return trailers;
  }
}
