<?php
	function page_group(&$tpl) {
		if (!isset($_GET['id']))
			header("Location: /cab/main/");

		$id = $_GET['id'];
		$access = "member";
		$page = "news";
		$SUNPUser = new SUNPUser();
		$Materials = new SUNPMaterials();
		if ($SUNPUser->is_user_creator_of_group_by_id($id))
			$access = "creator";
		else if (!$SUNPUser->is_user_in_group($id))
			header("Location: /cab/main/");
		if ($access == "member")
			$tpl->removeBlock("GROUP_CREATOR");

		$tpl->replaceVar("GROUP_ID", $id);
		$group_info = $SUNPUser->get_group_info_by_group_id($id);

		if (isset($_GET['sb'])) {
			$page = $_GET['sb'];
		}
		if ($page == "materials") {
			$parent_folder = 0;
			if (isset($_GET['pf']))
				$parent_folder = $_GET['pf'];

			if ($parent_folder == 0) {
				$parent_folder = $Materials->get_group_folder_id($id);
				$tpl->removeBlock("END_FOLDER_BREADCRUMB");
				$tpl->removeBlock("INIT_FOLDER_BREADCRUMB");
			}
			else {
				$breadcrumbs = $Materials->get_folder_breadcrumbs($parent_folder);
				unset($breadcrumbs[0]);
				$end_breadcrumb = $breadcrumbs[count($breadcrumbs)];
				unset($breadcrumbs[count($breadcrumbs)]);
				if (count($breadcrumbs) == 0)
					$tpl->removeBlock("BREADCRUMBS");
				$tpl->replaceLoop("BREADCRUMBS", $breadcrumbs);
				$tpl->replaceVar("END_BREADCRUMB", $end_breadcrumb['folder_name']);
			}
			$folders = $Materials->get_child_folders($parent_folder);
			$tpl->replaceLoop("FOLDERS", $folders);

			$materials = $Materials->get_materials($parent_folder);
			$tpl->replaceLoop("MATERIALS", $materials);

		}
		else if ($page == "news") {
			$News = new SUNPNews();

			$news_list = $News->get_news_list('group', $id);
			$tpl->replaceLoop("NEWS_LIST", $news_list);
		}
		else if ($page == "members") {
			$user_list[] = $group_info;
			$user_list = array_merge($user_list, $SUNPUser->get_group_user_list($id));
			$tpl->replaceLoop("USER_LIST", $user_list);
			$tpl->removeBlock("REMOVE_Власник");
		}
		else if ($page == "requests") {
			if ($access == "creator") {
				$requsets_list = $SUNPUser->get_requests_to_enter_group($id);
				$tpl->replaceLoop("REQUESTS_LIST", $requsets_list);
			}
			else
				header("Location: /cab/group/?id=".$id);
		}
	}
?>
