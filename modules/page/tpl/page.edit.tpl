<!-- BEGIN: MAIN -->
<div class="uk-container uk-margin-top">
	<div>
		{BREADCRUMBS}
	</div>
</div>
<div class="uk-container uk-container-small">
	{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
	<div>
		<form action="{PAGEEDIT_FORM_SEND}" enctype="multipart/form-data" method="post" name="pageform">
			<div class="uk-card uk-card-small uk-card-default">
				<div class="uk-card-header">
					<!-- IF {PHP.m} == 'edit' -->
					<h3>{PHP.L.page_edittitle}</h3>
					<!-- ELSE -->
					<h3>{PHP.L.page_addtitle}</h3>
					<!-- ENDIF -->
				</div>
				<div class="uk-card-body">
					<div class="tm-section-label">{PHP.L.General}</div>
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.Category}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_CAT}</div>
					</div>
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.Title}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_TITLE}</div>
					</div>
					<!-- IF {PHP.usr.isadmin} -->
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.Alias}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_ALIAS}</div>
					</div>
					<!-- ENDIF -->
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.Description}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_DESC}</div>
					</div>
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.Text}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_TEXT}</div>
					</div>
					<!-- BEGIN: TAGS -->
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PAGEEDIT_TOP_TAGS}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_TAGS} ({PAGEEDIT_TOP_TAGS_HINT})</div>
					</div>
					<!-- END: TAGS -->
					<div class="tm-section-label uk-margin-top">{PHP.L.Pictures}</div>
					<div>
						<!-- IF {PHP.m} == 'edit' -->
						{PAGEEDIT_FORM_ID|cot_attach_form("images", $this)}
						<!-- ELSE -->
						{PHP|cot_attach_form("images")}
						<!-- ENDIF -->
					</div>
					<!-- IF {PHP.usr.isadmin} && {PHP.m} == 'edit' -->
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m">{PHP.L.page_deletepage}:</div>
						<div class="uk-width-3-4@m">{PAGEEDIT_FORM_DELETE}</div>
					</div>
					<!-- ENDIF -->
					<div class="uk-grid uk-margin-top" uk-grid>
						<div class="uk-width-1-4@m"></div>
						<div class="uk-width-3-4@m">
							<button type="submit" class="uk-button uk-button-small uk-button-primary">{PHP.L.Submit}</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- END: MAIN -->


		<div class="block">
			<h2 class="page">{PAGEEDIT_PAGETITLE} #{PAGEEDIT_FORM_ID}</h2>
			{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}
			<form action="{PAGEEDIT_FORM_SEND}" enctype="multipart/form-data" method="post" name="pageform">
				<table class="cells">
					<tr>
						<td class="width30">{PHP.L.Category}:</td>
						<td class="width70">{PAGEEDIT_FORM_CAT}</td>
					</tr>
					<tr>
						<td>{PHP.L.Title}:</td>
						<td>{PAGEEDIT_FORM_TITLE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Description}:</td>
						<td>{PAGEEDIT_FORM_DESC}</td>
					</tr>
					<tr>
						<td>{PHP.L.Author}:</td>
						<td>{PAGEEDIT_FORM_AUTHOR}</td>
					</tr>
					<tr>
						<td>{PHP.L.Date}:</td>
						<td>
							{PAGEEDIT_FORM_DATE}
							<p class="small">{PAGEEDIT_FORM_DATENOW} {PHP.L.page_date_now}</p>
						</td>
					</tr>
					<tr>
						<td>{PHP.L.Begin}:</td>
						<td>{PAGEEDIT_FORM_BEGIN}</td>
					</tr>
					<tr>
						<td>{PHP.L.Expire}:</td>
						<td>{PAGEEDIT_FORM_EXPIRE}</td>
					</tr>
					<tr>
						<td>{PHP.L.Status}:</td>
						<td>{PAGEEDIT_FORM_LOCALSTATUS}</td>
					</tr>
					<tr>
						<td>{PHP.L.Alias}:</td>
						<td>{PAGEEDIT_FORM_ALIAS}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_metakeywords}:</td>
						<td>{PAGEEDIT_FORM_KEYWORDS}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_metatitle}:</td>
						<td>{PAGEEDIT_FORM_METATITLE}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_metadesc}:</td>
						<td>{PAGEEDIT_FORM_METADESC}</td>
					</tr>
<!-- BEGIN: TAGS -->
					<tr>
						<td>{PAGEEDIT_TOP_TAGS}:</td>
						<td>{PAGEEDIT_FORM_TAGS} ({PAGEEDIT_TOP_TAGS_HINT})</td>
					</tr>
<!-- END: TAGS -->
<!-- BEGIN: ADMIN -->
					<tr>
						<td>{PHP.L.Owner}:</td>
						<td>{PAGEEDIT_FORM_OWNERID}</td>
					</tr>
					<tr>
						<td>{PHP.L.Hits}:</td>
						<td>{PAGEEDIT_FORM_PAGECOUNT}</td>
					</tr>
<!-- END: ADMIN -->
					<tr>
						<td>{PHP.L.Parser}:</td>
						<td>{PAGEEDIT_FORM_PARSER}</td>
					</tr>
					<tr>
						<td colspan="2">
							{PAGEEDIT_FORM_TEXT}
							<!-- IF {PAGEEDIT_FORM_PFS} -->{PAGEEDIT_FORM_PFS}<!-- ENDIF -->
							<!-- IF {PAGEEDIT_FORM_SFS} --><span class="spaced">{PHP.cfg.separator}</span>{PAGEEDIT_FORM_SFS}<!-- ENDIF -->
						</td>
					</tr>
					<tr>
						<td>{PHP.L.page_file}:<br />
							{PHP.themelang.pageadd.Filehint}</td>
						<td>{PAGEEDIT_FORM_FILE}</td>
					</tr>
					<tr>
						<td>{PHP.L.URL}:<br />{PHP.L.page_urlhint}</td>
						<td>{PAGEEDIT_FORM_URL}<br />{PAGEEDIT_FORM_URL_PFS} &nbsp; {PAGEEDIT_FORM_URL_SFS}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_filesize}:<br />{PHP.L.page_filesizehint}</td>
						<td>{PAGEEDIT_FORM_SIZE}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_filehitcount}:<br />{PHP.L.page_filehitcounthint}</td>
						<td>{PAGEEDIT_FORM_FILECOUNT}</td>
					</tr>
					<tr>
						<td>{PHP.L.page_deletepage}:</td>
						<td>{PAGEEDIT_FORM_DELETE}</td>
					</tr>
					<tr>
						<td colspan="2" class="valid">
							<!-- IF {PHP.usr_can_publish} -->
							<button type="submit" name="rpagestate" value="0">{PHP.L.Publish}</button>
							<!-- ENDIF -->
							<button type="submit" name="rpagestate" value="2" class="submit">{PHP.L.Saveasdraft}</button>
							<button type="submit" name="rpagestate" value="1">{PHP.L.Submitforapproval}</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
