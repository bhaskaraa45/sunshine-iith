import 'package:flutter_riverpod/flutter_riverpod.dart';

//mentors
final ugMentorDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
final pgMentorDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
final phdMentorDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
//buddies
final ugBuddyDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
final pgBuddyDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
final phdBuddyDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
//for fic and counsellors
final teamDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
//faculty rep
final facultyRepDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
//management 
final managementDataDataProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());

//slot timing
final selectedTimeProvider = StateProvider<String?>((ref) => null);
final selectedDateProvider = StateProvider<String?>((ref) => null);
//isAdmin
final isAdminProvider = StateProvider<bool>((ref) => false);
//isGuest
final isGuestProvider = StateProvider<bool>((ref) => false);
//booked sessions provider
final bookedSessionProvider = StateNotifierProvider<DataNotifier, Map<String, List>>((ref) => DataNotifier());
//sessionId
final sessionIdProvider = StateProvider<String?>((ref) => null);



class DataNotifier extends StateNotifier<Map<String, List>> {
  DataNotifier() : super({});

void addData(String position, dynamic data) {
   if (!state.containsKey(position)) {
     state[position] = [];
   }
   state[position]!.add(data);
   state = {...state};
}

void addAllData(String position, List dataList) {
    if (!state.containsKey(position)) {
      state[position] = [];
    }
    state[position]!.addAll(dataList);
    state = {...state};
  }
  void deleteData(String position, dynamic data) {
    if (state.containsKey(position)) {
      state[position]!.remove(data);
      state = {...state};
    }
  }

  void deleteAllData(String position) {
    if (state.containsKey(position)) {
      state[position] = [];
      state = {...state};
    }
  }

}

