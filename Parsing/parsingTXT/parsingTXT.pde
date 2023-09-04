void setup() {
  String[] lines = loadStrings("data.txt"); // Загрузка текстового файла
  for (String line : lines) {
    String[] values = line.split(","); // Разделение строки по запятой
    String name = values[0].trim(); // Получение имени студента
    int age = Integer.parseInt(values[1].trim()); // Получение возраста студента

    println("Имя: " + name + ", Возраст: " + age);
  }
}
