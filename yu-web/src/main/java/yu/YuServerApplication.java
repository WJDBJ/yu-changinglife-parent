package yu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author: jianxiao
 * @date: 2020/10/22 15:58
 */
@SpringBootApplication
public class YuServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(YuServerApplication.class,args);
        System.out.println("http://localhost:8848");
    }
}
