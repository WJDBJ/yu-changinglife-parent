create table admin_menu
(
    id        int auto_increment comment '唯一标识，自增长'
        primary key,
    path      varchar(64) null comment '与 Vue 路由中的 path 对应，即地址路径',
    name      varchar(64) null comment '与 Vue 路由中的 name 属性对应',
    name_zh   varchar(64) null comment '中文名称，用于渲染导航栏（菜单）界面',
    icon_cls  varchar(64) null comment 'element 图标类名，用于渲染菜单名称前的小图标',
    component varchar(64) null comment '组件名，用于解析路由对应的组件',
    parent_id int         null comment '父节点 id，用于存储导航栏层级关系'
)
    comment '菜单路由管理表';

create table admin_permission
(
    id    int auto_increment comment '唯一标识，自增长'
        primary key,
    name  varchar(100) null comment '权限的名称，推荐使用英文',
    desc_ varchar(100) null comment '对权限功能的具体描述',
    url   varchar(100) null comment '权限对应的接口，是实现功能控制的关键'
)
    comment '权限管理表';

create table admin_role
(
    id      int auto_increment comment '唯一标识，自增长'
        primary key,
    name    varchar(100) null comment '角色名称',
    name_zh varchar(100) null comment '角色中文名称',
    enabled tinyint(1)   null comment '当前状态'
)
    comment '角色管理表';

create table admin_role_menu
(
    id  int auto_increment comment '唯一标识，自增长'
        primary key,
    rid int null comment '指定角色',
    mid int null comment '指定菜单'
)
    comment '角色权限管理表，用于管理角色可以访问的路由';

create table admin_role_permission
(
    id  int(20) auto_increment comment '唯一标识，自增长'
        primary key,
    rid int(20) null comment '指定角色',
    pid int(20) null comment '指定拥有权限'
)
    comment '角色权限表';

create index fk_role_permission_permission_1
    on admin_role_permission (pid);

create index fk_role_permission_role_1
    on admin_role_permission (rid);

create table admin_user
(
    user_id   bigint auto_increment comment '用户id'
        primary key,
    username  char(30)                  not null comment '用户名',
    password  varchar(100)              not null comment '密码',
    nickname  varchar(30)               not null comment '昵称',
    user_head varchar(100) default '1'  not null comment '头像',
    user_sex  bit          default b'1' not null comment '性别',
    signature varchar(100)              null comment '个性签名',
    user_area varchar(100)              null comment '地址',
    enabled   tinyint(1)                not null comment '状态'
)
    comment '用户信息表';

create table admin_user_role
(
    id  int auto_increment comment '唯一标识，自增长'
        primary key,
    uid int null comment '指定用户',
    rid int null comment '指定角色'
)
    comment '用户角色管理表';

create index fk_operator_role_operator_1
    on admin_user_role (uid);

create index fk_operator_role_role_1
    on admin_user_role (rid);

create table article_comment
(
    comment_id        bigint unsigned auto_increment comment '评论id'
        primary key,
    user_id           bigint   not null comment '发表用户id',
    article_id        bigint   not null comment '评论文章id',
    comment_date      datetime not null comment '评论日期',
    comment_content   text     not null comment '评论内容',
    parent_comment_id bigint   not null comment '父评论id'
);

create table article_content
(
    article_id           bigint   not null comment '文章id'
        primary key,
    article_content_html longtext not null comment '文章内容_html格式',
    article_content_md   longtext not null comment '文章内容_md格式'
)
    comment '文章内容html与md表';

create table article_jotter
(
    article_id       bigint auto_increment comment '唯一标识，自增长'
        primary key,
    sort_id          bigint       not null comment '文章分类',
    user_id          bigint       not null comment '发布用户id',
    article_title    varchar(255) not null comment '文章标题',
    article_abstract varchar(255) not null comment '文章摘要',
    article_cover    varchar(255) not null comment '文章封面',
    article_date     datetime     not null comment '文章发布时间'
)
    comment '笔记本文章表';

create table article_label
(
    label_id   bigint auto_increment comment '标签id'
        primary key,
    label_name varchar(20) not null comment '标签名称'
)
    comment '文章标签表';

create table article_set_label
(
    article_id bigint not null comment '文章id'
        primary key,
    label_id   bigint not null comment '标签id'
)
    comment '文章标签映射表';

create table article_sort
(
    sort_id          bigint      not null comment '分类id'
        primary key,
    sort_name        varchar(50) not null comment '分类名称',
    sort_alias       varchar(15) not null comment '分类别名',
    sort_description varchar(20) not null comment '分类描述'
)
    comment '文章类型表';

create table book_label
(
    label_id   int          not null comment '类型id'
        primary key,
    label_name varchar(255) not null comment '类型名称'
)
    comment '书籍类型表';

create table book_info
(
    book_id         int auto_increment comment '唯一标识，自增长'
        primary key,
    book_cover      varchar(255) default '' null comment '书籍封面',
    book_title      varchar(255) default '' not null comment '书籍名称',
    book_author     varchar(255) default '' null comment '书籍作者',
    publish_time    date                    null comment '书籍出版日期',
    publish_company varchar(255) default '' null comment '书籍出版社',
    description     varchar(255)            null comment '书籍简介',
    label_id        int                     null comment '书籍类型id',
    constraint fk_book_category_on_cid
        foreign key (label_id) references book_label (label_id)
            on update cascade on delete set null
)
    comment '书籍信息表';

create table chatroom_friend
(
    id        bigint auto_increment comment '唯一标识'
        primary key,
    user_id   bigint      not null comment '用户（唯一标识）',
    friend_id bigint      not null comment '好友（唯一标识）',
    note_name varchar(20) null comment '备注信息',
    enabled   bit         not null comment '状态'
)
    comment '聊天室用户好友列表';

create table chatroom_message
(
    msg_id      bigint auto_increment comment '唯一标识'
        primary key,
    send_time   datetime not null comment '发送时间',
    sender_id   bigint   not null comment '发送人id',
    receiver_id bigint   not null comment '接收人id',
    msg_type    int      not null comment '消息类型 0-文本 1-图片',
    msg_content text     not null comment '消息内容'
)
    comment '聊天室聊天记录';

create table chatroom_session
(
    session_id   bigint auto_increment comment '标识id'
        primary key,
    user_id      bigint           not null comment '所属用户id',
    object_id    bigint           not null comment '会话对象id',
    object_type  int              not null comment '对象类型 0-群对象 1-好友对象',
    unread_count int(2) default 0 not null comment '未读消息数量'
)
    comment '聊天室用户会话列表';

create table chatroom_strategy
(
    strategy_id    bigint auto_increment comment '唯一标识id'
        primary key,
    request_id     bigint       null comment '发起请求用户的id',
    response_id    bigint       null comment '接收请求用户的id',
    request_msg    varchar(200) null comment '好友申请时的验证消息',
    handling_time  datetime     null comment '请求发起或处理时间',
    handling_state bit          null comment '状态，是否已被处理'
)
    comment '好友添加策略';

create table simple_words
(
    words_id bigint(11) auto_increment comment '标识id'
        primary key,
    content  varchar(150) not null comment '微言碎语内容'
)
    comment '一言语录' charset = utf8mb4;

