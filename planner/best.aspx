<%@ Page Language="C#" AutoEventWireup="true" CodeFile="best.aspx.cs" Inherits="best" %>

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
                        <li><asp:LinkButton runat="server" OnClick="Logout" ID="btn_logout" Text="로그아웃"/></li> 
                        <% } %>       
                    </ul>
                </div>
            </div>
        </div>
        <div>
            <div class="container body-content">

              <h2>추천 여행지</h2>
                <h3>전세계 추천 여행지</h3>
                <div class="row">
                <div class="col-md-8">
                    <div class="move" style="position: fixed;bottom: 2em; right: 10px; padding: 1em; display: none;"><span id="top_move" style="float:right;" ><img src="./img/images.png" /></span></div>
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <hr />
                            
                            <h4 style="margin:auto">비바람이 7억년 동안 빚은 그랜드 캐니언</h4><br />
                            <div><img src="img2/그랜드캐년.jpg" style="width:90%" /></div>
                            그랜드 캐니언은 미국 애리조나 주 북부에 있는 고원지대를 흐르는 콜로라도 강에 의해서 깎여진 거대한 계곡이다. 콜로라도 강의 계곡으로 들어가는 입구는 동쪽에 있는 글랜 캐니언댐 밑에 있는 리스페리가 된다. 여기서 계곡으로 들어가는 콜로라도 강은 서쪽으로 446km의 장거리를 흘러서 계곡의 출구가 되는 미드 호로 들어 가는데 이 구간의 양편 계곡을 그랜드 캐니언이라고 부른다.
                            <br /><br /><br />
                            <h4> 미국과 캐나다의 나이아가라 폭포</h4>
                            <br />
                            <div><img src="img2/나이아가라 폭포.jpg"</div><br />
                            나이아가라 폭포는 두 개의 대형 폭포와 하나의 소형 폭포로 나뉜다. 원래는 하나였으나 오랜 시간에 걸쳐 지형이 깎여나가 폭포의 모양이 변했고 지금의 모양이 되었다. 두 개의 대형 폭포는 염소섬(Goat Island)을 경계로 캐나다 폭포(말굽 폭포, Horseshoe Falls)와 미국 폭포(American Falls)로 나뉜다. 소형 폭포는 브라이들 베일 폭포(Bridal Veil Falls)이며, 루나 섬(Luna Island)와 경계로 주요폭포들과 떨어져있고 미국에 속한다. 나이아가라 폭포는 세계에서 가장 높은 유량을 자랑하는 폭포이며 말굽폭포는 북미에서 가장 힘쎄고 강한 폭포이다.
                            <br /><br /><br />
                            <h4>물의 도시 이탈리아 베네치아</h4>
                            <br />
                            <div><img src="img2/베니스.jpg" style="width:90%" /></div>
                            베네치아는 이탈리아 북부 베네토 주의 주도이다. 과거 베네치아 공화국의 수도였다. 영어로는 '베니스', 독일어로는 '베네디히'라 한다. 세계적 관광지이며, 운하의 도시로도 유명하다. 베네치아만 안쪽의 석호 위에 흩어져 있는 118개의 섬들이 약 400개의 다리로 이어져 있다. 인구는 2006년 집계 당시 268,934명이며, 이 중 176,621명이 육지에 살고 있으며, 30,702명은 석호에, 61,611명은 구시가에 거주하고 있다.
                            <br /><br /><br />
                            <h4>신혼 여행의 성지 산호초 섬 몰디브</h4>
                            <div><img src="img2/몰디브.jpg" style="width:90%" /></div>
                            몰디브에 리조트들은 '지구상의 마지막 낙원'을 내세우며 관광객들을 유혹한다. 만약 낙원이라는 말에 대한 당신의 생각이 바람에 흔들리는 야자수, 깨끗한 하얀 모래사장, 반짝이는 에메랄드빛 라군 등이 있는 원시 열대림의 섬일 것이라 여긴다면 몰디브는 결코 실망시키지 않을 것이다. 이 곳은 스쿠버 다이버들이 자주 찾아와서 엄청난 산호초와 풍부한 해양세계를 탐험하는 곳이기도 하다.
                            <br /><br /><br />
                            <h4>천 개의 표정을 가진 홍콩</h4>
                            <div><img src="img2/홍콩.PNG" style="width:90%"/></div><br />
                            홍콩의 관광지는 센트럴과 코즈웨이 베이 지역이 있는 홍콩섬과 침사추이, 몽콕 지역이 있는 카우롱 반도로 크게 나눌 수 있다. 특히 수입 관세가 거의 없어 세계적으로 유명한 쇼핑 관광지가 되었다. 그리고 다양한 음식으로 식도락을 즐길 수 있는 곳이다. 야경 또한 장관이라 많은 관광객이 찾는다.
                            <br /><br /><br />
                            <h4>알로하~ 하와이</h4><br />
                            <div><img src="img2/하와이.jpg" style="width:90%" /></div>
                            미국의 주이자 태평양 한 가운데 있는 제도이며, 섬들 가운데 가장 큰 섬이 하와이라서 전체 섬들을 아울러 하와이 제도로 일컬으며, 혼동을 피하기 위해 하와이 섬은 빅 아일랜드 라는 별명으로도 불린다. 8개의 섬으로 이루어져 있으며 주로 호놀룰루 시가 속한 오아후 섬에 사람이 많이 산다.
                            <br /><br /><br />
                            <h4>예술과 낭만의 도시 파리</h4>
                            <div><img src="img2/파리.jpg" style="width:90%" /></div>
                            너무나도 유명한 예술과 낭만의 집중지 파리. 관광지로 손색없이 볼거리가 많다. 에펠탑, 사이요 궁, 트로카데로 정원, 루브르 박물관, 오르세 미술관, 센느강, 베르사유 궁전, 개선문, 샹제리제 거리, 몽마르뜨 언덕 등 구경할 거리가 아주 많다.
                            <br /><br /><br />
                            <h4>사랑의 도시 이탈리아 로마</h4>
                            <div><img src="img2/로마.jpg" style="width:90%" </div><br />
                            현대 이탈리아의 수도. 고대 로마 제국의 발원지이자 첫 번째 수도로서도 많은 사람들에게 알려져 있다. 별칭으로 잘 알려진 것이 영원의 도시, 이명은 '세계의 머리'라는 의미인 라틴어 카푸트 문디(caput mundi). 고대 로마 제국의 발원지인 만큼 고대 로마 시절의 문화, 문화유산, 관광지 등 볼거리가 많다.
                            <br /><br /><br /><br /><br /><br /><br />
                        </div>
                    </section>
                </div>
                </div>
            </div>
        </div>
 
        </form>
    </body>
    <script>
  $(document).ready(function()
    {
        var speed = 700; // 스크롤되는 속도
        $("#top_move").css("cursor", "pointer").click(function()
        {
            $('body, html').animate({scrollTop:0}, speed);
        });
        
        $(window).scroll(function() {  //탑 메뉴 보이고 사라지게 하기
        if($(this).scrollTop() > 50) {
         $('.move').fadeIn();
        } else {
         $('.move').fadeOut();
        }
       });
        
    });
</script>
</html>

