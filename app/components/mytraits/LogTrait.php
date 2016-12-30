<?php
/**
 * Created by PhpStorm.
 * User: gaojiyong
 * Date: 2016/4/8
 * Time: 10:45
 */
namespace app\components\mytraits;


use app\models\DyLog;

trait  LogTrait
{
    #日志表集合
    public $_tableList = [
        'cl_article',
        'auth_item',
        ''
    ];
    #表修改日志
    public function afterSave($insert, $changedAttributes)
    {

        parent::afterSave($insert, $changedAttributes);
        #排除控制台应用
        if(\Yii::$app->id != 'XwcCmd' ){
            if(!$insert){
                #更新
                $odata['last']= $changedAttributes;
            }
            $item = $this->attributes;
            $odata['cur'] = array_intersect_key($item,$changedAttributes);
            $tableName = $this->tableName();
            $uid =  \Yii::$app->getUser()->id ;


            if($uid && in_array($tableName,$this->_tableList)){
                $logModel = new DyLog();
                $logModel->saveItem($insert,$tableName,$odata,$this->getPrimaryKey());
            }
        }





//        $this->trigger($insert ? self::EVENT_AFTER_INSERT : self::EVENT_AFTER_UPDATE, new AfterSaveEvent([
//            'changedAttributes' => $changedAttributes
//        ]));
    }



}