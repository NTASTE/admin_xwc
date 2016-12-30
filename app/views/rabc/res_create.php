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

$this->params['breadcrumbs'][] = ['label' => '资源', 'url' => ['reslist']];
$this->params['breadcrumbs'][] = $model->isNewRecord ? '新增资源' : '编辑资源';


?>

<?php if ($model->isNewRecord): ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/rescreate'], 'method' => 'post', 'options' => ['enctype' => 'multipart/form-data']]); ?>
<?php else: ?>
    <?php $form = ActiveForm::begin(['action' => ['rabc/resedit'], 'method' => 'post', 'options' => ['enctype' => 'multipart/form-data']]); ?>
<?php endif; ?>

<div class="row">
    <div class="col-xs-12">
        <section class="panel">
            <div class="panel-body">
                <?= $form->field($model, 'name')->textInput(['maxlength' => 255]) ?>

                <?= $form->field($model, 'description')->textInput(['maxlength' => 255]) ?>

                <div class="form-group ">
                    <?php echo Html::DropDownList('menu_id', empty($menuModel) ? 0 : $menuModel['menu_id'], \app\models\AuthMenu::getMenus(), ['prompt' => '--请选择所属菜单--', 'class' => 'form-control m-bot15']); ?>
                </div>
                <div class="form-group">
                    <?= Html::hiddenInput('AuthItem[type]', 2); ?>
                    <?php if (!$model->isNewRecord): ?>
                        <?= Html::hiddenInput('name', $model['name']); ?>
                    <?php endif; ?>
                    <?= Html::submitButton("<i class='icon-ok bigger-110'></i>保存", ['class' => 'btn btn-primary', 'name' => 'submit-button']) ?>
                    &nbsp;
                    <?= Html::resetButton("<i class='icon-undo bigger-110'></i>重置", ['class' => 'btn  btn-primary', 'name' => 'submit-button']) ?>
                </div>


            </div>
        </section>
    </div>


</div>
<?php ActiveForm::end(); ?>


<?php if (!$model->isNewRecord): ?>
    <div class="row">

        <div class="col-md-12">
            <div class="panel">
                <header class="panel-heading">
                    操作日志
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                             </span>
                </header>
                <div class="panel-body">
                    <ul class="goal-progress">
                        <?php if (!empty($logs)): ?>
                            <?php foreach ($logs as $log): ?>
                                <li style="padding-bottom: 0;margin-bottom: 0;">
                                    <div class="prog-avatar">
                                        <span class="label label-default"><?= $log['username']; ?></span><br/>
<span class="label label-success">
    <?php if ($log['action'] == 0): ?>添加<?php endif; ?>
    <?php if ($log['action'] == 1): ?>修改<?php endif; ?>
</span>

                                    </div>
                                    <div class="details">
                                        <div class="highlight">
                                            <pre><code class="html"><?= $log['odata']; ?></code></pre>
                                        </div>
                                    </div>
                                </li>

                            <?php endforeach; ?>
                        <?php endif; ?>
                    </ul>
                    <div class="text-center"><a href="#">查看全部(未开发)</a></div>
                </div>
            </div>
        </div>
    </div>

<?php endif; ?>






