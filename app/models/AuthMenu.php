<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "auth_menu".
 *
 * @property integer $id
 * @property integer $pid
 * @property string $name
 * @property integer $depth
 * @property integer $sort
 */
class AuthMenu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'auth_menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'depth', 'sort'], 'integer'],
            [['name'], 'required'],
            [['name'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => 'Pid',
            'name' => 'Name',
            'depth' => 'Depth',
            'sort' => 'Sort',
        ];
    }

    public static function  getMenus(){
        $menuModels = AuthMenu::find()->orderBy(['sort' => SORT_ASC])->asArray()->all();

        $list = [];

        foreach($menuModels as $item){
            $list[$item['id']] = $item['name'];
        }
        return $list;
    }


    public function getItems()
    {
        return $this->hasMany(AuthItem::className(), ['name' => 'item_name'])
            ->viaTable('auth_menu_item',['menu_id' => 'id' ]);


    }
}
