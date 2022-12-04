<?php
session_start();
include('includes/config.php');
error_reporting(0);
if (isset($_POST['submit'])) {
  $fromdate = $_POST['fromdate'];
  $todate = $_POST['todate'];
  $message = $_POST['message'];
  $useremail = $_SESSION['login'];
  $status = 0;
  $vhid = $_GET['vhid'];
  $sql = "INSERT INTO  tblbooking(userEmail,VehicleId,FromDate,ToDate,message,Status) VALUES($useremail,$vhid,$fromdate,$todate,$message,$status)";
  // $query = $dbh->prepare($sql);
  // $query->bindParam(':useremail', $useremail, PDO::PARAM_STR);
  // $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
  // $query->bindParam(':fromdate', $fromdate, PDO::PARAM_STR);
  // $query->bindParam(':todate', $todate, PDO::PARAM_STR);
  // $query->bindParam(':message', $message, PDO::PARAM_STR);
  // $query->bindParam(':status', $status, PDO::PARAM_STR);
  // $query->execute();
  $results = pg_query_params($con, $sql, array($useremail, $vhid,$fromdate,$todate,$message,$status));
  $result = pg_fetch_array($results);
  if ($result) {
    echo "<script>alert('Booking successfull.');</script>";
  } else {
    echo "<script>alert('Something went wrong. Please try again');</script>";
  }
}

?>


<!DOCTYPE HTML>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <title>Apartment Leasing Port | Apartment Details</title>
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

  <!-- Start Switcher -->
  <?php include('includes/colorswitcher.php'); ?>
  <!-- /Switcher -->

  <!--Header-->
  <?php include('includes/header.php'); ?>
  <!-- /Header -->

  <!--Listing-Image-Slider-->

  <?php
  $vhid = intval($_GET['vhid']);
  $sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.id=$1";
  // $query = $dbh->prepare($sql);
  // $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
  // $query->execute();
  // $results = $query->fetchAll(PDO::FETCH_OBJ);
  $results = pg_query_params($con, $sql, array($vhid));
  $cnt = 1;
  if (pg_num_rows($results)>0) {
    while ($result = pg_fetch_array($results)) {
      $_SESSION['brndid'] = $result[29];
  ?>

      <section id="listing_img_slider">
        <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result[8]); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
        <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result[9]); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
        <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result[10]); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
        <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result[11]); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
        <?php if ($result[12] == "") {
        } else {
        ?>
          <div><img src="admin/img/vehicleimages/<?php echo htmlentities($result[12]); ?>" class="img-responsive" alt="image" width="900" height="560"></div>
        <?php } ?>
      </section>
      <!--/Listing-Image-Slider-->


      <!--Listing-detail-->
      <section class="listing-detail">
        <div class="container">
          <div class="listing_detail_head row">
            <div class="col-md-9">
              <h2><?php echo htmlentities($result[27]); ?> , <?php echo htmlentities($result[1]); ?></h2>
            </div>
            <div class="col-md-3">
              <div class="price_info">
                <p>$<?php echo htmlentities($result[4]); ?> </p>per month

              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-9">
              <div class="main_features">
                <ul>

                  <li> <i class="fa fa-calendar" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result[6]); ?></h5>
                    <p>Built/Renovated Year</p>
                  </li>
                  <li> <i class="fa fa-bed" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result[5]); ?></h5>
                    <p>Beds</p>
                  </li>

                  <li> <i class="fa fa-bath" aria-hidden="true"></i>
                    <h5><?php echo htmlentities($result[7]); ?></h5>
                    <p>Baths</p>
                  </li>
                </ul>
              </div>
              <div class="listing_more_info">
                <div class="listing_detail_wrap">
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs gray-bg" role="tablist">
                    <li role="presentation" class="active"><a href="#vehicle-overview " aria-controls="vehicle-overview" role="tab" data-toggle="tab">Apartment Overview </a></li>

                    <li role="presentation"><a href="#accessories" aria-controls="accessories" role="tab" data-toggle="tab">Facilities</a></li>
                  </ul>

                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- vehicle-overview -->
                    <div role="tabpanel" class="tab-pane active" id="vehicle-overview">

                      <p><?php echo htmlentities($result[3]); ?></p>
                    </div>


                    <!-- Accessories -->
                    <div role="tabpanel" class="tab-pane" id="accessories">
                      <!--Accessories-->
                      <table>
                        <thead>
                          <tr>
                            <th colspan="2">Facility</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Game Room</td>
                            <?php if ($result[13] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>In Unit Washer Dryer</td>
                            <?php if ($result[14] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>BBQ Fire Place</td>
                            <?php if ($result[15] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>


                          <tr>

                            <td>Dishwasher</td>

                            <?php if ($result[16] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Car Parking</td>
                            <?php if ($result[17] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Gym</td>
                            <?php if ($result[18] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Wifi</td>
                            <?php if ($result[19] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Electricity Included</td>
                            <?php if ($result[20] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>
                          <tr>
                            <td>Oven</td>
                            <?php if ($result[21] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php  } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Carpeted</td>
                            <?php if ($result[22] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>24x7 Residence Asssitance</td>
                            <?php if ($result[23] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                          <tr>
                            <td>Furnished</td>
                            <?php if ($result[24] == 1) {
                            ?>
                              <td><i class="fa fa-check" aria-hidden="true"></i></td>
                            <?php } else { ?>
                              <td><i class="fa fa-close" aria-hidden="true"></i></td>
                            <?php } ?>
                          </tr>

                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

              </div>
          <?php }
      } ?>

            </div>

            <!--Side-Bar-->
            <aside class="col-md-3">

              <div class="sidebar_widget">
                <div class="widget_heading">
                  <h5><i class="fa fa-envelope" aria-hidden="true"></i>Book Now</h5>
                </div>
                <form method="post">
                  <div class="form-group">
                    <input type="text" class="form-control" name="fromdate" placeholder="From Date(dd/mm/yyyy)" required>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" name="todate" placeholder="To Date(dd/mm/yyyy)" required>
                  </div>
                  <div class="form-group">
                    <textarea rows="4" class="form-control" name="message" placeholder="Message" required></textarea>
                  </div>
                  <?php if ($_SESSION['login']) { ?>
                    <div class="form-group">
                      <input type="submit" class="btn" name="submit" value="Book Now">
                    </div>
                  <?php } else { ?>
                    <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">Login For Book</a>

                  <?php } ?>
                </form>
              </div>
            </aside>
            <!--/Side-Bar-->
          </div>

          <div class="space-20"></div>
          <div class="divider"></div>

        </div>
      </section>
      <!--/Listing-detail-->
      <!--Login-Form -->
      <?php include('includes/login.php'); ?>
      <!--/Login-Form -->

      <!--Register-Form -->
      <?php include('includes/registration.php'); ?>

      <!--/Register-Form -->

      <!--Forgot-password-Form -->
      <?php include('includes/forgotpassword.php'); ?>

      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/bootstrap.min.js"></script>
      <script src="assets/js/interface.js"></script>
      <script src="assets/switcher/js/switcher.js"></script>
      <script src="assets/js/bootstrap-slider.min.js"></script>
      <script src="assets/js/slick.min.js"></script>
      <script src="assets/js/owl.carousel.min.js"></script>

</body>

</html>