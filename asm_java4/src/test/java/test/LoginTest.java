package test;

import com.poly.service.LoginService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class LoginTest {
    private LoginService loginService;

    @BeforeEach
    public void setUp() {
        loginService = new LoginService();  // Khởi tạo LoginService trước mỗi test
    }

    @Test
    public void testLoginSuccess() {
        boolean result = loginService.authenticate("user1", "password123");
        System.out.println("Test Đăng nhập thành công - Kết quả thực tế: " + result);
        assertTrue(result, "❌ Lỗi: Đăng nhập thành công nhưng bị lỗi!");
    }

    @Test
    public void testLoginFail_WrongPassword() {
        boolean result = loginService.authenticate("admin", "wrongpass");
        System.out.println("Test Sai mật khẩu - Kết quả thực tế: " + result);
        assertFalse(result, "❌ Lỗi: Sai mật khẩu nhưng vẫn đăng nhập được!");
    }

    @Test
    public void testLoginFail_UserNotFound() {
        boolean result = loginService.authenticate("nonexistentUser", "somepass");
        System.out.println("Test Tài khoản không tồn tại - Kết quả thực tế: " + result);
        assertFalse(result, "❌ Lỗi: Tài khoản không tồn tại nhưng vẫn đăng nhập được!");
    }

    @Test
    public void testLoginFail_EmptyFields() {
        boolean result = loginService.authenticate("", "");
        System.out.println("Test Trường hợp rỗng - Kết quả thực tế: " + result);
        assertFalse(result, "❌ Lỗi: Trường hợp rỗng nhưng vẫn đăng nhập được!");
    }
}
