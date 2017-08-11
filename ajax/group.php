<?
    function accept_user_enter_in_group($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->accept_user_enter_in_group($data));
    }

    function cancel_user_enter_in_group($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->cancel_user_enter_in_group($data));
    }

    function delete_user_from_group($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->delete_user_from_group($data));
    }

    function create_folder($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->create_folder($data['folder_name'], $data['parent'], $data['structure']));
    }

    function get_group_folder_id($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->get_group_folder_id($data));
    }

    function check_folder_name($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->check_folder_name($data['folder_name'], $data['parent'], $data['structure']));
    }

    function get_folder_path($folder_id) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->get_folder_path($folder_id));
    }

    function remove_folder($folder_id) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->remove_folder($folder_id));
    }

    function get_folder_info($folder_id) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->get_folder_info($folder_id));
    }

    function create_material($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->create_material($data['mat_name'], $data['mat_type'], $data['format'], $data['link'], $data['folder_id']));
    }

    function remove_material($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->remove_material($data));
    }

    function get_material_info($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->get_material_info($data));
    }
?>
