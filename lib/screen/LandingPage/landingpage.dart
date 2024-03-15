import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:news_app/screen/HomePage/homepage.dart';
import 'package:news_app/widgets/custom_sizes/custom_sizes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 209, 128, 1),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Widget
                        Image.asset(
              "assets/images/Land.png",
              fit: BoxFit.cover,
              height: 370,
              width: MediaQuery.of(context).size.width,
            ),

            // Gossip
            const SizedBox(height: CustomSizes.spaceBtwSections),
            const Text("Gossip", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

            // Stay ahead of the grapevine with Gossip: Where Indian Aunties Break News Faster Than Lightning!
            const SizedBox(height: CustomSizes.spaceBtwItems),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Center(
                child: Text(
                  "Where Indian Aunties Break News Faster Than Lightning!",
                  style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Login with Google
            const SizedBox(height: CustomSizes.getStartedButtonHeight),
            Material(
              borderRadius: BorderRadius.circular(CustomSizes.buttonRadius),
              elevation: CustomSizes.buttonElevation,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const HomePage()); // Navigate to HomePage using Get.to()
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Center(
                    child: Text("Get Started"
                    , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black38),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
