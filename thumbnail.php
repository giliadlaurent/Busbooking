<?php
	$currDir=dirname(__FILE__);
	include("$currDir/defaultLang.php");
	include("$currDir/language.php");
	include("$currDir/lib.php");

	handle_maintenance();

	// image paths
	$p=array(   
	);

	if(!count($p)) exit;

	// receive user input
	$t=$_GET['t']; // table name
	$f=$_GET['f']; // field name
	$v=$_GET['v']; // thumbnail view type: 'tv' or 'dv'
	$i=$_GET['i']; // original image file name

	// validate input
	if(!in_array($t, array_keys($p)))  getImage();
	if(!in_array($f, array_keys($p[$t])))  getImage();
	if(!preg_match('/^[a-z0-9_-]+\.(gif|png|jpg|jpeg|jpe)$/i', $i, $m)) getImage();
	if($v!='tv' && $v!='dv')   getImage();

	$img=$p[$t][$f].$i;
	$thumb=str_replace(".$m[1]ffffgggg", "_$v.$m[1]", $img.'ffffgggg');

	// if thumbnail exists and the user is not admin, output it without rebuilding the thumbnail
	if(getImage($thumb) && !getLoggedAdmin())  exit;

	// otherwise, try to create the thumbnail and output it
	if(!createThumbnail($img, getThumbnailSpecs($t, $f, $v)))  getImage();
	if(!getImage($thumb))  getImage();

	function getImage($img = ''){
		if(!$img){ // default image to return
			$img = './photo.gif';
			$exit = true;
		}

		/* force caching */
		$last_modified = filemtime($img);
		$last_modified_gmt = gmdate('D, d M Y H:i:s', $last_modified) . ' GMT';
		$headers = (function_exists('getallheaders') ? getallheaders() : $_SERVER);
		if(isset($headers['If-Modified-Since']) && (strtotime($headers['If-Modified-Since']) == $last_modified)){
			@header("Last-Modified: {$last_modified_gmt}", true, 304);
			@header("Cache-Control: public, max-age=86400", true);
			@header('Expires:');
			exit;
		}

		$thumbInfo = @getimagesize($img);
		$fp = @fopen($img, 'rb');
		if($thumbInfo && $fp){
			@header("Last-Modified: {$last_modified_gmt}", true, 200);
			@header("Cache-Control: public, max-age=86400", true);
			@header("Content-type: {$thumbInfo['mime']}");
			@header('Expires:');
			@fpassthru($fp);
			if(!$exit) return true; else exit;
		}

		if(!$exit) return false; else exit;
	}
