import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_share_plus/open.dart';
import 'package:sunshine_iith/services/data_model.dart';


class ProcessTimeline extends StatefulWidget {
  const ProcessTimeline({super.key});

  @override
  State<ProcessTimeline> createState() => _ProcessTimelineState();
}

enum Counsellors {counsellor1, counsellor2, counsellor3}
enum Mode {online, offline}
enum Communication {whatsapp, mail}


class _ProcessTimelineState extends State<ProcessTimeline> {
  int currStep =0;

  var sirOrMadam = ['sir' , 'madam'];

  String date = '';
  DateTime _date = DateTime.now();
  String time ='';
  TimeOfDay _time = TimeOfDay.now();
  bool timeFunctionCall = false;

  List<DataModel> counsellorsData = [
    DataModel(name: 'Maria Morris', email: 'maria.morris@admin.iith.ac.in', phone: '8331036081', position: 'no need', image: 'no need'),
    DataModel(name: 'Yukti Rastogi', email: 'yukti.rastogi@admin.iith.ac.in', phone: '8331036080', position: 'no need', image: 'no need'),
    DataModel(name: 'D. Phani Bhushan', email: 'phani.bhushan@admin.iith.ac.in', phone: '8331036082', position: 'no need', image: 'no need'),
  ];
  
  Counsellors? _valueCounsellors = Counsellors.counsellor1; 
  Mode? _valueMode = Mode.offline; 
  Communication? _valueCommunication = Communication.whatsapp; 


  @override
  void initState() {
    date = currDate(DateTime.now());
    super.initState();
  }

   onStepContinue(){
    // datePicker();
    if(currStep<3){
      setState(() {
      currStep++;
    });
    }else{
      if(_valueCommunication==Communication.whatsapp){
        requestSlot(true);
      }else{
        requestSlot(false);
      }
      
    }
  }

  onStepCancel(){
    if(currStep>0){
      setState(() {
        currStep--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    if(!timeFunctionCall){
      time = currTime(TimeOfDay.now());
    }

    return MaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 197, 54) , primary: const Color.fromARGB(255,21, 101, 192)),
      //   useMaterial3: true,
      // ),
      home: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 197, 54) , primary: const Color.fromARGB(255,21, 101, 192)),
          useMaterial3: true,
        ),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Text(
                    'Book Slot Now',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
        
                Stepper(
                  
                  currentStep: currStep,
                  onStepContinue: onStepContinue,
                  onStepCancel: onStepCancel,
                  controlsBuilder: controls,
                  steps: [
          
                    Step(
                      
                      state: currStep>0 ? StepState.complete : StepState.disabled,
                      isActive: currStep>=0,
                      title:  const Text('Select a counsellor for the session'), 
                      content: Column(
                        children: [
          
                          RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(0).name,
                            ),
                            value: Counsellors.counsellor1,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
      
                           RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(1).name,
                            ),
                            value: Counsellors.counsellor2,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
      
                           RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(2).name,
                            ),
                            value: Counsellors.counsellor3,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
                        ],
                      ),
                      ),
          
          
                    Step(
                      state: currStep>1 ? StepState.complete : StepState.disabled,
                      isActive: currStep>=1,
                      title: const Text('Select the mode of session'), 
                      content: Column(
                        children:[
                        RadioListTile<Mode>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              'Online',
                            ),
                            value: Mode.online,
                            groupValue: _valueMode,
                            onChanged: (value) => setState(() {
                              _valueMode = value;
                            }),
                          ),
      
                          RadioListTile<Mode>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              "Offline",
                            ),
                            value: Mode.offline,
                            groupValue: _valueMode,
                            onChanged: (value) => setState(() {
                              _valueMode = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      state: currStep>2 ? StepState.complete : StepState.disabled,
                      isActive: currStep>=2,
                      title: const Text('Pick a date and time for the session'),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                // splashColor: Colors.transparent,
                                onTap: (){
                                  datePicker();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: SizedBox(
                                    
                                    width: 170,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        suffixIcon: const Icon(Icons.calendar_today_outlined),
                                        labelText: 'Date',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      child:  Text(
                                        date,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
      
                          Row(
                            children: [
                              InkWell(
                                // splashColor: Colors.transparent,
                                onTap: (){
                                  timePicker();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: SizedBox(
                                    width: 170,
                                    child: InputDecorator(
                                      
                                      decoration: InputDecoration(
                                        suffixIcon: const Icon(Icons.schedule_outlined),
                                        labelText: 'Time',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      child: Text(time),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Step(
                      state: currStep>3 ? StepState.complete : StepState.disabled,
                      isActive: currStep>=3,
                      title: const Text('Select your prefered mode of communication'), 
                      content: Column(
                        children:[
                        RadioListTile<Communication>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              'Whatsapp',
                            ),
                            value: Communication.whatsapp,
                            groupValue: _valueCommunication,
                            onChanged: (value) => setState(() {
                              _valueCommunication = value;
                            }),
                          ),
      
                          RadioListTile<Communication>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              "Mail",
                            ),
                            value: Communication.mail,
                            groupValue: _valueCommunication,
                            onChanged: (value) => setState(() {
                              _valueCommunication = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                  ]
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }


    Widget controls(context , details){
  String str = 'NEXT';  
  if(currStep >= 3) str = 'REQUEST SLOT';

    return Row(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255,21, 101, 192),
          elevation: 2,
        ),
        onPressed: details.onStepContinue,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Text(
            str,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.5,
              letterSpacing: 1.2
            ),
          ),
        ),
        ),

        const SizedBox(width: 20,),

        OutlinedButton(
          
          onPressed: currStep<=0 ? null : details.onStepCancel, 
          child: const Text(
            'BACK',
            style: TextStyle(
              fontSize: 14.5,
              letterSpacing: 1.2
            ),
          ),)
    ],);
  }

  void datePicker() async{
    DateTime selectDate = _date;
    if(selectDate.hour>21){
      selectDate = selectDate.add(const Duration(hours: 3));
    }
    DateTime currDateTime = DateTime.now();
    await showDatePicker(
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 197, 54) , primary: const Color.fromARGB(255, 244, 197, 54)),
          useMaterial3: true,
        ), 
        child: child!,
        ),
      context: context, 
      initialDate: selectDate, 
      firstDate:  currDateTime, 
      lastDate: currDateTime.add(const Duration(days: 7)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      ).then((value) {
        setState(() {
          _date = value!;
          date = currDate(value);
        });
    });
  }

  String currDate(DateTime currDateTime){
    int hour = currDateTime.hour;
    if(hour > 21){
      currDateTime = currDateTime.add(const Duration(hours: 3));
    }
    return (currDateTime.day.toString() + '/' + currDateTime.month.toString() + '/' + currDateTime.year.toString());
  }

  void timePicker() async{
    timeFunctionCall = true;

    TimeOfDay selectedTime = _time;
    if(selectedTime.hour>21){
      selectedTime = const TimeOfDay(hour: 9, minute: 00);
    }

    final TimeOfDay? pickedTime =  await showTimePicker(
      builder: (context, child) => Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 197, 54) , primary: const Color.fromARGB(255, 244, 197, 54)),
          useMaterial3: true,
        ), 
        child: child!,
      ),
      context: context, 
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dialOnly,
    );

    setState(() {
      _time = pickedTime!;
      time = _time.format(context);
    });
  }

  String currTime(TimeOfDay time){
    int hour = time.hour;
    if(hour>21){
      time =const TimeOfDay(hour: 9, minute: 00);
    }else{
      time = TimeOfDay(hour: hour+1, minute: 00);
    }
    _time = time;

    return time.format(context);
  }

  void requestSlot(bool isWhatsapp){
    int ke =0;
    String s = sirOrMadam.elementAt(1);

    if(_valueCounsellors == Counsellors.counsellor2){
      ke = 1;
    }
    else if(_valueCounsellors == Counsellors.counsellor3){
      s = sirOrMadam.elementAt(0);
      ke = 2;
    }

    String name =FirebaseAuth.instance.currentUser!.displayName!;
    String mode = 'Online';

    if(_valueMode == Mode.offline){
      mode = 'Offline';
    }

    String day ="";
    int index = _date.weekday;

    if(index==1){day = 'Monday';}
    else if(index==2){day = 'Tuesday';}
    else if(index==3){day = 'Wednesday';}
    else if(index==4){day = 'Thursday';}
    else if(index==5){day = 'Friday';}
    else if(index==6){day = 'Saturday';}
    else if(index==7){day = 'Sunday';}


    String massage = 'Hi $s, I am $name. I was wondering if I could meet you for an $mode session on $day $date at $time. ';

    if(isWhatsapp){
      Open.whatsApp(
        whatsAppNumber: '91${counsellorsData.elementAt(ke).phone}' , 
        text: massage);
    }else{
      Open.mail(
        toAddress: counsellorsData.elementAt(ke).email,
        subject: 'Regarding Slot for a Session',
        body: massage, 
      );
    }

  }

}