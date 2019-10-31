<!--user widgets-->
 <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red">
                            <div class="panel-body">
                                <i class="fa fa-users fa-5x"></i>
                                <h3><?php countrecords("customers"); ?></h3>
                            </div>
                            <div class="panel-footer back-footer-red">
                                <a href="customers_view.php" style="text-decoration: none;color: white"><strong>Customers</strong></a>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-body">
                                <i class="fa fa-money fa-5x"></i>
                                <h3><?php countrecords("bookings"); ?></h3>
                            </div>
                            <div class="panel-footer back-footer-brown">
                                <a href="bookings_view.php" style="text-decoration: none;color: white"><strong>Bookings</strong></a>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-body">
                                <i class="fa fa fa-calendar fa-5x"></i>
                                <h3><?php $today=date('D/M/d/Y'); echo $today; ?></h3>
                            </div>
                            <div class="panel-footer back-footer-green">
                                <strong>Date</strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                            <div class="panel-body">
                                <i class="fa fa-user fa-5x"></i>
                                <h3><?php echo getLoggedMemberID(); ?></h3>
                            </div>
                            <div class="panel-footer back-footer-blue">
                                <a href="<?php echo PREPEND_PATH; ?>membership_profile.php" style="text-decoration:none;color: white"><strong>Account</strong></a>

                            </div>
                        </div>
                    </div>
                </div>
<!--admin widgets row-->
 <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-body">
                                <i class="fa fa-truck fa-5x"></i>
                                <h3><?php countrecords("buses"); ?></h3>
                            </div>
                            <div class="panel-footer back-footer-green">
                                <a href="buses_view.php" style="text-decoration: none;color: white"><strong>Buses</strong></a>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                            <div class="panel-body">
                                <i class="fa fa-sitemap fa-5x"></i>
                                <h3><?php countrecords("seats"); ?> </h3>
                            </div>
                            <div class="panel-footer back-footer-blue">
                                <a href="seats_view.php" style="text-decoration: none;color: white"><strong>Seats</strong></a>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red">
                            <div class="panel-body">
                                <i class="fa fa fa-check-circle fa-5x"></i>
                                <h3><?php countrecords("availability"); ?> </h3>
                            </div>
                            <div class="panel-footer back-footer-red">
                               <a href="availability_view.php" style="text-decoration: none;color: white"><strong>Availability</strong></a>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-body">
                                <i class="fa fa-road fa-5x"></i>
                                <h3><?php countrecords("routes"); ?> </h3>
                            </div>
                            <div class="panel-footer back-footer-brown">
                               <a href="routes_view.php" style="text-decoration: none;color: white"> <strong>Routes</strong></a>

                            </div>
                        </div>
                    </div>
                </div>
                <!--row ends here-->
                <?php 
                $currentuser=getLoggedMemberID();
                if ($currentuser=="admin") {
                    # code...
                    include("main-admin.php");
                }
                 ?>
                