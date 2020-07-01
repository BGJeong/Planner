<%@ Page Language="C#" AutoEventWireup="true" CodeFile="write.aspx.cs" Inherits="Board_write" %>

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
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (Session["uid"] == null) { %>
                    <li><a runat="server" href="~/Account/Register.aspx">회원가입</a></li>
                    <li><a runat="server" href="~/Account/Login.aspx">로그인</a></li>
                    <% } else { %>
                    <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃" OnClientClick="return confirm('정말 로그아웃 하시겠습니까?')" /></li> 
                    <% } %>       
                </ul>
            </div>
        </div>
    </div>
    <div>
      <div class="container body-content">
            <h2>글쓰기</h2>
            <hr />
            <div class="form-horizontal">
                <div id="MainContent_ctl00" class="text-danger" data-valsummary="true" style="display:none;"></div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">제목</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="title" CssClass="form-control" autocomplete="off" />
                        <label class="title_label" style="display:none;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="col-md-2 control-label">내용</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="content" CssClass="form-control" Width="1000px" Height="200px" style="resize:none"   TextMode="MultiLine" />
                        <label class="content_label" style="display:none;"></label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" OnClick="btnSaveClick" ID="btn_save" Text="글쓰기" CssClass="btn btn-default"/>
                        <asp:Button runat="server" OnClick="btn_cancel_Click" ID="btn_cancel" Text="취소" CssClass="btn btn-default"/>
                    </div>
                </div>
            </div>
            
    </div>
    </form>
</body>
</html>
