int rectX, rectY;      // Позиция квадратной кнопки
int circleX, circleY;  // Позиция круглой кнопки
int rectSize = 90;     // Диаметр квадратной кнопки
int circleSize = 93;   // Диаметр круглой кнопки
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

void setup() {
  size(640, 360);  // Устанавливаем размер окна
  rectColor = color(0);  // Цвет квадратной кнопки
  rectHighlight = color(51);  // Цвет выделения для квадратной кнопки
  circleColor = color(255);  // Цвет круглой кнопки
  circleHighlight = color(204);  // Цвет выделения для круглой кнопки
  baseColor = color(102);  // Базовый цвет кнопок
  currentColor = baseColor;  // Текущий цвет кнопок
  circleX = width/2+circleSize/2+10;  // Рассчитываем позицию круглой кнопки по горизонтали
  circleY = height/2;  // Рассчитываем позицию круглой кнопки по вертикали
  rectX = width/2-rectSize-10;  // Рассчитываем позицию квадратной кнопки по горизонтали
  rectY = height/2-rectSize/2;  // Рассчитываем позицию квадратной кнопки по вертикали
  ellipseMode(CENTER);  // Устанавливаем режим отрисовки круглой кнопки (центр - основная точка)
}

void draw() {
  update(mouseX, mouseY);  // Обновляем состояние кнопок на основе положения курсора
  background(currentColor);  // Заливаем фон текущим цветом
  
  // Отрисовка квадратной кнопки в зависимости от состояния
  if (rectOver) {
    fill(rectHighlight);  // Если курсор над кнопкой, используем цвет выделения
  } else {
    fill(rectColor);  // Иначе используем основной цвет
  }
  stroke(255);  // Устанавливаем цвет границы кнопки
  rect(rectX, rectY, rectSize, rectSize);  // Рисуем квадратную кнопку
  
  // Отрисовка круглой кнопки в зависимости от состояния
  if (circleOver) {
    fill(circleHighlight);  // Если курсор над кнопкой, используем цвет выделения
  } else {
    fill(circleColor);  // Иначе используем основной цвет
  }
  stroke(0);  // Устанавливаем цвет границы кнопки
  ellipse(circleX, circleY, circleSize, circleSize);  // Рисуем круглую кнопку
}

void update(int x, int y) {
  // Обновляем состояние переменных на основе положения курсора
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;  // Если курсор находится над круглой кнопкой, устанавливаем флаг true
    rectOver = false;  // Устанавливаем флаг false для квадратной кнопки
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;  // Если курсор находится над квадратной кнопкой, устанавливаем флаг true
    circleOver = false;  // Устанавливаем флаг false для круглой кнопки
  } else {
    circleOver = rectOver = false;  // Если курсор над обоими кнопками, обнулим
  }
}
void mousePressed() {
  // Обрабатываем событие клика мыши
  if (circleOver) {
    currentColor = circleColor;  // Если курсор над круглой кнопкой, меняем текущий цвет на цвет круглой кнопки
  }
  if (rectOver) {
    currentColor = rectColor;  // Если курсор над квадратной кнопкой, меняем текущий цвет на цвет квадратной кнопки
  }
}

boolean overRect(int x, int y, int width, int height)  {
  // Проверяем, находится ли курсор внутри указанных границ прямоугольника
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;  // Возвращаем true, если курсор внутри прямоугольника
  } else {
    return false;  // Возвращаем false, если курсор вне прямоугольника
  }
}

boolean overCircle(int x, int y, int diameter) {
  // Проверяем, находится ли курсор внутри указанных границ круга
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;  // Возвращаем true, если курсор внутри круга
  } else {
    return false;  // Возвращаем false, если курсор вне круга
  }
}
