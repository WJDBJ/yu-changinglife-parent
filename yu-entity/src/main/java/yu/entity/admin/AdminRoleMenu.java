package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author smile
 */
@Data
@ApiModel("角色访问权限映射")
public class AdminRoleMenu {

    @ApiModelProperty("唯一标识，自增长")
    private Integer id;
    @ApiModelProperty("指定角色")
    private Integer rid;
    @ApiModelProperty("指定菜单")
    private Integer mid;

}
