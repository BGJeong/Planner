<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/Site.css" rel="stylesheet">
    <link href="/css/jquery.bxslider.css" rel="stylesheet">
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
    
    .slide                                      { position: relative; width: 100%; height: 350px; padding: 0;     margin-top: 40px;
    margin-bottom: 40px;}
    .slide .wrap-slide                          { position: relative; width: 100%; height: 100%; overflow: hidden; }
    .slide .slide-img                           { position: absolute; top: 0; display: table; width: 100%; height: 100%; }
    .slide .slide01                             { background: url(/img/main1.jpg) no-repeat center 75%; background-size: cover; height: 350px;}
    .slide .slide02                             { background: url(/img/main.jpg) no-repeat 0 35%; background-size: cover; height: 350px;}
    .slide .slide03                             { background: url(/img/main2.jpg) no-repeat 0 35%; background-size: cover; height: 350px;}
    .slide .slide-txt                           { display: table-cell; vertical-align: middle; text-align: center; color: white; }
    .slide .slide-txt h2                        { height: inherit; margin-top: 0px; margin-bottom: 0px; font-size: 60px; }
    .slide .slide-txt h3                        { height: inherit; margin-top: 0px; margin-bottom: 0px; font-size: 20px; font-weight: bold; margin-top: 10px; }
    .slide .control                             { position: absolute; top: 159px; left: 50%; width: 20px; height: 39px; display: block; text-indent: -999999px; }

    .slide .slide-indicators                    { position: absolute; bottom: 10px; width: 100%; text-align: center; }
    .slide .slide-pos                           { display: inline-block; margin: 0 3px; width: 15px; height: 15px; background: white; opacity: 0.4; border-radius: 50%; overflow: hidden; cursor: pointer; }
    .slide .slide-pos.active                    { opacity: 1; }

    </style>
    <script src="/script/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/script/bootstrap.js" type="text/javascript"></script>
    <script src="/script/jquery.bxslider.min.js" type="text/javascript"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <%-- top menu --%>
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
        
        <%-- content--%>
        <div class="container body-content">
            <div class="slide">
                <ul class="wrap-slide">
                    <li class="slide-img slide01">
                        <div class="slide-txt">
                            <h2 class="eng">플래너 새로 작성하기</h2>
                            <h4> 다닐때 필요한 여행계획, 비용 산출등의 정보를 여기에서 추가하세요!</h4>
                        </div>
                    </li>
                    <li class="slide-img slide02 ">
                        <div class="slide-txt">
                            <h2 class="eng">여행을 떠나고 싶으신가요?</h2>
                            <h4>사람들의 발길이 잦아 북적북적한, 혹은 조용한 나만의 여행지를 찾고 싶으시면 여기에서 확인하세요!</h4>
                        </div>
                    </li>
                    <li class="slide-img slide03">
                        <div class="slide-txt">
                            <h2 class="eng">궁금한 것이 있으신가요 ?</h2>
                            <h4>평소 궁금했던 것, 혹은 사람들과의 소통이 필요하시다면 여기에서 확인하세요!</h4>
                        </div>
                    </li>
                </ul>
            </div>     
            
             <div class="row">
        <div class="col-md-4">
            <h2>플래너 새로 작성하기</h2>
            <p>
                여행을 다닐때 필요한 여행계획, 비용 산출등의 정보를 여기에서 추가하세요!
            </p>
            <p>
                <a class="btn btn-default" href="./Planner.aspx">더보기</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>여행을 떠나고 싶으신가요?</h2>
            <p>
                사람들의 발길이 잦아 북적북적한, 혹은 조용한 나만의 여행지를 찾고 싶으시면 여기에서 확인하세요!
            </p>
            <p>
                <a class="btn btn-default" href="./best.aspx">더보기 &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>궁금한 것이 있으신가요 ?</h2>
            <p>
                평소 궁금했던 것, 혹은 사람들과의 소통이 필요하시다면 여기에서 확인하세요!
            </p>
            <p>
                <a class="btn btn-default" href="./Board/list.aspx">더보기 &raquo;</a>
            </p>
        </div>
    </div>       
            
            <!--footer>
                <div class="footer">
                    <ul class="info">
                       </li>JeongBoGil </ul>
		       
                </div>
            </!--footer-->
        </div>
    
    </form>
</body>
<script>
    $(document).ready(function () {
        $('.wrap-slide').bxSlider();
    });
</script>
</html>
