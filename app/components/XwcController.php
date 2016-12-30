<?php

namespace app\components;

use Yii;
use yii\web\Controller;


class XwcController extends Controller
{
    public $topMenu = 'site';
//    public $layout='@app/views/layouts/main.php';
    public function behaviors()
    {
        return [
            'access' => [
                'class' => XwcAccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['login','captcha'],
                        'roles' => ['?']
                    ],
                    [
                        'allow' => false,
                        'roles' => ['?']
                    ],
                    [
                        'allow' => true,
                        'roles' => ['@']
                    ]
                ],
            ],
        ];
    }

    /**
     * 跳转页面
     * @param $url
     * @return string
     */
    protected function redictPage($url){
        $data['url'] = $url;
        return $this->render('//common/jump',$data);

    }



}
