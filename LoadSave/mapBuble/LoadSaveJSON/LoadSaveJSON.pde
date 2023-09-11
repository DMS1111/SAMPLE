import controlP5.*;
ControlP5 cp5;
/**
 * Загрузка данных в формате JSON
 * автор: Дэниел Шиффман.
 *
 * Этот пример демонстрирует, как использовать loadJSON()
 * извлекать данные из файла JSON и создавать объекты
 * исходя из этих данных.
 *
 * Вот как выглядит JSON (частично):
 *
 {
 "bubbles": [
 {
 "position": {
 "x": 160,
 "y": 103
 },
 "diameter": 43.19838,
 "label": "Happy"
 },
 {
 "position": {
 "x": 372,
 "y": 137
 },
 "diameter": 52.42526,
 "label": "Sad"
 }
 ]
 }
 */

// Массив Bubble objects
Bubble[] bubbles;
int i=1;
// JSON обьект
JSONObject json;
PImage logo2;
void setup() {
  size(1400, 740);
  loadData();
  surface.setTitle("Интерактивная карта");
  logo2 = loadImage("logo2.png");
  cp5 = new ControlP5(this);
  cp5.addButton("OPEN").setWidth(100).setHeight(25).linebreak();
  cp5.addButton("CLOSEC").setWidth(100).setHeight(25).linebreak();
 // cp5.setFont(createFont("fontawesome-webfont.ttf", 20));
 cp5.addIcon("icon2",10)
     .setPosition(1000,0)
     .setSize(70,50)
     .setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f205,#00f204)
     .setScale(0.9,1)
     .setSwitch(true)
     .setColorBackground(color(255,100))
     .hideBackground();
}

void draw() {
  background(255);
  image(logo2, 0, 0, 1400, 740);
  //Display all bubbles Отобразить все пузырьки
  for (Bubble b : bubbles) {
    b.display();
    b.rollover(mouseX, mouseY);
  }

  textSize(18);
  //
  textAlign(LEFT);
  fill(0);
    text("для отключения перемещения шаров нажми к", 10, height-10);
  //text("Click to add bubbles.", 10, height-10);
  if (i>5) i=1;
}

void loadData() {
  // Load JSON file загрузка джсон файла
  // Temporary full path until path problem resolved. Временный полный путь до тех пор, пока проблема с путем не будет решена.
  json = loadJSONObject("data.json"); //загружает файл

  JSONArray bubbleData = json.getJSONArray("bubbles"); //находит массив

  // Размер массива пузырьковых объектов определяется общим количеством XML-элементов с именем "bubble"
  bubbles = new Bubble[bubbleData.size()];

  for (int i = 0; i < bubbleData.size(); i++) {
    // Получите каждый объект в массиве
    JSONObject bubble = bubbleData.getJSONObject(i);
    // Получить объект положения
    JSONObject position = bubble.getJSONObject("position");
    // Получаем x,y из позиции
    int x = position.getInt("x");
    int y = position.getInt("y");

    // Получаем diamter и label
    float diameter = bubble.getFloat("diameter");
    String label = bubble.getString("label");

    // Поместить объект в массив
    bubbles[i] = new Bubble(x, y, diameter, label);
  }
}
Boolean one = false;
void OPEN() {
  one = true;
}
void CLOSEC() {
  one = false;
}
void keyPressed() {
  if (key =='r' || key == 'R' || key == 'к' || key =='К') {
    one = false;
  }
}
// тут происходит пересоздание обьектов
void mousePressed() {
  if (one == true) {


    //Cоздать новый JSON bubble обьект
    JSONObject newBubble = new JSONObject();

    // Создайте новый объект position в формате JSON
    JSONObject position = new JSONObject();
    position.setInt("x", mouseX);
    position.setInt("y", mouseY);

    // Добавить позицию в bubble
    newBubble.setJSONObject("position", position);

    // Добавить diamater и label в bubble
    newBubble.setFloat("diameter", 30); //диаметр
    //for (int i = 0; i<2; i=i+1){
    newBubble.setString("label", "New label" + " " + i); //имя

    // Добавьте новый объект JSON bubble к массиву
    JSONArray bubbleData = json.getJSONArray("bubbles");
    bubbleData.append(newBubble);

    if (bubbleData.size() > 5) { //количество кругов
      i++;
      bubbleData.remove(0); //удаляет ПЕРВЫЙ КРУГ а в JSON с последнего перезаписывает
    }

    // Сохранение новых данных
    saveJSONObject(json, "data/data.json");
    loadData();
  }
}
// }
