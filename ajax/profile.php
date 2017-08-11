<?
    function send_create_group_request($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->send_create_group_request($data['group_name'], $data['group_year'], $data['kafedra_id']));
    }

    function change_req_state($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->change_req_state($data['req_id'], $data['req_state']));
    }

    function send_request_to_enter_group($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->send_request_to_enter_group($data));
    }

    function send_kafedra_request($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->send_kafedra_request($data));
    }

    function accept_kafedra_request($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->accept_kafedra_request($data));
    }

    function cancel_kafedra_request($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->cancel_kafedra_request($data));
    }
?>
