<?php
if ( ! defined("BASEPATH") ) exit ("No direct script access allowed");
/**
* Taking leave request
*/
class Takeleaves extends CI_Controller
{
	
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$datas['title'] = "Takeleave Management";
		$datas['controller_name'] = strtolower(get_class());
		// var_dump($datas['controller_name']); die();
        $datas['records'] = $this->Takeleave->get_all();
        // var_dump($datas['records']); die();
		$this->load->view("takeleaves/index", $datas);
	}
	/*
      Inserts/updates an leave  request
     */
    function save($take_id=-1)
    {
        // $take_leave = array(
        //     'approved_by'=>$this->input->post('approved_by'),
        //     'start_date'=>$this->input->post('start_date'),
        //     'end_date'=>$this->input->post('end_date'),
        //     'content'=>$this->input->post('content'),            
        // );
        // if($this->Takeleave->save($take_leave,$take_id)){
        // 	 //New Takeleave
        //     if($take_id==-1)
        //     {
        //         echo json_encode(array('success'=>true,'message'=> 'Employee has been added successfully '.
        //         'take_id'=>$take_leave['take_id'],'actions'=>'add'));
                
        //         echo json_encode(array('success'=>true,'message'=> 'Employee has been added successfully '.
        //         $user_profile_data['first_name'].' '.$user_profile_data['last_name'],'user_id'=>$user_data['user_id'],
        //         'actions'=>'add'));
        //     }
        //     else //previous Take leave
        //     {
        //         echo json_encode(array('success'=>true,'message'=>'Employee has been updated successfully '.
        //         'take_id'=>$take_id,'actions'=>'update'));
        //     }
        // }
        // else//failure
        // {   
        //     echo json_encode(array('success'=>false,'message'=>'Employee cannot added/updated with successfully '.'user_id'=>-1));
        // }
    }
	public function edit($take_id) {
		$datas['title'] = "Edit User";
		$datas['controller_name'] = strtolower(get_class());
        $datas['record_info'] = $this->Takeleave->get_info($take_id);

		$this->load->view("takeleaves/form", $datas);
	}
	public function create() {
		$datas['title'] = "New Leave";
		$datas['controller_name'] = strtolower(get_class());
		$this->load->view("takeleaves/form", $datas);
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

