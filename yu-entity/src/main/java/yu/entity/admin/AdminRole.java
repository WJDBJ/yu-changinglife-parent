package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @author smile
 */
@Data
@ApiModel("角色信息")
public class AdminRole {

    @ApiModelProperty("唯一标识，自增长")
    private Integer id;
    @ApiModelProperty("角色名称（英文标识）")
    private String name;
    @ApiModelProperty("角色中文名称")
    private String nameZh;
    @ApiModelProperty("角色状态（启用、停用）")
    private boolean enabled;

    @ApiModelProperty("该角色所具有的所有权限，表示该角色可以允许执行的操作")
    private List<AdminPermission> perms;

    @ApiModelProperty("该角色可以访问路由，用于渲染菜单栏")
    private List<AdminMenu> menus;

}
