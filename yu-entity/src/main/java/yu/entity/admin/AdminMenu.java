package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * @author smile
 */
@Data
@ToString
@ApiModel("菜单路由管理")
@NoArgsConstructor
public class AdminMenu {

    @ApiModelProperty("唯一标识id，自增长")
    private Integer id;
    @ApiModelProperty("与 Vue 路由中的 path 对应，即地址路径")
    private String path;
    @ApiModelProperty("与 Vue 路由中的 name 属性对应")
    private String name;
    @ApiModelProperty("中文名称，用于渲染导航栏（菜单）界面")
    private String nameZh;
    @ApiModelProperty(" element 图标类名，用于渲染菜单名称前的小图标")
    private String iconCls;
    @ApiModelProperty("组件名，用于解析路由对应的组件")
    private String component;
    @ApiModelProperty("父节点 id，用于存储导航栏层级关系")
    private Integer parentId;

    @ApiModelProperty("子节点，用于存储当前字节下的所有子节点")
    private List<AdminMenu> children;

}
