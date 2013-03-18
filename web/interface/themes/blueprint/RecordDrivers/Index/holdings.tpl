{if !$hideLogin && $offlineMode != "ils-offline"}
  {if ($driverMode && !empty($holdings)) || $titleDriverMode}
    {if $showLoginMsg || $showTitleLoginMsg}
      <div class="userMsg">
        <a href="{$path}/MyResearch/Home?followup=true&followupModule=Record&followupAction={$id}">{translate text="Login"}</a> {translate text="hold_login"}
      </div>
    {/if}
    {if $user && !$user->cat_username}
      {include file="MyResearch/catalog-login.tpl"}
    {/if}
  {/if}
{/if}

{if $holdingTitleHold}
    <a class="holdPlace" href="{$holdingTitleHold|escape}">{translate text="title_hold_place"}</a>
{/if}

{if !empty($holdingURLs) || $holdingsOpenURL}
  <h3>{translate text="Internet"}</h3>
  {if !empty($holdingURLs)}
    {foreach from=$holdingURLs item=desc key=currentUrl name=loop}
      <a href="{if $proxy}{$proxy}/login?qurl={$currentUrl|escape:"url"}{else}{$currentUrl|escape}{/if}">{$desc|escape}</a><br/>
    {/foreach}
  {/if}
  {if $holdingsOpenURL}
    {include file="Search/openurl.tpl" openUrl=$holdingsOpenURL}
  {/if}
{/if}


{foreach from=$holdings item=holding key=location}
<!-- {$holding|@print_r} --> 
<h3>{$location|translate|escape}</h3>
<table cellpadding="2" cellspacing="0" border="0" class="citation" summary="{translate text='Holdings details from'} {translate text=$location}">
  {foreach from=$holding item=row}
	  {if $holding.0.callnumber}
	  <tr>
	    <th>{translate text="Call Number"}: </th>
	    <td>{$row.callnumber|escape}</td>
	  </tr>
	  {/if}
	  {if $holding.0.text}
      <tr>
        <th>{translate text="Text"}: </th>
        <td>{$row.text|escape}</td>
     </tr>
     {/if}
	  {if $holding.0.summary}
	  <tr>
	    <th>{translate text="Volume Holdings"}: </th>
	    <td>{foreach from=$row.summary item=summary}
	      {$summary|escape}<br>
	      {/foreach}
	    </td>
	  </tr>
	  {/if}
	  {if $holding.0.gaps}
	  <tr>
	    <th>{translate text="Gaps"}: </th>
	    <td>{foreach from=$row.gaps item=gaps}
	      {$gaps|escape}<br>
	      {/foreach}</td>
	  </tr>
	  {/if}
	  {if $holding.0.notes}
	  <tr>
	    <th>{translate text="Notes"}: </th>
	    <td>
	      {foreach from=$row.notes item=data}
	      {$data|escape}<br>
	      {/foreach}
	    </td>
	  </tr>
	  {/if}
  {/foreach}
</table>
{/foreach}

{if $history}
<h3>{translate text="Most Recent Received Issues"}</h3>
<ul>
  {foreach from=$history item=row}
  <li>{$row.issue|escape}</li>
  {/foreach}
</ul>
{/if}