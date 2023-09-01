float scrollPosition = 0;  // Позиция скролла
float scrollBarHeight = 20;  // Высота ползунка скроллбара
float scrollBarY;  // Вертикальное положение ползунка скроллбара
PImage[] cars;
int z=0;
int a;
boolean m=false;
 
PImage cars1, cars2, cars3, cars4, cars5, cars6, cars7, cars8, cars9, cars10, cars11, cars12, cars13, cars14, cars15, cars16, cars17, cars18, cars19, cars20;  // Изображения автомобилей
boolean isDragging = false;  // Флаг, указывающий, что ползунок скроллбара перетаскивается
float dragOffsetY = 0;  // Смещение ползунка скроллбара при перетаскивании

void setup() {
  size(480, 522);
  scrollBarY = 0;
  // Загрузка изображений автомобилей
  cars = new PImage[21];
  for (int i=1; i<21; i++){
    String qqq = "Car"+i+".jpg";
    cars[i] = loadImage(qqq);
    println (qqq);
  }
 /* cars1 = loadImage("Car1.jpg");
  cars2 = loadImage("Car2.jpg");
  cars3 = loadImage("Car3.jpg");
  cars4 = loadImage("Car4.jpg");
  cars5 = loadImage("Car5.jpg");
  cars6 = loadImage("Car6.jpg");
  cars7 = loadImage("Car7.jpg");
  cars8 = loadImage("Car8.jpg");
  cars9 = loadImage("Car9.jpg");
  cars10 = loadImage("Car10.jpg");
  cars11 = loadImage("Car11.jpg");
  cars12 = loadImage("Car12.jpg");
  cars13 = loadImage("Car13.jpg");
  cars14 = loadImage("Car14.jpg");
  cars15 = loadImage("Car15.jpg");
  cars16 = loadImage("Car16.jpg");
  cars17 = loadImage("Car17.jpg");
  cars18 = loadImage("Car18.jpg");
  cars19 = loadImage("Car19.jpg");
  cars20 = loadImage("Car20.jpg");*/
}

void draw() {
  background(100);
  int x=240;
  int y=174;
  
    for (int i=1; i<21; i++){
      if (m) a=0;
      else a=240;
      m=!m;
    image(cars[i], a, z + scrollPosition, x, y);
    if (!m) z += 174;
    if (i==20) z=0;
    println (z, i);
  }
  // Отрисовка изображений автомобилей с учетом позиции скролла
 /* image(cars[1], 0, scrollPosition, 240, 174);
  image(cars[2], 240, scrollPosition, 240, 174);
  image(cars[3], 0, 174 + scrollPosition, 240, 174);
  image(cars[4], 240, 174 + scrollPosition, 240, 174);
  image(cars[5], 0, 348 + scrollPosition, 240, 174);
  image(cars6, 240, 348 + scrollPosition, 240, 174);
   image(cars7, 240, 522 + scrollPosition, 240, 174);
        image(cars8, 0, 522 + scrollPosition, 240, 174);
          image(cars9, 0, 696 + scrollPosition, 240, 174);
          image(cars10, 240, 696 + scrollPosition, 240, 174);
            image(cars11, 0, 870 + scrollPosition, 240, 174);
            image(cars12, 240, 870 + scrollPosition, 240, 174);
              image(cars13, 0, 1044 + scrollPosition, 240, 174);
              image(cars14, 240, 1044 + scrollPosition, 240, 174);
                image(cars15, 0, 1218 + scrollPosition, 240, 174);
                image(cars16, 240, 1218 + scrollPosition, 240, 174);
                  image(cars17, 0, 1392 + scrollPosition, 240, 174);
                  image(cars18, 240, 1392 + scrollPosition, 240, 174);
                   image(cars19, 0, 1566 + scrollPosition, 240, 174);
                   image(cars20, 240, 1566 + scrollPosition, 240, 174);*/
  
  // Отрисовка скроллбара и его ползунка
  fill(200);
  rect(width - 10, 0, 10, height); // Скроллбар
  
  // Рассчитываем максимальное вертикальное положение ползунка скроллбара
  float maxScrollBarY = height - scrollBarHeight;
  
  // Рассчитываем положение ползунка скроллбара на основе отрицательного значения scrollPosition
  float scrollBarPosition = map(-scrollPosition, 0, 174 * 7, 0, maxScrollBarY);
  scrollBarY = scrollBarPosition;
  
  fill(150);
  rect(width - 10, scrollBarY, 10, scrollBarHeight); // Ползунок скроллбара
}

void mouseWheel(MouseEvent event) {
  float deltaY = event.getCount();
  scrollPosition += deltaY * 7;  // Изменение позиции скролла
  scrollPosition = constrain(scrollPosition, -(174*7), 0);  // Ограничение позиции скролла
}

void mousePressed(MouseEvent event) {
  if (event.getButton() == LEFT) {
    // Если нажата левая кнопка мыши
    if (mouseX > width - 7 && mouseY > scrollBarY && mouseY < scrollBarY + scrollBarHeight) {
      // Проверяем, находится ли курсор над ползунком скроллбара
      isDragging = true;  // Устанавливаем флаг перетаскивания
      dragOffsetY = mouseY - scrollBarY;  // Вычисляем смещение ползунка скроллбара
    }
  }
}

void mouseDragged(MouseEvent event) {
  if (isDragging) {
    // Если ползунок скроллбара перетаскивается
    // Перемещение ползунка скроллбара
    float newY = mouseY - dragOffsetY;
    newY = constrain(newY, 0, height - scrollBarHeight); // Ограничение новой позиции ползунка
  
    // Рассчитываем новую позицию скроллбара на основе новой позиции ползунка
    float newPosition = map(newY, 0, height - scrollBarHeight, 0, 174 * 7);
    scrollPosition = -newPosition; // Обновляем позицию скролла
  }
}

void mouseReleased(MouseEvent event) {
  isDragging = false;  // Пользователь отпустил кнопку мыши
}
