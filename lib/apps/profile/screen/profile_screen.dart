import 'package:flutter/material.dart';
import 'package:softic_ecommerce/apps/profile/controller/profile_controller.dart';
import 'package:softic_ecommerce/widget/appbar/k_appbar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ViewProfileController profile = Get.put(ViewProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: KAppBar(title: "Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Obx(() {
                if (profile.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (profile.hasError) {
                  return const Center(
                    child: Text("Opps, something went wrong"),
                  );
                }
                if (profile.profileModel! == null) {
                  return const Center(
                    child: Text("No data found."),
                  );
                }
                return ListTile(
                  leading: Image.network(profile.profileModel!.imageUrl),
                  title: Text(profile.profileModel!.firstName,
                      textScaleFactor: 1.5),
                  subtitle: Text(profile.profileModel!.lastName,
                      textScaleFactor: 1),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
