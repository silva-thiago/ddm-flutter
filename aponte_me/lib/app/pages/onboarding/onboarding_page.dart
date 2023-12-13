import 'package:aponte_me/app/pages/sign_up/sign_up_page.dart';
import 'package:aponte_me/app/widgets/plan_box_widget.dart';
import 'package:aponte_me/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  late final ChosenPlan chosenPlan;

  _OnboardingPageState() {
    chosenPlan = ChosenPlan(-1);
  }

  Future setSeenOnboard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    seenOnboard = await preferences.setBool('seenOnboard', true);
  }

  void updateValue(ChosenPlan data) {
    setState(() {
      chosenPlan = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    setSeenOnboard();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int value) {
                    setState(
                      () {
                        _pageIndex = value;
                      },
                    );
                  },
                  itemCount: onboardList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      OnboardContent(
                    image: onboardList[index].image,
                    imageSemanticsLabel: onboardList[index].imageSemanticsLabel,
                    message: onboardList[index].message,
                    content: onboardList[index].content,
                  ),
                ),
              ),
              Row(
                children: [
                  if (_pageIndex == 0) const SizedBox(width: 72.0),
                  if (_pageIndex != 0)
                    ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  const Spacer(),
                  ...List.generate(
                    onboardList.length,
                    (int index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: DotIndicator(active: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  if (_pageIndex == onboardList.length - 1)
                    FilledButton(
                      onPressed: () {
                        try {
                          // updateValue(chosenPlan);
                          if (chosenPlan.value == -1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          } else {
                            throw 'Você precisa escoher um plano.';
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                error.toString(),
                              ),
                            ),
                          );
                        }
                        const CircularProgressIndicator.adaptive();
                      },
                      style: FilledButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.check,
                      ),
                    )
                  else
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // backgroundColor: Theme.of(context).colorScheme.primary,
                        /*disabledBackgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),*/
                        /*foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,*/
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                ],
              ),
              /* const SizedBox(height: 32.0),
              if (_pageIndex != onboardList.length - 1)
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  // style: primaryButtonStyle,
                  child: Text(
                    'Começar a usar'.toUpperCase(),
                  ),
                ),
              const SizedBox(height: 32.0), */
            ],
          ),
        ),
      ),
    );
  }
}

class ChosenPlan {
  final int value;

  ChosenPlan(this.value);
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.active = false,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: active ? 12.0 : 4.0,
      width: 4.0,
      decoration: BoxDecoration(
        color: active
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
    );
  }
}

class OnboardData {
  const OnboardData({
    required this.image,
    required this.imageSemanticsLabel,
    required this.message,
    this.content,
    this.cardKey,
  });

  final String image, imageSemanticsLabel;
  final String message;
  final Widget? content;
  final Key? cardKey;
}

final List<OnboardData> onboardList = [
  const OnboardData(
    image: 'lib/assets/images/undraw_injured.png',
    imageSemanticsLabel:
        'Imagem ilustrativa de uma pessoa com uma tipóia no braço',
    message:
        'Imprevistos podem acontecer.\nPensando nisso a AponteMe quer ajudar você.',
  ),
  const OnboardData(
    image: 'lib/assets/images/undraw_connection.png',
    imageSemanticsLabel: 'Imagem ilustrativa de duas pessoas se conectando',
    message:
        'Os serviços AponteMe\nte mantém conectado às pessoas\nque mais importam.',
  ),
  const OnboardData(
    image: 'lib/assets/images/undraw_choose.png',
    imageSemanticsLabel: 'Imagem ilustrativa de duas pessoas se conectando',
    message: 'Escolha o plano certo para você.',
    content: PlanBoxWidget(
      previousSelectedCard: 0,
    ),
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.imageSemanticsLabel,
    required this.message,
    this.content,
  });

  final String image, imageSemanticsLabel;
  final String message;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    /* final Widget picture = SvgPicture.asset(
      image,
      height: 150,
      semanticsLabel: imageSemanticsLabel,
      placeholderBuilder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        child: const CircularProgressIndicator(),
      ),
    ); */

    /* final Widget picture = Image.asset(
      image,
      semanticLabel: imageSemanticsLabel,
      height: 150,
    ); */

    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          semanticLabel: imageSemanticsLabel,
          height: 150,
        ),
        const Spacer(),
        Text.rich(
          TextSpan(
            text: message,
          ),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        // const Spacer(),
        const SizedBox(height: 16.0),
        if (content != null) content!,
        const Spacer(),
      ],
    );
  }
}
