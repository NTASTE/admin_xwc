<?php
/**
 * Created by PhpStorm.
 * User: gaojiyong
 * Date: 2015/12/22
 * Time: 17:38
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\widgets\FileuploadWidget;
$this->params['breadcrumbs'][] = ['label' => '角色管理', 'url' => ['rlist'] ];
$this->params['breadcrumbs'][] =  $model->isNewRecord ? '新增角色' : '编辑角色';



?>



<?php if($model->isNewRecord): ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/rcreate'],'method'=>'post', 'options' => ['enctype' => 'multipart/form-data']]); ?>
<?php else: ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/redit'],'method'=>'post','options' => ['enctype' => 'multipart/form-data']]); ?>
<?php endif; ?>

<div class="row">
    <div class="col-xs-12">
        <section class="panel">
            <div class="panel-body">
                <?= $form->field($model, 'name')->textInput(['maxlength' => 255]) ?>
                <?= $form->field($model, 'description')->textInput(['maxlength' => 255]) ?>

                <div class="form-group">
                    <header class="panel-heading">资源列表</header>
                    <?php echo  $this->render('_widgets/_tree'); ?>
                    <header class="panel-heading"></header>
                </div>


                <div class="form-group">
                    <?=Html::hiddenInput('AuthItem[type]',1); ?>
                    <?=Html::hiddenInput('res_str',empty($res_str) ? "":$res_str); ?>
                    <?php if(!$model->isNewRecord): ?>
                        <?=Html::hiddenInput('name',$model['name']); ?>
                    <?php endif; ?>
                    <?= Html::submitButton("<i class='icon-ok bigger-110'></i>保存", ['class'=>'btn btn-primary','name' =>'submit-button']) ?>
                    &nbsp;
                    <?= Html::resetButton("<i class='icon-undo bigger-110'></i>重置", ['class'=>'btn  btn-primary','name' =>'submit-button']) ?>
                </div>


            </div>
        </section>
    </div>



</div>
<?php ActiveForm::end(); ?>

</div>






