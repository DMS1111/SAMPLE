import processing.serial.*;

Serial myPort;  // Объект Serial для связи с Arduino

void setup() {
  size(300, 400);
  // Настройка серийного порта (COM порта)
  String portName = Serial.list()[1]; // Найдем доступные порты и возьмем первый в списке
  myPort = new Serial(this, portName, 9600);

  // Вывод информации о подключении к порту
  println("Подключено к порту: " + portName);

  // Ждем, пока Arduino будет готово
  delay(2000);

  // Очищаем данные из буфера последовательного порта
  while (myPort.available() > 0) {
    myPort.readString();
  }
}

void draw() {
  background(255);
  textSize(32);
  // Если есть доступные данные в последовательном порту
  while (myPort.available() > 0) {
    // Читаем строку данных
    String data = myPort.readStringUntil('\n');

    // Если строка данных не пустая
    if (data != null) {
      // Разбиваем строку на три части по символу ":"
      String[] parts = split(data, ':');

      // Если получены все три части данных
      if (parts.length == 3) {
        String Svalue1 = parts[0];
        String stringData = parts[2];
        String Svalue2 = parts[1];
        int value1 = Integer.parseInt(Svalue1);
        int value2 = Integer.parseInt(Svalue2);
        // Вывод данных в консоль
        println("Received: " + value1 + ", " + value2 + ", " + stringData);
      }
    }
  }
}
