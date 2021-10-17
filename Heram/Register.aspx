<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Culture="auto" UICulture="auto" %>

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
            height: 440px;
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
                font-family: Tahoma, Geneva, sans-serif !important;
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
                font-family: Tahoma, Geneva, sans-serif !important;
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
            height: 15px;
            width: 130px;
        }

        #botton_right_two {
            float: right;
            height: 15px;
            width: 130px;
            margin-top: 3px;
        }

        #botton_right_three {
            float: right;
            height: 15px;
            width: 130px;
            margin-top: 3px;
        }

        .login-btn {
            float: right;
            height: 46px;
            width: 109px;
            background-image: url(App_Themes/Panel/login/register.png);
            background-repeat: no-repeat;
            background-position: 0px 0px;
            cursor: pointer;
            border: none;
        }

            .login-btn:hover {
                background-image: url(App_Themes/Panel/login/register.png);
                background-repeat: no-repeat;
                background-position: 0px -46px;
            }
    </style>
</head>

<body>
    <form id="Form1" runat="server">
        <div id="loginwrapper">
            <asp:CreateUserWizard ID="RegisterUser" ContinueDestinationPageUrl="~/Buyer/Default.aspx" runat="server" RequireEmail="False" OnCreatedUser="RegisterUser_CreatedUser" ConfirmPasswordCompareErrorMessage="رمز عبور و تکرار آن باید یکسان باشند" ConfirmPasswordLabelText="تکرار رمز عبور" ConfirmPasswordRequiredErrorMessage="تکرار رمز عبور اجباری است" CreateUserButtonText="ثبت نام و اتصال به بانک" DuplicateEmailErrorMessage="آدرس الکترونیکی تکراری است" DuplicateUserNameErrorMessage="نام کاربری تکراری است" EmailRegularExpressionErrorMessage="آدرس الکترونیکی را درست وارد نمایید" EmailRequiredErrorMessage="آدرس الکترونیکی اجباری است" PasswordLabelText="رمز عبور" PasswordRequiredErrorMessage="رمز عبور اجباری است" UserNameLabelText="نام کاربری" UserNameRequiredErrorMessage="نام کاربری اجباری است" InvalidPasswordErrorMessage="حداقل طول رمز عبور: {0}" EmailLabelText="E-mail">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                        <ContentTemplate>
                            <img src="App_Themes/Panel/login/title.png" width="242" height="36" alt="ورود به سیستم رزرو بلیت" />
                            <div id="input_wrapper">
                                <asp:TextBox runat="server" class="field" ID="FirstName" autocomplete="off" type="text" required="" title="نام را وارد کنید" name="نام" placeholder="نام" data-icon="U" />
                                <asp:TextBox runat="server" class="field" ID="LastName" autocomplete="off" type="text" required="" title="نام خانوادگی را وارد کنید" name="نام خانوادگی" placeholder="نام خانوادگی" data-icon="U" />
                                <asp:TextBox runat="server" class="field" ID="UserName" autocomplete="off" type="text" required="" title="آدرس الکترونیکی را وارد کنید" placeholder="آدرس الکترونیکی" data-icon="U" />
                                <asp:TextBox class="field" ID="Password" runat="server" autocomplete="off" TextMode="password" required="" title="کلمه عبور را وارد کنید" placeholder="کلمه عبور" data-icon="x" />
                                <asp:TextBox class="field" ID="ConfirmPassword" runat="server" autocomplete="off" TextMode="password" required="" title="تاییدیه رمز عبور را وارد کنید" placeholder="تاییدیه رمز عبور" data-icon="x" />
                                <asp:TextBox ID="Mobile" title="تلفن همراه را وارد کنید" MaxLength="11" placeholder="تلفن همراه" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                                <span>
                                    <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="رمز عبور و تاییدیه رمز عبور باید یکسان باشند." ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                    <asp:RegularExpressionValidator ID="MobileRegularExpressionValidator" Display="Dynamic" runat="server" ControlToValidate="Mobile" ValidationGroup="RegisterUserValidationGroup" ErrorMessage="تلفن همراه(09121234567)" ValidationExpression="\d{11}">*</asp:RegularExpressionValidator>
                                </span>
                            </div>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                            <div id="bottom_left">
                                <asp:ImageButton ID="StepNextButton" runat="server" SkinID="RegisterButton" CommandName="MoveNext" Text="ثبت نام" ValidationGroup="RegisterUserValidationGroup" />
                            </div>
                            <div style="margin-top:70px;padding: 0px;">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RegisterUserValidationGroup" />
                                </div>
                        </CustomNavigationTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="RegisterCompleteWizardStep" runat="server">
                        <ContentTemplate>
                            <div class="fields-container">
                                <p style="color: #FFF; direction: rtl; text-align: justify;">
                                    کاربر شما با موفقیت اضافه شد
                                </p>
                            </div>
                            <div class="fields-container" style="padding-right: 0px !important; margin-left: 0px !important;">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="ادامه" ValidationGroup="RegisterUserValidation" meta:resourcekey="ContinueButtonResource1" />
                            </div>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <FinishNavigationTemplate>
                    <asp:Button runat="server" CausesValidation="False" CommandName="MovePrevious" Text="بازگشت" ID="FinishPreviousButton"></asp:Button>
                    <asp:Button runat="server" CommandName="MoveComplete" Text="پایان" ID="FinishButton"></asp:Button>
                </FinishNavigationTemplate>
            </asp:CreateUserWizard>
        </div>
    </form>
</body>
</html>

