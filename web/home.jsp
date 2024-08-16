<%-- 
    Document   : home
    Created on : Jan 27, 2024, 8:30:15 AM
    Author     : aayus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>GOingGREEN</title>
        <link rel="stylesheet" href="styles/home.css" />
        <link rel="icon" href="image/logo.png" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    </head>

    <body>
        <div id="nav">
            <img src="image/logo.png" title="logo" alt="image not available" />
            <a href="home.html">
                <h4>HOME</h4>
            </a>
            <a href="#first_body2">
                <h4>ABOUT US</h4>
            </a>
            <a href="#about-us-in">
                <h4>SEsRVICES</h4>
            </a>
            <a href="#f2">
                <h4>CONTACT</h4>
            </a>
            <a href="ed_page.html">
                <h4>Learn More</h4>
            </a>
            <video autoplay loop muted src="image/bg_video.mp4" ></video>

            <%
                HttpSession login_check = request.getSession(false);
                String temp = (String) login_check.getAttribute("user_id");
                boolean user_status = (boolean) login_check.getAttribute("logged");
                String user_name = (String) request.getAttribute("user_name");
                if (!user_status) {
            %>
            <a href="login.html">
                <h4>Login &nbsp;&nbsp;</h4>
                <i class="fas fa-user fa-lg"> </i>
            </a>
            <%
            } else {
            %>
            <a href="logoutMap">
                <h4>LogOut</h4>
            </a>
            <span>
                <h4><%= user_name%> &nbsp;&nbsp;</h4>
                <i class="fas fa-user fa-lg"> </i>
            </span>
            <%
                }
            %>
        </div>

        <!-- <video autoplay loop muted src="video_bg.mp4" ></video> -->

        <div id="main">
            <div id="first_body1">
                <h1>BUY. COLLABORATE. BUILD</h1>
                <h2>BEGIN WITH US</h2>
                <h2><i>GOingGREEN</i></h2>

                <p>
                    GgAgro features an online marketplace showcasing cutting-edge greenhouse technologies,
                    equipment, and smart farming solutions, with a focus on verified vendors and product quality.
                    The platform goes beyond transactions, providing a space for education through online courses,
                    workshops, and webinars led by industry experts.
                </p>

            </div>
            <div id="first_body2">



                <p>
                    GgAgro is an innovative platform that leverages greenhouse technology and greenhouse
                    products to revolutionize urban agriculture and contribute to building a smart city.
                    By enabling year-round cultivation of fresh, organic produce in controlled environments,
                    GgAgro empowers urban residents to access locally grown, sustainable food sources.
                    Through collaborative partnerships and a comprehensive marketplace for greenhouse
                    products, GgAgro facilitates community engagement and supports the growth of green
                    businesses.
                </p>
                <img id="colon1" src="https://eiwgew27fhz.exactdn.com/wp-content/themes/puttosaurus/img/quote-left.svg"
                     alt="" />
                <img id="colon2" src="https://eiwgew27fhz.exactdn.com/wp-content/themes/puttosaurus/img/quote-right.svg"
                     alt="" />
            </div>
            <div id="about-us">

                <div id="about-us-in">
                    <h3>OUR SERVICES</h3>

                </div>

            </div>

            <div id="cards-container">
                <div class="card" id="card1">
                    <a href="product-preview-page.html">
                        <div class="overlay">
                            <h4>Buy Our Products</h4>
                            <p>
                                Craving a bounty of premium, farm-fresh greenhouse goodies?
                                Click here to explore our online marketplace.
                            </p>
                        </div>
                    </a>
                </div>
                <div class="card" id="card2">
                    <a href="collaborate_page.html">
                        <div class="overlay">
                            <h4>Collaborate To Sell</h4>
                            <p>
                                Interested in expanding your reach and selling your greenhouse products on our thriving
                                marketplace?
                                Click Here to explore Collaboration opportunities.
                            </p>
                        </div>
                    </a>
                </div>
                <div class="card" id="card3">
                    <a href="build_page.html">
                        <div class="overlay">
                            <h4>Build Your Dream</h4>
                            <p>
                                Ready to turn your greenhouse dreams into reality?
                                Click Here to construct your dream greenhouse from ground up using our top-quality services.
                            </p>
                        </div>
                    </a>
                </div>
            </div>

            <div id="footer">
                <div id="foot-logo">
                    <img src="image/logo.png" title="logo" alt="image not available" />
                </div>
                <div id="f1">
                    <img src="https://eiwgew27fhz.exactdn.com/wp-content/uploads/2023/02/logo-white.svg" alt="" />
                </div>
                <div id="f2">
                    <h3>Buy Our Products</h3>
                    <h3>Collab With Us</h3>
                    <h3>Install Green House</h3>
                </div>

                <div id="f4">
                    <h4>
                        +977 9768433005 <br />
                        +977 014253<br />
                        KamalPokhari, Kathmandu <br />
                        BR7 6RP <br />
                        GET DIRECTIONS <br />
                    </h4>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
