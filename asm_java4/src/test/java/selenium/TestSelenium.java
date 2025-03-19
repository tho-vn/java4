package selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import java.util.Collections;

public class TestSelenium {
    public static void main(String[] args) {
        // Đặt đường dẫn tới ChromeDriver
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\GIGABYTE\\Downloads\\chrome-win64\\chromedriver.exe");

        // Cấu hình ChromeOptions
        ChromeOptions options = new ChromeOptions();
        options.setBinary("C:\\Users\\GIGABYTE\\Downloads\\chrome-win64\\chrome-win64\\chrome.exe");
        options.addArguments("--remote-allow-origins=*");
        options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation")); // Ẩn cảnh báo automation

        // Khởi tạo WebDriver với ChromeOptions
        WebDriver driver = new ChromeDriver(options);

        try {
            // Mở trang web Google
            driver.get("https://www.google.com");

            // In tiêu đề trang ra console
            System.out.println("Page title: " + driver.getTitle());
        } finally {
            // Đóng trình duyệt
            driver.quit();
        }
    }
}
