<?
    function create_kafedra($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->create_kafedra($data));
    }

    function delete_kafedra($data) {
        $SUNPUser = new SUNPUser();
        echo json_encode($SUNPUser->delete_kafedra($data));
    }

    function get_kafedra_folder_id($data) {
        $Materials = new SUNPMaterials();
        echo json_encode($Materials->get_kafedra_folder_id($data));
    }
?>
