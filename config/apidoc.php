<?php
return [
    // 文档标题
    'title'              => 'APi接口文档',
    // 文档描述
    'desc'               => '智慧校园相关接口文档',
    // 版权申明
    'copyright'          => 'Powered By LZH',
    // 默认作者
    'default_author'=>'LZH',
    // 默认请求类型
    'default_method'=>'GET',
    // 设置应用/版本（必须设置）
    'apps' => [
        [
            'title'=>'后台管理',
            'path'=>'app\admin\controller',
            'folder'=>'admin',
//            'items'=>[
//                ['title'=>'V1.0','path'=>'app\admin\controller\v1','folder'=>'v1'],
//                ['title'=>'V2.0','path'=>'app\admin\controller\v2','folder'=>'v2']
//            ]
        ],
        [
            'title'=>'家长端小程序',
            'path'=>'app\parentmp\controller',
            'folder'=>'parentmp',
//            'items'=>[
//                ['title'=>'V1.0','path'=>'app\parentmp\controller\v1','folder'=>'v1'],
//                ['title'=>'V2.0','path'=>'app\parentmp\controller\v2','folder'=>'v2']
//            ]
        ],
        [
            'title'=>'教师端小程序',
            'path'=>'app\teachermp\controller',
            'folder'=>'teachermp',
//            'items'=>[
//                ['title'=>'V1.0','path'=>'app\teachermp\controller\v1','folder'=>'v1'],
//                ['title'=>'V2.0','path'=>'app\teachermp\controller\v2','folder'=>'v2']
//            ]
        ],
    ],
    // 控制器分组
    'groups'             => [],
    // 指定公共注释定义的文件地址
    'definitions'        => "app\controller\Definitions",
    //指定生成文档的控制器
    'controllers'        => [],
    // 过滤，不解析的控制器
    'filter_controllers' => [],
    // 缓存配置
    'cache'              => [
        // 是否开启缓存
        'enable' => false,
        // 缓存文件路径
        'path'   =>  '../runtime/apidoc/',
        // 是否显示更新缓存按钮
        'reload' => true,
        // 最大缓存文件数
        'max'    => 5,  //最大缓存数量
    ],
    // 权限认证配置
    'auth'               => [
        // 是否启用密码验证
        'enable'     => false,
        // 验证密码
        'password'   => "123456",
        // 密码加密盐
        'secret_key' => "apidoc#hg_code",
    ],
    // 统一的请求Header
    'headers'=>[
        ['name'=>'token','type'=>'string','require'=>true,'desc'=>'登录票据']
    ],
    // 统一的请求参数Parameters
    'parameters'=>[],
    // 统一的请求响应体，仅显示在文档提示中
    'responses'=>[
        ['name'=>'code','desc'=>'状态码','type'=>'int'],
        ['name'=>'message','desc'=>'操作描述','type'=>'string'],
        ['name'=>'data','desc'=>'业务数据','main'=>true,'type'=>'object'],
    ],
    // md文档
    'docs'              => [
        'menu_title' => '开发文档',
        'menus'      => [
            ['title'=>'md语法示例','path'=>'docs/Use'],
            [
                'title'=>'HTTP响应编码',
                'items'=>[
                    ['title'=>'status错误码说明','path'=>'docs/${app[0].folder}/HttpStatus'],
                    ['title'=>'code错误码说明','path'=>'docs/${app[0].folder}/HttpCode_${app[1].folder}'],
                ],
            ]
        ]
    ],
    'crud'=>[]

];
