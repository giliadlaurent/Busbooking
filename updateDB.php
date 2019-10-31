<?php
	// check this file's MD5 to make sure it wasn't called before
	$prevMD5=@implode('', @file(dirname(__FILE__).'/setup.md5'));
	$thisMD5=md5(@implode('', @file("./updateDB.php")));
	if($thisMD5==$prevMD5){
		$setupAlreadyRun=true;
	}else{
		// set up tables
		if(!isset($silent)){
			$silent=true;
		}

		// set up tables
		setupTable('buses', "create table if not exists `buses` (   `id` INT unsigned not null auto_increment , primary key (`id`), `number` VARCHAR(40) ) CHARSET utf8", $silent);
		setupTable('seats', "create table if not exists `seats` (   `id` INT unsigned not null auto_increment , primary key (`id`), `name` VARCHAR(40) ) CHARSET utf8", $silent);
		setupTable('availability', "create table if not exists `availability` (   `id` INT unsigned not null auto_increment , primary key (`id`), `bus` INT unsigned , `route` INT unsigned , `amount` INT unsigned , `date` DATE , `time` TIME , `status` VARCHAR(40) ) CHARSET utf8", $silent);
		setupIndexes('availability', array('bus','route'));
		setupTable('bookings', "create table if not exists `bookings` (   `id` INT unsigned not null auto_increment , primary key (`id`), `id_number` INT unsigned , `fullname` INT unsigned , `phone` INT unsigned , `bus` INT unsigned , `seat` INT unsigned , `amount` INT unsigned , `date` INT unsigned default '1' , `time` INT unsigned , `luggage` VARCHAR(40) , `date_booked` DATE ) CHARSET utf8", $silent, array( "ALTER TABLE bookings ADD `field11` VARCHAR(40)","ALTER TABLE `bookings` CHANGE `field11` `date_booked` VARCHAR(40) "," ALTER TABLE `bookings` CHANGE `date_booked` `date_booked` DATE "," ALTER TABLE `bookings` CHANGE `date_booked` `date_booked` DATE "," ALTER TABLE `bookings` CHANGE `date_booked` `date_booked` DATE "," ALTER TABLE `bookings` CHANGE `date_booked` `date_booked` DATE "));
		setupIndexes('bookings', array('id_number','bus','seat'));
		setupTable('routes', "create table if not exists `routes` (   `id` INT unsigned not null auto_increment , primary key (`id`), `name` VARCHAR(40) , `time` VARCHAR(40) , `amount` VARCHAR(40) ) CHARSET utf8", $silent);
		setupTable('customers', "create table if not exists `customers` (   `id` INT unsigned not null auto_increment , primary key (`id`), `fullname` VARCHAR(40) , `phone` VARCHAR(40) , `id_number` VARCHAR(40) ) CHARSET utf8", $silent);


		// save MD5
		if($fp=@fopen(dirname(__FILE__).'/setup.md5', 'w')){
			fwrite($fp, $thisMD5);
			fclose($fp);
		}
	}


	function setupIndexes($tableName, $arrFields){
		if(!is_array($arrFields)){
			return false;
		}

		foreach($arrFields as $fieldName){
			if(!$res=@db_query("SHOW COLUMNS FROM `$tableName` like '$fieldName'")){
				continue;
			}
			if(!$row=@db_fetch_assoc($res)){
				continue;
			}
			if($row['Key']==''){
				@db_query("ALTER TABLE `$tableName` ADD INDEX `$fieldName` (`$fieldName`)");
			}
		}
	}


	function setupTable($tableName, $createSQL='', $silent=true, $arrAlter=''){
		global $Translation;
		ob_start();

		echo '<div style="padding: 5px; border-bottom:solid 1px silver; font-family: verdana, arial; font-size: 10px;">';

		// is there a table rename query?
		if(is_array($arrAlter)){
			$matches=array();
			if(preg_match("/ALTER TABLE `(.*)` RENAME `$tableName`/", $arrAlter[0], $matches)){
				$oldTableName=$matches[1];
			}
		}

		if($res=@db_query("select count(1) from `$tableName`")){ // table already exists
			if($row = @db_fetch_array($res)){
				echo str_replace("<TableName>", $tableName, str_replace("<NumRecords>", $row[0],$Translation["table exists"]));
				if(is_array($arrAlter)){
					echo '<br>';
					foreach($arrAlter as $alter){
						if($alter!=''){
							echo "$alter ... ";
							if(!@db_query($alter)){
								echo '<span class="label label-danger">' . $Translation['failed'] . '</span>';
								echo '<div class="text-danger">' . $Translation['mysql said'] . ' ' . db_error(db_link()) . '</div>';
							}else{
								echo '<span class="label label-success">' . $Translation['ok'] . '</span>';
							}
						}
					}
				}else{
					echo $Translation["table uptodate"];
				}
			}else{
				echo str_replace("<TableName>", $tableName, $Translation["couldnt count"]);
			}
		}else{ // given tableName doesn't exist

			if($oldTableName!=''){ // if we have a table rename query
				if($ro=@db_query("select count(1) from `$oldTableName`")){ // if old table exists, rename it.
					$renameQuery=array_shift($arrAlter); // get and remove rename query

					echo "$renameQuery ... ";
					if(!@db_query($renameQuery)){
						echo '<span class="label label-danger">' . $Translation['failed'] . '</span>';
						echo '<div class="text-danger">' . $Translation['mysql said'] . ' ' . db_error(db_link()) . '</div>';
					}else{
						echo '<span class="label label-success">' . $Translation['ok'] . '</span>';
					}

					if(is_array($arrAlter)) setupTable($tableName, $createSQL, false, $arrAlter); // execute Alter queries on renamed table ...
				}else{ // if old tableName doesn't exist (nor the new one since we're here), then just create the table.
					setupTable($tableName, $createSQL, false); // no Alter queries passed ...
				}
			}else{ // tableName doesn't exist and no rename, so just create the table
				echo str_replace("<TableName>", $tableName, $Translation["creating table"]);
				if(!@db_query($createSQL)){
					echo '<span class="label label-danger">' . $Translation['failed'] . '</span>';
					echo '<div class="text-danger">' . $Translation['mysql said'] . db_error(db_link()) . '</div>';
				}else{
					echo '<span class="label label-success">' . $Translation['ok'] . '</span>';
				}
			}
		}

		echo "</div>";

		$out=ob_get_contents();
		ob_end_clean();
		if(!$silent){
			echo $out;
		}
	}
?>