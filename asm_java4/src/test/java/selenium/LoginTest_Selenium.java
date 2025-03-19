package selenium;


import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.time.Duration;

public class LoginTest_Selenium {
    private WebDriver driver;

    @BeforeMethod
    public void setUp() {
        WebDriverManager.chromedriver().setup(); // Khởi tạo chromeDriver
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        driver.get("http://localhost:8080/dangNhap"); // URL trang login
        System.out.println("Đã mở trang đăng nhập.");
    }

    @Test
    public void testLoginSuccess() {
        System.out.println("Bắt đầu kiểm tra đăng nhập thành công.");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // Nhập thông tin đăng nhập
        driver.findElement(By.id("sdt")).sendKeys("0702738245");
        System.out.println("Nhập tên đăng nhập:0702738245");

        WebElement passwordField = driver.findElement(By.id("matKhau"));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", passwordField);
        passwordField.sendKeys("123");
        System.out.println("Nhập mật khẩu: 123");

        // Chờ và tìm nút đăng nhập
        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("loginBtn")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", loginButton);
        loginButton.click();
        System.out.println("Đã nhấn nút đăng nhập.");

        try {
            // Đợi URL chuyển đến trang index.jsp
            wait.until(ExpectedConditions.urlContains("/index"));
//            System.out.println("URL hiện tại: " + driver.getCurrentUrl());

            // Kiểm tra session attribute
            if (driver.findElements(By.className("user-welcome")).size() > 0) {
                WebElement welcomeMessage = driver.findElement(By.className("user-welcome"));
                System.out.println("Tìm thấy phần chào mừng: " + welcomeMessage.getText());
                Assert.assertTrue(true);
                return;
            }

            // Kiểm tra thông báo thành công
            if (driver.findElements(By.id("successMsg")).size() > 0) {
                WebElement successMessage = driver.findElement(By.id("successMsg"));
                System.out.println("Tìm thấy thông báo:  Đăng Nhập Thành Công chúc mừng bạn" + successMessage.getText());
                Assert.assertTrue(successMessage.isDisplayed());
                return;
            }
            Assert.fail("Không tìm thấy bất kỳ dấu hiệu đăng nhập thành công nào!");

        } catch (TimeoutException e) {
            System.out.println("Lỗi timeout: " + e.getMessage());
            Assert.fail("Đăng nhập thất bại!");
        }
    }
    @Test
    public void testLoginGhiNho() {
        System.out.println("Bắt đầu kiểm tra đăng nhập thành công.");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

        // Nhập thông tin đăng nhập
        driver.findElement(By.id("sdt")).sendKeys("0702738245");
        System.out.println("Nhập tên đăng nhập:0702738245");

        WebElement passwordField = driver.findElement(By.id("matKhau"));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", passwordField);
        passwordField.sendKeys("123");
        System.out.println("Nhập mật khẩu: 123");
        WebElement nhoMKRadioButton = driver.findElement(By.id("exampleCheck1"));
        nhoMKRadioButton.click();
        System.out.println("Đã chọn nhớ mật khẩu");

        // Chờ và tìm nút đăng nhập
        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("loginBtn")));
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", loginButton);
        loginButton.click();
        System.out.println("Đã nhấn nút đăng nhập.");

        try {
            // Đợi URL chuyển đến trang index.jsp
            wait.until(ExpectedConditions.urlContains("/index"));
//            System.out.println("URL hiện tại: " + driver.getCurrentUrl());

            // Kiểm tra session attribute
            if (driver.findElements(By.className("user-welcome")).size() > 0) {
                WebElement welcomeMessage = driver.findElement(By.className("user-welcome"));
                System.out.println("Tìm thấy phần chào mừng: " + welcomeMessage.getText());
                Assert.assertTrue(true);
                return;
            }

            // Kiểm tra thông báo thành công
            if (driver.findElements(By.id("successMsg")).size() > 0) {
                WebElement successMessage = driver.findElement(By.id("successMsg"));
                System.out.println("Tìm thấy thông báo:  Đăng Nhập Thành Công chúc mừng bạn" + successMessage.getText());
                Assert.assertTrue(successMessage.isDisplayed());
                return;
            }
            Assert.fail("Không tìm thấy bất kỳ dấu hiệu đăng nhập thành công nào!");

        } catch (TimeoutException e) {
            System.out.println("Lỗi timeout: " + e.getMessage());
            Assert.fail("Đăng nhập thất bại!");
        }
    }

    @Test
    public void testLoginFail_WrongPassword() {
        System.out.println("Bắt đầu kiểm tra đăng nhập với mật khẩu sai.");

        // Nhập thông tin đăng nhập
        driver.findElement(By.id("sdt")).sendKeys("0702738245");
        System.out.println("Nhập tên đăng nhập: 0702738245");

        driver.findElement(By.id("matKhau")).sendKeys("123123123123");
        System.out.println("Nhập mật khẩu sai: SAI MẬT KHẨU");

        // Chờ và nhấn nút đăng nhập
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement loginButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("loginBtn")));

        // Cuộn đến nút đăng nhập nếu nó bị che khuất
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", loginButton);
        loginButton.click();
        System.out.println("Đã nhấn nút đăng nhập.");
        // Kiểm tra thông báo lỗi
        try {
            WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("error")));
            Assert.assertTrue(successMessage.isDisplayed(), "Đăng nhập thất bại!");
            System.out.println("Đăng Nhập thất bại do :" + successMessage.getText());
        } catch (Exception e) {
            Assert.fail("Không tìm thấy thông báo lỗi!", e);
        }
    }

    @AfterMethod
    public void tearDown() {
        if (driver != null) {
            System.out.println("Đóng trình duyệt.");
            driver.quit();
        }
    }
}
