<ul class="nav nav-pills nav-stacked custom-nav">


    <li class="menu-list <?php if($this->context->id == 'article'): ?>nav-active<?php endif;  ?>" ><a href=""><i class="fa fa-laptop"></i> <span>资讯管理</span></a>
        <ul class="sub-menu-list">
            <li <?php if($this->context->action->id == 'list'): ?>class="active"<?php endif;  ?> ><a href="<?= Yii::$app->urlManager->createUrl(['article/list'])?>">资讯列表</a></li>
            <li <?php if($this->context->action->id == 'create'): ?>class="active"<?php endif;  ?>><a href="<?= Yii::$app->urlManager->createUrl(['article/create'])?>">添加资讯</a></li>
        </ul>
    </li>


    <li class="menu-list <?php if($this->context->id == 'rabc'): ?>nav-active<?php endif;  ?>" ><a href=""><i class="fa fa-group"></i> <span>权限管理</span></a>
        <ul class="sub-menu-list">
            <li <?php if($this->context->action->id == 'ulist'): ?>class="active"<?php endif;  ?> ><a href="<?= Yii::$app->urlManager->createUrl(['rabc/ulist'])?>">用 户</a></li>
            <li <?php if($this->context->action->id == 'rlist'): ?>class="active"<?php endif;  ?>><a href="<?= Yii::$app->urlManager->createUrl(['rabc/rlist'])?>">角 色</a></li>
            <li <?php if($this->context->action->id == 'reslist'): ?>class="active"<?php endif;  ?>><a href="<?= Yii::$app->urlManager->createUrl(['rabc/reslist'])?>">资 源</a></li>
        </ul>
    </li>

    <!--                <li><a href="login.html"><i class="fa fa-sign-in"></i> <span>Login Page</span></a></li>-->
</ul>