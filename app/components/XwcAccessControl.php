<?php
namespace app\components;

use Yii;
use yii\base\ErrorException;
use yii\filters\AccessControl;
use yii\web\ForbiddenHttpException;


/**
 * 权限过滤器
 * Class XwcAccessControl
 * @package app\components
 */
class XwcAccessControl extends AccessControl
{

    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {

        if (parent::beforeAction($action)) {
            $permission =  $action->controller->id.'/'.$action->id;
            if (in_array($permission,$this->_allowActions()) || Yii::$app->user->can($permission)) {
                return true;
            }else{
                throw new ForbiddenHttpException("抱歉,您没有权限操作这个页面,请联系管理员开通!");
            }
        }
        return false;
    }


    /**
     * 排除的Action 比如ajax请求,错误页面等
     */
    private function _allowActions(){
        return [
            'site/error',
            'rabc/getres',
            'site/logout',
            'site/login',
            'site/captcha'
        ];
    }
}
