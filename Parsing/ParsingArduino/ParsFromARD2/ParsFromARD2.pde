import processing.serial.*;

Serial myPort; // Порт для связи с Arduino
String lineSeparator = "/////////////";
void setup() {
  // Получение списка доступных портов
  String[] portList = Serial.list();

  // Проверка наличия портов
  if (portList.length <1) {
    println("Нет доступных портов. Убедитесь, что Arduino подключен.");
    exit();
  } else {
    // Печать списка доступных портов
    println("Доступные порты:");
    for (int i = 0; i < portList.length; i++) {
      println(i + ": " + portList[i]);
    }

    // Выбор порта
    int selectedPort = 1; // Выбранный порт (здесь выбран второй порт из списка) ПОКАЧТО НУЖНО УКАЗАТЬ
    String selectedPortName = portList[selectedPort];

    // Установка связи с выбранным портом
    myPort = new Serial(this, selectedPortName, 9600);
    println("Установлена связь с портом: " + selectedPortName);
  }
}

void draw() {
  // Ваш код обработки данных с Arduino
  if (myPort.available() > 0) { // Проверка доступности данных
    String data = myPort.readStringUntil('\n'); // Чтение строки до символа новой строки
    if (data != null) {
      data = data.trim(); // Удаление лишних пробелов
      String[] values = data.split(","); // Разделение строки по запятой

      for (String value : values) {
        int number = parseInt(value); // Преобразование значения в число
        println("Значение: " + number);
        println(lineSeparator);
        delay(1000);
      }
    }
  }
}
