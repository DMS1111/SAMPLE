int totalLines = 41; // Общее количество строк текста
int lineHeight = 20; // Высота одной строки
int visibleLines; // Количество видимых строк
int scrollAmount = 0; // Количество пикселей прокрутки

void setup() {
  size(400, 400);
  visibleLines = height / lineHeight;
}

void draw() {
  background(255);

  int startLine = scrollAmount / lineHeight;
  int endLine = min(startLine + visibleLines, totalLines);

  for (int i = startLine; i < endLine; i++) {
    fill(0);
    text("Line " + i, 20, (i - startLine) * lineHeight + 30);
  }

  drawScrollbar();
}

void drawScrollbar() {
  float scrollbarY = map(scrollAmount, 0, (totalLines - visibleLines) * lineHeight, 0, height);
  fill(200);
  rect(width - 20, 0, 20, height);
  fill(150);
  float scrollbarHeight = map(visibleLines, 0, totalLines, height, 0);
  rect(width - 20, scrollbarY, 20, scrollbarHeight);
}

void mouseWheel(MouseEvent event) {
  scrollAmount += event.getCount() * 3;
  scrollAmount = constrain(scrollAmount, 0, (totalLines - visibleLines) * lineHeight);
}
