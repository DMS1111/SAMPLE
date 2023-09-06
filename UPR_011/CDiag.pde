//////////////////////////////////////////////////////////////////////////////////3

class PWindow3 extends PApplet {
  PWindow3() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  void settings() {//диагностика
    size(480, 460);
  }
  
  boolean bat1=false;
  boolean bat2=false;
  boolean bot1=false;
  boolean bot2=false;
  
float scrollPosition = 0;  // Позиция скролла
float scrollBarHeight = 20;  // Высота ползунка скроллбара
float scrollBarY;  // Вертикальное положение ползунка скроллбара
boolean isDragging = false;  // Флаг, указывающий, что ползунок скроллбара перетаскивается
float dragOffsetY = 0;  // Смещение ползунка скроллбара при перетаскивании  
  
  int z=0;
int a;
boolean m=false;

  void setup() {
    background(150);
    windowMove(1420, 540);
    surface.setTitle("Машинки на трассе");
    scrollBarY = 0;
  }

  void draw() {
    background(150);
    
    if (mouseX > 10 && mouseX < 235 && mouseY > 10 && mouseY < 155) {
      bat1=true;
      bat2=false;
      if(bot1){
      fill(200, 0, 0);
      }else fill(0, 200, 0);
    rect(7, 7, 230, 150);
    }
    if (mouseX > 250 && mouseX < 450 && mouseY > 10 && mouseY < 155) {
      bat2=true;
      bat1=false;
      if(bot2){
      fill(200, 0, 0);
      }else fill(0, 200, 0);
    rect(237, 7, 230, 150);
    }
    
      int x=225;
      int y=145;
    
    for (int i=1; i<cap+1; i++){
      if (m) a=10;
      else a=240;
      m=!m;
    image(cars[i], a, z + scrollPosition, x, y);
        if(bot1) image(car0, 10, 10, 225, 145);
    if(bot2) image(car0, 240, 10, 225, 145);
    
    if (!m) z += 150;
    if (i==cap) z=10;
    
  //  if(bot1) image(car0, 10, 10, 225, 145);
  //  if(bot2) image(car0, 240, 10, 225, 145);
    
   // println (z, i);
  }
  /*
   image(car1, 10, 10, 225, 145);
   if(bot1) image(car0, 10, 10, 225, 145);
   image(car2, 240, 10, 225, 145);
   if(bot2) image(car0, 240, 10, 225, 145);
   image(car3, 10, 160, 225, 145);
   image(car4, 240, 160, 225, 145);
   image(car5, 10, 310, 225, 145);
   image(car6, 240, 310, 225, 145);*/
    
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
  
 /* void Map2() {
  if (one == null) one = new PWindow();
 // if (one != null) one = null;  
}

void Ext2(){
  //exit();
     // dispose();
    three = null;
}*/

void mouseWheel(MouseEvent event) {
  float deltaY = event.getCount();
  deltaY*=-1;
  scrollPosition += deltaY * 20;  // Изменение позиции скролла
  scrollPosition = constrain(scrollPosition, -(174*7), 0);  // Ограничение позиции скролла
}

  void mousePressed(MouseEvent event) {
      if (bat1) {bot1=!bot1; bat1=false;}
      if (bat2) {bot2=!bot2; bat2=false;}
      
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

  void exit()
  {
    dispose();
    three = null;
  }
}
