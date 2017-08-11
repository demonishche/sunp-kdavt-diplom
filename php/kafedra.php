<?php
	function page_kafedra(&$tpl) {
		if (!isset($_GET['id']))
			header("Location: /cab/main/");

		$id = $_GET['id'];
		$tpl->replaceVar("KAFEDRA_ID", $id);

		$page = "news";
		$SUNPUser = new SUNPUser();
		$kafedra_info = $SUNPUser->get_kafedra_info($id);
		$tpl->replaceVar("KAFEDRA_NAME", $kafedra_info['kafedra_name']);

		if (isset($_GET['sb']))
			$page = $_GET['sb'];

		if ($page == "materials") {
			$Materials = new SUNPMaterials();
			$parent_folder = 0;
			if (isset($_GET['pf']))
				$parent_folder = $_GET['pf'];

			if ($parent_folder == 0) {
				$parent_folder = $Materials->get_kafedra_folder_id($id);
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
		if ($page == "news") {
			$News = new SUNPNews();

			$news_list = $News->get_news_list('kafedra', $id);
			$tpl->replaceLoop("NEWS_LIST", $news_list);
		}
		// else if ($page == "members") {
		// 	$user_list[] = $group_info;
		// 	$user_list = array_merge($user_list, $SUNPUser->get_group_user_list($id));
		// 	$tpl->replaceLoop("USER_LIST", $user_list);
		// 	$tpl->removeBlock("REMOVE_Власник");
		// }
	}
?>
