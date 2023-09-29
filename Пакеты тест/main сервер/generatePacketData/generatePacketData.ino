void setup() {
  Serial.begin(9600); // Инициализация последовательного порта с скоростью 9600 бит/с
}

void loop() {
  // Генерация случайного числа от 0 до 1023
  int randomValue1 = random(1024);
  
  // Генерация случайной строки
  String randomString = generateRandomString();
  
  // Генерация второго случайного числа от 0 до 1023
  int randomValue2 = random(1024);
  
  // Формирование пакета данных в виде строки
  String packetData = String(randomValue1) + ":" + String(randomValue2) + ":" + randomString;
  
  // Отправка пакета данных через последовательный порт
  Serial.println(packetData);
  
  delay(1000); // Задержка 1 секунду
}

// Функция для генерации случайной строки
String generateRandomString() {
  String possibleCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  String randomString = "";
  int stringLength = random(5, 10); // Генерация случайной длины строки от 5 до 10 символов
  
  for (int i = 0; i < stringLength; i++) {
    int randomIndex = random(possibleCharacters.length());
    randomString += possibleCharacters.charAt(randomIndex);
  }
  
  return randomString;
}