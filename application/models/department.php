<?php

/**
* Class Department for using with department data
*/
class Department extends CI_Model
{
	
	/*
	Returns all the departments
	*/
	function get_all($col='department_name',$order='asc')
	{
		$data = $this->db
				->from("departments")
				->order_by($col, $order)
				->get();
		return $data;
	}
	/*
	Gets information about a particular employee
	*/
	function get_info($dep_id)
	{
		$query = $this->db
				->where("department_id", $dep_id)
				->get("departments");
		
		if($query->num_rows()==1)
		{
			return $query->row();
		}
		else
		{
			//Get empty base parent object, as $user_id is NOT an employee
			$obj = new stdClass();
			
			//Get all the fields from employee table
			$fields = $this->db->list_fields('departments');
			
			//append those fields to base parent object, we we have a complete empty object
			foreach ($fields as $field)
			{
				$obj->$field='';
			}
			
			return $obj;
		}
	}

}