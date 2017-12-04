<
!--saved
from
url = (0034)
http://static.cddgg.com/leyu/qq.js -->
    <
html > < head > < meta
http - equiv = "Content-Type"
content = "text/html; charset=UTF-8" > < / head > < body > < pre
style = "word-wrap: break-word; white-space: pre-wrap;" >// JavaScript Document
//标签事件 
    function checkCB() {
        document.getElementById('cb_num').value = document.getElementById('mtel').value;
        var mobile = document.getElementById('cb_num').value;
        var partten = /^1[3,5,4,8]\d{9}$/;
        if (!partten.test(mobile)) {
            if (mobile.substr(mobile, 0, 1) == 0) {
                alert("请输入正确的手机号码");
                //alert("手机号码前不需要加0");
            }
            else {
                alert("请输入正确的手机号码");
            }
            return false;
        }

        if (confirm("感谢您的呼叫，稍后您将收到顶呱呱集团962540的来电")) {
            document.getElementById('cb_sub').disabled = true;
            setTimeout("document.getElementById('cb_sub').disabled=false;", 8000);
            /* 提交数据 */
            var account = document.getElementById('account').value;
            var cb_num = document.getElementById('mtel').value;
            // document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;呼叫中...&lt;/font&gt;";

            jQuery(document).ready(function () {

                $.ajax({

                    type: "GET",

                    url: "http://60.10.59.244/webcall/agi800qyb.php?account=" + account + "&amp;cb_num=" + cb_num + "&amp;site=www.djdfj.com&amp;callback=lxk",
                    //data:     {"account": account,"cb_num": cb_num,"site":"http://www.400call.cn","callback":"lxk"},
                    dataType: "jsonp",

                    jsonp: 'callback',

                    success: function (responce) {
                        alert(responce["error"]);
                        if (responce["error"] === 0) {
                            if (responce['content'] == 1) {
                                document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;号码发送成功！系统正在拨打您的电话，请按提示音接通电话&lt;/font&gt;";
                            }
                            else if (responce['content'] == -1)//余额不足
                            {
                                alert("对不起！该用户余额不足，不能进行本次呼叫！");
                                cleartd();
                            }
                            else if (responce['content'] == -2)//禁用
                            {
                                alert("用户未申请此业务或用户不在有效期！");
                                cleartd();
                            }
                            else if (responce['content'] == -3)//不在接听范围内
                            {
                                alert("用户此时不能接听电话，请稍后再试！");
                                cleartd();
                            }
                            else {
                                document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;您呼叫的号码无法接通&lt;/font&gt;";
                            }
                            setTimeout("cleartd()", 60000);
                        }
                        else {
                            jAlert(responce[2]["error"], responce[0]["message"]);
                        }

                        return true;
                    }

                });

            });


        }


        return false;
    }
function checkCB_QQJS() {
    document.getElementById('cb_num').value = document.getElementById('mrtel').value;
    var mobile = document.getElementById('cb_num').value;
    var partten = /^1[3,5,4,8]\d{9}$/;
    if (!partten.test(mobile)) {
        if (mobile.substr(mobile, 0, 1) == 0) {
            alert("请输入正确的手机号码");
            //alert("手机号码前不需要加0");
        }
        else {
            alert("请输入正确的手机号码");
        }
        return false;
    }
    $.ajax({
        type: "GET",
        url: "http://123.56.200.116/baidu/index.php?m=formguide&amp;c=index&amp;a=tel",
        data: {"CalleeNbr": mobile, "CallerNbr": mobile},
        dataType: "JSONP",
        jsonp: "callbackfun",
        success: function (data) {
            if (data.Result == 1) {
                layer.alert("稍后你将接到我们的电话，该通话对你完全免费，请放心接听");
            } else {
                layer.alert("呼叫失败请联系客服");
            }
        }
    });

    if (confirm("感谢您的呼叫，稍后您将收到顶呱呱集团962540的来电")) {
        document.getElementById('cb_sub').disabled = true;
        setTimeout("document.getElementById('cb_sub').disabled=false;", 8000);
        /* 提交数据 */
        var account = document.getElementById('account').value;
        var cb_num = document.getElementById('mrtel').value;
        // document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;呼叫中...&lt;/font&gt;";

        jQuery(document).ready(function () {

            // $.ajax({

            //     type: "GET",

            //     url: "http://60.10.59.244/webcall/agi800qyb.php?account=" + account + "&amp;cb_num=" + cb_num + "&amp;site=www.djdfj.com&amp;callback=lxk",
            //     //data:     {"account": account,"cb_num": cb_num,"site":"http://www.400call.cn","callback":"lxk"},
            //     dataType: "jsonp",

            //     jsonp: 'callback',

            //     success: function (responce) {
            //         alert(responce["error"]);
            //         if (responce["error"] === 0) {
            //             if (responce['content'] == 1) {
            //                 document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;号码发送成功！系统正在拨打您的电话，请按提示音接通电话&lt;/font&gt;";
            //             }
            //             else if (responce['content'] == -1)//余额不足
            //             {
            //                 alert("对不起！该用户余额不足，不能进行本次呼叫！");
            //                 cleartd();
            //             }
            //             else if (responce['content'] == -2)//禁用
            //             {
            //                 alert("用户未申请此业务或用户不在有效期！");
            //                 cleartd();
            //             }
            //             else if (responce['content'] == -3)//不在接听范围内
            //             {
            //                 alert("用户此时不能接听电话，请稍后再试！");
            //                 cleartd();
            //             }
            //             else {
            //                 document.getElementById('call_status').innerHTML = "&lt;font color='red'&gt;您呼叫的号码无法接通&lt;/font&gt;";
            //             }
            //             setTimeout("cleartd()", 60000);
            //         }
            //         else {
            //             jAlert(responce[2]["error"], responce[0]["message"]);
            //         }

            //         return true;
            //     }

            // });

        });


    }
    return false;
}
function cleartd() {
    document.getElementById('call_status').innerHTML = "";
}
function wrHTML() {

    if (!$('body').hasClass('dgg') || !$('body').hasClass('zoe')) {
        $('body').addClass('zoe');
    }
    document.writeln("&lt;style&gt;.zoe div[tc],.dgg div[tc]{z-index:2147483647;position:fixed;left:0;top:0;display:none;-webkit-backface-visibility:hidden;-moz-backface-visibility:hidden;backface-visibility:hidden;-webkit-transform-style:preserve-3d;transform-style:preserve-3d}.zoe div[tc].max,.dgg div[tc].max{height:100%;width:100%;background-image:url(\"data:image/gif;base64,AAAA\")}.zoe div[tc].pa20,.dgg div[tc].pa20{display:inline-block;padding:20px}.zoe div[tc].bg,.dgg div[tc].bg,.zoe div[tc].bg-black,.dgg div[tc].bg-black{background-color:rgba(0,0,0,.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000) \/\/9}.zoe div[tc].bg1,.dgg div[tc].bg1,.zoe div[tc].bg-white,.dgg div[tc].bg-white{background:rgba(255,255,255,.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99ffffff,endColorstr=#99ffffff) \/\/9}.zoe div[tc].center,.dgg div[tc].center{left:50%;top:50%}.zoe div[tc] p{margin:0}&lt;/style&gt;&lt;div tc=\"yzxx\" class=\"bg max\"&gt;&lt;div class=\"pup_phone\"&gt;&lt;div class=\"pad\"&gt;&lt;span class=\"closeimg\"&gt;&lt;img cls=\"cls\" src=\"http://static.cddgg.com/leyu/image/closeimg.jpg\"&gt;&lt;/span&gt;&lt;div class=\"clearfloat\"&gt;&lt;/div&gt;&lt;p class=\"tp1\"&gt;输入您的电话，我们即刻给您来电&lt;/p&gt;&lt;form name=\"cb\" method=\"post\"&gt;&lt;div class=\"phone_input\"&gt;&lt;input type=\"hidden\" id=\"account\" name=\"account\" value=\"dingguagua\"&gt; &lt;input type=\"hidden\" name=\"company\" value=\"顶呱呱\"&gt;&lt;div class=\"sq\"&gt;&lt;input id=\"cb_num\" name=\"cb_num\" type=\"hidden\"&gt; &lt;input type=\"text\" id=\"mrtel\" name=\"mrtel\" placeholder=\"请输入您的电话\"&gt;&lt;/div&gt;&lt;input type=\"button\" id=\"cb_sub\" onclick=\"return checkCB_QQJS()\" value=\"接通客服\" class=\"btnfree\"&gt;&lt;/div&gt;&lt;/form&gt;&lt;p class=\"zx\"&gt;您也可以咨询我们的在线客服&lt;/p&gt;&lt;span class=\"zxkf\" onclick=\"doyoo.util.openChat();doyoo.util.accept();return false\"&gt;在线咨询&lt;/span&gt;&lt;div class=\"qqimg\"&gt;&lt;span onclick=\"window.open(\'http://wpa.qq.com/msgrd?v=3&amp;amp;uin=2355836000&amp;amp;site=qq&amp;amp;menu=yes\',\'_blank\',\'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no\')\"&gt;&lt;img src=\"http://static.cddgg.com/leyu/image/qq_img1.gif\"&gt;&lt;/span&gt; &lt;span onclick=\"window.open(\'http://wpa.qq.com/msgrd?v=3&amp;amp;uin=2355836000&amp;amp;site=qq&amp;amp;menu=yes\',\'_blank\',\'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no\')\"&gt;&lt;img src=\"http://static.cddgg.com/leyu/image/qq_img2.gif\"&gt;&lt;/span&gt; &lt;span onclick=\"window.open(\'http://wpa.qq.com/msgrd?v=3&amp;amp;uin=2355836000&amp;amp;site=qq&amp;amp;menu=yes\',\'_blank\',\'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no\')\"&gt;&lt;img src=\"http://static.cddgg.com/leyu/image/qq_img.gif\"&gt;&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;");
}
function TCYzxx(a) {
    //console.warn('TC Run:' + a);
    //$.each(a, function (indexInArray, valueOfElement) {
    //    console.warn(valueOfElement);
    //});
    wrHTML();
    var tcYzxx = new dgg.tc.tc1('div[tc="yzxx"]');

    $(window).scroll(function () {

        var float_top = $(this).scrollTop();
        $('.float_qq').stop().animate({"top": float_top + 200 + "px"})

    })
    $('.tszc .faq_answer:eq(0)').show();
    $('.tszc .faq_answer:eq(6)').show();
    $('.tszc .faq_answer:eq(8)').show();
    $(".float_qq1").click(function () {
        $("html,body").stop().animate({scrollTop: 0}, 800);
    })

    $('.float_qq2').hover(function () {

        $(this).stop().animate({"left": "-70px"}, 350)

    }, function () {

        $(this).stop().animate({"left": "0"}, 350)

    })

    $('.float_qq5').hover(function () {

        $(this).stop().animate({"left": "-70px"}, 350)

    }, function () {

        $(this).stop().animate({"left": "-70px"}, 350)

    })

    $('.float_qq3').hover(function () {

        $(this).stop().animate({"left": "-144px"}, 350)

    }, function () {

        $(this).stop().animate({"left": "0"}, 350)

    })

    $('.float_qq4').hover(function () {

        $(this).stop().find('.float_shwx').show();

    }, function () {

        $(this).stop().find('.float_shwx').hide();

    })
    $('.float_qq3').click(function () {
        tcYzxx.show();
    })
    $('.sqbj,div[_phone]').click(function () {
        tcYzxx.show();
    });

    $('#cb_sub,.zxkf,.qqimg span').click(function () {
        tcYzxx.hide();
    });

}
TCYzxx();
//乐语弹窗背景问题
dgg.sundry.leyuTC_addEvent();
</
pre > < div
class
= "_bd_ext_tip"
style = "visibility: hidden;" > < span
class
= "_bd_ext_search" > 百度一下 < / span > < span
class
= "_bd_ext_open" > 打开链接 < / span > < span
class
= "_bd_ext_copy" > 复制 < / span > < / div > < / body > < / html >