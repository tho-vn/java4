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

public class RegisterTest_Selenium {
    private WebDriver driver;

    @BeforeMethod
    public void setUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("http://localhost:8080/dangky");
    }


    @Test
    public void testRegisterSuccess() throws InterruptedException {
        System.out.println("Bắt đầu test đăng ký thành công...");

        driver.findElement(By.name("sdt")).sendKeys("0999999999");
        System.out.println("Nhập sđt: 0999999999");

        driver.findElement(By.name("matKhau")).sendKeys("123");
        System.out.println("Nhập mật khẩu");

        driver.findElement(By.name("matKhau2")).sendKeys("123");
        System.out.println("Nhập xác nhận mật khẩu");

        driver.findElement(By.name("tenND")).sendKeys("Nguyen Van A");
        System.out.println("Nhập tên : Nguyen Van A");

        driver.findElement(By.name("email")).sendKeys("a@gmail.com");
        System.out.println("Nhập email: a@gmail.com");

        // Chọn giới tính Nam
        WebElement maleRadioButton = driver.findElement(By.id("male"));
        maleRadioButton.click();
        System.out.println("Đã chọn giới tính: Nam");

        Thread.sleep(5000); // Chờ 5 giây để trang tải xong
        System.out.println("Chờ 5 giây để đảm bảo giao diện đã load xong...");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement registerButton = wait.until(
                ExpectedConditions.elementToBeClickable(By.id("registerBtn"))
        );
        System.out.println("Nút đăng ký đã sẵn sàng để click");

        registerButton.click();
        System.out.println("Đã nhấn vào nút đăng ký");
        System.out.println("Đã Đăng Kí Thành Công");
    }


    @Test
    public void testRegisterFail_ExistingUser() {

        System.out.println("Bắt đầu test đăng ký với tài khoản đã tồn tại...");

        System.out.println("Bắt đầu test đăng ký...");

        driver.findElement(By.name("sdt")).sendKeys("0702738245");
        System.out.println("Nhập sđt: 0702738245");

        driver.findElement(By.name("matKhau")).sendKeys("123");
        System.out.println("Nhập mật khẩu");

        driver.findElement(By.name("matKhau2")).sendKeys("123");
        System.out.println("Nhập xác nhận mật khẩu");

        driver.findElement(By.name("tenND")).sendKeys("Vo Nhu Tho");
        System.out.println("Nhập tên :Vo Nhu Tho");

        driver.findElement(By.name("email")).sendKeys("nhutho2005@gmail.com");
        System.out.println("Nhập email: nhutho2005@gmail.com");


        WebElement maleRadioButton = driver.findElement(By.id("male"));
        maleRadioButton.click();

        ((JavascriptExecutor) driver).executeScript("document.body.style.zoom='80%'");
        try {
            Thread.sleep(500); // Đợi 0.5s để đảm bảo cuộn xong
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }


        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        WebElement registerButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("registerBtn")));
        registerButton.click();
        System.out.println("Đã nhấn vào nút đăng ký");
        try {
            Thread.sleep(3000);
            WebElement successMessage = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("loitaotk")));
            System.out.println("Tạo tài khoản thất bại do : " + successMessage.getText());
        } catch (Exception e) {
            Assert.fail("Không tìm thấy thông báo lỗi!",e);
        }
    }


    @AfterMethod
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
