<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Planner.aspx.cs" Inherits="Planner" %>

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

    <div class="container body-content">
        <div class="form-horizontal">
            <h2>플래너</h2>
            <h4>나만의 플래너를 만들어보세요</h4>
            <hr>
            <div class="map">    
                <div class="map_canvas" id="map" style="background-color:black;">      
                    <div id="floating-panel">
                        <input onclick="clearMarkers();" type="button" value="마커숨기기"/>
                        <input onclick="showMarkers();" type="button" value="마커모두보이기"/>
                        <input onclick="deleteMarkers();" type="button" value="마커지우기"/>
                    </div>
                </div>
                <div id="map_canvas" style="width:800px; height:450px;"></div>
            </div>
            
            <div style="margin-top: 20px;">
                <div style="width: 48%;">
                    <form runat="server" action="Planner.aspx" method="post">
                        <div style="display: inline; float: right;">
                            <input type="text" class="form-control" placeholder="제목을 입력하세요" name="title">   
                            <asp:button runat="server" type="submit" class="btn btn-default" OnClick="savePlan" text="저장하기"/>
                        </div>
                    
                        <table class="table" style="float: left; margin-right: 1px; width:600px">
                            <thead>
                                <tr>
                                    <th width="230px">주소</th>
                                    <th width="230px">위도</th>
                                    <th width="230px">경도</th>
                                </tr>
                            </thead>
                            <tbody id="plan"></tbody>
                        </table>
                    
                    </form>        
                </div>
                <div style="width: 48%; float: left; margin-left: 1px;">
                    <table class="table" id="plan_table">
                        <thead>
                            <tr>
                                <th width="100">제목</th>
                            </tr>
                        </thead>
                        <tbody id="load_plan"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_27EVoPwzTl0wtySSzKv9ESTlv3Uf1oc&signed_in=true&libraries=places&callback=initMap" async defer></script>
<script>
    $(document).ready(function () {
        $.ajax({
            type: "POST",
            url: "Planner.aspx/GetSomeThings",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });

        $('#logout').click(function () {

            var result = confirm('로그아웃 하시겠습니까?');

            if (result) {
                $.ajax({
                    type: "POST",
                    url: "Planner.aspx/logout",
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


        $("#plan_table").on("click", "tr", function (e) {


            if ($(this).hasClass("load_plan") == false) {
                return false;
            }
            var location = [];
            $('#plan').empty(ros);
            var lat = $(this).data('lat');
            var lng = $(this).data('lng');
            var addr = $(this).data('addr');
            for (var i = 0; i < lat.split(',').length ; i++) {
                location.push({ addr: addr.split(',')[i], lat: lat.split(',')[i], lng: lng.split(',')[i] });
                var ros = '<tr>';
                ros += '<td width="230px"><input type="text" name="plan_address" value="' + addr.split(',')[i] + '"></td>';
                ros += '<td width="230px"><input type="text" name="plan_lat" value="' + lat.split(',')[i] + '"></td>';
                ros += '<td width="230px"><input type="text" name="plan_lng" value="' + lng.split(',')[i] + '"></td></tr>';

                $('#plan').append(ros);
            }


            initMap(location);


            return false;
            
        });
    });

    function OnSuccess(response) {
        var planner = [];

               
        $.each(response.d, function (index, value) {

            if (index % 5 == 0) {
                var row = '<tr class="load_plan" id="load_plan_' + index + '" data-lat="'+value+'"></tr>';
                $('#load_plan').append(row);
            }

            if (index % 5 == 1) {
                $('#load_plan_' + (index - 1)).data('lng', value);
            }

            if (index % 5 == 2) {
                $('#load_plan_' + (index - 2)).data('addr', value);
                
            }
            
            if (index % 5 == 3) {
                var row = '<td>' + value + '</td>';
                $('#load_plan_' + (index - 3)).append(row);
            }

            if (index % 5 == 4) {
                var row = '<button class="delete_plan btn btn-default" onclick="button1_click('+value+'); return false;">삭제하기</button>';
                $('#load_plan_' + (index - 4)).append(row);
            }

        });


    }

    function button1_click(value) {

        var result = confirm('정말 삭제하시겠습니까 ? ');
        if (result) {
            $.ajax({
                type: "POST",
                url: "Planner.aspx/delete",
                data: '{id:' + value + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        } else {
            return false;
        }

        return false; 
    }

    var markers = [];
    var Coordinates= [];
    var travelPathArray = [];
    var map;

    function attachMessage(marker, latlng) {
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var lat = results[0].geometry.location.lat();
                    var lng = results[0].geometry.location.lng();
                    var address_nm = results[0].formatted_address;

                    var row = '<tr>';
                    row += '<td><input type="text" name="plan_address" value="' + address_nm + '"></td>';
                    row += '<td><input type="text" name="plan_lat" value="' + lat + '"></td>';
                    row += '<td><input type="text" name="plan_lng" value="' + lng + '"></td></tr>';

                    $('#plan').append(row);


                    var infowindow = new google.maps.InfoWindow(
                        {
                            content: address_nm,
                            size: new google.maps.Size(50, 50)
                        });
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker);
                    });
                }
            } else {
                alert('주소 가져오기 오류!');
            }
        });
    }
    function getflightPath() {
        for (i in travelPathArray) {
            travelPathArray[i].setMap(null);
        }
        var flightPath = new google.maps.Polyline (
                {
                    path: Coordinates,
                    strokeColor: "#FF0000",
                    strokeWeight: 3
                }
            );
        flightPath.setMap(map);
        travelPathArray.push(flightPath);
    }
    function setMapOnAll(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
            travelPathArray[i].setMap(map);
        }
    }
    function clearMarkers() {
        setMapOnAll(null);
    }
    function showMarkers() {
        setMapOnAll(map);
    }
    function deleteMarkers() {
        location.reload();
    }

    function initMap(location) {

        var styleArray = [
  {
      featureType: "all",
      stylers: [
       { saturation: -80 }
      ]
  }, {
      featureType: "road.arterial",
      elementType: "geometry",
      stylers: [
        { hue: "#00ffee" },
        { saturation: 50 }
      ]
  }, {
      featureType: "poi.business",
      elementType: "labels",
      stylers: [
        { visibility: "off" }
      ]
  }
        ];
        var myLatlng = new google.maps.LatLng(48.175901, 8.526680);
        var myOptions = {
            zoom: 6,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles:styleArray
        }
        map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

        if (typeof location == 'undefined') {
            google.maps.event.addListener(map, 'click', function (event) {
                var marker = new google.maps.Marker(
                    {
                        position: event.latLng,
                        map: map,
                        title: '위치마커',

                    });
                attachMessage(marker, event.latLng);
                Coordinates.push(event.latLng);
                markers.push(marker);
                getflightPath();
            });
            
        } else {
            var infowindow = new google.maps.InfoWindow();
            var marker, i;
            for (i = 0; i < location.length; i++) {  
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(location[i]['lat'], location[i]['lng']),
                    map: map
                });

                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        infowindow.setContent(location[i]['addr']);
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }

            var flightPlanCoordinates = [];
            for (i = 0; i < location.length; i++) {
                flightPlanCoordinates.push({ lat: Number(location[i]['lat']), lng: Number(location[i]['lng']) });
            }

            var flightPath = new google.maps.Polyline({
                path: flightPlanCoordinates,
                geodesic: true,
                strokeColor: '#FF0000',
                strokeOpacity: 1.0,
                strokeWeight: 2
            });
            flightPath.setMap(map);
        }
    }
</script>   
</html>
