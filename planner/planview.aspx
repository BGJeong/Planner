<%@ Page Language="C#" AutoEventWireup="true" CodeFile="planview.aspx.cs" Inherits="planview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
         <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/Site.css" rel="stylesheet"/>
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
    <form id="form2" runat="server">
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
                    <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃" OnClientClick="return confirm('정말 로그아웃 하시겠습니까?')" /></li> 
                    <% } %>       
                </ul>
            </div>
        </div>
    </div>
    <div class="container body-content">
      <h2>상세보기</h2>
        <HR /><br />
        <div class="form-horizontal">
         <table class="table table-striped" >
        <tr>
            <td>
                작성자
            </td>
            <td>
                <asp:Label ID="LaB_Writer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                제목
            </td>
            <td>
                <asp:Label ID="LaB_Title" runat="server"></asp:Label>
                <asp:Label ID="LaB_lng" runat="server"></asp:Label>
                <asp:Label ID="LaB_lat" runat="server"></asp:Label>
                <asp:Label ID="LaB_addr" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height:200px">
            <td style="width:100px">
                글내용
            </td>
            <td style="width:600px">
                <div id="map" style="width:800px; height:450px;"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button Text="목록" runat="server"  ID="btn_List" 
                    onclick="btn_List_Click" CssClass="btn btn-default" />
                <asp:Button ID="btn_Delete" Text="삭제" runat="server"   OnClientClick="return confirm('정말 삭제하시겠습니까?')"
                    onclick="btn_Delete_Click" class="btn btn-danger" />
                <asp:Button runat="server" ID="btn_Modify"  Text="수정" 
                    onclick="Modify_Click" CssClass="btn btn-default" />
            </td>
        </tr>
    </table>
            </div>
    </div>
    </form>
</body>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZdtgIY8Nqr6s-jPbJppE83bvEAL0fIHE&callback=initMap&libraries=&v=weekly"defer></script>
        <script>
            
            var temp = planview.aspx.pageConfig.lat;
            console.log(temp);
            
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById("map"), {
                    center: { lat: -34.397, lng: 150.644 },
                    zoom: 8
                });
            }
       </script>
</html>