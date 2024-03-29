import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/pages/login.dart';
import 'package:sunshine_iith/pages/session_book.dart/process_timeline.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';

class SessionBookIntro extends ConsumerWidget {
  const SessionBookIntro({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 244, 197, 54),
            primary: const Color.fromARGB(255, 21, 101, 192)),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Meet with our counsellors',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Image.asset('assets/images/sunshine_4.png'),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Text(
                      'Come over and meet one of us. Let us sit back, relax and have a chat about what is on your mind.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (ref.read(isGuestProvider)) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text(
                                      "Log In!",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    content: const Text(
                                      "You have to login with your IITH mail-id to access this feature.",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            ref
                                                .watch(isGuestProvider.notifier)
                                                .state = false;
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                CustomPageRoute(
                                                    child: const LoginPage(),
                                                    startPos: const Offset(0, 1)),
                                                (route) => false);
                                          },
                                          child: const Text("Login",style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 7, 89, 156)))),
                                    ],
                                  ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProcessTimeline()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 6.0,
                        shadowColor: Colors.grey[900],
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor:
                            const Color.fromARGB(255, 255, 199, 88),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ASK FOR A SLOT',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                // letterSpacing: 1.18
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
