<?php
if ( !defined("BASEPATH") ) exit("No direct script access allowed");

class Departments extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$datas['title'] = "Department Management";
		$datas['controller_name'] = strtolower(get_class());
        $datas['records'] = $this->Department->get_all();
		$this->load->view("departments/index", $datas);
	}

	public function edit($user_id) {
		$datas['title'] = "Edit User";
		$datas['controller_name'] = strtolower(get_class());
        $datas['record_info'] = $this->Departments->get_info($user_id);

		$this->load->view("staffs/form", $datas);
	}

	public function create() {
		$datas['title'] = "New Departments";
		$datas['controller_name'] = strtolower(get_class());

		$this->load->view("departments/form", $datas);
	}

	/*
    This delete employee from the users table
    */
    function delete($user_id) {
        if ($this->Employee->delete($user_id)) {
            echo json_encode(array('success' => true, 'message' => 'Delete successfully ' .
                count($user_id) . ' employee(s)'));
        } else {
            echo json_encode(array('success' => false, 'message' => 'Deleting was error, delete was failed'));
        }
    }

}