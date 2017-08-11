<?
function page_cab(&$tpl) {
    global $Router;
    $page = $Router->getPageByName($Router->getPage());
    $tpl->replaceVar("PAGE_TITLE", $page['page_title']);

    $SUNPUser = new SUNPUser();
    if ($SUNPUser->isUserLoggedIn()) {
        $tpl->removeBlock("NOT_LOGGED");
        if ($SUNPUser->getUserRole() != 1)
            $tpl->removeBlock("ADMIN");
    }
    else
        $tpl->removeBlock("LOGGED");

    $kafedra_list = $SUNPUser->get_kafedra_list();
    $tpl->replaceLoop("KAFEDRA_LIST", $kafedra_list);

    if ($SUNPUser->is_user_creator_of_group()) {
        $group_info = $SUNPUser->get_user_creator_group_info();
        $tpl->replaceVar("USER_GROUP_NAME", $group_info['group_name']);
        $tpl->replaceVar("USER_GROUP_ID", $group_info['group_id']);
    }
    else if ($SUNPUser->is_user_consist_in_group()) {
        $group_info = $SUNPUser->get_user_consist_group_info();
        $tpl->replaceVar("USER_GROUP_NAME", $group_info['group_name']);
        $tpl->replaceVar("USER_GROUP_ID", $group_info['group_id']);
    }
    else
        $tpl->removeBlock("USER_GROUP_LINK");

}
?>
