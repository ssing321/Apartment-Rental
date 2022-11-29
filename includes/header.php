<header>
  <div class="default-header">
    <div class="container">
      
        
      <div class="col-sm-9 col-md-10">
      
        
        <?php if (strlen($_SESSION['login']) == 0) {
        ?>
          <div class="login_btn"> <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Login / Register</a> </div>
        <?php } else {

          echo "Welcome ";
        } ?>
      
      </div>
      
    </div>
  </div>

  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i>
                <?php
                $email = $_SESSION['login'];
                $sql = 'SELECT FullName FROM tblusers WHERE EmailId=$1';
                //$rs = pg_query($con, $query)
                // $query = $dbh->prepare($sql);
                // $query->bindParam(':email', $email, PDO::PARAM_STR);
                // $query->execute();
                $results = pg_query_params($con, $sql, array($email));
                if (pg_num_rows($results)>0) {
                  while($result = pg_fetch_array($results, NULL)) {

                    echo htmlentities($result[0]);
                  }
                } ?>
                <i class="fa fa-angle-down" aria-hidden="true"></i></a>
              <ul class="dropdown-menu">
                <?php if ($_SESSION['login']) { ?>
                  <li><a href="profile.php">Profile Settings</a></li>
                  <li><a href="update-password.php">Update Password</a></li>
                  <li><a href="my-booking.php">My Booking</a></li>
                  <li><a href="logout.php">Sign Out</a></li>
                <?php } ?>
              </ul>
            </li>
          </ul>
        </div>
        <!-- <div class="header_search">
          <div id="search_toggle"><i class="fa fa-search" aria-hidden="true"></i></div>
          <form action="search.php" method="post" id="header-search-form">
            <input type="text" placeholder="Search..." name="searchdata" class="form-control" required="true">
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
          </form>
        </div> -->
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.php">Home</a> </li>
          <li><a href="car-listing.php">Apartment Listing</a>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end -->

</header>