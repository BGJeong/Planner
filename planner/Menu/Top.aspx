

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="/css/bootstrap.css" rel="stylesheet">
        <link href="/css/Site.css" rel="stylesheet">
    <style>
    #floating-panel {position: absolute;top: 10px;left: 25%; z-index: 5; background-color: #fff; padding: 5px; border: 1px solid #999; text-align: center; font-family: 'Roboto','sans-serif'; line-height: 18px; padding-left: 10px;}
    ol, ul { list-style: none; }
    pre, input, select, textarea { max-width: none; margin: 0; padding: 0; border: 0; border-radius: 0; outline: 0; color: #333; font: inherit; font-size: 16px; }
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
    .map { position: relative; width: 100%; height: auto; }
    .map-canvas { position: relative; top: 0; left: 0; z-index: 0; width: 100%; height: 0; padding-bottom: 60%; }
    .line-input { display: block; position: relative; width: 100%; min-height: 49px; padding: 10px 0; border-bottom: 1px solid #dfdfdf; border-radius: 0; line-height: 1.3; }
    </style>
    <script src="/script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/script/bootstrap.js" type="text/javascript"></script>
</head>
<body>
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
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (Session["uid"] == null) { %>
                    <li><a runat="server" href="~/Account/Register.aspx">회원가입</a></li>
                    <li><a runat="server" href="~/Account/Login.aspx">로그인</a></li>
                    <% } else { %>
                    <li><a id="logout" style="cursor: pointer;">로그아웃</a></li>
                    <% } %>       
                </ul>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#logout').click(function () {

                var result = confirm('로그아웃 하시겠습니까?');

                if (result) {
                    $.ajax({
                        type: "POST",
                        url: "Top.aspx/logout",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            window.location.href = '/Main.aspx';
                        },
                        failure: function (response) {
                            alert(response.d);
                        },
                        error: function (response) {
                            alert(response.d);
                        }
                    });
                }
            });
        });
    </script>
