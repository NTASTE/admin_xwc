<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "auth_menu_item".
 *
 * @property integer $menu_id
 * @property string $item_name
 */
class AuthMenuItem extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'auth_menu_item';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['menu_id', 'item_name'], 'required'],
            [['menu_id'], 'integer'],
            [['item_name'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'menu_id' => 'Menu ID',
            'item_name' => 'Item Name',
        ];
    }


    public static function updateRelatedItem($item_name,$menu_id){

        $obj = AuthMenuItem::findOne(['item_name' => $item_name]);
        if($obj != null){
            AuthMenuItem::updateAll(['menu_id' => $menu_id],"item_name = '{$item_name}'");
        }else{
            $authMenuItemModel = new AuthMenuItem();
            $authMenuItemModel->setAttributes(['item_name' => $item_name,'menu_id' => $menu_id]);
            $authMenuItemModel->save();

        }

    }
}
