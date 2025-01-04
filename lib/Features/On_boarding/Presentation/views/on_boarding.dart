import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:game_dz_app/constants.dart';

class OnBoardScreen extends StatefulWidget {
  static const String routename = '/onBoard'; 
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController on_board_page_controller = PageController(initialPage: 0);
  int current_index = 0;


  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (var i = 0; i < 3; i++) {
      if (i == current_index) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  current_index = page;
                });
              },
              controller: on_board_page_controller,
              children: [
                Create_page(
                    image: 'assets/images/onboard.png',
                    title: Constants.titleOne,
                    description: Constants.descriptionOne),
                Create_page(
                    image:'assets/images/onboard.png',
                    title: Constants.titleTwo,
                    description: Constants.descriptionTwo),
                Create_page(
                    image:'assets/images/onboard.png',
                    title: Constants.titleThree,
                    description: Constants.descriptionThree),
              ],
            ),
            // Bottom navigation container
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SigninPage()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Centered indicators
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildIndicator(),
                    ),
                    // Next button
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (current_index < 2) {
                              current_index++;
                              if (current_index < 3) {
                                on_board_page_controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              }
                            } else {
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SigninPage()));
                            }
                          });
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Constants.blue,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Create_page extends StatelessWidget {
  final image;
  final title;
  final description;
  const Create_page({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(image),
          ),
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900, // Extra bold
                fontSize: 28,
                color: Colors.white,
                height: 1.2, // Line height
                letterSpacing: -0.5, // Tighter letter spacing
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300, // Very light weight
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
                height: 1.5, // Increased line height for readability
                letterSpacing: 0.1, // Slightly increased letter spacing
              ),
            ),
          ),
        ],
      ),
    );
  }
}
