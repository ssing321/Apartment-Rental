<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {

	if (isset($_POST['submit'])) {
		$vehicletitle = $_POST['vehicletitle'];
		$brand = $_POST['brandname'];
		$vehicleoverview = $_POST['vehicalorcview'];
		$priceperday = $_POST['priceperday'];
		$fueltype = $_POST['fueltype'];
		$modelyear = $_POST['modelyear'];
		$seatingcapacity = $_POST['seatingcapacity'];
		$airconditioner = $_POST['airconditioner'];
		$powerdoorlocks = $_POST['powerdoorlocks'];
		$antilockbrakingsys = $_POST['antilockbrakingsys'];
		$brakeassist = $_POST['brakeassist'];
		$powersteering = $_POST['powersteering'];
		$driverairbag = $_POST['driverairbag'];
		$passengerairbag = $_POST['passengerairbag'];
		$powerwindow = $_POST['powerwindow'];
		$cdplayer = $_POST['cdplayer'];
		$centrallocking = $_POST['centrallocking'];
		$crashcensor = $_POST['crashcensor'];
		$leatherseats = $_POST['leatherseats'];
		$id = intval($_GET['id']);

		$sql = "update tblvehicles set VehiclesTitle=$1,VehiclesBrand=$2,VehiclesOverview=$3,PricePerDay=$4,FuelType=$5,ModelYear=$6,SeatingCapacity=$7,AirConditioner=$8,PowerDoorLocks=$9,AntiLockBrakingSystem=$10,BrakeAssist=$11,PowerSteering=$12,DriverAirbag=$13,PassengerAirbag=$14,PowerWindows=$15,CDPlayer=$16,CentralLocking=$17,CrashSensor=$18,LeatherSeats=$19 where id=$20 ";
		$results = pg_query_params($con, $sql, array($vehicletitle, $brand, $vehicleoverview, $priceperday, $fueltype, $modelyear, $seatingcapacity, $airconditioner, $powerdoorlocks, $antilockbrakingsys, $brakeassist, $powersteering, $driverairbag, $passengerairbag, $powerwindow, $cdplayer, $centrallocking, $crashcensor, $leatherseats));
		$msg = "Data updated successfully";
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

		<title>Apartment Leasing Portal | Admin Edit Apartment Info</title>

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

							<h2 class="page-title">Edit Apartment</h2>

							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">Basic Info</div>
										<div class="panel-body">
											<?php if ($msg) { ?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php } ?>
											<?php
											$id = intval($_GET['id']);
											$sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.id=$1";
											$results = pg_query_params($con, $sql, array($id));
											$cnt = 1;
											if (pg_num_rows($results) > 0) {
												while ($result = pg_fetch_array($results)) {	?>

													<form method="post" class="form-horizontal" enctype="multipart/form-data">
														<div class="form-group">
															<label class="col-sm-2 control-label">Apartment Title<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<input type="text" name="vehicletitle" class="form-control" value="<?php echo htmlentities($result[1]) ?>" required>
															</div>
															<label class="col-sm-2 control-label">Select Community<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<select class="selectpicker" name="brandname" required>
																	<option value="<?php echo htmlentities($result[29]); ?>"><?php echo htmlentities($bdname = $result[28]); ?> </option>
																	<?php $ret = "select id,BrandName from tblbrands";
																	//$query= $dbh -> prepare($ret);
																	//$query->bindParam(':id',$id, PDO::PARAM_STR);
																	// $query-> execute();
																	// $resultss = $query -> fetchAll(PDO::FETCH_OBJ);
																	$results = pg_query($con, $ret);
																	if (pg_num_rows($results) > 0) {
																		while ($result1 = pg_fetch_array($results, NULL)) {
																			if ($result1[1] == $bdname) {
																				continue;
																			} else {
																	?>
																				<option value="<?php echo htmlentities($result1[0]); ?>"><?php echo htmlentities($result1[1]); ?></option>
																	<?php }
																		}
																	} ?>

																</select>
															</div>
														</div>

														<div class="hr-dashed"></div>
														<div class="form-group">
															<label class="col-sm-2 control-label">Apartment Overview<span style="color:red">*</span></label>
															<div class="col-sm-10">
																<textarea class="form-control" name="vehicalorcview" rows="3" required><?php echo htmlentities($result[3]); ?></textarea>
															</div>
														</div>

														<div class="form-group">
															<label class="col-sm-2 control-label">Price Per Day(in USD)<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<input type="text" name="priceperday" class="form-control" value="<?php echo htmlentities($result[4]); ?>" required>
															</div>
															<label class="col-sm-2 control-label">Select Fuel Type<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<select class="selectpicker" name="fueltype" required>
																	<option value="<?php echo htmlentities($result[5]); ?>"> <?php echo htmlentities($result[5]); ?> </option>

																	<option value="Petrol">1</option>
																	<option value="Diesel">2</option>
																	<option value="CNG">3</option>
																</select>
															</div>
														</div>


														<div class="form-group">
															<label class="col-sm-2 control-label">Model Year<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<input type="text" name="modelyear" class="form-control" value="<?php echo htmlentities($result[6]); ?>" required>
															</div>
															<label class="col-sm-2 control-label">Baths<span style="color:red">*</span></label>
															<div class="col-sm-4">
																<input type="text" name="seatingcapacity" class="form-control" value="<?php echo htmlentities($result[7]); ?>" required>
															</div>
														</div>
														<div class="hr-dashed"></div>
														<div class="form-group">
															<div class="col-sm-12">
																<h4><b>Vehicle Images</b></h4>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-4">
																Image 1 <img src="img/vehicleimages/<?php echo htmlentities($result[8]); ?>" width="300" height="200" style="border:solid 1px #000">
																<a href="changeimage1.php?imgid=<?php echo htmlentities($result[0]) ?>">Change Image 1</a>
															</div>
															<div class="col-sm-4">
																Image 2<img src="img/vehicleimages/<?php echo htmlentities($result[9]); ?>" width="300" height="200" style="border:solid 1px #000">
																<a href="changeimage2.php?imgid=<?php echo htmlentities($result[0]) ?>">Change Image 2</a>
															</div>
															<div class="col-sm-4">
																Image 3<img src="img/vehicleimages/<?php echo htmlentities($result[10]); ?>" width="300" height="200" style="border:solid 1px #000">
																<a href="changeimage3.php?imgid=<?php echo htmlentities($result[0]) ?>">Change Image 3</a>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-4">
																Image 4<img src="img/vehicleimages/<?php echo htmlentities($result[11]); ?>" width="300" height="200" style="border:solid 1px #000">
																<a href="changeimage4.php?imgid=<?php echo htmlentities($result[0]) ?>">Change Image 4</a>
															</div>
															<div class="col-sm-4">
																Image 5
																<?php if ($result[12] == "") {
																	echo htmlentities("File not available");
																} else { ?>
																	<img src="img/vehicleimages/<?php echo htmlentities($result[12]); ?>" width="300" height="200" style="border:solid 1px #000">
																	<a href="changeimage5.php?imgid=<?php echo htmlentities($result[0]) ?>">Change Image 5</a>
																<?php } ?>
															</div>

														</div>
														<div class="hr-dashed"></div>
										</div>
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-default">
										<div class="panel-heading">Facilities</div>
										<div class="panel-body">


											<div class="form-group">
												<div class="col-sm-3">
													<?php if ($result[13] == 1) { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="airconditioner" checked value="1">
															<label for="inlineCheckbox1"> Game Room </label>
														</div>
													<?php } else { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="airconditioner" value="1">
															<label for="inlineCheckbox1"> Game Room </label>
														</div>
													<?php } ?>
												</div>
												<div class="col-sm-3">
													<?php if ($result[14] == 1) { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="powerdoorlocks" checked value="1">
															<label for="inlineCheckbox2"> In Unit Washer Dryers </label>
														</div>
													<?php } else { ?>
														<div class="checkbox checkbox-success checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="powerdoorlocks" value="1">
															<label for="inlineCheckbox2"> In Unit Washer Dryers </label>
														</div>
													<?php } ?>
												</div>
												<div class="col-sm-3">
													<?php if ($result[15] == 1) { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="antilockbrakingsys" checked value="1">
															<label for="inlineCheckbox3"> BBQ Fire Place </label>
														</div>
													<?php } else { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="antilockbrakingsys" value="1">
															<label for="inlineCheckbox3"> BBQ Fire Place </label>
														</div>
													<?php } ?>
												</div>
												<div class="col-sm-3">
													<?php if ($result[16] == 1) {
													?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="brakeassist" checked value="1">
															<label for="inlineCheckbox3"> Dishwasher </label>
														</div>
													<?php } else { ?>
														<div class="checkbox checkbox-inline">
															<input type="checkbox" id="inlineCheckbox1" name="brakeassist" value="1">
															<label for="inlineCheckbox3"> Dishwasher </label>
														</div>
													<?php } ?>
												</div>

												<div class="form-group">
													<?php if ($result[17] == 1) {
													?>
														<div class="col-sm-3">
															<div class="checkbox checkbox-inline">
																<input type="checkbox" id="inlineCheckbox1" name="powersteering" checked value="1">
																<label for="inlineCheckbox1"> Car Parking </label>
															</div>
														<?php } else { ?>
															<div class="col-sm-3">
																<div class="checkbox checkbox-inline">
																	<input type="checkbox" id="inlineCheckbox1" name="powersteering" value="1">
																	<label for="inlineCheckbox1"> Car Parking </label>
																</div>
															<?php } ?>
															</div>
															<div class="col-sm-3">
																<?php if ($result[18] == 1) {
																?>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" id="inlineCheckbox1" name="driverairbag" checked value="1">
																		<label for="inlineCheckbox2">Gym</label>
																	</div>
																<?php } else { ?>
																	<div class="checkbox checkbox-inline">
																		<input type="checkbox" id="inlineCheckbox1" name="driverairbag" value="1">
																		<label for="inlineCheckbox2">Gym</label>
																	<?php } ?>
																	</div>
																	<div class="col-sm-3">
																		<?php if ($result[19] == 1) {
																		?>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" id="inlineCheckbox1" name="passengerairbag" checked value="1">
																				<label for="inlineCheckbox3"> Passenger Airbag </label>
																			</div>
																		<?php } else { ?>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" id="inlineCheckbox1" name="passengerairbag" value="1">
																				<label for="inlineCheckbox3"> Gym </label>
																			</div>
																		<?php } ?>
																	</div>
																	<div class="col-sm-3">
																		<?php if ($result[20] == 1) {
																		?>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" id="inlineCheckbox1" name="powerwindow" checked value="1">
																				<label for="inlineCheckbox3"> Electricity Included </label>
																			</div>
																		<?php } else { ?>
																			<div class="checkbox checkbox-inline">
																				<input type="checkbox" id="inlineCheckbox1" name="powerwindow" value="1">
																				<label for="inlineCheckbox3"> Electricity Included </label>
																			</div>
																		<?php } ?>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-3">
																			<?php if ($result[21] == 1) {
																			?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="cdplayer" checked value="1">
																					<label for="inlineCheckbox1"> Oven </label>
																				</div>
																			<?php } else { ?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="cdplayer" value="1">
																					<label for="inlineCheckbox1"> Oven </label>
																				</div>
																			<?php } ?>
																		</div>
																		<div class="col-sm-3">
																			<?php if ($result[22] == 1) {
																			?>
																				<div class="checkbox  checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="centrallocking" checked value="1">
																					<label for="inlineCheckbox2">Carpeted</label>
																				</div>
																			<?php } else { ?>
																				<div class="checkbox checkbox-success checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="centrallocking" value="1">
																					<label for="inlineCheckbox2">Carpeted</label>
																				</div>
																			<?php } ?>
																		</div>
																		<div class="col-sm-3">
																			<?php if ($result[23] == 1) {
																			?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="crashcensor" checked value="1">
																					<label for="inlineCheckbox3"> 24x7 Residence Asssitance </label>
																				</div>
																			<?php } else { ?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="crashcensor" value="1">
																					<label for="inlineCheckbox3"> 24x7 Residence Asssitance </label>
																				</div>
																			<?php } ?>
																		</div>
																		<div class="col-sm-3">
																			<?php if ($result[24] == 1) {
																			?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="leatherseats" checked value="1">
																					<label for="inlineCheckbox3"> Leather Seats </label>
																				</div>
																			<?php } else { ?>
																				<div class="checkbox checkbox-inline">
																					<input type="checkbox" id="inlineCheckbox1" name="leatherseats" value="1">
																					<label for="inlineCheckbox3"> Leather Seats </label>
																				</div>
																			<?php } ?>
																		</div>
																	</div>

															<?php }
													} ?>


															<div class="form-group">
																<div class="col-sm-8 col-sm-offset-2">

																	<button class="btn btn-primary" name="submit" type="submit" style="margin-top:4%">Save changes</button>
																</div>
															</div>

															</form>
															</div>
														</div>
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