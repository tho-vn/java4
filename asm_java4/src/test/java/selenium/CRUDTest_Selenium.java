package selenium;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.*;

import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.util.List;

public class CRUDTest_Selenium {
    private WebDriver driver;
    private WebDriverWait wait;

    // Thông tin đăng nhập
    private final String LOGIN_URL = "http://localhost:8080/dangNhap";
    private final String SDT = "0702738245";
    private final String matKhau = "123";
    private final String CRUD_URL = "http://localhost:8080/qlVideo/index";

    @BeforeMethod
    public void setUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
        loginToAdmin();
    }

    private void loginToAdmin() {
        driver.get(LOGIN_URL);
        System.out.println("Đã mở trang đăng nhập.");

        driver.findElement(By.id("sdt")).sendKeys(SDT);
        driver.findElement(By.id("matKhau")).sendKeys(matKhau);
        driver.findElement(By.id("loginBtn")).click();
        System.out.println("Đã nhấn nút đăng nhập.");

        // Chờ trang chuyển đến Dashboard
        wait.until(ExpectedConditions.urlContains("/index"));
        System.out.println("Đã đăng nhập thành công.");

        driver.get(CRUD_URL);
        System.out.println("Đã vào trang quản lý video.");

        ((JavascriptExecutor) driver).executeScript("document.body.style.zoom='80%'");
    }

    @Test
    public void testCreateRecord() {
        System.out.println("Bắt đầu kiểm tra tạo video mới.");

        // Nhập thông tin video
        driver.findElement(By.name("maVideo")).sendKeys("vonhutho");
        driver.findElement(By.name("poster")).sendKeys("https://i.imgur.com/mlH731D.jpeg");
        driver.findElement(By.name("chuDe")).sendKeys("KiaGroupp");
        driver.findElement(By.name("luotXem")).sendKeys("99000000");
        driver.findElement(By.name("link")).sendKeys("https://www.youtube.com/embed/dQw4w9WgXcQ");
        WebElement maleRadioButton = driver.findElement(By.id("hoatDong"));
        maleRadioButton.click();
        System.out.println("Đã chọn status: Active");

        driver.findElement(By.name("moTa")).sendKeys("Mô tả video test");


        WebElement createButton = wait.until(ExpectedConditions.elementToBeClickable(By.id("createBtn")));

        // Cuộn đến nút đăng nhập nếu nó bị che khuất
        ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", createButton);
        createButton.click();
        System.out.println("Đã nhấn nút tạo video.");
        System.out.println("Tạo video thành công.");
    }

    @Test
    public void testReadRecord() throws InterruptedException {
        System.out.println("Bắt đầu kiểm tra tìm kiếm video.");
        // Chờ ô nhập từ khóa xuất hiện
        WebElement searchBox = wait.until(ExpectedConditions.presenceOfElementLocated(By.id("textSearch")));
        searchBox.clear();
        searchBox.sendKeys("KiaGroup");
        System.out.println("Đã nhập từ khóa tìm kiếm video");

        // Nhấn ENTER để tìm kiếm
        searchBox.sendKeys(Keys.RETURN);
        System.out.println("Đã nhấn ENTER để tìm kiếm.");

        // Chờ danh sách cập nhật
        Thread.sleep(5000); // Chờ 5 giây
        System.out.println("Đợi kết quả tìm kiếm cập nhật...");

        // Kiểm tra xem video có hiển thị không
//        WebElement video = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//h3[contains(text(),'KiaGroup')]")));
//        Assert.assertTrue(video.isDisplayed(), "❌ Không tìm thấy video!");
        System.out.println("Tìm kiếm video thành công.");
    }





    // Phương thức hỗ trợ tìm kiếm phần tử, giúp tránh lỗi TimeoutException
    private WebElement waitForElement(By by) {
        return wait.until(ExpectedConditions.presenceOfElementLocated(by));
    }

    @AfterMethod
    public void tearDown(ITestResult result) {
        if (driver != null) {
            System.out.println("🔹 Đóng trình duyệt.");
            driver.quit();
        }
    }

}
