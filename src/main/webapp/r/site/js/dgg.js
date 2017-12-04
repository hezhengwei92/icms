<
!--saved
from
url = (0043)
http://www.cddgg.net/static/ptweb/js/dgg.js -->
    <
html > < head > < meta
http - equiv = "Content-Type"
content = "text/html; charset=GBK" > < / head > < body > < pre
style = "word-wrap: break-word; white-space: pre-wrap;" >// JavaScript Document
    $(function () {
        //var ur = document.location;
        //$('[src=' + "ur" + ']').addClass('show');

        $('.hb .wx_box').hide();
        $('.hb').hover(function () {
            $(this).find('.wx_box').show();
        }, function () {
            $(this).find('.wx_box').hide();
        })
        $('.isbox1').hover(function () {
            $(this).addClass('divh');
        }, function () {
            $(this).removeClass('divh')
        })
        /*微信*/
        $('.wx').hover(function () {
            $(this).find('.wx_img').stop().slideDown();
        }, function () {
            $(this).find('.wx_img').stop().slideUp();
        })
        $(".tab_foot").tabso({
            cntSelect: ".tab_foot_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });
        //下拉
        $('.xlb').hover(function () {
            $(this).addClass('sxl');
            $(this).find('.hul').stop().slideDown();
        }, function () {
            $(this).find('.hul').stop().slideUp();
            $(this).removeClass('sxl');
        })
        $('#j-header-searchwrap').hover(function () {
            $(this).find('.ui-dropdown-menu').show();
            $(this).addClass('hover');
        }, function () {
            $(this).find('.ui-dropdown-menu').hide();
            $(this).removeClass('hover');
        })
        $('.ui-dropdown .ui-dropdown-menu li').click(function () {
            var value = $(this).find('a').html();
            $('#j-header-searchlabel').html(value);
        })
        $('#header .menu .p').hover(function () {
            $(this).addClass('phover');
        }, function () {
            $(this).removeClass('phover')
        })
        $('#header .menu .p').find('.ui-banner').hide();
        $('#header .menu .p').hover(function () {
            $(this).find('.ui-banner').show();
        }, function () {
            $(this).find('.ui-banner').hide();
        })
        $('.show_box').find('.clearfloat').show();

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
        if ($('.sub_right').length &gt; 0) {
            var detail = $('.sub_right .detail');
            $('.sub_right .more-btn').click(function (e) {
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
        /*	$('.snap-box').on('mouseenter','dd',function(e){ //控制�&#65533;
         var $this=$(this)
         var index=$this.index();
         $this.siblings('dd').removeClass('item-current');
         $this.addClass('item-current');
         $('.slide-box .slide-item').stop(true,true).not(':eq('+index+')').hide(); //内容�&#65533;
         $('.slide-box .slide-item').eq(index).show();
         $('.slide-box-masker').stop(true,true).css({'opacity':'1','display':'block'}).fadeOut("fast");
         });

         $('.slide-box').find('.slide-items').hide();
         $('.tab1_box .snap-box dl dd').hover(function(){
         $('.slide-box').find('.slide-items').show();
         },function(){
         $('.slide-box').find('.slide-items').hide();
         })*/
        /*function gos(){
         function imgshow(){
         $('.img-i').fadeTo('slow',1);
         }
         var timer=setInterval(imgshow,"1000");
         }

         gos();
         clearTimeout(timer);
         */
        $('.slide-box').hide();
        $('.tab1_box .snap-box dl dd').find('.slide-items').hide();
        $('.tab1_box .snap-box dl dd').hover(function () {
            /*$('.slide-box').show();
             $('.slide-box').css('z-index','1')
             $('.z-banner').hide();*/
            var timer = null;
            $('.img-i').stop().fadeTo(300, 0);
            function gos() {
                $('.img-i').stop().fadeTo(300, 1);
                window.clearTimeout(timer);
            };
            timer = window.setTimeout(function () {
                gos()
            }, 1000);

            $(this).find('.slide-items').show();
            //图片飞入
            if ($('.slide-box').find('.fly-img3').removeClass('hide')) {
                $('.slide-box').find('.fly-img3').children('img').css('left', '0px');
                $('.slide-box').find('.fly-img3').children('img').eq(2).animate({left: 555});
                $('.slide-box').find('.fly-img3').children('img').eq(1).animate({left: 390});
                $('.slide-box').find('.fly-img3').children('img').eq(0).animate({left: 225});
            }
            if ($('.slide-box').find('.fly-img1').removeClass('hide')) {
                $('.slide-box').find('.fly-img1').children('img').css('left', '0px');
                $('.slide-box').find('.fly-img1').children('img').eq(2).animate({left: 560});
                $('.slide-box').find('.fly-img1').children('img').eq(1).animate({left: 395});
                $('.slide-box').find('.fly-img1').children('img').eq(0).animate({left: 230});
            }
            if ($('.slide-box').find('.fly-img2').removeClass('hide')) {
                $('.slide-box').find('.fly-img2').children('img').css('left', '0px');
                $('.slide-box').find('.fly-img2').children('img').eq(2).animate({left: 438});
                $('.slide-box').find('.fly-img2').children('img').eq(1).animate({left: 333});
                $('.slide-box').find('.fly-img2').children('img').eq(0).animate({left: 228});
            }

        }, function () {
            $(this).find('.slide-items').hide();
            /*

             $('.slide-box').hide();
             $('.slide-box').css('z-index','0')
             $('.z-banner').show();*/
        })
        $('.pt1 li:eq(0)').addClass('sel');
        $('.pt1 li:eq(0)').click(function () {
            $(this).addClass('sel');
            $('.pt1 li:eq(1)').removeClass('sel');
            $('#hidden').val(1);
        })
        $('.pt1 li:eq(1)').click(function () {
            $(this).addClass('sel');
            $('.pt1 li:eq(0)').removeClass('sel');
            $('#hidden').val(2);
        })
        $('.tab1_box li:eq(1)').hide();
        /*more*/
//$('.bom').css('height','200px');
        $('.more-wrap1 span').click(function () {
            if (!$('.bom').hasClass('bom1')) {
                $(this).parent('.more-wrap1').prev('.bom').addClass('bom1')
            } else {
                $(this).parent('.more-wrap1').prev('.bom').removeClass('bom1')
            }

        })
        $('.sate .limg').click(function () {
            $('.imgpup').show();
        })
        $('.imgpup .ok').click(function () {
            $('.imgpup').hide();
        })
        $('.jf-service ul li').each(function (index, event) {
            if ((index + 1) % 3 == 0) {
                $(this).addClass('sright')
            }
        })
//自增8个li还未完成
        var cout = 0;
        $('.jf-show li:gt(7)').hide();
        $('.load-more .load-btn').click(function () {
            $('.jf-show li:gt(7)').show();
            /*$('.jf-show li:gt(7)').show*(8);
             cout+=8;*/

        })


        /*$('div.wtop&gt;.tab1').children('li').eq(1).click(function () {
         $('.slide-box').find('.slide-items').hide();
         })
         $('div.wtop&gt;.tab1').children('li').eq(0).click(function () {
         $('.slide-box').find('.slide-items').show();
         })*/
        /*$('.in-inner .tab1 li').click(function(){
         $(this).parents().find('.tab1_box').show();
         if($(this).hasClass('sel')){
         $(this).parents().find('.tab1_box').hide();
         }else{
         $(this).parents().find('.tab1_box').show();
         }
         })*/
        var canClick = false;
        $('.in-inner .tab1 li').click(function () {
            if (!canClick) {
                canClick = true;
                $(this).parents().find('.tab1_box').show();
                return false;
            }
            if ($(this).hasClass('sel')) {
                $(this).parents().find('.tab1_box').hide();
            } else {
                $(this).parents().find('.tab1_box').show();
            }
        })
        $('.publicbox').hide();
        $('.public').hover(function () {
            $(this).find('.publicbox').show();
        }, function () {
            $(this).find('.publicbox').hide();
        })
//查看更多-平台简介页�&#65533;
        $('.divm .showc').hide();
        $('.divm .showt .rshow').click(function () {
            $('.divm .showc').stop().slideUp();
            $(this).parent().next().stop().slideDown();
        })
//关闭绑定手机
        $('.fixedbg').hide();
        $('.p_window .tdiv .close').click(function () {
            $(this).parents('.fixedbg').hide();
        })
        /*需求发�&#65533;*/
        $('.sub_cat .tabM_box').show();
        $('.tabM_box .cat_bd:gt(1)').show();
        $('.sub_list1 li').click(function () {
            $('.sub_cat .tabM_box').hide();
            $(this).parents('.sub_left').next('.sub_cat').find('.tabM_box').show();
            $(this).parents('.sub_left').next('.sub_cat').css('background', '#fff')
        })
        $('.sx a').click(function () {
            if ($(this).hasClass('ah')) {
                $(this).removeClass('ah');
                $(this).parent().find('a').removeClass('ah')
            } else {
                $(this).addClass('ah')
            }
        })
        /*$('.sub_list1').on('click','li',function(e){ //控制�&#65533;
         var $this=$(this)
         var index=$this.index();
         $(this).parents('.sub_left').next('.sub_cat').css('background','#fff');
         //$this.siblings('li').removeClass('item-current');
         //$this.addClass('item-current');
         $('.sub_cat .cat_bd').stop(true,true).not(':eq('+index+')').hide(); //内容�&#65533;
         $('.sub_cat .cat_bd').eq(index).show();
         $('.slide-box-masker').stop(true,true).css({'opacity':'1','display':'block'}).fadeOut("fast");
         });

         $('.sub_list1 li').click(function(){
         var $this=$(this);
         var index=$this.index();
         $(this).parents('.sub_left').next('.sub_cat').show();
         })
         */
        $(".jdt").progressbar({
            disabled: false, value: 45, max: 100
        });
        $('.score2 .wh').hover(function () {
            $(this).parent().find('.intro').show();
        }, function () {
            $(this).parent().find('.intro').hide();
        })

//左侧导航1
        $('.scon').parent().find('span a').hide(0);
        //$('.scon:first').parent().find('h4:first').addClass('hclass');
        if ($('li[show]').length &gt; 0) {
            $('li[show] h4').children('a').show(0);
            var showNum = $('li[show]').index()
            $('.left1   ul li h4').removeClass('hclass');
            $('.left1  ul li h4').next('.scon').fadeOut(0);

            $('.left1  ul li:eq(' + showNum + ')&gt;span:eq(0)').addClass('hclass');
            $('.left1  ul li:eq(' + showNum + ')&gt;span:eq(0)').next('.scon').fadeIn(0);

            //$('.left_slide ul').prepend($('.left_slide ul li:eq(' + showNum + ')'));
            $('.left_slide ul li:not([show])').remove();

        }
        if ($('li[index]').length &gt; 0) {
            $('li[index] span').children('a').show(0);
            var showNum = $('li[index]').index()
            $('.left1  ul li:eq(' + showNum + ')&gt;h4:eq(0)').addClass('hclass');
            $('.left1  ul li:eq(' + showNum + ')&gt;h4:eq(0)').next('.scon').fadeIn(0);
        }
        $('.left1  ul li h4 a').click(function () {
            location.href = $(this).attr('href');
            return false;
        });
        $('.left1  ul li h4').click(function () {

            if ($('.left1  ul li .hclass').index('.left1  ul li h4') != $(this).index('.left1  ul li h4')) {
                $('.left1  ul li h4').removeClass('hclass');
                $('.left1  ul li h4').next('.scon').fadeOut(0);
                $('.left1  ul li h4 a').hide(0);
                $(this).addClass('hclass');
                $(this).children('a').show(0);

                $(this).next('.scon').fadeIn(0);

            } else {
                $(this).children('a').hide(0);
                $(this).next('.scon').fadeOut(0);
                $(this).removeClass('hclass')

            }


        })


        $('.rbox .left li').hover(function () {
            $(this).addClass('lh');
        }, function () {
            $(this).removeClass('lh')
        })
        var detail1 = $('.detailWord .ph');
        $('.more-wrap .moreb').click(function (e) {
            e.preventDefault();
            if ($(this).hasClass('opened')) {
                detail1.slideUp(600);
                $(this).removeClass('opened');
            } else {
                detail1.slideDown(600);
                $(this).addClass('opened');
            }
        })
        for (var i = 0; i &lt; $('.tabM').length; i++) {
            new dgg.qh.qh1('.tabM:eq(' + i + ')', '.tabM_box:eq(' + i + ')', 0).init(0);
        }
        for (var i = 0; i &lt; $('.tabs').length; i++) {
            new dgg.qh.qh1('.tabs:eq(' + i + ')', '.tab_box:eq(' + i + ')', 0).init(0);
        }

        $('.cdiv .abox a').each(function (index, event) {
            if ((index + 1) % 2 == 0) {
                $(this).addClass('brn')
            } else {
                $(this).removeClass('brn')
            }
        })
        /*$('.rbox1 .showb .hide').hide();
         $('.rbox1 .showb:eq(0) .hide').show();
         $('.rbox1 .showb .tb').click(function () {

         if (!$(this).hasClass('tbc')) {

         $('.rbox1 .showb .abox').slideUp();
         $('.rbox1 .showb .tb').removeClass('tbc');
         $(this).removeClass('tbc').addClass('tbc');
         $(this).next().slideDown();
         }
         })*/
        /*$('.rbox1 .showb .abox').hide();
         //$('.rbox1 .showb:eq(0) .abox').show();
         $('.rbox1 .showb .tb').click(function () {
         $('.rbox1 .showb .abox').hide();
         if (!$(this).hasClass('tbc')) {

         $('.rbox1 .showb .abox').slideUp();
         $('.rbox1 .showb .tb').removeClass('tbc');
         $(this).addClass('tbc');
         $(this).next().slideDown();
         }else{
         $(this).next().slideUp();

         }

         })	*/
        $('.rbox1 .showb .abox').hide();
        $('.rbox1 .showb[show]').children('.tb').addClass('tbc').next().show();
//$('.rbox1 .showb:eq(0) .abox').show();
        $('.rbox1 .showb .tb').click(function () {
            $('.rbox1 .showb .abox').hide();
            if ($(this).hasClass('tbc')) {
                $(this).next().slideUp();
                $('.rbox1 .showb .tb').removeClass('tbc');
            } else {
                $('.rbox1 .showb .tb').removeClass('tbc');
                $('.rbox1 .showb .abox').slideUp();
                $(this).addClass('tbc');
                $(this).next().slideDown();
            }

        })
        $("#tempTxt1").Slide({
            effect: "scroolTxt",
            autoPlay: true,
            speed: "normal",
            timer: 2000,
            steps: 1
        })
        $("#tempTxt2").Slide({
            effect: "scroolTxt",
            autoPlay: true,
            speed: "normal",
            timer: 2000,
            steps: 2
        })
        $("#temp1").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#tem_top_gw").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 4000
        })
        $("#temp1_in").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#temp2").Slide({
            effect: "scroolY",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })
        $("#temp_gw").Slide({
            effect: "scroolX",
            autoPlay: true,
            speed: "normal",
            timer: 3000
        })

        $(".tab_foot").tabso({
            cntSelect: ".tab_foot_box",
            tabEvent: "mouseover",
            tabStyle: "normal"
        });

        //首页图片内容显示1
        $(".picbox").hover(function () {
            $(this).children("div.pictext").stop().fadeIn(800);
            $(this).children("div.picbg").stop().fadeIn(800);
            $(this).find("h3").delay(200).stop().animate({"marginTop": [50, "easeOutCirc"]}, 800)
        }, function () {
            $(this).children("div.pictext").stop().fadeOut();
            $(this).children("div.picbg").stop().fadeOut();
            $(this).find("h3").stop().animate({"marginTop": [26, "easeOutCirc"]}, 800)
        });

//平台荣誉


        $('.tabs1 li').click(function () {
            var tC = $(this),
                tCv = tC.children('span').html(),
                tI = $(this).parent().children('input');
            if (tCv != tI.val()) {
                tI.val(tCv);
            } else {
                tI.val('');
            }
        });

        $('.div2 .sdiv3').hover(function () {
            $(this).addClass('sdivh');
        }, function () {
            $(this).removeClass('sdivh')
        })
        $('.div3 dd .dimg img,.div4 dd .dimg img').hover(function () {
            $(this).stop().animate({"marginTop": "-73px"});
            $(this).parent().next('h4').css("color", "#029feb")
        }, function () {
            $(this).stop().animate({"marginTop": "0px"});
            $(this).parent().next('h4').css("color", "#666")
        })
        /*  $('.cdiv&gt;div').stop().slideUp();
         $('.cdiv&gt;div').eq(0).stop().slideDown();

         $('.ltw a').click(function(){
         $(this).parent().find('.now').removeClass('now');
         $(this).addClass('now');
         $('.cdiv&gt;div').stop().slideUp();
         var anum=$(this).index();

         $('.cdiv&gt;div').eq(anum).stop().slideDown();
         return false;
         })

         */

        dgg.forIE();

        /*首页浮动定位*/
        $(window).scroll(function () {

            var scrll_top = $(this).scrollTop();
            $('.float').stop().animate({"top": scrll_top + 200 + "px"})

        })

        $('.float_list li').hover(function () {

            var float_text = $(this).attr('data-name')

            $(this).find('a').html(float_text)
            $(this).find('a').css({"background-color": "#c70c1f", "opacity": "1"})

            $(this).find('a').stop().animate({"width": "170px"}, 450)

        }, function () {

            var float_less = $(this).attr('data-text')
            $(this).find('a').html(float_less)
            $(this).find('a').css({"background-color": "#000", "opacity": "0.7"})
            $(this).find('a').stop().animate({"width": "30px"}, 450)

        })

        $('.float_list li').click(function () {

            $(this).addClass('floag_on').siblings().removeClass('floag_on')

        })

    })
// 了解顶呱�&#65533;
function initAbout() {

}


//鼠标滚动事件
/*$(window).scroll(function () { 

 if ($(document).scrollTop() &gt; 70) {
 $(".index_font p").animate({ "top": "0", "opacity": "1" }, 3000).css({ "filter": "Alpha(opacity=100)" });
 }

 });*/
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