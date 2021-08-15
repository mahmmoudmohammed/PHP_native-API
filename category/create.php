<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
  
// get database connection
include_once '../config/database.php';
  
// instantiate category object
include_once '../objects/category.php';
  
$database = new Database();
$db = $database->getConnection();
  
$category = new category($db);
  
// get posted data
$data = json_decode(file_get_contents("php://input"));
  
// make sure data is not empty
// print_r (json_encode($data));
if(
    !empty($data->name) &&
    !empty($data->created)
){
  
    // set category property values
    $category->name = $data->name;
    $category->created = date('Y-m-d H:i:s');
  
    // create the category
    if($category->create()){
  
        // set response code - 201 created
        http_response_code(201);
  
        // tell the user
        echo json_encode(array("message" => "category was created."));
    }
  
    // if unable to create the category, tell the user
    else{
  
        // set response code - 503 service unavailable
        http_response_code(503);
  
        // tell the user
        echo json_encode(array("message" => "Unable to create category."));
    }
}
  
// tell the user data is incomplete
else{
  // print_r (json_encode($data));
    // set response code - 400 bad request
    http_response_code(400);
  
    // tell the user

    echo json_encode(array("message" => "Unable to create category. Data is incomplete."));
}
?>