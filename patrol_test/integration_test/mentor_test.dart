import 'package:patrol/patrol.dart';          // TEM de vir primeiro
import 'package:flutter/material.dart';       // Para Text(), widgets, etc.
import 'package:flutter_test/flutter_test.dart'; // Para expect(), contains(), isNot()
import 'package:tpc3_my_app/main.dart';


void main() {
  patrolTest(
    'Suggest mentors based on department and interests',
        ($) async {
      await $.pumpWidgetAndSettle(MentorApp());

      await $('deptField').enterText("Computer Science");
      await $('interestsField').enterText("AI");

      await $('searchButton').tap();
      await $.pumpAndSettle();

      // Verifica se o mentor correto aparece na lista
      expect($(Text('Alice')).exists, true);

      // Verifica que não aparece erro nenhum
      expect($(Text('Error')).exists, false);
    },
  );
}
