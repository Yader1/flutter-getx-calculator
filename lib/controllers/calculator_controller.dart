import 'package:get/get.dart';

class CalculatorController extends GetxController{
  var firsNumber = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult = '30'.obs;
  var operation = '+'.obs;

  void resetAll(){
    firsNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '+';
  }

  changeNegativePositive(){
    if(mathResult.startsWith('-')){
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-${mathResult.value}';
    }
  }

  addNumber(String number){
    if(mathResult.value == '0') return mathResult.value = number;

    if(mathResult.value == '-0'){
      return mathResult.value = '-$number';
    }

    mathResult.value = mathResult.value + number;
  }

  addDecimalPoint(){
    if(mathResult.contains('.')) return;

    if(mathResult.startsWith('0')){
      mathResult.value = '0.';
    } else {
      mathResult.value = '${mathResult.value}.';
    }
  }

  selectOperation(String newOperatior){
    operation.value = newOperatior;
    firsNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  deleteLastEntry(){
    if(mathResult.value.replaceAll('-', '').length > 1){
      mathResult.value = mathResult.value.substring(0, mathResult.value.length -1);
    } else {
      mathResult.value = '0';
    }
  }

  calculateResult(){
    double num1 = double.parse(firsNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch(operation.value){
      case '+':
        mathResult.value = '${num1 + num2}';
      break;

      case '-':
        mathResult.value = '${num1 - num2}';
      break;

      case 'X':
        mathResult.value = '${num1 * num2}';
      break;

      case '/':
        mathResult.value = '${num1 / num2}';
      break;

      default:
        return;
    }

    if(mathResult.value.endsWith('.0')){
      mathResult.value = mathResult.substring(0, mathResult.value.length - 2);
    }
  }
}