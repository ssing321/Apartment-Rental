<?php
session_start();
include('includes/config.php');
error_reporting(0);
?>

<!DOCTYPE HTML>
<html lang="en">

<head>

  <title>Apartment Leasing Portal | Apartment Listing</title>
  <!--Bootstrap -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
  <!--Custome Style -->
  <link rel="stylesheet" href="assets/css/style.css" type="text/css">
  <!--OWL Carousel slider-->
  <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
  <link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
  <!--slick-slider -->
  <link href="assets/css/slick.css" rel="stylesheet">
  <!--bootstrap-slider -->
  <link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
  <!--FontAwesome Font Style -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">



  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>

<body>


  <!--Header-->
  <?php include('includes/header.php'); ?>
  <!-- /Header -->

  <!--Page Header-->
  <section class="page-header listing_page">
    <div class="container">
      <div class="page-header_wrap">
        <div class="page-heading">
          <h1>Apartment Listing</h1>
        </div>
        <ul class="coustom-breadcrumb">
          <li><a href="#">Home</a></li>
          <li>Apartment Listing</li>
        </ul>
      </div>
    </div>
    <!-- Dark Overlay-->
    <div class="dark-overlay"></div>
  </section>
  <!-- /Page Header-->

  <!--Listing-->
  <section class="listing-page">
    <div class="container">
      <div class="row">
        <div class="col-md-9 col-md-push-3">
          <div class="result-sorting-wrapper">
            <div class="sorting-count">
              <?php
              $sql = "SELECT id from tblvehicles";
              $results = pg_query($con, $sql);
              $cnt = pg_num_rows($results)
              ?>
              <p><span> Listings</span></p>
            </div>
          </div>

          <?php $sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand";
          $results = pg_query($con, $sql);
          $cnt = 1;
          if (pg_num_rows($results) > 0) {
            while ($result = pg_fetch_array($results)) {  ?>
              <div class="product-listing-m gray-bg">
                <div class="product-listing-img"><img src="admin/img/vehicleimages/<?php echo htmlentities($result[8]); ?>" class="img-responsive" alt="Image" /> </a>
                </div>
                <div class="product-listing-content">
                  <h5><a href="vehical-details.php?vhid=<?php echo htmlentities($result[0]); ?>"><?php echo htmlentities($result[27]); ?> , <?php echo htmlentities($result[1]); ?></a></h5>
                  <p class="list-price">$<?php echo htmlentities($result[4]); ?> Per Month</p>
                  <ul>
                    <li><i class="fa fa-bath" aria-hidden="true"></i><?php echo htmlentities($result[7]); ?> Baths</li>
                    <li><i class="fa fa-calendar" aria-hidden="true"></i><?php echo htmlentities($result[6]); ?> Built/Renovated</li>
                    <li><i class="fa fa-bed" aria-hidden="true"></i><?php echo htmlentities($result[5]); ?>Beds</li>
                  </ul>
                  <a href="vehical-details.php?vhid=<?php echo htmlentities($result[0]); ?>" class="btn">View Details <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                </div>
              </div>
          <?php }
          } ?>
        </div>

        <!--Side-Bar-->
        <aside class="col-md-3 col-md-pull-9">
          <div class="sidebar_widget">
            <div class="widget_heading">
              <h5><i class="fa fa-filter" aria-hidden="true"></i> Filter Apartments </h5>
            </div>
            <div class="sidebar_filter">
              <form action="search-carresult.php" method="post">
                <div class="form-group select">
                  <select class="form-control" name="brand">
                    <option>Select Community</option>

                    <?php $sql = "SELECT * from  tblbrands ";
                    $results = pg_query($con, $sql);
                    // $query = $dbh->prepare($sql);
                    // $query->execute();
                    // $results = $query->fetchAll(PDO::FETCH_OBJ);

                    $cnt = 1;
                    if (pg_num_rows($results) > 0) {
                      while ($result = pg_fetch_array($results)) {       ?>
                        <option value="<?php echo htmlentities($result[0]); ?>"><?php echo htmlentities($result[1]); ?></option>
                    <?php }
                    } ?>

                  </select>
                </div>
                <div class="form-group select">
                  <select class="form-control" name="fueltype">
                    <option>Select # of Beds</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                  </select>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-block"><i class="fa fa-search" aria-hidden="true"></i> Search Apartmets</button>
                </div>
              </form>
            </div>
          </div>

          
        
      </div>
    </div>
  </section>
  <!-- /Listing-->

  <!--Login-Form -->
  <?php include('includes/login.php'); ?>
  <!--/Login-Form -->

  <!--Register-Form -->
  <?php include('includes/registration.php'); ?>

  <!--/Register-Form -->

  <!--Forgot-password-Form -->
  <?php include('includes/forgotpassword.php'); ?>

  <!-- Scripts -->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/interface.js"></script>
  <!--Switcher-->
  <script src="assets/switcher/js/switcher.js"></script>
  <!--bootstrap-slider-JS-->
  <script src="assets/js/bootstrap-slider.min.js"></script>
  <!--Slider-JS-->
  <script src="assets/js/slick.min.js"></script>
  <script src="assets/js/owl.carousel.min.js"></script>

</body>

</html>