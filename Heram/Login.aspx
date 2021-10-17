<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>سیستم رزرو</title>
    <script type="text/javascript" src="App_Themes/Panel/js/jquery-1.10.1.min.js"></script>
    <script src="App_Themes/Panel/login/modernizr.js"></script>
    <!--placeholder-->
    <script>
        $(document).ready(function () {
            if (!Modernizr.input.placeholder) {

                $('[placeholder]').focus(function () {
                    var input = $(this);
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                        input.removeClass('placeholder');
                    }
                }).blur(function () {
                    var input = $(this);
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.addClass('placeholder');
                        input.val(input.attr('placeholder'));
                    }
                }).blur();
                $('[placeholder]').parents('form').submit(function () {
                    $(this).find('[placeholder]').each(function () {
                        var input = $(this);
                        if (input.val() == input.attr('placeholder')) {
                            input.val('');
                        }
                    })
                });
            }
        });
    </script>
    <style type="text/css">
        body {
            background-image: url(App_Themes/Panel/login/patt.png);
            background-repeat: repeat;
        }

        :focus {
            outline: 0;
        }

        #loginwrapper a:link {
            color: #FFF;
            text-decoration: none;
        }

        #loginwrapper a:visited {
            text-decoration: none;
            color: #FFF;
        }

        #loginwrapper a:hover {
            text-decoration: none;
            color: #007dbb;
        }

        #loginwrapper a:active {
            text-decoration: none;
            color: #FFF;
        }

        #loginwrapper {
            height: 220px;
            width: 250px;
            margin-right: auto;
            margin-left: auto;
            padding-top: 50px;
            padding-right: 25px;
            padding-left: 25px;
            background-color: #2ab0e9;
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 20px;
            color: #FFF;
            direction: rtl;
            margin-top: 150px;
        }

            #loginwrapper #input_wrapper input[type=text] {
                margin-bottom: 10px;
                margin-right: 5px;
                padding-right: 50px;
                border: 0px;
                font-size: 16px;
                width: 200px !important;
                height: 40px;
                clear: both;
                background: rgba(255, 255, 255, 0.7) url(App_Themes/Panel/login/user.png);
                background-repeat: no-repeat;
                background-position: 210px center;
                -webkit-transition: 0.4s linear !important;
                -moz-transition: 0.4s linear !important;
                -o-transition: 0.4s linear !important;
                -ms-transition: 0.4s linear !important;
                transition: 0.4s linear !important;
                font-family: Arial,Tahoma, Geneva, sans-serif !important;
            }

                #loginwrapper #input_wrapper input[type=text]:hover, #loginwrapper input[type=text]:focus {
                    -webkit-transition: 0.4s linear !important;
                    -moz-transition: 0.4s linear !important;
                    -o-transition: 0.4s linear !important;
                    -ms-transition: 0.4s linear !important;
                    transition: 0.4s linear !important;
                    background-color: rgba(255, 255, 255, 1) !important;
                }

            #loginwrapper #input_wrapper input[type=password] {
                margin-bottom: 10px;
                margin-right: 5px;
                padding-right: 50px;
                border: 0px;
                font-size: 16px;
                width: 200px !important;
                height: 40px;
                clear: both;
                background: rgba(255, 255, 255, 0.7) url(App_Themes/Panel/login/lock.png);
                background-repeat: no-repeat;
                background-position: 210px center;
                -webkit-transition: 0.4s linear !important;
                -moz-transition: 0.4s linear !important;
                -o-transition: 0.4s linear !important;
                -ms-transition: 0.4s linear !important;
                transition: 0.4s linear !important;
                font-family: Arial,Tahoma, Geneva, sans-serif !important;
            }

                #loginwrapper #input_wrapper input[type=password]:hover, #loginwrapper input[type=password]:focus {
                    -webkit-transition: 0.4s linear !important;
                    -moz-transition: 0.4s linear !important;
                    -o-transition: 0.4s linear !important;
                    -ms-transition: 0.4s linear !important;
                    transition: 0.4s linear !important;
                    background-color: rgba(255, 255, 255, 1) !important;
                }

        #bottom {
            float: right;
            height: 60px;
            width: 270px;
            margin-right: 5px;
        }

        #input_wrapper {
            width: 240px;
            clear: both;
        }

        #bottom_right {
            float: right;
            height: 60px;
            width: 131px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        #bottom_left {
            float: left;
            height: 60px;
            width: 131px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        #botton_right_one {
            float: right;
            margin-right: 25px;
        }

        #botton_right_two {
            float: right;
            margin-top: 5px;
        }

        #botton_right_three {
            float: right;
            margin-top: 3px;
        }

        .login-btn {
            float: right;
            height: 46px;
            width: 109px;
            background-image: url(App_Themes/Panel/login/enter.png);
            background-repeat: no-repeat;
            background-position: 0px 0px;
            cursor: pointer;
            border: none;
        }

            .login-btn:hover {
                background-image: url(App_Themes/Panel/login/enter.png);
                background-repeat: no-repeat;
                background-position: 0px -46px;
            }
    </style>
</head>

<body>
    <form id="Form1" runat="server">
        <div id="loginwrapper">
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" FailureText="نام کاربری یا کلمه عبور شما اشتباه است" RenderOuterTable="false" OnLoggedIn="LoginUser_LoggedIn">
                <LayoutTemplate>
                    <img src="App_Themes/Panel/login/title.png" width="242" height="36" alt="ورود به سیستم رزرو بلیت" />
                    <div id="input_wrapper">
                        <asp:TextBox runat="server" class="field" ID="UserName" autocomplete="off" type="text" required="" title="نام کاربری را وارد کنید" name="نام کاربری" placeholder="نام کاربری" data-icon="U" />
                        <asp:TextBox class="field" ID="Password" runat="server" autocomplete="off" TextMode="password" required="" title="کلمه عبور را وارد کنید" placeholder="کلمه عبور" data-icon="x" />
                    </div>
                    <div id="bottom">
                        <div id="bottom_right">
                            <div id="botton_right_one"><a href="Register.aspx?Roles=QnV5ZXI=">عضویت</a></div>
                            <div id="botton_right_two">
                                <asp:CheckBox runat="server" Text="ذخیره سازی" ID="RememberMe"></asp:CheckBox>
                                </div>
                        </div>
                        <div id="bottom_left">
                            <asp:ImageButton ID="LoginButton" runat="server" CommandName="Login" ValidationGroup="LoginUserValidationGroup" SkinID="LoginButton" />
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </div>
    </form>
</body>
</html>

