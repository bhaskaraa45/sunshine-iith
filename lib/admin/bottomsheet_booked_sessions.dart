import 'package:flutter/material.dart';
import 'package:open_share_plus/open.dart';

class BookedSessionBottomsheet extends StatelessWidget {
  final String name;
  final String email;
  final String? contact;
  final String date;
  final String time;
  const BookedSessionBottomsheet(
      {super.key,
      required this.contact,
      required this.date,
      required this.email,
      required this.name,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 244, 197, 54),
                primary: const Color.fromARGB(255, 21, 101, 192)),
            useMaterial3: true,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(150),
                ),
                height: 6,
                width: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Session Details',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Contact No:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Date:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Time:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              '$contact',
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              time,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.5, 8.5, 8.5),
                    child: Text(
                      email,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              button(MediaQuery.of(context).size.width * 0.8, 'Send Email', () {
                Open.mail(toAddress: email,body: 'Hello $name,');
              }, false),
              const SizedBox(
                height: 10,
              ),
              button(MediaQuery.of(context).size.width * 0.8,
                  'Message on WhatsApp', () {
                Open.whatsApp(
                    whatsAppNumber: "91$contact", text: "Hello $name, ");
              }, (contact == null || contact!.isEmpty)),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(double width, String text, func, bool isNull) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 21, 101, 192),
          elevation: 2,
        ),
        onPressed: isNull
            ? null
            : () async {
                func();
              },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, letterSpacing: 1.2),
          ),
        ),
      ),
    );
  }
}
