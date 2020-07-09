<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="/css/bootstrap.css" rel="stylesheet">
        <link href="/css/Site.css" rel="stylesheet">
    <style>
    ol, ul { list-style: none; }
    footer { background: #222; color: #888; }
    footer { margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline; }
    footer .footer { position: relative; max-width: 1200px; margin: 0 auto; padding: 16px; }
    @media (min-width: 768px)
    footer .footer { padding: 36px 24px; }
    footer .footer-nav { margin: -8px; padding: 0 0 16px; }
    @media (min-width: 768px) 
    footer .footer-nav { margin: 0 -12px; padding-bottom: 24px; }
    @media (min-width: 768px)
    footer .info { margin: -2px -4px; font-size: 14px; }
    footer .info { font-size: 12px; }
    footer .info li { display: inline; padding-right: 4px; line-height: 1.5; }
    @media (min-width: 768px)
    footer .info li { display: inline-block; padding: 0 4px; }
    </style>
    <script src="/script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/script/bootstrap.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="/main.aspx" class="navbar-brand">여행플래너</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/Planner.aspx">플래너</a></li>
                        <li><a href="/Best.aspx">추천여행지</a></li>
                        <li><a href="/Board/list.aspx">자유게시판</a></li>
                        <li><a href="/planboard.aspx">내 플랜</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (Session["uid"] == null) { %>
                        <li><a runat="server" href="~/Account/Register.aspx">회원가입</a></li>
                        <li><a runat="server" href="~/Account/Login.aspx">로그인</a></li>
                        <% } else { %>
                        <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃" /></li> 
                        <% } %>       
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="container body-content">
            <h2>회원 가입</h2>
            <p class="text-danger"></p>
            <div class="form-horizontal">
                <h4>새로운 계정을 만듭니다.</h4>
                <hr>
                <div id="MainContent_ctl00" class="text-danger" data-valsummary="true" style="display:none;"></div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">회원 ID</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox placeholder="ID를 입력하세요" runat="server" ID="UserName" CssClass="form-control" autocomplete="off" />
                        <label class="id_label" style="display:none;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">비밀번호</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="비밀번호를 입력하세요" />
                        <label class="password_label" style="display:none;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">비밀번호 확인</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="비밀번호 확인을 입력하세요" />
                        <label class="password_confirm_label" style="display:none;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                       <br /> <asp:Button runat="server" OnClick="CreateUser_Click" ID="register_btn" Text="가입하기" CssClass="btn btn-default" disabled="true"/>
                    </div>
                </div>
            </div>
            <hr>
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {
        $('#<%= UserName.ClientID %>').keyup(function (e) {
            var _this = $(this);

            if (_this.val().length == 0) {
                $('.id_label').css('display', 'block');
                $('.id_label').text('아이디를 입력해주세요.');
                $('.id_label').css('color', 'red');

                $('#register_btn').prop('disabled', true);
                return;
            }
            if (_this.val().length > 15) {
                $('.id_label').css('display', 'block');
                $('.id_label').text('최대 15글자의 아이디를 입력해주세요.');
                $('.id_label').css('color', 'red');
                _this.focus();
                $('#register_btn').prop('disabled', true);
                return;
            }
            if (_this.val().length < 3) {
                $('.id_label').css('display', 'block');
                $('.id_label').text('최소 3글자 이상의 아이디를 입력해주세요.');
                $('.id_label').css('color', 'red');
                _this.focus();
                $('#register_btn').prop('disabled', true);
                return;
            }
            $('.id_label').css('display', 'none');
            $.ajax({
                type: "POST",
                url: '/Account/Register.aspx/CheckUserName',
                data: "{name:\"" + _this.val() + "\"}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (msg.d == 'failed') {
                        $('.id_label').show();
                        $('.id_label').text('이미 같은 아이디가 있습니다.');
                        $('#register_btn').prop('disabled', true);
                        return;
                    }

                    $('.id_label').hide();
                    if ($('.id_label').is(':visible') &&
                        $('.password_label').is(':visible') &&
                        $('.password_confirm_label').is(':visible')) {
                        $('#register_btn').prop('disabled', true);
                    } else {
                        $('#register_btn').prop('disabled', false);
                    }
                }
            });
        });
        $('#Password').keyup(function (e) {
            var _this = $(this);

            if (_this.val().length == 0) {
                $('.password_label').css('display', 'none');
                $('.password_label').css('color', 'red');
                $('.password_label').text('비밀번호를 입력해주세요.');
                $('#register_btn').prop('disabled', true);
                return;
            }

            if (_this.val().length < 4) {
                $('.password_label').css('display', 'block');
                $('.password_label').css('color', 'red');
                $('.password_label').text("비밀번호는 최소 4글자 이상 입력 해주세요.");
                _this.focus();
                $('#register_btn').prop('disabled', true);
                return;
            }

            if ($('#ConfirmPassword').val()) {
                if (_this.val() != $('#ConfirmPassword').val()) {
                    $('.password_label').css('display', 'block');
                    $('.password_label').css('color', 'red');
                    $('.password_label').text("비밀번호가 일치하지 않습니다.");
                    _this.focus();
                    $('#register_btn').prop('disabled', true);
                    return;
                }
            }

            $('.password_label').css('display', 'none');

            if ($('.id_label').is(':visible') &&
                $('.password_label').is(':visible') &&
                $('.password_confirm_label').is(':visible')) {
                $('#register_btn').prop('disabled', true);
            } else {
                $('#register_btn').prop('disabled', false);
            }
        });
        $('#ConfirmPassword').keyup(function (e) {
            var _this = $(this);

            if (_this.val().length == 0) {
                $('.password_confirm_label').css('display', 'none');
                return;
            }

            if (_this.val().length < 4) {
                $('.password_confirm_label').css('display', 'block');
                $('.password_confirm_label').css('color', 'red');
                $('.password_confirm_label').text("비밀번호가 일치하지 않습니다.");
                _this.focus();
                $('#register_btn').prop('disabled', true);
                return;
            }

            if (_this.val() != $('#Password').val()) {
                $('.password_confirm_label').css('display', 'block');
                $('.password_confirm_label').css('color', 'red');
                $('.password_confirm_label').text("비밀번호가 일치하지 않습니다.");
                _this.focus();
                $('#register_btn').prop('disabled', true);
                return;
            }

            $('.password_label').css('display', 'none');
            $('.password_confirm_label').css('display', 'none');

            if ($('.id_label').is(':visible') &&
                $('.password_label').is(':visible') &&
                $('.password_confirm_label').is(':visible')) {
                $('#register_btn').prop('disabled', true);
            } else {
                $('#register_btn').prop('disabled', false);
            }
        });
    });
</script>
</html>
