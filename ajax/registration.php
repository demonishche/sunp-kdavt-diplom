<?
function is_email_exists($data){
  $data = (array)json_decode($data);
  $user = new User();
  echo $user->isEmailExists($data);
}

function new_user($data){
  $data = (array)json_decode($data);
  $user = new SUNPUser();
  echo json_encode($user->reg_user($data));
}
?>
