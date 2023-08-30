void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  
  // Проверяем, находится ли курсор над кругом
  if (mouseX > 250 && mouseX < 350 && mouseY > 250 && mouseY < 350) {
    // Рисуем попап
    fill(0);
    rect(10, 10, 100, 100);
  }
  
  // Рисуем круг
  fill(255, 0, 0);
  ellipse(300, 300, 100, 100);
}
