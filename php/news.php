<?php
	function page_news(&$tpl) {
		$id = $_GET['id'];
		$News = new SUNPNews();
		$news = $News->get_news($id);

		

		$tpl->replaceVarArr($news);
	}
?>
