var Login = function () {

    function showErrorTips(msg) {
        var error = $('.error-alert');
        error.html(msg);
        error.removeClass('hidden');
        setTimeout(function () {
            error.addClass("hidden");
            location.reload();
        }, 3000);
    }

    function showSuccessTips(msg) {
        var error = $('.error-alert');
        error.html(msg);
        error.removeClass('Huialert-error');
        error.addClass("Huialert-success");
        error.removeClass('hidden');
        setTimeout(function () {
            error.addClass("hidden");
            window.location.href = "/system";
        }, 2000);
    }

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeVerifyCode() {
        $("#verifyImg").attr("src", "/verify/captchaImg?" + genTimestamp());
    }

    var changeBg = function () {
        var number = Math.ceil(Math.random() * 8);
        $(".loginWraper").css(
            "background",
            "#3283AC url('/r/system/images/admin-login-bg/" + number
            + ".jpg') no-repeat center");
    }

    var showVerifyImg = function () {
        $("#verify-input").bind("click", function () {
            $("#verifyImg").removeClass('hidden');
        });
        $("#verifyImg").bind("click", function () {
            changeVerifyCode();
        });
    }

    var validateForm = function () {

        var form = $('#loginform');
        form.validate({

            rules: {
                password: "required",
                username: "required",
                verifycode: {
                    required: true,
                    remote: "/verify/validateCaptchaImage"
                }
            },
            messages: {
                username: {
                    required: " 必填",
                },
                password: {
                    required: " 必填",
                },
                verifycode: {
                    required: " 必填",
                    remote: "错误"
                }
            },
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    success: function (data) {
                        var obj = jQuery.parseJSON(data);
                        if (obj.success) {
                            showSuccessTips(obj.msg);
                        }
                        showErrorTips(obj.msg);
                        $(form).resetForm();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        showErrorTips('提交失败！');
                        // alert(XMLHttpRequest.status);
                        // alert(XMLHttpRequest.readyState);
                        // alert(textStatus);
                    }
                });
                return false;
            }
        });
    }
    return {
        init: function () {
            changeBg();
            showVerifyImg();
            validateForm();
        }

    };
}();
