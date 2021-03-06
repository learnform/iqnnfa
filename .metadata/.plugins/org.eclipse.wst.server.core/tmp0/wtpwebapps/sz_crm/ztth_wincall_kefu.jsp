<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>toolbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="js/bootstrap/css/font-awesome.min.css" rel="stylesheet" media="screen" />
</head>
<body>
<script src="js/bootstrap/js/jquery.js" ></script>
<script src="js/bootstrap/js/config.js" ></script>
<script src="js/bootstrap/js/jquery.wincall.js" ></script>
<script src="js/bootstrap/js/app.js" ></script>
<script src="js/bootstrap/js/bootstrap.min.js"></script>
<object  width="0" height="0" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" id="wincall" align="middle">
    <param name="allowScriptAccess" value ="always" />
    <param name="allowFullScreen" value="false" />
    <param name="movie" value="wincall400.swf" />
    <param name="quality" value="high" />
    <param name="bgcolor" value="#ffffff" />
    <embed src="wincall400sss.swf" width="0" height="0" id="wincall_emded"  quality="high" name="wincall" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="pull-left" id='toolbar'>
            <!-- #section:elements.button.app -->
            <button class="btn btn-info " id="ztth_login">
                <i class="fa fa-circle-o-notch  fa-1x" ></i><br/>
                <span id='ztth_login_value'>签入</span>
            </button>
            <button class="btn btn-default " id="ztth_unbusy" disabled="disabled">
                <i class="fa fa-slack fa-1x"></i><br/>
                置闲
            </button>
            <button class="btn btn-default" id="ztth_busy" disabled="disabled">
                <i class="fa fa-jsfiddle fa-1x"></i><br/>
                置忙
            </button>
            <button class="btn btn-default" id="ztth_callinner" disabled="disabled">
                <i class="fa fa-bomb fa-1x"></i><br/>
                内呼
            </button>
            <button class="btn btn-default" id="ztth_callouter" disabled="disabled" >
                <i class="fa fa-cube fa-1x"></i><br/>
                外呼
            </button>
            <button class="btn btn-default" id="ztth_hangup" disabled="disabled">
                <i class="fa fa-volume-off fa-1x"></i><br/>
                挂断
            </button>
            <button class="btn btn-default" id="ztth_hold" disabled="disabled">
                <i class="fa fa-pause fa-1x"></i><br/>
                <span id='ztth_hold_value'>保持</span>
            </button>
            <button class="btn btn-default" id="ztth_evaluation" disabled="disabled">
                <i class="fa fa-play fa-1x"></i><br/>
                满意度
            </button>
            <button class="btn btn-default" id="ztth_consultinner" disabled="disabled">
                <i class="fa fa-user fa-1x"></i><br/>
                咨询坐席
            </button>
            <button class="btn btn-default" id="ztth_consultouter" disabled="disabled">
                <i class="fa fa-phone fa-1x"></i><br/>
                咨询外线
            </button>
            <button class="btn btn-default" id="ztth_consultback" disabled="disabled">
                <i class="fa fa-reply fa-1x"></i><br/>
                咨询接回
            </button>
            <button class="btn btn-default" id="ztth_transfer" disabled="disabled">
                <i class="fa fa-random fa-1x"></i><br/>
                转接
            </button>
            <button class="btn btn-default" id="ztth_threeway" disabled="disabled">
                <i class="fa fa-group fa-1x"></i><br/>
                三方
            </button>
            <button class="btn btn-default" id="ztth_threewayback" disabled="disabled">
                <i class="fa fa-undo fa-1x"></i><br/>
                三方接回
            </button>
            <button class="btn btn-default" id="ztth_chanspy" disabled="disabled">
                <i class="fa fa-headphones fa-1x"></i><br/>
                监听
            </button>
            <button class="btn btn-default" id="ztth_breakin" disabled="disabled">
                <i class="fa fa-arrow-down fa-1x"></i><br/>
                强插
            </button>
			<button class="btn btn-default" id="ztth_intercept" disabled="disabled">
                <i class="fa fa-arrow-down fa-1x"></i><br/>
                拦截
            </button>
            <!-- /section:elements.button.app -->
        </div>
        <div class="pull-right">
            <span class="label">坐席状态：</span><span class="label label-success" id='ztth_seat_state' >未签入</span><br>
            <span class="label">队列状态：</span><span class="label label-success" id='ztth_queue_state'>未签入</span><br>
            <span><span id='ztth_phone_error' class="label label-important hide">电话注册失败</span></span>
        </div>
    </div>
    <div id="ztth_myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="ztth_myModalLabel">Modal header</h3>
        </div>
        <div class="modal-body" id='ztth_modal_content'>
            <p></p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true" id='ztth_btn_hidden'>关闭</button>
        </div>
    </div>
</div>
<!--内呼框--->
<div id="callinner_content" style="display:none">
 <form class="form-horizontal">
    <div class="control-group">
		<label class="control-label" for="agent_num" id="ztth_agent_num">坐席工号:</label>
		<div class="controls">
			<input type="text" id="ztth_pc_user_num" placeholder="" >
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="num_list" id="ztth_inner_number">主叫号码:</label>
		<div class="controls" id="ztth_num_list">
		
		</div>
	</div>
    <div class="control-group">
		<div class="controls">
			<button type="button" class="btn" id='ztth_pc_callinner_btn' onclick="innerCall()"> 呼叫</button>
			<input type="hidden" id="ztth_inner_agent_flag" value = "" />
		</div>
	</div>
    <div>
        <table class="table table-bordered" id='ztth_innerTable'>

        </table>
    </div>
 </form>
</div>
<!--外呼框--->
<div id="callout_content" style="display:none">
    <form class="form-horizontal">
        <div class="control-group">
            <label class="control-label" for="callouter_num" id="ztth_number_label">外呼号码:</label>
            <div class="controls">
                <input type="text" id="ztth_callouter_num" placeholder="" />
            </div>
        </div>
		<!--
        <div class="control-group" id="que_list_label">
            <label class="control-label" for="out_que_list" >选择技能组:</label>
            <div class="controls" id='out_que_list'>

            </div>
        </div>-->
        <div class="control-group">
            <label class="control-label" for="out_que_num">选择主叫号码:</label>
            <div class="controls" id='ztth_out_que_num'>

            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <button type="button" class="btn ztth_callouter_btn" id='ztth_callouter_btn' onclick="clickOutNumKefu()"> 呼叫</button>
                <input type="hidden" value="1" id="ztth_out_inner_flag" />
            </div>
        </div>
    </form>
</div>
<div id="ztth_chanspy_content" style="display:none">
    <div>
        <table class="table table-bordered" id='ztth_chanspyTable'>

        </table>
    </div>
</div>
<!--来电弹框--->
<div id="incoming_dialog" style="display:none">
    <div id="callin_number" style="color:red;font-size:25px;"></div>
    <div id="calling_loc"  style="color:red;font-size:25px;"></div>
    <button class="btn" data-dismiss="modal" aria-hidden="true" id='ztth_btn_jieting' onclick="ztthAnswer()">接听</button>
    <button class="btn" data-dismiss="modal" aria-hidden="true" id='ztth_btn_jujie' onclick="ztthReject()">拒接</button>
</div>

</body>
</html>