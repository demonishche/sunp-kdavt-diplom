<?
    function create_news($data) {
        $News = new SUNPNews();
        echo json_encode($News->create_news($data['title'], $data['text'], $data['struct'], $data['struct_id']));
    }
?>
