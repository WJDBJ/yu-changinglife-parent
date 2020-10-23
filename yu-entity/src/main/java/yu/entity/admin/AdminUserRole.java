package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author smile
 */
@Data
@ApiModel("用户角色映射")
@NoArgsConstructor
public class AdminUserRole {

    @ApiModelProperty("唯一标识，自增长")
    private Integer id;
    @ApiModelProperty("指定用户")
    private Integer uid;
    @ApiModelProperty("指定角色")
    private Integer rid;

    public AdminUserRole(Integer uid, Integer rid) {
        this.uid = uid;
        this.rid = rid;
    }

}
