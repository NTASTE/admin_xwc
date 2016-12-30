<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "os_log".
 *
 * @property integer $id
 * @property string $username
 * @property integer $action
 * @property string $otable
 * @property integer $oid
 * @property string $odata
 * @property string $year
 * @property string $month
 * @property string $day
 * @property integer $create_time
 */
class DyLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dy_log';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['action', 'create_time'], 'integer'],
            [['odata', 'year', 'month'], 'required'],
            [['odata'], 'string'],
            [['username', 'otable'], 'string', 'max' => 255],
            [['oid'],'string','max'=>20],
            [['year'], 'string', 'max' => 4],
            [['month', 'day'], 'string', 'max' => 2]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'action' => 'Action',
            'otable' => 'Otable',
            'oid' => 'Oid',
            'odata' => 'Odata',
            'year' => 'Year',
            'month' => 'Month',
            'day' => 'Day',
            'create_time' => 'Create Time',
        ];
    }


    public function saveItem($insert,$tableName,$odata,$id){

        $logModel = new DyLog();
        $logModel->setAttributes([
            'username' => \Yii::$app->getUser()->identity->attributes['username'],
            'action' => $insert ? 0:1,
            'otable' => $tableName,
            'oid' => $id,
            'odata' => json_encode($odata,JSON_UNESCAPED_UNICODE),
            'create_time' =>time(),
            'year' => date('Y',time()),
            'month' => date('m',time()),
            'day' => date('d',time()),
        ]);
        $logModel->save();
    }


    public static function getLogs($table,$id){

        $items = DyLog::find()->orderBy(['id' => SORT_DESC])->where(['otable' => $table,'oid' => $id])->asArray()->all();

        return $items;


    }





}
