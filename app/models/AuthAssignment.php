<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "auth_assignment".
 *
 * @property string $item_name
 * @property string $user_id
 * @property integer $created_at
 *
 * @property AuthItem $itemName
 */
class AuthAssignment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'auth_assignment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item_name', 'user_id'], 'required'],
            [['created_at'], 'integer'],
            [['item_name', 'user_id'], 'string', 'max' => 64]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'item_name' => 'Item Name',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItemName()
    {
        return $this->hasOne(AuthItem::className(), ['name' => 'item_name']);
    }

    /**
     * 获取
     * @param $id
     * @return array
     */
    public static function getRoleNamesByUserId($uid){
        $auth = Yii::$app->authManager;
        $authAssignment = $auth->getRolesByUser($uid);
        $roleNames = array_map(function($obj){
            return $obj->name;
        },$authAssignment);

        return $roleNames;
    }


    /**
     * 获取
     * @param $id
     * @return array
     */
    public static function getRoleDescByUserId($uid){
        $auth = Yii::$app->authManager;
        $authAssignment = $auth->getRolesByUser($uid);
        $roleNames = array_map(function($obj){
            return $obj->name;
        },$authAssignment);

        return $roleNames;
    }


    public static function saveUsers($roles,$uid){
        $auth = Yii::$app->authManager;
        $auth->revokeAll($uid);
        if(!empty($roles)){
            #废除所有角色
            foreach($roles as $role){
                $roleObj = $auth->createRole($role);
                $auth->assign($roleObj, $uid);
            }
        }

    }


    /**
     * 保存角色下的权限
     * @param $roles
     * @param $uid
     */
    public static function saveRes($res,$role){


        if(!empty($res)){
            $resList= explode(',',$res);
            array_filter($resList);
        }
        AuthItemChild::deleteAll(['parent' => $role['name']]);



        if(isset($resList)&& $resList){


            $auth = Yii::$app->authManager;

            // 角色新建
            if(null == ($author = $auth->getRole($role['name']))){
                $author = $auth->createRole($role['name']);
                $auth->add($author);
            }
            #角色所属权限列表
            $permissList = $auth->getPermissionsByRole($role['name']);

            foreach($resList as $res){
                if(array_key_exists($res,$permissList)){
                    continue;
                }else{
                    #资源新建
                    if(null == ($resPermission = $auth->getPermission($res))){
                        $resPermission = $auth->createPermission($res);
                        $resPermission->description = $role['description'];
                        $auth->add($resPermission);
                    }

                    $auth->addChild($author, $resPermission);
                }
            }






        }


//        if($roles){
//            #废除所有角色
//            $auth->revokeAll($uid);
//            foreach($roles as $role){
//                $roleObj = $auth->createRole($role);
//                $auth->assign($roleObj, $uid);
//            }
//        }

    }


    /**
     * 获取角色下的权限
     * @param $roles
     * @param $uid
     */
    public static function getRes($role){
        $auth = Yii::$app->authManager;
        $list = $auth->getPermissionsByRole($role);
        $newList = [];
        if($list){
            foreach($list as $item){
                $newList[] = $item->name;
            }
        }

        return empty($newList) ? "": implode(',',$newList);
    }

}
