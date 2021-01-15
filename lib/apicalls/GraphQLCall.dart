import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter/foundation.dart';


GraphQLClient client=GraphQLClient(link: HttpLink(uri: 'https://y78f3ynr83.execute-api.us-east-1.amazonaws.com/dev/graphql'), cache: InMemoryCache());




class GraphQLCall{


  dynamic Query(String query) async {
    //client.mutate(MutationOptions())
    var result = await client.query(QueryOptions(pollInterval: 1,documentNode: gql(query)));

    return result.data;

  }

}
GraphQLCall AGraphQLCall= GraphQLCall();