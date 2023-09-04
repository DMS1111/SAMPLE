import javax.swing.*;
import java.awt.event.*;
import java.io.*;

void setup() {
  // Создаем новое диалоговое окно выбора файла
  JFileChooser fileChooser = new JFileChooser();
  
  // Устанавливаем заголовок окна выбора файла
  fileChooser.setDialogTitle("Выберите файл для открытия");
  
  // Устанавливаем фильтр для отображения только файлов с расширением .bat
  fileChooser.setFileFilter(new javax.swing.filechooser.FileFilter() {
    public boolean accept(File file) {
      return file.getName().toLowerCase().endsWith(".bat") || file.isDirectory();
    }
    
    public String getDescription() {
      return "Файлы BAT (*.bat)";
    }
  });
  
  // Устанавливаем режим выбора только одного файла
  fileChooser.setMultiSelectionEnabled(false);
  
  // Обработчик события для кнопки "Открыть"
  int response = fileChooser.showOpenDialog(null);
  if (response == JFileChooser.APPROVE_OPTION) {
    File selectedFile = fileChooser.getSelectedFile();
    
    try {
      // Создаем новый экземпляр Runtime
      Runtime runtime = Runtime.getRuntime();
      
      // Получаем путь к выбранному файлу и выполняем команду открытия файла в командной строке в Windows
      String filePath = selectedFile.getAbsolutePath();
      Process process = runtime.exec("cmd.exe /c start " + filePath);
      
      // Закрываем скетч после открытия файла
      exit();
    } catch (IOException e) {
      println("Ошибка при открытии файла в командной строке: " + e.getMessage());
    }
  } else {
    // Если пользователь не выбрал файл, просто закрываем скетч
    exit();
  }
}
