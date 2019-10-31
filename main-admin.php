<div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span class="fa fa-bell"> <strong>Bookings Due Today</strong></span>
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID No.</th>
                                                <th>FullName</th>
                                                <th>Phone</th>
                                                <th>Bus</th>
                                                <th>Seat</th>
                                                <th>Date</th>
                                                <th>DepartureTime</th>
                                                <th>Amount</th>
                                                <th>DateBooked</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php duetoday("bookings");?>
                                        </tbody>
                                    </table>
                                    <a href="http://localhost/busbooking/bookings_view.php?SortField=&SortDirection=&FilterAnd%5B1%5D=and&FilterField%5B1%5D=8&FilterOperator%5B1%5D=like&FilterValue%5B1%5D=<?php $today=date('m%/d%/Y'); echo $today;?>" class="btn btn-info btn-block fa fa-list">See All Due Today</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>