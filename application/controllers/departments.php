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

	public function edit($dep_id) {
		$datas['title'] = "Edit User";
		$datas['controller_name'] = strtolower(get_class());
        $datas['record_info'] = $this->Departments->get_info($dep_id);

		$this->load->view("staffs/form", $datas);
	}

	public function create() {
		$datas['title'] = "New Departments";
		$datas['controller_name'] = strtolower(get_class());
		// start to insert
		$departments = array('' => '-- Select --');
        foreach($this->Department->get_all()->result_array() as $row)
        {
            $departments[$row['department_id']] = $row['department_name'];
        }
        $datas['department']=$departments;
        // the end of insert
		$this->load->view("departments/form", $datas);
	}
    public function save($dep_id){
    	$department = array(
    				'department_name' => $this->input->post('dept_name'),
    				'description' => $this->input->post('dept_description')
    		);
    	if($this->Department->save($department,$dep_id)){
    		if($dep_id == -1)
            {
                echo json_encode(array('success'=>true,'message'=> 'Employee has been added successfully '.
                $department['department_name'].' '.$department['description'],'department_id'=>$dep_id['department_id'],
                'actions'=>'add'));
            }
            else //previous employee
            {
               echo json_encode(array('success'=>true,'message'=> 'Employee has been added successfully '.
                $department['department_name'].' '.$department['description'],'department_id'=>$dep_id['department_id'],
                'actions'=>'Update'));
            }
    	}

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