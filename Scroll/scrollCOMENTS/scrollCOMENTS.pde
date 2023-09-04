int totalLines = 41;      // Общее количество строк текста
int lineHeight = 20;      // Высота одной строки
int visibleLines;         // Количество видимых строк
int scrollAmount = 0;     // Количество пикселей прокрутки

void setup() {
  size(400, 400);         // Устанавливаем размер окна
  visibleLines = height / lineHeight; // Вычисляем количество видимых строк
}

void draw() {
  background(255);        // Заливаем фон белым цветом

  int startLine = scrollAmount / lineHeight; // Начальная видимая строка
  int endLine = min(startLine + visibleLines, totalLines); // Конечная видимая строка

  // Отрисовка текста на экране
  for (int i = startLine; i < endLine; i++) {
    fill(0);               // Черный цвет текста
    text("Line " + i, 20, (i - startLine) * lineHeight + 30); // Отображаем строку
  }

  drawScrollbar();        // Отрисовываем полосу прокрутки
}

void drawScrollbar() {
  // Вычисляем позицию полосы прокрутки
  float scrollbarY = map(scrollAmount, 0, (totalLines - visibleLines) * lineHeight, 0, height);
  
  // Отрисовка фона полосы прокрутки
  fill(200);              
  rect(width - 20, 0, 20, height);
  
  // Отрисовка фронтальной части полосы прокрутки
  fill(150);              
  float scrollbarHeight = map(visibleLines, 0, totalLines, height, 0);
  rect(width - 20, scrollbarY, 20, scrollbarHeight);
}

void mouseWheel(MouseEvent event) {
  // Обновляем значение прокрутки в зависимости от направления
  scrollAmount += event.getCount() * 3;
  // Ограничиваем значение прокрутки, чтобы не выйти за границы текста
  scrollAmount = constrain(scrollAmount, 0, (totalLines - visibleLines) * lineHeight);
}
