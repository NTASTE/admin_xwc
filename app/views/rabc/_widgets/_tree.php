
<div class="profile-contact-links align-left">
    <div  style="overflow: auto;height: 250px;" >
        <ul id="treeDemo" class="ztree"></ul>
    </div>

</div>

<link rel="stylesheet" href="/tools/zree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="/tools/zree_v3/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/tools/zree_v3/js/jquery.ztree.excheck.js"></script>
<SCRIPT type="text/javascript">
    (function() {
    <!--
    var $j = jQuery.noConflict();
    //    var zTreeObj;
    var setting = {
        check: {
            enable: true,
            chkStyle: "checkbox",
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            }
        },
        async: {
            enable: true,
            url:"<?=Yii::$app->urlManager->createUrl(['rabc/getres']); ?>",
//            autoParam:["id", "name=n", "level=lv"],
            otherParam:{
                "otherParam":"zTreeAsyncTest",
                '_csrf':'<?= Yii::$app->request->csrfToken ?>',
                'role' : $j("input[name='AuthItem[name]']").val()
            },
            dataFilter: filter
        },
        callback: {
//            beforeClick: beforeClick,
            onCheck: onCheck
        }
    };


    function onCheck(event, treeId, treeNode, clickFlag) {

        var _chkArr = new Array;
        var treeObj = $j.fn.zTree.getZTreeObj("treeDemo");
        var nodes = treeObj.getCheckedNodes(true);

        for(var i=0;i<nodes.length;i++){
            if(nodes[i].isParent == false){
                _chkArr.push(nodes[i].id);
            }
        }

        var nodestr = _chkArr.join(",");
        $("input[name='res_str']").val(nodestr);

//        alert(treeNode.tId + ", " + treeNode.id + "," + treeNode.checked);
    }


    function filter(treeId, parentNode, childNodes) {
        if (!childNodes) return null;
        for (var i=0, l=childNodes.length; i<l; i++) {
            childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
        }
        return childNodes;
    }




    $j(document).ready(function(){
        $j.fn.zTree.init($j("#treeDemo"), setting);
    });
    //-->

    function conv_str(treeNode) {
        if(treeNode.isParent){
            treeNode.children.forEach(function (value, index) {

            });


        }else{

        }
    }

    })(jQuery);
</SCRIPT>