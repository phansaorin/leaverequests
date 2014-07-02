<?php
if ( !defined("BASEPATH") ) exit("No direct script access allowed");

class Garlleries extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$datas['title'] = "Gallery Management";
		$datas['controller_name'] = strtolower(get_class());
        $datas['records'] = $this->Gallery->get_all();
		$this->load->view("garlleries/index", $datas);
	}
}