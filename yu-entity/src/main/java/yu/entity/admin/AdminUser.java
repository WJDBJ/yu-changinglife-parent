package yu.entity.admin;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.List;

/**
 * @author smile
 */
@Data
@ToString
@ApiModel("用户实体")
@NoArgsConstructor
public class AdminUser implements UserDetails {

    @ApiModelProperty("用户id")
    private Integer userId;
    @ApiModelProperty("用户名")
    private String username;
    @ApiModelProperty("用户密码")
    private String password;
    @ApiModelProperty("昵称")
    private String nickname;
    @ApiModelProperty("头像")
    private String userHead;
    @ApiModelProperty("性别")
    private boolean userSex;
    @ApiModelProperty("个性签名")
    private String signature;
    @ApiModelProperty("地区")
    private String userArea;
    @ApiModelProperty("帐号是否启用")
    private boolean enabled;

    @ApiModelProperty("用户所拥有的角色")
    private List<AdminRole> roles;

    public AdminUser(Integer userId, String username, String nickname, Boolean enabled) {
        this.userId = userId;
        this.username = username;
        this.nickname = nickname;
        this.enabled = enabled;
    }

    /** 帐户是否过期 */
    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }

    /** 帐户是否被冻结 */
    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return true;
    }

    /** 帐户密码是否过期，一般有的密码要求性高的系统会使用到，比较每隔一段时间就要求用户重置密码 */
    @Override
    @JsonIgnore
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /** 所有角色信息 */
    @Override
    @JsonIgnore
    public List<GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (AdminRole adminRole : roles) {
            authorities.add(new SimpleGrantedAuthority("ROLE_" + adminRole.getName()));
        }
        return authorities;
    }

}

