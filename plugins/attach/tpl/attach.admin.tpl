<!-- BEGIN: MAIN -->
<script src="{PHP.cfg.plugins_dir}/attach/assets/js/attach.admin.js" type="text/javascript"></script>	

<div id="catgenerator" style="display:none">
    <table class="cells">
        <tr>
            <td class="coltop width10">{PHP.L.Extension}</td>
            <td class="coltop width20">{PHP.L.Category}</td>
            <td class="coltop width20">{PHP.L.Path}</td>
            <td class="coltop width5">{PHP.L.att_req}</td>
            <td class="coltop width15">{PHP.L.att_fileext}</td>
            <td class="coltop width10">{PHP.L.att_size}</td>
            <td class="coltop width5">&nbsp;</td>
        </tr>
        <tr class="newscat" style="display: none;">
            <td><input type="text" class="text ca_ext" name="ca_ext" value="" size="12" maxlength="255" /></td>
            <td><input type="text" class="text ca_cat" name="ca_cat" value="" size="12" maxlength="255" /></td>
            <td><input type="text" class="text ca_path" name="ca_path" value="" size="12" maxlength="255" /></td>
            <td><input type="checkbox" class="ca_req" name="ca_req" value=""/></td>
            <td>
                <select class="text ca_fileext" name="ca_ext">
                    <option value="">Все файлы</option>
                    <option value="image/*">Только картинки</option>
                    <option value="application/x-rar-compressed,application/zip, application/octet-stream">Только Архивы</option>
                    <option value="application/msword,application/pdf,application/mspowerpoint,application/powerpoint,application/mspowerpoint,application/octet-stream,text/plain">Только Документы</option>
                </select>
            </td>
            <td><input type="text" class="text ca_size" name="ca_size" value="" size="2" maxlength="255" /></td>
            <td><a href="#" class="deloption negative button trash icon" style="display:none">{PHP.L.Delete}</a></td>
        </tr>
        <!-- BEGIN: ADDITIONAL -->
        <tr class="newscat">
            <td><input type="text" class="text ca_ext" name="ca_ext" value="{ADDMODULE}" size="12" maxlength="255" /></td>
            <td><input type="text" class="text ca_cat" name="ca_cat" value="{ADDCATEGORY}" size="12" maxlength="255" /></td>
            <td><input type="text" class="text ca_path" name="ca_path" value="{ADDPATH}" size="12" maxlength="255" /></td>
            <td><input type="checkbox" class="ca_req" name="ca_req" value="{ADDREQ}" <!-- IF {ADDREQ} -->checked="checked"<!-- ENDIF --> /></td>
            <td>
                <select class="text ca_fileext" name="ca_ext">
                    <option value="" <!-- IF !{ADDEXT} -->selected<!-- ENDIF -->>Все файлы</option>
                    <option value="image/*" <!-- IF {ADDEXT} == "image/*" -->selected<!-- ENDIF -->>Только картинки</option>
                    <option value="application/x-rar-compressed,application/zip, application/octet-stream" <!-- IF {ADDEXT} == "application/x-rar-compressed,application/zip, application/octet-stream" -->selected<!-- ENDIF -->>Только Архивы</option>
                    <option value="application/msword,application/pdf,application/mspowerpoint,application/powerpoint,application/mspowerpoint,application/octet-stream,text/plain" <!-- IF {ADDEXT} == "application/msword,application/pdf,application/mspowerpoint,application/powerpoint,application/mspowerpoint,application/octet-stream,text/plain" -->selected<!-- ENDIF -->>Только Документы</option>
                </select>
            </td>
            <td><input type="text" class="text ca_size" name="ca_size" value="{ADDMAX}" size="2" maxlength="255" /></td>
            <td><a href="#" class="deloption negative button trash icon" style="display:none">{PHP.L.Delete}</a></td>
        </tr>
        <!-- END: ADDITIONAL -->
        <tr id="addtr">
            <td class="valid" colspan="8"><button name="addoption" id="addoption" type="button">{PHP.L.Add}</button></td>
        </tr>
    </table>
</div>
<!-- END: MAIN -->