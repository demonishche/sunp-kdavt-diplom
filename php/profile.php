<?php
	function page_profile(&$tpl) {
		$SUNPUser = new SUNPUser();

	    $kafedra_list = $SUNPUser->get_kafedra_list();
	    $tpl->replaceLoop("KAFEDRA_LIST", $kafedra_list);

		$group_list = $SUNPUser->get_group_list();
	    $tpl->replaceLoop("GROUP_LIST", $group_list);

		if ($SUNPUser->get_user_post() == "student") {
			$tpl->removeBlock("ONLY_TEACHERS");

			if ($SUNPUser->is_user_creator_of_group()) {
				$tpl->removeBlock("NOT_GROUP_AND_REQUEST");
				$tpl->removeBlock("ENTER_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATE_GROUP_PROCCESSING");
				$tpl->removeBlock("IN_GROUP");
				$group_info = $SUNPUser->get_user_creator_group_info();
				$tpl->replaceVar("GROUP_NAME", $group_info['group_name']);
				$tpl->replaceVar("GROUP_ID", $group_info['group_id']);
			}
			else if ($SUNPUser->is_user_consist_in_group()) {
				$tpl->removeBlock("NOT_GROUP_AND_REQUEST");
				$tpl->removeBlock("ENTER_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATE_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATOR_GROUP");
				$group_info = $SUNPUser->get_user_consist_group_info();
				$tpl->replaceVar("GROUP_NAME", $group_info['group_name']);
				$tpl->replaceVar("GROUP_ID", $group_info['group_id']);
			}
			else if ($SUNPUser->is_user_request_to_create_group()) {
				$tpl->removeBlock("NOT_GROUP_AND_REQUEST");
				$tpl->removeBlock("ENTER_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATOR_GROUP");
				$tpl->removeBlock("IN_GROUP");
				$group_name = $SUNPUser->get_user_create_request_group()['group_name'];
				$tpl->replaceVar("GROUP_NAME", $group_name);
			}
			else if ($SUNPUser->is_user_request_to_enter_in_group()) {
				$tpl->removeBlock("NOT_GROUP_AND_REQUEST");
				$tpl->removeBlock("CREATE_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATOR_GROUP");
				$tpl->removeBlock("IN_GROUP");
				$group_name = $SUNPUser->get_user_enter_in_request_group()['group_name'];
				$tpl->replaceVar("GROUP_NAME", $group_name);
			}
			else {
				$tpl->removeBlock("ENTER_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATE_GROUP_PROCCESSING");
				$tpl->removeBlock("CREATOR_GROUP");
				$tpl->removeBlock("IN_GROUP");
			}
		}
		else {
			$tpl->removeBlock("ONLY_STUDENTS");
			if ($SUNPUser->is_user_in_kafedra_request()) {
				$tpl->removeBlock("NOT_REQUEST_TO_KAFEDRA");
				$tpl->removeBlock("IN_KAFEDRA");
				$req_data = $SUNPUser->get_kafedra_request_data_by_user()['kafedra_name'];
				$tpl->replaceVar("KAFEDRA_NAME", $req_data);
			}
			else if ($SUNPUser->is_user_in_kafedra()) {
				$tpl->removeBlock("NOT_REQUEST_TO_KAFEDRA");
				$tpl->removeBlock("ENTER_KAFEDRA_PROCCESSING");
				$kafedra_data = $SUNPUser->get_kafedra_data_by_user();
				$tpl->replaceVar("KAFEDRA_NAME", $kafedra_data['kafedra_name']);
				$tpl->replaceVar("KAFEDRA_ID", $kafedra_data['kafedra_id']);
			}
			else {
				$tpl->removeBlock("ENTER_KAFEDRA_PROCCESSING");
				$tpl->removeBlock("IN_KAFEDRA");
			}
		}
	}
?>
