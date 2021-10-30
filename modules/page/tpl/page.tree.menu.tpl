<!-- BEGIN: MAIN -->
<ul class="list-unstyled">
	<!-- FOR {KEY}, {VALUE} IN {ITEMS} -->
	<li class="align-items-center">
		<a href="{VALUE.href}">{VALUE.title}</a>
		<!-- IF {VALUE.children} -->
		<ul class="list-unstyled ms-2">
			<!-- FOR {SUBCAT} IN {VALUE.children} -->
			<li class="align-items-center">
				<a href="{SUBCAT.href}">{SUBCAT.title}</a>
			</li>
			<!-- ENDFOR -->
		</ul>
		<!-- ENDIF -->
	</li>
	<!-- ENDFOR -->
</ul>
<!-- END: MAIN -->
