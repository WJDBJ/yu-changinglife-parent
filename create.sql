create table admin_menu
(
    id        int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    path      varchar(64) null comment '�� Vue ·���е� path ��Ӧ������ַ·��',
    name      varchar(64) null comment '�� Vue ·���е� name ���Զ�Ӧ',
    name_zh   varchar(64) null comment '�������ƣ�������Ⱦ���������˵�������',
    icon_cls  varchar(64) null comment 'element ͼ��������������Ⱦ�˵�����ǰ��Сͼ��',
    component varchar(64) null comment '����������ڽ���·�ɶ�Ӧ�����',
    parent_id int         null comment '���ڵ� id�����ڴ洢�������㼶��ϵ'
)
    comment '�˵�·�ɹ����';

create table admin_permission
(
    id    int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    name  varchar(100) null comment 'Ȩ�޵����ƣ��Ƽ�ʹ��Ӣ��',
    desc_ varchar(100) null comment '��Ȩ�޹��ܵľ�������',
    url   varchar(100) null comment 'Ȩ�޶�Ӧ�Ľӿڣ���ʵ�ֹ��ܿ��ƵĹؼ�'
)
    comment 'Ȩ�޹����';

create table admin_role
(
    id      int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    name    varchar(100) null comment '��ɫ����',
    name_zh varchar(100) null comment '��ɫ��������',
    enabled tinyint(1)   null comment '��ǰ״̬'
)
    comment '��ɫ�����';

create table admin_role_menu
(
    id  int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    rid int null comment 'ָ����ɫ',
    mid int null comment 'ָ���˵�'
)
    comment '��ɫȨ�޹�������ڹ����ɫ���Է��ʵ�·��';

create table admin_role_permission
(
    id  int(20) auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    rid int(20) null comment 'ָ����ɫ',
    pid int(20) null comment 'ָ��ӵ��Ȩ��'
)
    comment '��ɫȨ�ޱ�';

create index fk_role_permission_permission_1
    on admin_role_permission (pid);

create index fk_role_permission_role_1
    on admin_role_permission (rid);

create table admin_user
(
    user_id   bigint auto_increment comment '�û�id'
        primary key,
    username  char(30)                  not null comment '�û���',
    password  varchar(100)              not null comment '����',
    nickname  varchar(30)               not null comment '�ǳ�',
    user_head varchar(100) default '1'  not null comment 'ͷ��',
    user_sex  bit          default b'1' not null comment '�Ա�',
    signature varchar(100)              null comment '����ǩ��',
    user_area varchar(100)              null comment '��ַ',
    enabled   tinyint(1)                not null comment '״̬'
)
    comment '�û���Ϣ��';

create table admin_user_role
(
    id  int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    uid int null comment 'ָ���û�',
    rid int null comment 'ָ����ɫ'
)
    comment '�û���ɫ�����';

create index fk_operator_role_operator_1
    on admin_user_role (uid);

create index fk_operator_role_role_1
    on admin_user_role (rid);

create table article_comment
(
    comment_id        bigint unsigned auto_increment comment '����id'
        primary key,
    user_id           bigint   not null comment '�����û�id',
    article_id        bigint   not null comment '��������id',
    comment_date      datetime not null comment '��������',
    comment_content   text     not null comment '��������',
    parent_comment_id bigint   not null comment '������id'
);

create table article_content
(
    article_id           bigint   not null comment '����id'
        primary key,
    article_content_html longtext not null comment '��������_html��ʽ',
    article_content_md   longtext not null comment '��������_md��ʽ'
)
    comment '��������html��md��';

create table article_jotter
(
    article_id       bigint auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    sort_id          bigint       not null comment '���·���',
    user_id          bigint       not null comment '�����û�id',
    article_title    varchar(255) not null comment '���±���',
    article_abstract varchar(255) not null comment '����ժҪ',
    article_cover    varchar(255) not null comment '���·���',
    article_date     datetime     not null comment '���·���ʱ��'
)
    comment '�ʼǱ����±�';

create table article_label
(
    label_id   bigint auto_increment comment '��ǩid'
        primary key,
    label_name varchar(20) not null comment '��ǩ����'
)
    comment '���±�ǩ��';

create table article_set_label
(
    article_id bigint not null comment '����id'
        primary key,
    label_id   bigint not null comment '��ǩid'
)
    comment '���±�ǩӳ���';

create table article_sort
(
    sort_id          bigint      not null comment '����id'
        primary key,
    sort_name        varchar(50) not null comment '��������',
    sort_alias       varchar(15) not null comment '�������',
    sort_description varchar(20) not null comment '��������'
)
    comment '�������ͱ�';

create table book_label
(
    label_id   int          not null comment '����id'
        primary key,
    label_name varchar(255) not null comment '��������'
)
    comment '�鼮���ͱ�';

create table book_info
(
    book_id         int auto_increment comment 'Ψһ��ʶ��������'
        primary key,
    book_cover      varchar(255) default '' null comment '�鼮����',
    book_title      varchar(255) default '' not null comment '�鼮����',
    book_author     varchar(255) default '' null comment '�鼮����',
    publish_time    date                    null comment '�鼮��������',
    publish_company varchar(255) default '' null comment '�鼮������',
    description     varchar(255)            null comment '�鼮���',
    label_id        int                     null comment '�鼮����id',
    constraint fk_book_category_on_cid
        foreign key (label_id) references book_label (label_id)
            on update cascade on delete set null
)
    comment '�鼮��Ϣ��';

create table chatroom_friend
(
    id        bigint auto_increment comment 'Ψһ��ʶ'
        primary key,
    user_id   bigint      not null comment '�û���Ψһ��ʶ��',
    friend_id bigint      not null comment '���ѣ�Ψһ��ʶ��',
    note_name varchar(20) null comment '��ע��Ϣ',
    enabled   bit         not null comment '״̬'
)
    comment '�������û������б�';

create table chatroom_message
(
    msg_id      bigint auto_increment comment 'Ψһ��ʶ'
        primary key,
    send_time   datetime not null comment '����ʱ��',
    sender_id   bigint   not null comment '������id',
    receiver_id bigint   not null comment '������id',
    msg_type    int      not null comment '��Ϣ���� 0-�ı� 1-ͼƬ',
    msg_content text     not null comment '��Ϣ����'
)
    comment '�����������¼';

create table chatroom_session
(
    session_id   bigint auto_increment comment '��ʶid'
        primary key,
    user_id      bigint           not null comment '�����û�id',
    object_id    bigint           not null comment '�Ự����id',
    object_type  int              not null comment '�������� 0-Ⱥ���� 1-���Ѷ���',
    unread_count int(2) default 0 not null comment 'δ����Ϣ����'
)
    comment '�������û��Ự�б�';

create table chatroom_strategy
(
    strategy_id    bigint auto_increment comment 'Ψһ��ʶid'
        primary key,
    request_id     bigint       null comment '���������û���id',
    response_id    bigint       null comment '���������û���id',
    request_msg    varchar(200) null comment '��������ʱ����֤��Ϣ',
    handling_time  datetime     null comment '���������ʱ��',
    handling_state bit          null comment '״̬���Ƿ��ѱ�����'
)
    comment '������Ӳ���';

create table simple_words
(
    words_id bigint(11) auto_increment comment '��ʶid'
        primary key,
    content  varchar(150) not null comment '΢����������'
)
    comment 'һ����¼' charset = utf8mb4;

