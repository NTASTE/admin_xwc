<?php
namespace app\controllers;

use app\components\CTools;
use app\components\XwcController;
use app\models\AuthAssignment;
use app\models\AuthItem;
use app\models\AuthItemChild;
use app\models\AuthMenu;
use app\models\AuthMenuItem;
use app\models\DyLog;
use Yii;
use app\models\User;
use yii\base\Exception;
use yii\data\Pagination;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * UserController implements the CRUD actions for User model.
 */
class RabcController extends XwcController
{
    public $topMenu = 'user';

    public function actionUlist()
    {

        $searchParams = Yii::$app->request->get('search');
        $query = User::find();
        $pages = new Pagination(['totalCount' => $query->count()]);
        $pages->setPageSize(15);

        if (!empty($searchParams['username'])) {
            $query->andWhere(['like', 'username', $searchParams['username']]);
        }

        $list = $query->orderBy(['id' => SORT_DESC])
            ->offset($pages->offset)
            ->limit($pages->limit)
            ->all();


        $roleModel = new User();
        $data['pages'] = $pages;
        $data['searchParams'] = $searchParams;
        $data['list'] = $list;
        $data['attrbutes'] = $roleModel->attributeLabels();
        return $this->render('ulist', $data);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionUcreate()
    {
        $userModel = new User();
        $userModel->scenario = 'create';
        if (Yii::$app->request->isPost) {
            try {
                if ($userModel->load(Yii::$app->request->post()) && $userModel->save()) {
                    #角色权限
                    AuthAssignment::saveUsers(Yii::$app->request->post('roles'), $userModel->id);
                    Yii::$app->getSession()->setFlash('success', '保存成功');
                    return $this->redictPage(Yii::$app->urlManager->createUrl(['rabc/ulist']));
                } else {
                    #抛出异常
                    throw new Exception (CTools::recursiveMultiArray($userModel->errors));
                }
            } catch (Exception $e) {
                #捕获抛出的异�?
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
                return $this->redictPage(Yii::$app->request->referrer);
            }


        }
        $roleModels = AuthItem::find()->where(['type' => 1])->all();
        $data['roleModels'] = $roleModels;
        $data['userModel'] = $userModel;
        $data['attrbutes'] = $userModel->attributeLabels();
        return $this->render('ucreate', $data);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUedit($id = 0)
    {

        $id = empty($id) ? Yii::$app->request->post('id') : $id;

        $userModel = $this->findModel($id);


        if ($userModel['username'] == 'admin' && Yii::$app->getUser()->identity->attributes['username'] != 'admin') {
            throw new ForbiddenHttpException("无操作权限");
        }

        $userModel->scenario = 'update';
        $userModel->password = '';
        if (Yii::$app->request->isPost) {
            try {
                if ($userModel->load(Yii::$app->request->post()) && $userModel->save()) {
                    #角色权限
                    AuthAssignment::saveUsers(Yii::$app->request->post('roles'), $id);
                    Yii::$app->getSession()->setFlash('success', '保存成功');
                    return $this->redictPage(Yii::$app->request->referrer);
                } else {
                    #抛出异常
                    throw new Exception (CTools::recursiveMultiArray($userModel->errors));
                }
            } catch (Exception $e) {
                #捕获抛出的异�?
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
                return $this->redictPage(Yii::$app->request->referrer);
            }

        }


        $roleModels = AuthItem::find()->where(['type' => 1])->all();
        $data['roleModels'] = $roleModels;
        $data['roleNames'] = AuthAssignment::getRoleNamesByUserId($id);
        $data['userModel'] = $userModel;
        $data['logs'] = DyLog::getLogs('user', $id);
        $data['attrbutes'] = $userModel->attributeLabels();
        return $this->render('ucreate', $data);
    }


    /**
     * 删除用户
     * @param $id
     * @return string|\yii\web\Response
     */
    public function actionUdel($id)
    {
        $res = User::updateAll(['status' => User::STATUS_DELETED],['id' => $id]);


        if ($res == 1) {
            Yii::$app->getSession()->setFlash('success', '删除成功');
        } else {
            Yii::$app->getSession()->setFlash('error', '删除失败');
        }
        return $this->redictPage(Yii::$app->request->referrer);
    }
    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }


    public function actionRlist()
    {

        $query = AuthItem::find()->where(['type' => 1]);

        $pages = new Pagination(['totalCount' => $query->count()]);
        $pages->setPageSize(15);

        if (!empty($searchParams['username'])) {
            $query->andWhere(['like', 'username', $searchParams['username']]);
        }
        $list = $query
            ->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        $roleModel = new AuthItem();
        $data['attrbutes'] = $roleModel->attributeLabels();
        $data['list'] = $list;
        $data['pages'] = $pages;
        return $this->render('rlist', $data);

    }

    public function actionRcreate()
    {
        $model = new AuthItem();
        if (Yii::$app->request->isPost) {
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    #角色权限
                    AuthAssignment::saveRes(Yii::$app->request->post('res_str'), $model);
                    return $this->redirect(['rabc/rlist']);
                }
            } catch (Exception $e) {
                #捕获抛出的异�?
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
            }


        }
        $roleModels = AuthItem::find()->where(['type' => 1])->all();
        $data['roleModels'] = $roleModels;
        $data['model'] = $model;
        $data['attrbutes'] = $model->attributeLabels();
        return $this->render('rcreate', $data);
    }


    public function actionRedit($name = '')
    {
        $name = empty($name) ? Yii::$app->request->post('name') : $name;

        if ($name == 'admin' && Yii::$app->getUser()->identity->attributes['username'] != 'admin') {
            throw new ForbiddenHttpException("无操作权限");
        }

        $model = AuthItem::findOne(['name' => $name]);

        if (Yii::$app->request->isPost) {
            try {
                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    #角色权限
                    AuthAssignment::saveRes(Yii::$app->request->post('res_str'), $model);
                    return $this->redirect(['rabc/rlist']);
                }
            } catch (Exception $e) {
                #捕获抛出的异�?
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
            }


        }
        $res_str = AuthAssignment::getRes($name);
        $data['res_str'] = $res_str;
        $data['model'] = $model;
        $data['attrbutes'] = $model->attributeLabels();
        return $this->render('rcreate', $data);
    }



    /**
     * 角色删除
     * @param $name
     * @return string
     */
    public function actionRdel($name)
    {
        $res = AuthItem::deleteAll(['name' => $name,'type' => 1]);
        AuthAssignment::deleteAll(['item_name' => $name]);

        if ($res == 1) {
            Yii::$app->getSession()->setFlash('success', '删除成功');
        } else {
            Yii::$app->getSession()->setFlash('error', '删除失败');
        }
        return $this->redictPage(Yii::$app->request->referrer);
    }


    /**
     * 资源列表
     * @return string
     */
    public function actionReslist()
    {

        $query = AuthItem::find()->where(['type' => 2]);

        $pages = new Pagination(['totalCount' => $query->count()]);
        $pages->setPageSize(15);

        if (!empty($searchParams['username'])) {
            $query->andWhere(['like', 'username', $searchParams['username']]);
        }
        $list = $query
            ->offset($pages->offset)
            ->limit($pages->limit)
            ->orderBy(['name' => SORT_ASC])
            ->all();

        $roleModel = new AuthItem();
        $data['attrbutes'] = $roleModel->attributeLabels();
        $data['list'] = $list;
        $data['pages'] = $pages;
        return $this->render('reslist', $data);

    }

    /**
     * 新建资源
     * @return string
     */
    public function actionRescreate()
    {
        $model = new AuthItem();


        if (Yii::$app->request->isPost) {
            try {
                if (empty(Yii::$app->request->post('menu_id'))) {
                    throw new Exception("未选择所属菜单");
                }

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    #保存和菜单对应关系
                    AuthMenuItem::updateRelatedItem($model->name, Yii::$app->request->post('menu_id'));

                    Yii::$app->getSession()->setFlash('success', '保存成功');
                    return $this->redictPage(Yii::$app->urlManager->createUrl(['rabc/reslist']));

                } else {
                    #抛出异常
                    throw new Exception (CTools::recursiveMultiArray($model->errors));
                }
            } catch (Exception $e) {
                #捕获抛出的异�?
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
                return $this->redictPage(Yii::$app->request->referrer);
            }


        }


        $data['model'] = $model;
        $data['attrbutes'] = $model->attributeLabels();
        return $this->render('res_create', $data);
    }


    /**
     * 编辑资源
     * @param string $name
     * @return string
     */
    public function actionResedit($name = '')
    {

        $name = empty($name) ? Yii::$app->request->post('name') : $name;

        $model = AuthItem::findOne(['name' => $name]);


        if (Yii::$app->request->isPost) {
            try {
                if (empty(Yii::$app->request->post('menu_id'))) {
                    throw new Exception("未选择所属菜单");
                }

                if ($model->load(Yii::$app->request->post()) && $model->save()) {
                    #保存和菜单对应关系
                    AuthMenuItem::updateRelatedItem($model->name, Yii::$app->request->post('menu_id'));
                    Yii::$app->getSession()->setFlash('success', '保存成功');
                    return $this->redictPage(Yii::$app->request->referrer);
                } else {
                    #抛出异常
                    throw new Exception (CTools::recursiveMultiArray($model->errors));
                }
            } catch (Exception $e) {
                Yii::$app->getSession()->setFlash('error', $e->getMessage());
                return $this->redictPage(Yii::$app->request->referrer);
            }


        }

        $menuModel = AuthMenuItem::findOne(['item_name' => $name]);
        $data['menuModel'] = $menuModel;
        $data['model'] = $model;
        $data['attrbutes'] = $model->attributeLabels();
        $data['logs'] = DyLog::getLogs('auth_item',$name);
        return $this->render('res_create', $data);
    }


    /**
     * 资源删除
     * @param $name
     * @return string
     */
    public function actionResdel($name)
    {
        $res = AuthItem::deleteAll(['name' => $name,'type'=>2]);
        AuthMenuItem::deleteAll(['item_name' => $name]);
        AuthItemChild::deleteAll(['child' => $name]);
        if ($res == 1) {
            Yii::$app->getSession()->setFlash('success', '删除成功');
        } else {
            Yii::$app->getSession()->setFlash('error', '删除失败');
        }
        return $this->redictPage(Yii::$app->request->referrer);
    }


    /**
     * 获取权限树状数据
     */
    public function actionGetres()
    {

        $name = Yii::$app->request->post('role');
        $menus = AuthMenu::find()->orderBy(['sort' => SORT_DESC])->all();

        $list = [];
        $listKeys = [];
        foreach ($menus as $menu) {
            $listKeys[] = $menu['name'];
            $list[] = [
                'id' => $menu['id'],
                'name' => $menu['name'],
                'pId' => 0,
                'open' => true
            ];

            if ($menu->items) {
                foreach ($menu->items as $res) {
                    $listKeys[] = $res['name'];
                    $list[] = [
                        'id' => $res['name'],
                        'name' => $res['description'],
                        'pId' => $menu['id'],
                        'open' => true,
//						'checked' => true
                    ];
                }


            }

        }

        if (!empty($name)) {
            $auth = Yii::$app->authManager;
            $resList = $auth->getPermissionsByRole($name);
            if ($resList) {
                foreach ($resList as $key => $v) {
                    $index = array_search($v->name, $listKeys);
                    if ((false != $index)) {
                        $list[$index]['checked'] = true;
                    }

                }
            }

        }


        echo json_encode($list);
        exit;


    }


}
