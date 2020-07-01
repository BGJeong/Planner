<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modify.aspx.cs" Inherits="Board_modify" %>

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
    <div class="container body-content">
         <h2>수정하기</h2>
        <hr /><br />
         <table class="table table-striped">
        <tr>
            <td style="width:200px">
                글쓴이
            </td>
            <td style="width:600px">
                <asp:Label ID="TB_Writer" runat="server" Width="400"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:100px">
                작성일
            </td>
            <td style="width:600px">
                <asp:Label ID="TB_Date" runat="server" Width="400"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width:100px">
                제목
            </td>
            <td style="width:1200px">
                <asp:TextBox ID="TB_Title" runat="server" Width="800"></asp:TextBox>
            </td>
        </tr>
        <tr style="height:200px">
            <td style="width:100px">
                글내용
            </td>
            <td style="width:1200px">
                <asp:TextBox TextMode="MultiLine" ID="TB_Content" runat="server" Width="400" Height="170" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button ID="btn_Cancel" Text="취소" runat="server" 
                    onclick="Cancel_Click" CssClass="btn btn-default" />
                <asp:Button runat="server" ID="btn_Modify"  Text="수정" 
                    onclick="Modify_Click" CssClass="btn btn-default" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
