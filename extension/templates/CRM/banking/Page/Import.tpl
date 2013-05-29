{debug}
<form action="/drupal/civicrm/banking/import" method="POST">
<div class="crm-block crm-form-block crm-import-datasource-form-block" id="choose-data-source">
  <h3>Select Importer</h3>
    <table class="form-layout">
      <tbody>
        <tr class="crm-import-datasource-form-block-dataSource">
          <td class="label"><label for="dataSource">Choose configuration<span title="This field is required." class="crm-marker">*</span></label>
          </td>
          <td>
            <select class="form-select required" id="banking-importer-plugin" name="importer-plugin" onchange="todo(this.value);" 
                      {if $page_mode == 'run'}disabled{/if}>
              {foreach from=$plugin_list item=field key=fieldName}
              <option value="{$field.id}">{$field.name}</option>
              {/foreach}
            </select>
          </td>
        </tr>
        <!--tr class="crm-import-datasource-form-block-dataSource">
          <td class="label"><label for="dataSource">Plugin Configuration<span title="This field is required." class="crm-marker">*</span></label>
          </td>
          <td>
            <select class="form-select required" id="banking-importer-plugin-configuration" name="importer-config" onchange="todo(this.value);" 
                      {if $page_mode == 'run'}disabled{/if}>
              <option selected="selected" value="Default">Default</option>
            </select>
          </td>
        </tr-->
    </tbody>
  </table>
</div>

<div class="crm-block crm-form-block crm-import-datasource-form-block">
  <h3>Upload File</h3>
  <table class="form-layout">
    <tbody>
      <tr>
        <td class="label">
          <label for="uploadFile">  Import Data File<span title="This field is required." class="crm-marker">*</span></label>
        </td>
        <td>
          <input type="file" class="form-file required" id="uploadFile" name="uploadFile" maxlength="255" size="30" disabled><br>
        </td>
      </tr>
    </tbody>
  </table>
</div>

<div class="crm-block crm-form-block crm-import-datasource-form-block" id="import options">
  <h3>Import Options</h3>
    <table class="form-layout">
      <tbody>
        <tr class="crm-import-datasource-form-block-dataSource">
          <td>
            <input type="checkbox" class="form-checkbox" value="on" name="dry_run" id="dry_run"
                      {if $page_mode == 'run'} disabled {/if}
                      {if $dry_run == 'on'} checked {/if}>
                    Dry run</input>
          </td>
        </tr>
        <tr class="crm-import-datasource-form-block-dataSource">
          <td>
            <input type="checkbox" class="form-checkbox" value="on" name="process" id="process" 
                      {if $page_mode == 'run'} disabled {/if}
                      {if $process == 'on'} checked {/if}>
                    Process payments right away</input>
          </td>
        </tr>
    </tbody>
  </table>
</div>

{if $page_mode == 'run'}
  <div class="crm-block crm-form-block crm-import-datasource-form-block" id="import options">
    <h3>Execution log</h3>
    <table>
      {foreach from=$log item=field}
      <tr><td>{$field[0]}</td><td>{$field[1]*100|string_format:"%.2f"}%</td><td width="80%">{$field[2]}</td></tr>
      {/foreach}
    </table>
  </div>
{/if}

  
<div class="crm-submit-buttons">
  {if $page_mode == 'config'}
  <span class="crm-button crm-button-type-upload crm-button_qf_DataSource_upload">
    <input type="submit" value="Import!" class="validate form-submit default">
  </span>
  {else}
  <a class="button" href="{$config->civiRelativeURL}civicrm/banking/payments?show=payments">
    <span align="right"><div class="icon details-icon"></div>See Results</span>
  </a>
  {/if}


  <!--span class="crm-button crm-button-type-cancel crm-button_qf_DataSource_cancel">
    <input type="submit" id="_qf_DataSource_cancel-bottom" value="Cancel" name="_qf_DataSource_cancel" class="cancel form-submit">
  </span-->
</div>
</form>
