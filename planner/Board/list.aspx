<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="list" %>

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
                    <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃" OnClientClick="return confirm('정말 로그아웃 하시겠습니까?')" /></li> 
                    <% } %>       
                </ul>
            </div>
        </div>
    </div>
        <div class="container body-content">
            <h2>자유 게시판</h2>
            <hr />
            <div class="form-horizontal">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="701px" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="글번호" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="uid" HeaderText="작성자" SortExpression="uid" />
                        <asp:HyperlinkField DataTextField="title" HeaderText="제목" SortExpression="title" datanavigateurlfields="id" datanavigateurlformatstring="~/Board/view.aspx?param={0}" />
                        <asp:BoundField DataField="date" HeaderText="작성일" SortExpression="date" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=JEONGBOGIL-PC;Initial Catalog=Basic;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [uid], [title], [date], [id] FROM [board] ORDER BY [id] DESC"></asp:SqlDataSource>
                  <% if (Session["uid"] != null) { %>
                    <a class="btn btn-default" href="./write.aspx">글쓰기</a> 
                  <% } else { %>
                    <li><asp:Label runat="server" Text="로그인을 해야 글을 쓸 수 있습니다" /></li> 
                    <% } %>   
    
            </div>
        </div>
    </form>
</body>
</html>
