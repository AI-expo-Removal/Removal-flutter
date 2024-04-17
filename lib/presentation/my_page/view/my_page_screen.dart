import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_properties.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_provider.dart';
import 'package:removal_flutter/core/removal_color.dart';
import 'package:removal_flutter/presentation/my_page/provider/my_page_view_model_provider.dart';
import 'package:removal_flutter/presentation/my_page/widget/my_page_app_bar.dart';
import 'package:removal_flutter/presentation/my_page/widget/user_name_widget.dart';
import 'package:removal_flutter/presentation/my_page/widget/user_password_widget.dart';
import 'package:removal_flutter/presentation/my_page/widget/user_phone_number_widget.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
          () => ref
          .watch(myPageViewModelProvider.notifier)
          .getUser(accessToken: ref.watch(jwtStoreProvider).load(properties: JwtStoreProperties.accessToken).toString()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const MyPageAppBar(),
      body: const Column(
        children: [
          UserNameWidget(),
          SizedBox(height: 100),
          UserPhoneNumberWidget(),
          UserPasswordWidget()
        ],
      ),
    );
  }
}
