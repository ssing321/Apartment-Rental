<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {
	if (isset($_REQUEST['eid'])) {
		$eid = intval($_GET['eid']);
		$status = 2;
		$sql = "UPDATE tblbooking SET status=$1 WHERE  id=$2";
		$results = pg_query_params($con, $sql, array($status, $eid));

		$msg = "Booking Successfully Cancelled";
	}


	if (isset($_REQUEST['aeid'])) {
		$aeid = intval($_GET['aeid']);
		$status = 1;

		$sql = "UPDATE tblbooking SET Status=$1 WHERE  id=$2";
		$results = pg_query_params($con, $sql, array($status, $aeid));

		$msg = "Booking Successfully Confirmed";
	}


?>

	<!doctype html>
	<html lang="en" class="no-js">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="theme-color" content="#3e454c">

		<title>Apartment Leasing Portal |Admin Manage Lease Details </title>

		<!-- Font awesome -->
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- Sandstone Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Bootstrap Datatables -->
		<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
		<!-- Bootstrap social button library -->
		<link rel="stylesheet" href="css/bootstrap-social.css">
		<!-- Bootstrap select -->
		<link rel="stylesheet" href="css/bootstrap-select.css">
		<!-- Bootstrap file input -->
		<link rel="stylesheet" href="css/fileinput.min.css">
		<!-- Awesome Bootstrap checkbox -->
		<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
		<!-- Admin Stye -->
		<link rel="stylesheet" href="css/style.css">
		<style>
			.errorWrap {
				padding: 10px;
				margin: 0 0 20px 0;
				background: #fff;
				border-left: 4px solid #dd3d36;
				-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
			}

			.succWrap {
				padding: 10px;
				margin: 0 0 20px 0;
				background: #fff;
				border-left: 4px solid #5cb85c;
				-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
			}
		</style>

	</head>

	<body>
		<?php include('includes/header.php'); ?>

		<div class="ts-main-content">
			<?php include('includes/leftbar.php'); ?>
			<div class="content-wrapper">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12">

							<h2 class="page-title">Manage Leasing Details</h2>

							<!-- Zero Configuration Table -->
							<div class="panel panel-default">
								<div class="panel-heading">Leasing Info</div>
								<div class="panel-body">
									<?php if ($error) { ?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } else if ($msg) { ?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php } ?>
									<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Customer Name</th>
												<th>Apartment#</th>
												<th>From Date</th>
												<th>To Date</th>
												<th>Message</th>
												<th>Status</th>
												<th>Posting date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>#</th>
												<th>Customer Name</th>
												<th>Apartment#</th>
												<th>From Date</th>
												<th>To Date</th>
												<th>Message</th>
												<th>Status</th>
												<th>Posting date</th>
												<th>Action</th>
											</tr>
										</tfoot>
										<tbody>

											<?php $sql = "SELECT tblusers.FullName,tblbrands.BrandName,tblvehicles.VehiclesTitle,tblbooking.FromDate,tblbooking.ToDate,tblbooking.message,tblbooking.VehicleId as vid,tblbooking.Status,tblbooking.PostingDate,tblbooking.id  from tblbooking join tblvehicles on tblvehicles.id=tblbooking.VehicleId join tblusers on tblusers.EmailId=tblbooking.userEmail join tblbrands on tblvehicles.VehiclesBrand=tblbrands.id  ";
											$results = pg_query($con, $sql);
											$cnt = 1;
											if (pg_num_rows($results) > 0) {
												while ($result = pg_fetch_array($results)) {		?>
													<tr>
														<td><?php echo htmlentities($cnt); ?></td>
														<td><?php echo htmlentities($result[0]); ?></td>
														<td><a href="edit-apt.php?id=<?php echo htmlentities($result[6]); ?>"><?php echo htmlentities($result[1]); ?> , <?php echo htmlentities($result[2]); ?></td>
														<td><?php echo htmlentities($result[3]); ?></td>
														<td><?php echo htmlentities($result[4]); ?></td>
														<td><?php echo htmlentities($result[5]); ?></td>
														<td><?php
															if ($result[7] == 0) {
																echo htmlentities('Not Confirmed yet');
															} else if ($result[7] == 1) {
																echo htmlentities('Confirmed');
															} else {
																echo htmlentities('Cancelled');
															}
															?></td>
														<td><?php echo htmlentities($result[8]); ?></td>
														<td><a href="manage-bookings.php?aeid=<?php echo htmlentities($result[9]); ?>" onclick="return confirm('Do you really want to Confirm this booking')"> Confirm</a> /


															<a href="manage-bookings.php?eid=<?php echo htmlentities($result[9]); ?>" onclick="return confirm('Do you really want to Cancel this Booking')"> Cancel</a>
														</td>

													</tr>
											<?php $cnt = $cnt + 1;
												}
											} ?>

										</tbody>
									</table>



								</div>
							</div>



						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- Loading Scripts -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap-select.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap.min.js"></script>
		<script src="js/Chart.min.js"></script>
		<script src="js/fileinput.js"></script>
		<script src="js/chartData.js"></script>
		<script src="js/main.js"></script>
	</body>

	</html>
<?php } ?>