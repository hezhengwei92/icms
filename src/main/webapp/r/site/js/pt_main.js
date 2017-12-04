<
!--saved
from
url = (0044)
http://www.cddgg.net/static/v2/js/pt_main.js -->
    <
html > < head > < meta
http - equiv = "Content-Type"
content = "text/html; charset=GBK" > < / head > < body > < pre
style = "word-wrap: break-word; white-space: pre-wrap;" > $(function () {

        /*js存放�&#65533;*/
        $("#sc_txt1").Slide({
            effect: "scroolTxt",
            autoPlay: true,
            speed: "normal",
            timer: 3000,
            steps: 2
        })
        $("#pt_txt").Slide({
            effect: "scroolTxt",
            autoPlay: true,
            speed: "normal",
            timer: 3000,
            steps: 1
        })
        /*$("#ch-anli").Slide({
         effect: "scroolLoop",
         autoPlay: true,
         speed: "normal",
         timer: 3000,
         steps: 1
         })*/
        $("#tem_top_gw").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 4000
        })
        $("#tem_rgw1").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 4000
        })
        $("#tem_pic").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#tem_rgw2").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#pt_pic").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#tem_rgw").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })

        //默认选项卡切�&#65533; 首页分类
        $(".tab_class").tabso({
            cntSelect: ".tab_class_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        //默认选项卡切�&#65533; 顾问
        $(".tab_gw").tabso({
            cntSelect: ".tab_gw_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        //默认选项卡切�&#65533;
        $(".tab_ra").tabso({
            cntSelect: ".tab_ra_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        /*$(".tab_gwm").tabso({
         cntSelect: ".tab_gwm_box",
         tabEvent: "mouseover",
         tabStyle: "normal"
         });*/
        $(".tab_tw").tabso({
            cntSelect: ".tab_tw_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        $(".tab_tw1").tabso({
            cntSelect: ".tab_tw1_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        $(".tab_tw2").tabso({
            cntSelect: ".tab_tw2_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        $(".tab_qa").tabso({
            cntSelect: ".tab_qa_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        //默认选项卡切�&#65533; 底部
        $(".tab_foot").tabso({
            cntSelect: ".tab_foot_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        //找服�&#65533;
        $(".tab_service").tabso({
            cntSelect: ".tab_service_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        $(".ui-cat").tabso({
            cntSelect: ".ui-top",
            tabEvent: "mouseover",
            tabStyle: "normal",
            tabEvent: "click"
        });

        /*$("#Inquire_t").tabso({
         cntSelect: "#Inquire_c",
         tabEvent: "mouseover",
         tabStyle: "normal"
         });*/

        $("#more_gw").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })

        //上下滑动选项卡切�&#65533;
        $(".q").tabso({
            cntSelect: ".qq",
            tabEvent: "mouseover",
            tabStyle: "move-animate",
            direction: "top"
        });
        /*微信*/
        $('.wx').hover(function () {
            $(this).find('.wx_img').stop().slideDown();
        }, function () {
            $(this).find('.wx_img').stop().slideUp();
        })
        //搜索框弹出选项
        $('#j-header-searchwrap').hover(function () {
            $(this).find('.ui-dropdown-menu').show();
            $(this).addClass('hover');
        }, function () {
            $(this).find('.ui-dropdown-menu').hide();
            $(this).removeClass('hover');
        })
        /*dl hover*/
        $('.cate-box .bd .list dl').hover(function () {
            $(this).addClass('dhover')
        }, function () {
            $(this).removeClass('dhover')
        })
        //导航文字添加背景
        $('#header .menu .p').hover(function () {
            $(this).addClass('phover');
        }, function () {
            $(this).removeClass('phover')
        })
        //内页导航内容显示
        $('#header .menu .p').find('.ui-banner').hide();
        $('#header .menu .p').hover(function () {
            $(this).find('.ui-banner').show();
        }, function () {
            $(this).find('.ui-banner').hide();
        })
        //顶呱呱结�&#65533;
        if ($('.ibox0').length &gt; 0) {
            var detail = $('.ibox0 .detail');
            $('.ibox0 .more-btn').click(function (e) {
                e.preventDefault();
                if ($(this).hasClass('opened')) {
                    detail.slideUp(600);
                    $(this).removeClass('opened');
                } else {
                    detail.slideDown(600);
                    $(this).addClass('opened');
                }
            })
        }
        $('.find .guwen-list li').hover(function () {
            $(this).addClass('li_hover');
        }, function () {
            $(this).removeClass('li_hover')
        })
        $('.find .gw-other-list li').hover(function () {
            $(this).addClass('li_hover');
        }, function () {
            $(this).removeClass('li_hover')
        })
        $('.ui-dropdown .ui-dropdown-menu li').click(function () {
            var value = $(this).find('a').html();
            $('#j-header-searchlabel').html(value);
            $('#j_header_search_type').val(value);
            $(this).parent().hide();

        })
        $('.xlb').hover(function () {
            $(this).addClass('sxl');
            $(this).find('.hul').stop().slideDown();
        }, function () {
            $(this).find('.hul').stop().slideUp();
            $(this).removeClass('sxl');
        })

        $('.gw_info p .txtm').hide();
        $('.gw_info .scly .show-m').click(function () {
            var txt = $('.gw_info p .txtm').css('display');
            if (txt == 'none') {
                $(this).addClass('opended')
                $(this).html('收起&lt;span class="bb"&gt;&lt;/span&gt;');
                $(this).prev('.txt').find('.txtm').show();
                $(this).prev('.txt').find('.slh').hide();
            } else {
                $(this).removeClass('opended')
                $(this).html('更多&lt;span class="bb"&gt;&lt;/span&gt;');
                $(this).prev('.txt').find('.txtm').hide();
                $(this).prev('.txt').find('.slh').show();
            }
        });
        $('.gw_info p .txt-m').hide();
        $('.gw_info .pla .show-m').click(function () {
            var txt = $('.gw_info p .txt-m').css('display');
            if (txt == 'none') {
                $(this).addClass('opended')
                $(this).html('收起&lt;span class="bb"&gt;&lt;/span&gt;');
                $(this).prev('.txt').find('.txtm').show();
                $(this).prev('.txt').find('.slh').hide();
                $(this).prev('.txt').find('.mys').hide();
                $(this).parents().find('.pla').addClass('plah');
            } else {
                $(this).removeClass('opended')
                $(this).html('更多&lt;span class="bb"&gt;&lt;/span&gt;');
                $(this).prev('.txt').find('.txtm').hide();
                $(this).prev('.txt').find('.slh').show();
                $(this).prev('.txt').find('.mys').show();
                $(this).parents().find('.pla').removeClass('plah');
            }
        })
        //服务浮动
        $('.service_type li:eq(0)').addClass('li_cur');
        $('.service_type li:eq(0)').find('.children').show();
        $('.service_type li:eq(0)').find('.children').find('li:eq(0)').addClass('c_cur');
        $('.service_type li:eq(0)').find('.children').find('.children1').show();
        $('.service_type li').click(function () {
            $('.service_type li').find('.children').hide();
            if ($(this).hasClass('li_cur')) {
                $(this).removeClass('li_cur');
                $(this).children('.children').hide();
            } else {
                $('.service_type li').removeClass('li_cur');
                $(this).addClass('li_cur');
                $(this).children('.children').show();

            }
        })
        $('.children li').click(function () {
            $('.children li').find('.children1').hide();
            if ($(this).hasClass('c_cur')) {
                $(this).removeClass('c_cur');
                $(this).children('.children1').hide();

            } else {
                $('.children li').removeClass('c_cur');
                $(this).addClass('c_cur');
                $(this).children('.children1').show();


            }
        })
        //开关服务浮�&#65533;
        $('.float_left .right_box').click(function () {
            var rh = $('.float_left .left_box');
            if (!rh.hasClass('rh')) {
                rh.addClass('rh');
                rh.hide();
                $(this).css('left', "0");
                $(this).find('p').html('展开')
                $(this).find('.btn').html('+')
            } else {
                rh.addClass('rh').removeClass('rh')
                rh.show();
                $(this).css('left', "205px")
                $(this).find('p').html('收起')
                $(this).find('.btn').html('-')

            }
        })

        //case
        if ($('.other-list').length &gt; 0) {
            var detail = $('.other-list .case_info');
            $('.other-list .case-btn').click(function (e) {
                e.preventDefault();
                if ($(this).hasClass('opened')) {
                    detail.slideUp(600);
                    $(this).removeClass('opened');
                } else {
                    detail.slideDown(600);
                    $(this).addClass('opened');
                }
            })
        }
        if ($('.other_dt').length &gt; 0) {
            var detail = $('.other_dt .case_info');
            $('.other_dt .case-btn').click(function (e) {
                e.preventDefault();
                if ($(this).hasClass('opened')) {
                    detail.slideUp(600);
                    $(this).html("查看问答")
                    $(this).removeClass('opened');
                } else {
                    detail.slideDown(600);
                    $(this).html("关闭问答")
                    $(this).addClass('opened');
                }
            })
        }
        $('.publicbox').hide();
        $('.public').hover(function () {
            $(this).find('.publicbox').show();
        }, function () {
            $(this).find('.publicbox').hide();
        })
        //分类
        $('.fenlei span.shoud').click(function (e) {
            $(this).next('.classf').toggle()
            $('body').click(function () {
                $('.classf').hide();

            })
            e.stopPropagation();
        })
        $('.fenlei div:eq(0) a').click(function () {
            $(this).parents('.fenlei').children('span:eq(0)').children('em').html($(this).html());
        });
        //tiwen dl hover
        $('.questions .tab_qa_box dl').hover(function () {
            $(this).addClass('dhover');
        }, function () {
            $(this).removeClass('dhover');
        })
        //steps
        $('.fr_wrap5 .two').hide();
        $('.fr_wrap5 .three').hide();
        $('.fr_wrap5 .step1_box .next_step').click(function () {
            $(this).parents('.fr_wrap5').find('.one').hide();
            $(this).parents('.fr_wrap5').find('.three').hide();
            $(this).parents('.fr_wrap5').find('.two').show();
        })
        $('.fr_wrap5 .step2_box .prev_step').click(function () {
            $(this).parents('.fr_wrap5').find('.one').show();
            $(this).parents('.fr_wrap5').find('.three').hide();
            $(this).parents('.fr_wrap5').find('.two').hide();
        })
        $('.fr_wrap5 .step2_box .next_step').click(function () {
            $(this).parents('.fr_wrap5').find('.one').hide();
            $(this).parents('.fr_wrap5').find('.three').show();
            $(this).parents('.fr_wrap5').find('.two').hide();
        })
        $('.fr_wrap5 .step3_box .prev_step').click(function () {
            $(this).parents('.fr_wrap5').find('.one').hide();
            $(this).parents('.fr_wrap5').find('.three').hide();
            $(this).parents('.fr_wrap5').find('.two').show();
        })
    })
//倒计�&#65533;
$(function () {
    updateEndTime();
});
//倒计时函�&#65533;
function updateEndTime() {
    var date = new Date();
    var time = date.getTime();  //当前时间�&#65533;1970�&#65533;1�&#65533;1日之间的毫秒�&#65533;

    $(".settime").each(function (i) {

        var endDate = this.getAttribute("endTime"); //结束时间字符�&#65533;
        //转换为时间日期类�&#65533;
        var endDate1 = eval('new Date(' + endDate.replace(/\d+(?=-[^-]+$)/, function (a) {
                return parseInt(a, 10) - 1;
            }).match(/\d+/g) + ')');

        var endTime = endDate1.getTime(); //结束时间毫秒�&#65533;

        var lag = (endTime - time) / 1000; //当前时间和结束时间之间的秒数
        if (lag &gt; 0) {
            var second = Math.floor(lag % 60);
            var minite = Math.floor((lag / 60) % 60);
            var hour = Math.floor((lag / 3600) % 24);
            var day = Math.floor((lag / 3600) / 24);
            $(this).html(day + "�&#65533;" + hour + "小时" + minite + "�&#65533;" + second + "�&#65533;");
        }
        else
            $(this).html("团购已经结束啦！");
    });
    setTimeout("updateEndTime()", 1000);
}
//placeholder
$(function () {
    //判断浏览器是否支持placeholder属�&#65533;
    supportPlaceholder = 'placeholder' in document.createElement('input'),
        placeholder = function (input) {
            var text = input.attr('placeholder'),
                defaultValue = input.defaultValue;
            if (!defaultValue) {
                input.val(text).addClass("phcolor");
            }
            input.focus(function () {
                if (input.val() == text) {
                    $(this).val("");
                }
            });
            input.blur(function () {
                if (input.val() == "") {
                    $(this).val(text).addClass("phcolor");
                }
            });
//输入的字符不为灰�&#65533;
            input.keydown(function () {
                $(this).removeClass("phcolor");
            });
        };
    //当浏览器不支持placeholder属性时，调用placeholder函数
    if (!supportPlaceholder) {
        $('input').each(function () {
            text = $(this).attr("placeholder");
            if ($(this).attr("type") == "text") {
                placeholder($(this));
            }
        });
    }
});


</
pre > < div
class
= "_bd_ext_tip"
style = "visibility: hidden;" > < span
class
= "_bd_ext_search" >
�
ٶ
�
һ
��</
span > < span
class
= "_bd_ext_open" >
������</
span > < span
class
= "_bd_ext_copy" >
����</
span > < / div > < / body > < / html >