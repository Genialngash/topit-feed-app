import 'package:graphql/client.dart';
import 'package:topit_feed_page/core/constants.dart';

GraphQLClient getGraphQLClient({required String token}) {
  final Link link = HttpLink(
    kbaseUrl,
    defaultHeaders: {
      'Authorization': 'Bearer $token',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}