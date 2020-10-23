package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author smile
 */
@Data
@ApiModel("角色权限映射")
public class AdminRolePermission {

    @ApiModelProperty("唯一标识，自增长")
    private Integer id;
    @ApiModelProperty("指定角色")
    private Integer rid;
    @ApiModelProperty("指定拥有权限")
    private Integer pid;

}
