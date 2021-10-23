<!-- BEGIN: MAIN -->
<div>
	<ul class="uk-nav-default uk-nav-parent-icon" uk-nav>
		<!-- FOR {KEY}, {VALUE} IN {ITEMS} -->
		<li <!-- IF {VALUE.children} -->class="uk-parent"<!-- ENDIF -->>
		<a href="{VALUE.href}">{VALUE.title}</a>
		<!-- IF {VALUE.children} -->
		<ul class="uk-nav-sub">
			<!-- FOR {SUBCAT} IN {VALUE.children} -->
			<li><a href="{SUBCAT.href}">{SUBCAT.title}</a></li>
			<!-- ENDFOR -->
		</ul>
		<!-- ENDIF -->
		</li>
		<!-- ENDFOR -->
	</ul>
</div>
<!-- END: MAIN -->
