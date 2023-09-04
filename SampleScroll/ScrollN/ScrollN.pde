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
  deltaY *=-1; //инверсия прокрутки колесика мыши с этой строчкой скролл работает как в браузере
  scrollPosition += deltaY * 20;  // Изменение позиции скролла 20 это количество пикселей на которое смещается скролл
  scrollPosition = constrain(scrollPosition, -(174*7), 0);  // Ограничение позиции скролла 7 тут выбрано методом перебора с значением 7 все работает -_!__!_-
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
