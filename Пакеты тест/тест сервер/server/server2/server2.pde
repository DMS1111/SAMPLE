import processing.net.*;
import processing.serial.*;
Serial myPort;
String lineSeparator = "/////////////";
Server s;
Client c;
String input;
int data[];

void setup() {
  size(450, 255);
  background(204);
  stroke(0);
  frameRate(5); // Slow it down a little
  s = new Server(this, 12345);  // Start a simple server on a port
  myPort = new Serial(this, "COM6", 9600);
  
}
void draw() {
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
          s.write(number + "\n");
      }
    }
  }
/*  if (mousePressed == true) {
    // Draw our line
    stroke(255);
    line(pmouseX, pmouseY, mouseX, mouseY);
    // Send mouse coords to other person
    //s.write(pmouseX + " " + pmouseY + " " + mouseX + " " + mouseY + "\n");
    for (int i = 0; i < 1; i++) {
    int randomNumber = int(random(1, 100)); // Генерируем случайное число в диапазоне от 1 до 100
    println("Случайное число " + (i+1) + ": " + randomNumber);
    s.write(randomNumber + "\n");
  }
 }
   



  // Receive data from client
  c = s.available();
  if (c != null) {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = int(split(input, ' '));  // Split values into an array
    // Draw line using received coords
    stroke(0);
    line(data[0], data[1], data[2], data[3]);
  }
*/ 
}
