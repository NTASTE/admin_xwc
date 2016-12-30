<?php
/**
 * Created by PhpStorm.
 * User: gaojiyong
 * Date: 2015/12/22
 * Time: 17:38
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\widgets\EditorWidget;
use app\components\widgets\FileuploadWidget;
use app\components\widgets\ImguploadWidget;
$this->params['breadcrumbs'][] = ['label' => '用户管理', 'url' => ['ulist'] ];
$this->params['breadcrumbs'][] =  $projectModel->isNewRecord ? '添加用户' : '编辑用户';

?>
<?php if($projectModel->isNewRecord): ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/ucreate'],'method'=>'post', 'options' => ['enctype' => 'multipart/form-data']]); ?>
<?php else: ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/uedit'],'method'=>'post','options' => ['enctype' => 'multipart/form-data']]); ?>
<?php endif; ?>
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <section class="panel">
            <div class="panel-body">
                    <?= $form->field($userModel, 'username')->textInput(['maxlength' => 255]) ?>
                <?= $form->field($userModel, 'nickname')->textInput(['maxlength' => 255]) ?>
                    <?= $form->field($userModel, 'password')->passwordInput(['maxlength' => 255]) ?>
                <?= $form->field($userModel, 'email')->textInput(['maxlength' => 255]) ?>

                <div class="form-group">
                    <?=Html::label("所属角色");?>
                    <?= Html::checkboxList('roles', empty($roleNames)? []:$roleNames, \yii\helpers\ArrayHelper::map($roleModels, 'name', 'description')) ?>
                </div>


                <div class="form-group">
                    <?php if(!$userModel->isNewRecord): ?>
                        <?=Html::hiddenInput('id',$userModel['id']); ?>
                    <?php endif; ?>
                    <?= Html::submitButton("<i class='icon-ok bigger-110'></i>保存", ['class'=>'btn btn-info btn-sm','name' =>'submit-button']) ?>
                    &nbsp;
                    <?= Html::resetButton("<i class='icon-undo bigger-110'></i>重置", ['class'=>'btn  btn-info btn-sm','name' =>'submit-button']) ?>
                </div>


            </div>
        </section>
    </div>



</div>
<?php ActiveForm::end(); ?>

</div>



