import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/api/auth.provider.dart';
import '../providers/api/book.provider.dart';
import '../providers/api/post.provider.dart';
import '../providers/api/user.provider.dart';


class ProvidersService {
  static List<SingleChildWidget> providerList() {
    return [
      ChangeNotifierProvider(create: (ctx) => AuthApiProvider()),
      ChangeNotifierProxyProvider<AuthApiProvider, UserApiProvider>(
        create: (ctx) => UserApiProvider(),
        update: (ct, auth, prevState) => UserApiProvider(
          authToken: auth.token,
        ),
      ),
      ChangeNotifierProxyProvider<AuthApiProvider, PostApiProvider>(
        create: (ctx) => PostApiProvider(),
        update: (ct, auth, prevState) => PostApiProvider(
          authToken: auth.token,
        ),
      ),
      ChangeNotifierProxyProvider<AuthApiProvider, BookApiProvider>(
        create: (ctx) => BookApiProvider(),
        update: (ct, auth, prevState) => BookApiProvider(
          authToken: auth.token,
        ),
      ),

    ];
  }
}