void setup() {
  Serial.begin(9600); // Начинаем связь через последовательный порт на скорости 9600 бит/с
  randomSeed(analogRead(0)); // Инициализируем генератор случайных чисел на основе аналогового сигнала
}

void loop() {
  int randomNumber1 = random(0, 100); // Генерируем случайное число от 0 до 99
  int randomNumber2 = random(0, 100); // Генерируем еще одно случайное число от 0 до 99
  
  Serial.print(randomNumber1); // Выводим первое число
  Serial.print(","); // Выводим запятую
  Serial.println(randomNumber2); // Выводим второе число с символом новой строки
  
  delay(2000); // Пауза 2 сек
}