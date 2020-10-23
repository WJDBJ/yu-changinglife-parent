package yu.entity.admin;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author smile
 */
@Data
@ApiModel("权限信息")
public class AdminPermission {

    @ApiModelProperty("唯一标识，自增长")
    private Integer id;
    @ApiModelProperty("权限的名称，推荐使用英文 ")
    private String name;
    @ApiModelProperty("对权限功能的具体描述")
    private String desc_;
    @ApiModelProperty("权限对应的接口，是实现功能控制的关键")
    private String url;

}
