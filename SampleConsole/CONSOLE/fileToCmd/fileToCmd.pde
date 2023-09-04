import java.io.*;

void setup() {
  try {
    // Создаем новый экземпляр Runtime
    Runtime runtime = Runtime.getRuntime();
    
    // Указываем полный путь к файлу test.bat и выполняем команду открытия файла в командной строке в Windows
    Process process = runtime.exec("cmd.exe /c start C:/Users/User/Desktop/test.bat");
    
    // Закрываем скетч после открытия файла

  } catch (IOException e) {
    println("Ошибка при открытии файла в командной строке: " + e.getMessage());
  }
}
