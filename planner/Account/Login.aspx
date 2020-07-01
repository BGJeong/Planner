<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>aa</title>
        <link href="/css/bootstrap.css" rel="stylesheet"/>
        <link href="/css/Site.css" rel="stylesheet"/>
    <style>
    ol, ul { list-style: none; }
    footer { background: #222; color: #888; }
    footer { margin: 0; padding: 0; border: 0; font-size: 100%; font: inherit; vertical-align: baseline; }
    footer .footer { position: relative; max-width: 1200px; margin: 0 auto; padding: 16px; }
    @media (min-width: 768px)
    footer .footer {padding: 36px 24px;}
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (Session["uid"] == null) { %>
                        <li><a runat="server" href="~/Account/Register.aspx">회원가입</a></li>
                        <li><a runat="server" href="~/Account/Login.aspx">로그인</a></li>
                        <% } else { %>
                        <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃"/></li> 
                        <% } %>       
                    </ul>
                </div>
            </div>
        </div>

        <div class="container body-content">
            <h2>로그인</h2>
            <div class="row">
                <div class="col-md-8">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <h4>등록된 회원만 로그인이 가능합니다.</h4>
                            <hr />
                            <asp:Label runat="server" ID="alert_label" style="color:red;"></asp:Label>
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                           <br /><br /> <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">I D</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control"  placeholder="ID를 입력하세요" />
                                    <asp:Label runat="server" ID="username_label" style="color:red;"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">비밀번호</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="비밀번호를 입력하세요" />
                                    <asp:Label runat="server" ID="password_label" style="color:red;"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="LogIn" ID="btn_login" Text="로그인" CssClass="btn btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                     아직 회원이 아니세요?
                                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" href="Register.aspx">회원가입</asp:HyperLink>
                   
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>


    </form>
</body>
</html>
