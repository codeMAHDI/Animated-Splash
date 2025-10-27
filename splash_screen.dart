import 'package:event_platform/utils/app_strings/app_strings.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_images/app_images.dart';
import '../../components/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  // Animation Controllers
  late AnimationController _image1Controller;
  late AnimationController _image2Controller;
  late AnimationController _image3Controller;
  late AnimationController _textController;
  late AnimationController _buttonController;

  // Image Animations
  late Animation<Offset> _image1Slide;
  late Animation<double> _image1Rotate;
  late Animation<double> _image1Fade;

  late Animation<Offset> _image2Slide;
  late Animation<double> _image2Rotate;
  late Animation<double> _image2Fade;

  late Animation<Offset> _image3Slide;
  late Animation<double> _image3Scale;
  late Animation<double> _image3Fade;

  // Text & Button Animations
  late Animation<Offset> _textSlide;
  late Animation<double> _textFade;
  late Animation<Offset> _buttonSlide;
  late Animation<double> _buttonFade;

  @override
  void initState() {
    super.initState();

    _initAnimations();
    _startAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        // Get.offAllNamed(AppRoutes.loginScreen);
      });
    });
  }

  void _initAnimations() {
    // Image 1 - Left top theke asbe
    _image1Controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _image1Slide = Tween<Offset>(
      begin: const Offset(-2.5, -3.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _image1Controller, curve: Curves.easeOut));
    _image1Rotate = Tween<double>(begin: -0.8, end: -0.14).animate(_image1Controller);
    _image1Fade = Tween<double>(begin: 0.0, end: 1.0).animate(_image1Controller);

    // Image 2 - Right top theke asbe
    _image2Controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _image2Slide = Tween<Offset>(
      begin: const Offset(2.5, -3.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _image2Controller, curve: Curves.easeOut));
    _image2Rotate = Tween<double>(begin: 0.8, end: 0.07).animate(_image2Controller);
    _image2Fade = Tween<double>(begin: 0.0, end: 1.0).animate(_image2Controller);

    // Image 3 - Center top theke asbe
    _image3Controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _image3Slide = Tween<Offset>(
      begin: const Offset(0.0, -3.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _image3Controller, curve: Curves.easeOut));
    _image3Scale = Tween<double>(begin: 0.5, end: 1.0).animate(_image3Controller);
    _image3Fade = Tween<double>(begin: 0.0, end: 1.0).animate(_image3Controller);

    // Text - Right theke asbe
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));
    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);

    // Button - Left theke asbe
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _buttonSlide = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _buttonController, curve: Curves.easeOut));
    _buttonFade = Tween<double>(begin: 0.0, end: 1.0).animate(_buttonController);
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _image1Controller.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _image2Controller.forward();
    });
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) _image3Controller.forward();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        _textController.forward();
        _buttonController.forward();
      }
    });
  }

  @override
  void dispose() {
    _image1Controller.dispose();
    _image2Controller.dispose();
    _image3Controller.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomImage(
            imageSrc: AppImages.backG,
            width: size.width,
            height: size.height,
            boxFit: BoxFit.cover,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0, right: 20.w, left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Images Stack with Animation
                SizedBox(
                  height: 400.h,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        // Image 1 (Back) - Left top theke asbe, center e thakbe
                        AnimatedBuilder(
                          animation: _image1Controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _image1Fade.value,
                              child: Transform.translate(
                                offset: Offset(
                                  _image1Slide.value.dx * 150.w,
                                  _image1Slide.value.dy * 150.h,
                                ),
                                child: Transform.rotate(
                                  angle: _image1Rotate.value,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: _buildImageCard(
                            AppImages.splashScreenImage3, // Apnar 3rd image
                            200.w,
                            260.h,
                          ),
                        ),

                        // Image 2 (Middle) - Right top theke asbe, center e thakbe
                        AnimatedBuilder(
                          animation: _image2Controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _image2Fade.value,
                              child: Transform.translate(
                                offset: Offset(
                                  _image2Slide.value.dx * 150.w,
                                  _image2Slide.value.dy * 150.h,
                                ),
                                child: Transform.rotate(
                                  angle: _image2Rotate.value,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: _buildImageCard(
                            AppImages.splashScreenImage2, // Apnar 2nd image
                            200.w,
                            260.h,
                          ),
                        ),

                        // Image 3 (Front) - Center top theke asbe, center e thakbe
                        AnimatedBuilder(
                          animation: _image3Controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _image3Fade.value,
                              child: Transform.translate(
                                offset: Offset(
                                  _image3Slide.value.dx * 150.w,
                                  _image3Slide.value.dy * 150.h,
                                ),
                                child: Transform.scale(
                                  scale: _image3Scale.value,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: _buildImageCard(
                            AppImages.splashImage, // Apnar main image
                            230.w,
                            290.h,
                            hasBorder: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Text with Animation - Right theke
                SlideTransition(
                  position: _textSlide,
                  child: FadeTransition(
                    opacity: _textFade,
                    child: CustomText(
                      top: 5.h,
                      text: AppStrings.plan,
                      fontSize: 32.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Button with Animation - Left theke
                SlideTransition(
                  position: _buttonSlide,
                  child: FadeTransition(
                    opacity: _buttonFade,
                    child: CustomButton(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.loginScreen);
                      },
                      title: AppStrings.getStarted,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageCard(String imagePath, double width, double height,
      {bool hasBorder = false}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: hasBorder ? Border.all(color: Colors.white, width: 4.w) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: CustomImage(
          imageSrc: imagePath,
          fit: BoxFit.cover,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
