# Widgetic API Gateway Bash client

## Overview

This is a Bash client script for accessing Widgetic API Gateway service.

The script uses cURL underneath for making all REST calls.

## Usage

```shell
# Make sure the script has executable rights
$ chmod u+x client.sh

# Print the list of operations available on the service
$ ./client.sh -h

# Print the service description
$ ./client.sh --about

# Print detailed information about specific operation
$ ./client.sh <operationId> -h

# Make GET request
./client.sh --host http://<hostname>:<port> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make GET request using arbitrary curl options (must be passed before <operationId>) to an SSL service using username:password
client.sh -k -sS --tlsv1.2 --host https://<hostname> -u <user>:<password> --accept xml <operationId> <queryParam1>=<value1> <header_key1>:<header_value2>

# Make POST request
$ echo '<body_content>' | client.sh --host <hostname> --content-type json <operationId> -

# Make POST request with simple JSON content, e.g.:
# {
#   "key1": "value1",
#   "key2": "value2",
#   "key3": 23
# }
$ echo '<body_content>' | client.sh --host <hostname> --content-type json <operationId> key1==value1 key2=value2 key3:=23 -

# Make POST request with form data
$ client.sh --host <hostname> <operationId> key1:=value1 key2:=value2 key3:=23

# Preview the cURL command without actually executing it
$ client.sh --host http://<hostname>:<port> --dry-run <operationid>

```

## Docker image

You can easily create a Docker image containing a preconfigured environment
for using the REST Bash client including working autocompletion and short
welcome message with basic instructions, using the generated Dockerfile:

```shell
docker build -t my-rest-client .
docker run -it my-rest-client
```

By default you will be logged into a Zsh environment which has much more
advanced auto completion, but you can switch to Bash, where basic autocompletion
is also available.

## Shell completion

### Bash

The generated bash-completion script can be either directly loaded to the current Bash session using:

```shell
source client.sh.bash-completion
```

Alternatively, the script can be copied to the `/etc/bash-completion.d` (or on OSX with Homebrew to `/usr/local/etc/bash-completion.d`):

```shell
sudo cp client.sh.bash-completion /etc/bash-completion.d/client.sh
```

#### OS X

On OSX you might need to install bash-completion using Homebrew:

```shell
brew install bash-completion
```

and add the following to the `~/.bashrc`:

```shell
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

### Zsh

In Zsh, the generated `_client.sh` Zsh completion file must be copied to one of the folders under `$FPATH` variable.

## Documentation for API Endpoints

All URIs are relative to */v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CanvasesApi* | [**createCanvas_0**](docs/CanvasesApi.md#createcanvas_0) | **POST** /canvases | Create Canvas
*CanvasesApi* | [**deleteCanvas_0**](docs/CanvasesApi.md#deletecanvas_0) | **DELETE** /canvases/{id} | Delete Canvas
*CanvasesApi* | [**getAllCanvases_0**](docs/CanvasesApi.md#getallcanvases_0) | **GET** /canvases | Get All Canvases
*CanvasesApi* | [**getCanvas_0**](docs/CanvasesApi.md#getcanvas_0) | **GET** /canvases/{id} | Get Canvas
*CanvasesApi* | [**updateCanvas_0**](docs/CanvasesApi.md#updatecanvas_0) | **PUT** /canvases/{id} | Update Canvas
*CompositionsApi* | [**addAiAnswersKnowledgeDocument_0**](docs/CompositionsApi.md#addaianswersknowledgedocument_0) | **POST** /compositions/{id}/adapters/ai-answers/knowledge/documents | Add a document for a widget&#39;s AI to answer from
*CompositionsApi* | [**checkCompositionAccess_0**](docs/CompositionsApi.md#checkcompositionaccess_0) | **GET** /compositions/{id}/access | Check Composition Access
*CompositionsApi* | [**createCompositionContentItem_0**](docs/CompositionsApi.md#createcompositioncontentitem_0) | **POST** /compositions/{id}/content/{list}/items | Add a content list item
*CompositionsApi* | [**createCompositionDatabaseRecord_0**](docs/CompositionsApi.md#createcompositiondatabaserecord_0) | **POST** /compositions/{id}/database/{table} | Create Record In Composition Database
*CompositionsApi* | [**createComposition_0**](docs/CompositionsApi.md#createcomposition_0) | **POST** /compositions | Create Composition
*CompositionsApi* | [**deleteCompositionContentItem_0**](docs/CompositionsApi.md#deletecompositioncontentitem_0) | **DELETE** /compositions/{id}/content/{list}/items/{itemId} | Delete a content list item
*CompositionsApi* | [**deleteCompositionDataSource_0**](docs/CompositionsApi.md#deletecompositiondatasource_0) | **DELETE** /compositions/{id}/data-source | Remove the composition data source binding
*CompositionsApi* | [**deleteCompositionDatabaseRecord_0**](docs/CompositionsApi.md#deletecompositiondatabaserecord_0) | **DELETE** /compositions/{id}/database/{table}/{recordId} | Delete Record From Composition Database
*CompositionsApi* | [**deleteComposition_0**](docs/CompositionsApi.md#deletecomposition_0) | **DELETE** /compositions/{id} | Delete Composition
*CompositionsApi* | [**describeCompositionEntries_0**](docs/CompositionsApi.md#describecompositionentries_0) | **GET** /compositions/{id}/entries | Describe What a Composition Keeps
*CompositionsApi* | [**duplicateComposition_0**](docs/CompositionsApi.md#duplicatecomposition_0) | **POST** /compositions/{id}/duplicate | Duplicate Composition
*CompositionsApi* | [**getAiAnswersKnowledge_0**](docs/CompositionsApi.md#getaianswersknowledge_0) | **GET** /compositions/{id}/adapters/ai-answers/knowledge | See the documents a widget&#39;s AI answers from
*CompositionsApi* | [**getAllCompositions_0**](docs/CompositionsApi.md#getallcompositions_0) | **GET** /compositions | Get All Compositions
*CompositionsApi* | [**getCompositionById_0**](docs/CompositionsApi.md#getcompositionbyid_0) | **GET** /compositions/{id} | Get Composition
*CompositionsApi* | [**getCompositionContentSchema_0**](docs/CompositionsApi.md#getcompositioncontentschema_0) | **GET** /compositions/{id}/schema/content | Get Content Schema
*CompositionsApi* | [**getCompositionContent_0**](docs/CompositionsApi.md#getcompositioncontent_0) | **GET** /compositions/{id}/content | Get Current Content
*CompositionsApi* | [**getCompositionDataSource_0**](docs/CompositionsApi.md#getcompositiondatasource_0) | **GET** /compositions/{id}/data-source | Read the composition data source binding
*CompositionsApi* | [**getCompositionDatabaseRecord_0**](docs/CompositionsApi.md#getcompositiondatabaserecord_0) | **GET** /compositions/{id}/database/{table}/{recordId} | Get Record From Composition Database
*CompositionsApi* | [**getCompositionDatabaseRecords_0**](docs/CompositionsApi.md#getcompositiondatabaserecords_0) | **GET** /compositions/{id}/database/{table} | Get All Records From Composition Database Table
*CompositionsApi* | [**getCompositionDesignSchema_0**](docs/CompositionsApi.md#getcompositiondesignschema_0) | **GET** /compositions/{id}/schema/design | Get Design Schema
*CompositionsApi* | [**getCompositionDesign_0**](docs/CompositionsApi.md#getcompositiondesign_0) | **GET** /compositions/{id}/design | Get Composition Design
*CompositionsApi* | [**getCompositionEmbedSchema_0**](docs/CompositionsApi.md#getcompositionembedschema_0) | **GET** /compositions/{id}/schema/embed | Get Embed Schema
*CompositionsApi* | [**getCompositionEmbedSettings_0**](docs/CompositionsApi.md#getcompositionembedsettings_0) | **GET** /compositions/{id}/embed-settings | Get Composition Embed Settings
*CompositionsApi* | [**getCompositionPreview_0**](docs/CompositionsApi.md#getcompositionpreview_0) | **GET** /compositions/{id}/preview | Get Composition Preview
*CompositionsApi* | [**getCompositionVersions_0**](docs/CompositionsApi.md#getcompositionversions_0) | **GET** /compositions/{id}/versions | Get Composition Versions
*CompositionsApi* | [**getCompositionsBatch_0**](docs/CompositionsApi.md#getcompositionsbatch_0) | **POST** /compositions/batch | Get Compositions Batch
*CompositionsApi* | [**patchCompositionContentItem_0**](docs/CompositionsApi.md#patchcompositioncontentitem_0) | **PATCH** /compositions/{id}/content/{list}/items/{itemId} | Update a content list item
*CompositionsApi* | [**readCompositionEntries_0**](docs/CompositionsApi.md#readcompositionentries_0) | **GET** /compositions/{id}/entries/{table} | Read the Entries of a Composition&#39;s Table
*CompositionsApi* | [**removeAiAnswersKnowledgeDocument_0**](docs/CompositionsApi.md#removeaianswersknowledgedocument_0) | **DELETE** /compositions/{id}/adapters/ai-answers/knowledge/documents/{documentId} | Remove a document from a widget&#39;s knowledge base
*CompositionsApi* | [**setCompositionDataSource_0**](docs/CompositionsApi.md#setcompositiondatasource_0) | **PUT** /compositions/{id}/data-source | Bind a public JSON data source for embed refresh
*CompositionsApi* | [**setDynamicContent_0**](docs/CompositionsApi.md#setdynamiccontent_0) | **PUT** /compositions/{id}/content | Set Dynamic Content
*CompositionsApi* | [**updateCompositionDatabaseRecord_0**](docs/CompositionsApi.md#updatecompositiondatabaserecord_0) | **PUT** /compositions/{id}/database/{table}/{recordId} | Update Record In Composition Database
*CompositionsApi* | [**updateCompositionStatus_0**](docs/CompositionsApi.md#updatecompositionstatus_0) | **PUT** /compositions/{id}/status | Update Composition Status
*CompositionsApi* | [**updateComposition_0**](docs/CompositionsApi.md#updatecomposition_0) | **PUT** /compositions/{id} | Update Composition
*CompositionsApi* | [**validateCompositionContent_0**](docs/CompositionsApi.md#validatecompositioncontent_0) | **POST** /compositions/{id}/content/validate | Validate Content
*CreditsApi* | [**getUserCreditBalance_0**](docs/CreditsApi.md#getusercreditbalance_0) | **GET** /credits/user/{userId}/balance | Get an account&#39;s credit balance
*CreditsApi* | [**getUserCreditTransactions_0**](docs/CreditsApi.md#getusercredittransactions_0) | **GET** /credits/user/{userId}/transactions | List an account&#39;s credit ledger
*EntitlementsApi* | [**getManagedUserEntitlements_0**](docs/EntitlementsApi.md#getmanageduserentitlements_0) | **GET** /entitlements/managed-users/{managedUserId} | Get managed user entitlements
*EntitlementsApi* | [**getPartnerEntitlements_0**](docs/EntitlementsApi.md#getpartnerentitlements_0) | **GET** /entitlements/partners/{partnerId} | Get partner entitlements
*InvoicesApi* | [**getInvoicesByPartnerId_0**](docs/InvoicesApi.md#getinvoicesbypartnerid_0) | **GET** /invoices/partner/{partnerId} | List a partner&#39;s invoices
*ManagedUsersApi* | [**copyPresetForManagedUser_0**](docs/ManagedUsersApi.md#copypresetformanageduser_0) | **POST** /managed-users/{id}/presets/{key}/copy | Give a managed user a copy of one of your presets
*ManagedUsersApi* | [**createCompositionFromPreset_0**](docs/ManagedUsersApi.md#createcompositionfrompreset_0) | **POST** /managed-users/{id}/presets/{key}/composition | Create a composition from one of your presets in one call
*ManagedUsersApi* | [**createManagedUserEditorSession_0**](docs/ManagedUsersApi.md#createmanagedusereditorsession_0) | **POST** /managed-users/{id}/editor-sessions | Create an editor session for a managed user
*ManagedUsersApi* | [**createManagedUser_0**](docs/ManagedUsersApi.md#createmanageduser_0) | **POST** /managed-users | Create Managed User
*ManagedUsersApi* | [**deleteManagedUser_0**](docs/ManagedUsersApi.md#deletemanageduser_0) | **DELETE** /managed-users/{id} | Delete Managed User
*ManagedUsersApi* | [**getAllManagedUsers_0**](docs/ManagedUsersApi.md#getallmanagedusers_0) | **GET** /managed-users | Get Managed Users
*ManagedUsersApi* | [**getManagedUserById_0**](docs/ManagedUsersApi.md#getmanageduserbyid_0) | **GET** /managed-users/{id} | Get Managed User By ID
*ManagedUsersApi* | [**getManagedUserDesignDefaults_0**](docs/ManagedUsersApi.md#getmanageduserdesigndefaults_0) | **GET** /managed-users/{id}/design-defaults | Read design defaults for one managed user
*ManagedUsersApi* | [**getManagedUserLimits_0**](docs/ManagedUsersApi.md#getmanageduserlimits_0) | **GET** /managed-users/{id}/limits | Read monthly credit cap and usage for one managed user
*ManagedUsersApi* | [**getManagedUserStorageUsage_0**](docs/ManagedUsersApi.md#getmanageduserstorageusage_0) | **GET** /managed-users/{id}/storage-usage | Storage used by one managed user&#39;s uploads
*ManagedUsersApi* | [**getManagedUserUsage_0**](docs/ManagedUsersApi.md#getmanageduserusage_0) | **GET** /managed-users/{id}/usage | What a managed user&#39;s editor sessions spent
*ManagedUsersApi* | [**getManagedUsersByManagerId_0**](docs/ManagedUsersApi.md#getmanagedusersbymanagerid_0) | **GET** /users/{managerId}/managed-users | Get Managed Users By Manager
*ManagedUsersApi* | [**revokeManagedUserEditorSession_0**](docs/ManagedUsersApi.md#revokemanagedusereditorsession_0) | **DELETE** /managed-users/{id}/editor-sessions/{sessionId} | End one editor session of a managed user
*ManagedUsersApi* | [**revokeManagedUserEditorSessions_0**](docs/ManagedUsersApi.md#revokemanagedusereditorsessions_0) | **DELETE** /managed-users/{id}/editor-sessions | End every editor session of a managed user
*ManagedUsersApi* | [**setManagedUserDesignDefaults_0**](docs/ManagedUsersApi.md#setmanageduserdesigndefaults_0) | **PUT** /managed-users/{id}/design-defaults | Set or clear design defaults for one managed user
*ManagedUsersApi* | [**setManagedUserLimits_0**](docs/ManagedUsersApi.md#setmanageduserlimits_0) | **PUT** /managed-users/{id}/limits | Set or clear the monthly credit cap for one managed user
*ManagedUsersApi* | [**updateManagedUser_0**](docs/ManagedUsersApi.md#updatemanageduser_0) | **PUT** /managed-users/{id} | Update Managed User
*OperationsApi* | [**operationsIdGet_0**](docs/OperationsApi.md#operationsidget_0) | **GET** /operations/{id} | Get operation status
*PartnerApi* | [**addAiAnswersKnowledgeDocument**](docs/PartnerApi.md#addaianswersknowledgedocument) | **POST** /compositions/{id}/adapters/ai-answers/knowledge/documents | Add a document for a widget&#39;s AI to answer from
*PartnerApi* | [**addPersonalWorkspaceDomain**](docs/PartnerApi.md#addpersonalworkspacedomain) | **POST** /users/{id}/workspace/domains | Allow a website to show your widgets
*PartnerApi* | [**callPublicCompositionAdapter**](docs/PartnerApi.md#callpubliccompositionadapter) | **POST** /embed/compositions/{compositionId}/adapters/{adapterId}/{operation} | Call a gateway operation of an adapter a published widget uses
*PartnerApi* | [**checkCompositionAccess**](docs/PartnerApi.md#checkcompositionaccess) | **GET** /compositions/{id}/access | Check Composition Access
*PartnerApi* | [**copyPresetForManagedUser**](docs/PartnerApi.md#copypresetformanageduser) | **POST** /managed-users/{id}/presets/{key}/copy | Give a managed user a copy of one of your presets
*PartnerApi* | [**createCanvas**](docs/PartnerApi.md#createcanvas) | **POST** /canvases | Create Canvas
*PartnerApi* | [**createComposition**](docs/PartnerApi.md#createcomposition) | **POST** /compositions | Create Composition
*PartnerApi* | [**createCompositionContentItem**](docs/PartnerApi.md#createcompositioncontentitem) | **POST** /compositions/{id}/content/{list}/items | Add a content list item
*PartnerApi* | [**createCompositionDatabaseRecord**](docs/PartnerApi.md#createcompositiondatabaserecord) | **POST** /compositions/{id}/database/{table} | Create Record In Composition Database
*PartnerApi* | [**createCompositionFromPreset**](docs/PartnerApi.md#createcompositionfrompreset) | **POST** /managed-users/{id}/presets/{key}/composition | Create a composition from one of your presets in one call
*PartnerApi* | [**createCompositionFromWidget**](docs/PartnerApi.md#createcompositionfromwidget) | **POST** /widgets/{id}/composition | Create a composition for a widget in one call
*PartnerApi* | [**createManagedUser**](docs/PartnerApi.md#createmanageduser) | **POST** /managed-users | Create Managed User
*PartnerApi* | [**createManagedUserEditorSession**](docs/PartnerApi.md#createmanagedusereditorsession) | **POST** /managed-users/{id}/editor-sessions | Create an editor session for a managed user
*PartnerApi* | [**createPartnerExtraCreditsInvoice**](docs/PartnerApi.md#createpartnerextracreditsinvoice) | **POST** /partners/{partnerId}/credits/extra-invoice | Buy extra credits for a partner
*PartnerApi* | [**createPublicCompositionEntry**](docs/PartnerApi.md#createpubliccompositionentry) | **POST** /embed/compositions/{compositionId}/entries/{table} | Append a visitor entry through the gateway
*PartnerApi* | [**createUserApiKey**](docs/PartnerApi.md#createuserapikey) | **POST** /users/{id}/keys | Create an API key
*PartnerApi* | [**createWidget**](docs/PartnerApi.md#createwidget) | **POST** /widgets | Create Widget
*PartnerApi* | [**deleteCanvas**](docs/PartnerApi.md#deletecanvas) | **DELETE** /canvases/{id} | Delete Canvas
*PartnerApi* | [**deleteComposition**](docs/PartnerApi.md#deletecomposition) | **DELETE** /compositions/{id} | Delete Composition
*PartnerApi* | [**deleteCompositionContentItem**](docs/PartnerApi.md#deletecompositioncontentitem) | **DELETE** /compositions/{id}/content/{list}/items/{itemId} | Delete a content list item
*PartnerApi* | [**deleteCompositionDataSource**](docs/PartnerApi.md#deletecompositiondatasource) | **DELETE** /compositions/{id}/data-source | Remove the composition data source binding
*PartnerApi* | [**deleteCompositionDatabaseRecord**](docs/PartnerApi.md#deletecompositiondatabaserecord) | **DELETE** /compositions/{id}/database/{table}/{recordId} | Delete Record From Composition Database
*PartnerApi* | [**deleteCompositionEntryItems**](docs/PartnerApi.md#deletecompositionentryitems) | **DELETE** /compositions/{id}/entries/{table}/items | Delete composition entry items by id or host context
*PartnerApi* | [**deleteManagedUser**](docs/PartnerApi.md#deletemanageduser) | **DELETE** /managed-users/{id} | Delete Managed User
*PartnerApi* | [**deletePersonalWorkspaceDomain**](docs/PartnerApi.md#deletepersonalworkspacedomain) | **DELETE** /users/{id}/workspace/domains/{domainId} | Stop allowing a website to show your widgets
*PartnerApi* | [**deleteUserApiKey**](docs/PartnerApi.md#deleteuserapikey) | **DELETE** /users/{id}/keys/{keyId} | Delete an API key
*PartnerApi* | [**describeCompositionEntries**](docs/PartnerApi.md#describecompositionentries) | **GET** /compositions/{id}/entries | Describe What a Composition Keeps
*PartnerApi* | [**duplicateComposition**](docs/PartnerApi.md#duplicatecomposition) | **POST** /compositions/{id}/duplicate | Duplicate Composition
*PartnerApi* | [**exportCompositionEntryItems**](docs/PartnerApi.md#exportcompositionentryitems) | **GET** /compositions/{id}/entries/{table}/export | Export composition entry items
*PartnerApi* | [**getAiAnswersKnowledge**](docs/PartnerApi.md#getaianswersknowledge) | **GET** /compositions/{id}/adapters/ai-answers/knowledge | See the documents a widget&#39;s AI answers from
*PartnerApi* | [**getAllCanvases**](docs/PartnerApi.md#getallcanvases) | **GET** /canvases | Get All Canvases
*PartnerApi* | [**getAllCompositions**](docs/PartnerApi.md#getallcompositions) | **GET** /compositions | Get All Compositions
*PartnerApi* | [**getAllManagedUsers**](docs/PartnerApi.md#getallmanagedusers) | **GET** /managed-users | Get Managed Users
*PartnerApi* | [**getCanvas**](docs/PartnerApi.md#getcanvas) | **GET** /canvases/{id} | Get Canvas
*PartnerApi* | [**getCompositionById**](docs/PartnerApi.md#getcompositionbyid) | **GET** /compositions/{id} | Get Composition
*PartnerApi* | [**getCompositionContent**](docs/PartnerApi.md#getcompositioncontent) | **GET** /compositions/{id}/content | Get Current Content
*PartnerApi* | [**getCompositionContentSchema**](docs/PartnerApi.md#getcompositioncontentschema) | **GET** /compositions/{id}/schema/content | Get Content Schema
*PartnerApi* | [**getCompositionDataSource**](docs/PartnerApi.md#getcompositiondatasource) | **GET** /compositions/{id}/data-source | Read the composition data source binding
*PartnerApi* | [**getCompositionDatabaseRecord**](docs/PartnerApi.md#getcompositiondatabaserecord) | **GET** /compositions/{id}/database/{table}/{recordId} | Get Record From Composition Database
*PartnerApi* | [**getCompositionDatabaseRecords**](docs/PartnerApi.md#getcompositiondatabaserecords) | **GET** /compositions/{id}/database/{table} | Get All Records From Composition Database Table
*PartnerApi* | [**getCompositionDesign**](docs/PartnerApi.md#getcompositiondesign) | **GET** /compositions/{id}/design | Get Composition Design
*PartnerApi* | [**getCompositionDesignSchema**](docs/PartnerApi.md#getcompositiondesignschema) | **GET** /compositions/{id}/schema/design | Get Design Schema
*PartnerApi* | [**getCompositionEmbedSchema**](docs/PartnerApi.md#getcompositionembedschema) | **GET** /compositions/{id}/schema/embed | Get Embed Schema
*PartnerApi* | [**getCompositionEmbedSettings**](docs/PartnerApi.md#getcompositionembedsettings) | **GET** /compositions/{id}/embed-settings | Get Composition Embed Settings
*PartnerApi* | [**getCompositionPreview**](docs/PartnerApi.md#getcompositionpreview) | **GET** /compositions/{id}/preview | Get Composition Preview
*PartnerApi* | [**getCompositionVersions**](docs/PartnerApi.md#getcompositionversions) | **GET** /compositions/{id}/versions | Get Composition Versions
*PartnerApi* | [**getCompositionsBatch**](docs/PartnerApi.md#getcompositionsbatch) | **POST** /compositions/batch | Get Compositions Batch
*PartnerApi* | [**getInvoicesByPartnerId**](docs/PartnerApi.md#getinvoicesbypartnerid) | **GET** /invoices/partner/{partnerId} | List a partner&#39;s invoices
*PartnerApi* | [**getManagedUserById**](docs/PartnerApi.md#getmanageduserbyid) | **GET** /managed-users/{id} | Get Managed User By ID
*PartnerApi* | [**getManagedUserDesignDefaults**](docs/PartnerApi.md#getmanageduserdesigndefaults) | **GET** /managed-users/{id}/design-defaults | Read design defaults for one managed user
*PartnerApi* | [**getManagedUserEntitlements**](docs/PartnerApi.md#getmanageduserentitlements) | **GET** /entitlements/managed-users/{managedUserId} | Get managed user entitlements
*PartnerApi* | [**getManagedUserLimits**](docs/PartnerApi.md#getmanageduserlimits) | **GET** /managed-users/{id}/limits | Read monthly credit cap and usage for one managed user
*PartnerApi* | [**getManagedUserStorageUsage**](docs/PartnerApi.md#getmanageduserstorageusage) | **GET** /managed-users/{id}/storage-usage | Storage used by one managed user&#39;s uploads
*PartnerApi* | [**getManagedUserUsage**](docs/PartnerApi.md#getmanageduserusage) | **GET** /managed-users/{id}/usage | What a managed user&#39;s editor sessions spent
*PartnerApi* | [**getManagedUsersByManagerId**](docs/PartnerApi.md#getmanagedusersbymanagerid) | **GET** /users/{managerId}/managed-users | Get Managed Users By Manager
*PartnerApi* | [**getMyPartners**](docs/PartnerApi.md#getmypartners) | **GET** /partners/mine | Find the partner you administer
*PartnerApi* | [**getPartnerAdapterConnections**](docs/PartnerApi.md#getpartneradapterconnections) | **GET** /partners/{partnerId}/adapter-connections | See which adapter keys a partner has connected
*PartnerApi* | [**getPartnerAnalyticsByManagedUser**](docs/PartnerApi.md#getpartneranalyticsbymanageduser) | **GET** /partners/{partnerId}/analytics/managed-users | What each managed user&#39;s widgets did
*PartnerApi* | [**getPartnerAnalyticsSummary**](docs/PartnerApi.md#getpartneranalyticssummary) | **GET** /partners/{partnerId}/analytics/summary | What was done with a partner&#39;s published widgets
*PartnerApi* | [**getPartnerAnalyticsTimeline**](docs/PartnerApi.md#getpartneranalyticstimeline) | **GET** /partners/{partnerId}/analytics/timeline | What was done with a partner&#39;s widgets, day by day
*PartnerApi* | [**getPartnerAnalyticsTopWidgets**](docs/PartnerApi.md#getpartneranalyticstopwidgets) | **GET** /partners/{partnerId}/analytics/top-widgets | Which widgets were viewed the most
*PartnerApi* | [**getPartnerBillingOverview**](docs/PartnerApi.md#getpartnerbillingoverview) | **GET** /partners/{partnerId}/billing-overview | Get comprehensive partner billing overview
*PartnerApi* | [**getPartnerContract**](docs/PartnerApi.md#getpartnercontract) | **GET** /partners/{partnerId}/contract | Get a partner&#39;s contract
*PartnerApi* | [**getPartnerCreditBalance**](docs/PartnerApi.md#getpartnercreditbalance) | **GET** /partners/{partnerId}/credits/balance | Get partner credit balance
*PartnerApi* | [**getPartnerCreditTransactions**](docs/PartnerApi.md#getpartnercredittransactions) | **GET** /partners/{partnerId}/credits/transactions | Get partner credit transaction history
*PartnerApi* | [**getPartnerDataDatabase**](docs/PartnerApi.md#getpartnerdatadatabase) | **GET** /partners/{partnerId}/data-database | See the Neon database a partner keeps the data of its compositions in
*PartnerApi* | [**getPartnerDesignDefaults**](docs/PartnerApi.md#getpartnerdesigndefaults) | **GET** /partners/{partnerId}/design-defaults | Read partner-wide design defaults
*PartnerApi* | [**getPartnerEntitlements**](docs/PartnerApi.md#getpartnerentitlements) | **GET** /entitlements/partners/{partnerId} | Get partner entitlements
*PartnerApi* | [**getPartnerEntryContextSigning**](docs/PartnerApi.md#getpartnerentrycontextsigning) | **GET** /partners/{partnerId}/entry-context-signing | See how the context of your embeds is signed
*PartnerApi* | [**getPartnerNotificationSettings**](docs/PartnerApi.md#getpartnernotificationsettings) | **GET** /partners/{partnerId}/notifications/settings | Where your notifications go
*PartnerApi* | [**getPartnerStorageDestination**](docs/PartnerApi.md#getpartnerstoragedestination) | **GET** /partners/{partnerId}/storage | Get where a partner&#39;s uploaded files are stored
*PartnerApi* | [**getPartnerStorageUsage**](docs/PartnerApi.md#getpartnerstorageusage) | **GET** /partners/{partnerId}/storage/usage | What a partner&#39;s customers store
*PartnerApi* | [**getPersonalWorkspaceDomains**](docs/PartnerApi.md#getpersonalworkspacedomains) | **GET** /users/{id}/workspace/domains | List the websites allowed to show your widgets
*PartnerApi* | [**getPublicCompositionEmbed**](docs/PartnerApi.md#getpubliccompositionembed) | **GET** /embed/compositions/{compositionId} | Resolve a composition UUID to a published widget URL
*PartnerApi* | [**getPublicCompositionIframe**](docs/PartnerApi.md#getpubliccompositioniframe) | **GET** /embed/compositions/{compositionId}/frame | Embed a published composition with its saved values
*PartnerApi* | [**getUserAdapterConnections**](docs/PartnerApi.md#getuseradapterconnections) | **GET** /users/{userId}/adapter-connections | See which adapter keys an account has connected
*PartnerApi* | [**getUserApiKeyUsageLogs**](docs/PartnerApi.md#getuserapikeyusagelogs) | **GET** /users/{id}/api-keys/{keyId}/logs | Read what an API key was used for
*PartnerApi* | [**getUserApiKeys**](docs/PartnerApi.md#getuserapikeys) | **GET** /users/{id}/keys | List the API keys of an account
*PartnerApi* | [**getUserCreditBalance**](docs/PartnerApi.md#getusercreditbalance) | **GET** /credits/user/{userId}/balance | Get an account&#39;s credit balance
*PartnerApi* | [**getUserCreditTransactions**](docs/PartnerApi.md#getusercredittransactions) | **GET** /credits/user/{userId}/transactions | List an account&#39;s credit ledger
*PartnerApi* | [**getWidgets**](docs/PartnerApi.md#getwidgets) | **GET** /widgets | List Widgets
*PartnerApi* | [**getWidgetsBatch**](docs/PartnerApi.md#getwidgetsbatch) | **POST** /widgets/batch | Get Widgets Batch
*PartnerApi* | [**listCompositionEntryItems**](docs/PartnerApi.md#listcompositionentryitems) | **GET** /compositions/{id}/entries/{table}/items | List composition entry items with paging and filters
*PartnerApi* | [**listManagedUserEntries**](docs/PartnerApi.md#listmanageduserentries) | **GET** /managed-users/{id}/entries | List entries across a managed user&#39;s compositions
*PartnerApi* | [**listPartnerNotificationDeliveries**](docs/PartnerApi.md#listpartnernotificationdeliveries) | **GET** /partners/{partnerId}/notifications/deliveries | How your notifications reached you
*PartnerApi* | [**listPartnerNotifications**](docs/PartnerApi.md#listpartnernotifications) | **GET** /partners/{partnerId}/notifications | What your partner account was told
*PartnerApi* | [**listPartnerPresets**](docs/PartnerApi.md#listpartnerpresets) | **GET** /partners/{partnerId}/presets | List the widgets a partner offers as presets
*PartnerApi* | [**operationsIdGet**](docs/PartnerApi.md#operationsidget) | **GET** /operations/{id} | Get operation status
*PartnerApi* | [**patchCompositionContentItem**](docs/PartnerApi.md#patchcompositioncontentitem) | **PATCH** /compositions/{id}/content/{list}/items/{itemId} | Update a content list item
*PartnerApi* | [**postPublicCompositionEmbedStatus**](docs/PartnerApi.md#postpubliccompositionembedstatus) | **POST** /embed/compositions/status | Batch-check whether compositions are currently served for embed
*PartnerApi* | [**readCompositionEntries**](docs/PartnerApi.md#readcompositionentries) | **GET** /compositions/{id}/entries/{table} | Read the Entries of a Composition&#39;s Table
*PartnerApi* | [**removeAiAnswersKnowledgeDocument**](docs/PartnerApi.md#removeaianswersknowledgedocument) | **DELETE** /compositions/{id}/adapters/ai-answers/knowledge/documents/{documentId} | Remove a document from a widget&#39;s knowledge base
*PartnerApi* | [**removePartnerAdapterConnection**](docs/PartnerApi.md#removepartneradapterconnection) | **DELETE** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from a partner
*PartnerApi* | [**removePartnerDataDatabase**](docs/PartnerApi.md#removepartnerdatadatabase) | **DELETE** /partners/{partnerId}/data-database | Stop keeping the data of a partner&#39;s compositions in its own database
*PartnerApi* | [**removePartnerPreset**](docs/PartnerApi.md#removepartnerpreset) | **DELETE** /partners/{partnerId}/presets/{key} | Take a widget off the partner&#39;s presets
*PartnerApi* | [**removePartnerStorageDestination**](docs/PartnerApi.md#removepartnerstoragedestination) | **DELETE** /partners/{partnerId}/storage | Stop storing a partner&#39;s uploaded files in its own bucket
*PartnerApi* | [**removeUserAdapterConnection**](docs/PartnerApi.md#removeuseradapterconnection) | **DELETE** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from an account
*PartnerApi* | [**replayPartnerNotificationDelivery**](docs/PartnerApi.md#replaypartnernotificationdelivery) | **POST** /partners/{partnerId}/notifications/deliveries/{deliveryId}/replay | Send a webhook delivery again
*PartnerApi* | [**revokeManagedUserEditorSession**](docs/PartnerApi.md#revokemanagedusereditorsession) | **DELETE** /managed-users/{id}/editor-sessions/{sessionId} | End one editor session of a managed user
*PartnerApi* | [**revokeManagedUserEditorSessions**](docs/PartnerApi.md#revokemanagedusereditorsessions) | **DELETE** /managed-users/{id}/editor-sessions | End every editor session of a managed user
*PartnerApi* | [**rotatePartnerEntryContextSecret**](docs/PartnerApi.md#rotatepartnerentrycontextsecret) | **POST** /partners/{partnerId}/entry-context-signing/secret | Make a secret to sign the context of your embeds
*PartnerApi* | [**rotatePartnerWebhookSecret**](docs/PartnerApi.md#rotatepartnerwebhooksecret) | **POST** /partners/{partnerId}/notifications/webhook-secret | Make a new secret for your webhook
*PartnerApi* | [**sendPartnerNotificationTestEvent**](docs/PartnerApi.md#sendpartnernotificationtestevent) | **POST** /partners/{partnerId}/notifications/test-event | Send a test event to your webhook
*PartnerApi* | [**setCompositionDataSource**](docs/PartnerApi.md#setcompositiondatasource) | **PUT** /compositions/{id}/data-source | Bind a public JSON data source for embed refresh
*PartnerApi* | [**setDynamicContent**](docs/PartnerApi.md#setdynamiccontent) | **PUT** /compositions/{id}/content | Set Dynamic Content
*PartnerApi* | [**setManagedUserDesignDefaults**](docs/PartnerApi.md#setmanageduserdesigndefaults) | **PUT** /managed-users/{id}/design-defaults | Set or clear design defaults for one managed user
*PartnerApi* | [**setManagedUserLimits**](docs/PartnerApi.md#setmanageduserlimits) | **PUT** /managed-users/{id}/limits | Set or clear the monthly credit cap for one managed user
*PartnerApi* | [**setPartnerAdapterConnection**](docs/PartnerApi.md#setpartneradapterconnection) | **PUT** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to a partner
*PartnerApi* | [**setPartnerDataDatabase**](docs/PartnerApi.md#setpartnerdatadatabase) | **PUT** /partners/{partnerId}/data-database | Keep the data of a partner&#39;s compositions in a Neon database of its own
*PartnerApi* | [**setPartnerDesignDefaults**](docs/PartnerApi.md#setpartnerdesigndefaults) | **PUT** /partners/{partnerId}/design-defaults | Set or clear partner-wide design defaults
*PartnerApi* | [**setPartnerPreset**](docs/PartnerApi.md#setpartnerpreset) | **PUT** /partners/{partnerId}/presets/{key} | Make a widget a preset, or replace a preset
*PartnerApi* | [**setPartnerStorageDestination**](docs/PartnerApi.md#setpartnerstoragedestination) | **PUT** /partners/{partnerId}/storage | Set where a partner&#39;s uploaded files are stored
*PartnerApi* | [**setUserAdapterConnection**](docs/PartnerApi.md#setuseradapterconnection) | **PUT** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to an account
*PartnerApi* | [**updateCanvas**](docs/PartnerApi.md#updatecanvas) | **PUT** /canvases/{id} | Update Canvas
*PartnerApi* | [**updateComposition**](docs/PartnerApi.md#updatecomposition) | **PUT** /compositions/{id} | Update Composition
*PartnerApi* | [**updateCompositionDatabaseRecord**](docs/PartnerApi.md#updatecompositiondatabaserecord) | **PUT** /compositions/{id}/database/{table}/{recordId} | Update Record In Composition Database
*PartnerApi* | [**updateCompositionStatus**](docs/PartnerApi.md#updatecompositionstatus) | **PUT** /compositions/{id}/status | Update Composition Status
*PartnerApi* | [**updateManagedUser**](docs/PartnerApi.md#updatemanageduser) | **PUT** /managed-users/{id} | Update Managed User
*PartnerApi* | [**updatePartnerEntryContextSigning**](docs/PartnerApi.md#updatepartnerentrycontextsigning) | **PUT** /partners/{partnerId}/entry-context-signing | Require a signed context, or stop requiring it
*PartnerApi* | [**updatePartnerNotificationSettings**](docs/PartnerApi.md#updatepartnernotificationsettings) | **PUT** /partners/{partnerId}/notifications/settings | Choose where your notifications go
*PartnerApi* | [**updatePersonalWorkspaceDomain**](docs/PartnerApi.md#updatepersonalworkspacedomain) | **PUT** /users/{id}/workspace/domains/{domainId} | Change a website on your list
*PartnerApi* | [**updateUserApiKey**](docs/PartnerApi.md#updateuserapikey) | **PUT** /users/{id}/keys/{keyId} | Rename an API key, or switch it off or on
*PartnerApi* | [**uploadPublicCompositionAdapterFile**](docs/PartnerApi.md#uploadpubliccompositionadapterfile) | **PUT** /embed/compositions/{compositionId}/adapters/upload/files/{ticket} | Send the file a visitor chose through the upload adapter of a published widget
*PartnerApi* | [**uploadsGet**](docs/PartnerApi.md#uploadsget) | **GET** /uploads | List the account&#39;s uploads
*PartnerApi* | [**uploadsIdDelete**](docs/PartnerApi.md#uploadsiddelete) | **DELETE** /uploads/{id} | Delete an upload
*PartnerApi* | [**uploadsIdGet**](docs/PartnerApi.md#uploadsidget) | **GET** /uploads/{id} | Get an upload by id
*PartnerApi* | [**uploadsLimitsGet**](docs/PartnerApi.md#uploadslimitsget) | **GET** /uploads/limits | Upload size limits and accepted file types
*PartnerApi* | [**uploadsPost**](docs/PartnerApi.md#uploadspost) | **POST** /uploads | Upload a file
*PartnerApi* | [**validateCompositionContent**](docs/PartnerApi.md#validatecompositioncontent) | **POST** /compositions/{id}/content/validate | Validate Content
*PartnerApi* | [**validateToken**](docs/PartnerApi.md#validatetoken) | **GET** /tokens/validate | Validate current authentication token
*PartnerApi* | [**verifyPartnerDataDatabase**](docs/PartnerApi.md#verifypartnerdatadatabase) | **POST** /partners/{partnerId}/data-database/verify | Check that a partner&#39;s own database still works
*PartnerApi* | [**verifyPartnerStorageDestination**](docs/PartnerApi.md#verifypartnerstoragedestination) | **POST** /partners/{partnerId}/storage/verify | Check that a partner&#39;s storage destination still works
*PartnersApi* | [**createPartnerExtraCreditsInvoice_0**](docs/PartnersApi.md#createpartnerextracreditsinvoice_0) | **POST** /partners/{partnerId}/credits/extra-invoice | Buy extra credits for a partner
*PartnersApi* | [**getMyPartners_0**](docs/PartnersApi.md#getmypartners_0) | **GET** /partners/mine | Find the partner you administer
*PartnersApi* | [**getPartnerAdapterConnections_0**](docs/PartnersApi.md#getpartneradapterconnections_0) | **GET** /partners/{partnerId}/adapter-connections | See which adapter keys a partner has connected
*PartnersApi* | [**getPartnerAnalyticsByManagedUser_0**](docs/PartnersApi.md#getpartneranalyticsbymanageduser_0) | **GET** /partners/{partnerId}/analytics/managed-users | What each managed user&#39;s widgets did
*PartnersApi* | [**getPartnerAnalyticsSummary_0**](docs/PartnersApi.md#getpartneranalyticssummary_0) | **GET** /partners/{partnerId}/analytics/summary | What was done with a partner&#39;s published widgets
*PartnersApi* | [**getPartnerAnalyticsTimeline_0**](docs/PartnersApi.md#getpartneranalyticstimeline_0) | **GET** /partners/{partnerId}/analytics/timeline | What was done with a partner&#39;s widgets, day by day
*PartnersApi* | [**getPartnerAnalyticsTopWidgets_0**](docs/PartnersApi.md#getpartneranalyticstopwidgets_0) | **GET** /partners/{partnerId}/analytics/top-widgets | Which widgets were viewed the most
*PartnersApi* | [**getPartnerBillingOverview_0**](docs/PartnersApi.md#getpartnerbillingoverview_0) | **GET** /partners/{partnerId}/billing-overview | Get comprehensive partner billing overview
*PartnersApi* | [**getPartnerContract_0**](docs/PartnersApi.md#getpartnercontract_0) | **GET** /partners/{partnerId}/contract | Get a partner&#39;s contract
*PartnersApi* | [**getPartnerCreditBalance_0**](docs/PartnersApi.md#getpartnercreditbalance_0) | **GET** /partners/{partnerId}/credits/balance | Get partner credit balance
*PartnersApi* | [**getPartnerCreditTransactions_0**](docs/PartnersApi.md#getpartnercredittransactions_0) | **GET** /partners/{partnerId}/credits/transactions | Get partner credit transaction history
*PartnersApi* | [**getPartnerDataDatabase_0**](docs/PartnersApi.md#getpartnerdatadatabase_0) | **GET** /partners/{partnerId}/data-database | See the Neon database a partner keeps the data of its compositions in
*PartnersApi* | [**getPartnerDesignDefaults_0**](docs/PartnersApi.md#getpartnerdesigndefaults_0) | **GET** /partners/{partnerId}/design-defaults | Read partner-wide design defaults
*PartnersApi* | [**getPartnerEntryContextSigning_0**](docs/PartnersApi.md#getpartnerentrycontextsigning_0) | **GET** /partners/{partnerId}/entry-context-signing | See how the context of your embeds is signed
*PartnersApi* | [**getPartnerNotificationSettings_0**](docs/PartnersApi.md#getpartnernotificationsettings_0) | **GET** /partners/{partnerId}/notifications/settings | Where your notifications go
*PartnersApi* | [**getPartnerStorageDestination_0**](docs/PartnersApi.md#getpartnerstoragedestination_0) | **GET** /partners/{partnerId}/storage | Get where a partner&#39;s uploaded files are stored
*PartnersApi* | [**getPartnerStorageUsage_0**](docs/PartnersApi.md#getpartnerstorageusage_0) | **GET** /partners/{partnerId}/storage/usage | What a partner&#39;s customers store
*PartnersApi* | [**listPartnerNotificationDeliveries_0**](docs/PartnersApi.md#listpartnernotificationdeliveries_0) | **GET** /partners/{partnerId}/notifications/deliveries | How your notifications reached you
*PartnersApi* | [**listPartnerNotifications_0**](docs/PartnersApi.md#listpartnernotifications_0) | **GET** /partners/{partnerId}/notifications | What your partner account was told
*PartnersApi* | [**listPartnerPresets_0**](docs/PartnersApi.md#listpartnerpresets_0) | **GET** /partners/{partnerId}/presets | List the widgets a partner offers as presets
*PartnersApi* | [**removePartnerAdapterConnection_0**](docs/PartnersApi.md#removepartneradapterconnection_0) | **DELETE** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from a partner
*PartnersApi* | [**removePartnerDataDatabase_0**](docs/PartnersApi.md#removepartnerdatadatabase_0) | **DELETE** /partners/{partnerId}/data-database | Stop keeping the data of a partner&#39;s compositions in its own database
*PartnersApi* | [**removePartnerPreset_0**](docs/PartnersApi.md#removepartnerpreset_0) | **DELETE** /partners/{partnerId}/presets/{key} | Take a widget off the partner&#39;s presets
*PartnersApi* | [**removePartnerStorageDestination_0**](docs/PartnersApi.md#removepartnerstoragedestination_0) | **DELETE** /partners/{partnerId}/storage | Stop storing a partner&#39;s uploaded files in its own bucket
*PartnersApi* | [**replayPartnerNotificationDelivery_0**](docs/PartnersApi.md#replaypartnernotificationdelivery_0) | **POST** /partners/{partnerId}/notifications/deliveries/{deliveryId}/replay | Send a webhook delivery again
*PartnersApi* | [**rotatePartnerEntryContextSecret_0**](docs/PartnersApi.md#rotatepartnerentrycontextsecret_0) | **POST** /partners/{partnerId}/entry-context-signing/secret | Make a secret to sign the context of your embeds
*PartnersApi* | [**rotatePartnerWebhookSecret_0**](docs/PartnersApi.md#rotatepartnerwebhooksecret_0) | **POST** /partners/{partnerId}/notifications/webhook-secret | Make a new secret for your webhook
*PartnersApi* | [**sendPartnerNotificationTestEvent_0**](docs/PartnersApi.md#sendpartnernotificationtestevent_0) | **POST** /partners/{partnerId}/notifications/test-event | Send a test event to your webhook
*PartnersApi* | [**setPartnerAdapterConnection_0**](docs/PartnersApi.md#setpartneradapterconnection_0) | **PUT** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to a partner
*PartnersApi* | [**setPartnerDataDatabase_0**](docs/PartnersApi.md#setpartnerdatadatabase_0) | **PUT** /partners/{partnerId}/data-database | Keep the data of a partner&#39;s compositions in a Neon database of its own
*PartnersApi* | [**setPartnerDesignDefaults_0**](docs/PartnersApi.md#setpartnerdesigndefaults_0) | **PUT** /partners/{partnerId}/design-defaults | Set or clear partner-wide design defaults
*PartnersApi* | [**setPartnerPreset_0**](docs/PartnersApi.md#setpartnerpreset_0) | **PUT** /partners/{partnerId}/presets/{key} | Make a widget a preset, or replace a preset
*PartnersApi* | [**setPartnerStorageDestination_0**](docs/PartnersApi.md#setpartnerstoragedestination_0) | **PUT** /partners/{partnerId}/storage | Set where a partner&#39;s uploaded files are stored
*PartnersApi* | [**updatePartnerEntryContextSigning_0**](docs/PartnersApi.md#updatepartnerentrycontextsigning_0) | **PUT** /partners/{partnerId}/entry-context-signing | Require a signed context, or stop requiring it
*PartnersApi* | [**updatePartnerNotificationSettings_0**](docs/PartnersApi.md#updatepartnernotificationsettings_0) | **PUT** /partners/{partnerId}/notifications/settings | Choose where your notifications go
*PartnersApi* | [**verifyPartnerDataDatabase_0**](docs/PartnersApi.md#verifypartnerdatadatabase_0) | **POST** /partners/{partnerId}/data-database/verify | Check that a partner&#39;s own database still works
*PartnersApi* | [**verifyPartnerStorageDestination_0**](docs/PartnersApi.md#verifypartnerstoragedestination_0) | **POST** /partners/{partnerId}/storage/verify | Check that a partner&#39;s storage destination still works
*PublicEmbedApi* | [**callPublicCompositionAdapter_0**](docs/PublicEmbedApi.md#callpubliccompositionadapter_0) | **POST** /embed/compositions/{compositionId}/adapters/{adapterId}/{operation} | Call a gateway operation of an adapter a published widget uses
*PublicEmbedApi* | [**createPublicCompositionEntry_0**](docs/PublicEmbedApi.md#createpubliccompositionentry_0) | **POST** /embed/compositions/{compositionId}/entries/{table} | Append a visitor entry through the gateway
*PublicEmbedApi* | [**getPublicCompositionEmbed_0**](docs/PublicEmbedApi.md#getpubliccompositionembed_0) | **GET** /embed/compositions/{compositionId} | Resolve a composition UUID to a published widget URL
*PublicEmbedApi* | [**getPublicCompositionIframe_0**](docs/PublicEmbedApi.md#getpubliccompositioniframe_0) | **GET** /embed/compositions/{compositionId}/frame | Embed a published composition with its saved values
*PublicEmbedApi* | [**postPublicCompositionEmbedStatus_0**](docs/PublicEmbedApi.md#postpubliccompositionembedstatus_0) | **POST** /embed/compositions/status | Batch-check whether compositions are currently served for embed
*PublicEmbedApi* | [**uploadPublicCompositionAdapterFile_0**](docs/PublicEmbedApi.md#uploadpubliccompositionadapterfile_0) | **PUT** /embed/compositions/{compositionId}/adapters/upload/files/{ticket} | Send the file a visitor chose through the upload adapter of a published widget
*TokensApi* | [**validateToken_0**](docs/TokensApi.md#validatetoken_0) | **GET** /tokens/validate | Validate current authentication token
*UploadsApi* | [**uploadsGet_0**](docs/UploadsApi.md#uploadsget_0) | **GET** /uploads | List the account&#39;s uploads
*UploadsApi* | [**uploadsIdDelete_0**](docs/UploadsApi.md#uploadsiddelete_0) | **DELETE** /uploads/{id} | Delete an upload
*UploadsApi* | [**uploadsIdGet_0**](docs/UploadsApi.md#uploadsidget_0) | **GET** /uploads/{id} | Get an upload by id
*UploadsApi* | [**uploadsLimitsGet_0**](docs/UploadsApi.md#uploadslimitsget_0) | **GET** /uploads/limits | Upload size limits and accepted file types
*UploadsApi* | [**uploadsPost_0**](docs/UploadsApi.md#uploadspost_0) | **POST** /uploads | Upload a file
*UsersApi* | [**addPersonalWorkspaceDomain_0**](docs/UsersApi.md#addpersonalworkspacedomain_0) | **POST** /users/{id}/workspace/domains | Allow a website to show your widgets
*UsersApi* | [**createUserApiKey_0**](docs/UsersApi.md#createuserapikey_0) | **POST** /users/{id}/keys | Create an API key
*UsersApi* | [**deletePersonalWorkspaceDomain_0**](docs/UsersApi.md#deletepersonalworkspacedomain_0) | **DELETE** /users/{id}/workspace/domains/{domainId} | Stop allowing a website to show your widgets
*UsersApi* | [**deleteUserApiKey_0**](docs/UsersApi.md#deleteuserapikey_0) | **DELETE** /users/{id}/keys/{keyId} | Delete an API key
*UsersApi* | [**getPersonalWorkspaceDomains_0**](docs/UsersApi.md#getpersonalworkspacedomains_0) | **GET** /users/{id}/workspace/domains | List the websites allowed to show your widgets
*UsersApi* | [**getUserAdapterConnections_0**](docs/UsersApi.md#getuseradapterconnections_0) | **GET** /users/{userId}/adapter-connections | See which adapter keys an account has connected
*UsersApi* | [**getUserApiKeyUsageLogs_0**](docs/UsersApi.md#getuserapikeyusagelogs_0) | **GET** /users/{id}/api-keys/{keyId}/logs | Read what an API key was used for
*UsersApi* | [**getUserApiKeys_0**](docs/UsersApi.md#getuserapikeys_0) | **GET** /users/{id}/keys | List the API keys of an account
*UsersApi* | [**removeUserAdapterConnection_0**](docs/UsersApi.md#removeuseradapterconnection_0) | **DELETE** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from an account
*UsersApi* | [**setUserAdapterConnection_0**](docs/UsersApi.md#setuseradapterconnection_0) | **PUT** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to an account
*UsersApi* | [**updatePersonalWorkspaceDomain_0**](docs/UsersApi.md#updatepersonalworkspacedomain_0) | **PUT** /users/{id}/workspace/domains/{domainId} | Change a website on your list
*UsersApi* | [**updateUserApiKey_0**](docs/UsersApi.md#updateuserapikey_0) | **PUT** /users/{id}/keys/{keyId} | Rename an API key, or switch it off or on
*WidgetsApi* | [**createCompositionFromWidget_0**](docs/WidgetsApi.md#createcompositionfromwidget_0) | **POST** /widgets/{id}/composition | Create a composition for a widget in one call
*WidgetsApi* | [**createWidget_0**](docs/WidgetsApi.md#createwidget_0) | **POST** /widgets | Create Widget
*WidgetsApi* | [**getWidgetsBatch_0**](docs/WidgetsApi.md#getwidgetsbatch_0) | **POST** /widgets/batch | Get Widgets Batch
*WidgetsApi* | [**getWidgets_0**](docs/WidgetsApi.md#getwidgets_0) | **GET** /widgets | List Widgets


## Documentation For Models

 - [AccountCreditBalance](docs/AccountCreditBalance.md)
 - [AccountCreditBalanceResponse](docs/AccountCreditBalanceResponse.md)
 - [AccountCreditTransaction](docs/AccountCreditTransaction.md)
 - [AdapterConnection](docs/AdapterConnection.md)
 - [AdapterConnectionRemoval](docs/AdapterConnectionRemoval.md)
 - [AddAiAnswersKnowledgeDocument201Response](docs/AddAiAnswersKnowledgeDocument201Response.md)
 - [AddAiAnswersKnowledgeDocumentRequest](docs/AddAiAnswersKnowledgeDocumentRequest.md)
 - [AddDomainRequest](docs/AddDomainRequest.md)
 - [AiAnswersKnowledge](docs/AiAnswersKnowledge.md)
 - [AiAnswersKnowledgeDocument](docs/AiAnswersKnowledgeDocument.md)
 - [AiAnswersKnowledgeRemoval](docs/AiAnswersKnowledgeRemoval.md)
 - [AiAnswersKnowledgeTotals](docs/AiAnswersKnowledgeTotals.md)
 - [ApiKeyScope](docs/ApiKeyScope.md)
 - [Canvas](docs/Canvas.md)
 - [CanvasResponse](docs/CanvasResponse.md)
 - [CheckCompositionAccessResponse](docs/CheckCompositionAccessResponse.md)
 - [CheckCompositionAccessResponseData](docs/CheckCompositionAccessResponseData.md)
 - [Composition](docs/Composition.md)
 - [CompositionDataSource](docs/CompositionDataSource.md)
 - [CompositionDataSourceResponse](docs/CompositionDataSourceResponse.md)
 - [CompositionEntriesDescription](docs/CompositionEntriesDescription.md)
 - [CompositionEntriesDescriptionResponse](docs/CompositionEntriesDescriptionResponse.md)
 - [CompositionEntriesReading](docs/CompositionEntriesReading.md)
 - [CompositionEntriesReadingResponse](docs/CompositionEntriesReadingResponse.md)
 - [CompositionEntryAggregateTally](docs/CompositionEntryAggregateTally.md)
 - [CompositionEntryAggregatesBlock](docs/CompositionEntryAggregatesBlock.md)
 - [CompositionEntryColumn](docs/CompositionEntryColumn.md)
 - [CompositionEntryDeleteSuccess](docs/CompositionEntryDeleteSuccess.md)
 - [CompositionEntryDeleteSuccessData](docs/CompositionEntryDeleteSuccessData.md)
 - [CompositionEntryItem](docs/CompositionEntryItem.md)
 - [CompositionEntryItemsMeta](docs/CompositionEntryItemsMeta.md)
 - [CompositionEntryItemsPageSuccess](docs/CompositionEntryItemsPageSuccess.md)
 - [CompositionEntryTable](docs/CompositionEntryTable.md)
 - [CompositionEntryTally](docs/CompositionEntryTally.md)
 - [CompositionResponse](docs/CompositionResponse.md)
 - [CompositionVersion](docs/CompositionVersion.md)
 - [ContentCheckFinding](docs/ContentCheckFinding.md)
 - [ContentItemWriteResult](docs/ContentItemWriteResult.md)
 - [ContentItemWriteResultValidationResult](docs/ContentItemWriteResultValidationResult.md)
 - [CopyPartnerPresetRequest](docs/CopyPartnerPresetRequest.md)
 - [CreateCanvasRequest](docs/CreateCanvasRequest.md)
 - [CreateCompositionContentItem201Response](docs/CreateCompositionContentItem201Response.md)
 - [CreateCompositionContentItemRequest](docs/CreateCompositionContentItemRequest.md)
 - [CreateCompositionDatabaseRecord201Response](docs/CreateCompositionDatabaseRecord201Response.md)
 - [CreateCompositionFromPresetRequest](docs/CreateCompositionFromPresetRequest.md)
 - [CreateCompositionFromWidget201Response](docs/CreateCompositionFromWidget201Response.md)
 - [CreateCompositionFromWidgetRequest](docs/CreateCompositionFromWidgetRequest.md)
 - [CreateUserApiKeyRequest](docs/CreateUserApiKeyRequest.md)
 - [CreateWidget201Response](docs/CreateWidget201Response.md)
 - [CreateWidget201ResponseData](docs/CreateWidget201ResponseData.md)
 - [CreatedUserApiKey](docs/CreatedUserApiKey.md)
 - [CreatedUserApiKeyResponse](docs/CreatedUserApiKeyResponse.md)
 - [DeleteCompositionContentItemResponse](docs/DeleteCompositionContentItemResponse.md)
 - [DeleteCompositionContentItemResponseData](docs/DeleteCompositionContentItemResponseData.md)
 - [DeleteCompositionDataSourceResponse](docs/DeleteCompositionDataSourceResponse.md)
 - [DeleteCompositionDataSourceResponseData](docs/DeleteCompositionDataSourceResponseData.md)
 - [DeleteManagedUser200Response](docs/DeleteManagedUser200Response.md)
 - [DeletePersonalWorkspaceDomainResponse](docs/DeletePersonalWorkspaceDomainResponse.md)
 - [DeletePersonalWorkspaceDomainResponseData](docs/DeletePersonalWorkspaceDomainResponseData.md)
 - [DeleteUserApiKeyResponse](docs/DeleteUserApiKeyResponse.md)
 - [DeleteUserApiKeyResponseData](docs/DeleteUserApiKeyResponseData.md)
 - [DesignDefaults](docs/DesignDefaults.md)
 - [DuplicateComposition202Response](docs/DuplicateComposition202Response.md)
 - [DuplicateComposition202ResponseData](docs/DuplicateComposition202ResponseData.md)
 - [DuplicateCompositionRequest](docs/DuplicateCompositionRequest.md)
 - [EditorSession](docs/EditorSession.md)
 - [EditorSessionResponse](docs/EditorSessionResponse.md)
 - [Entitlement](docs/Entitlement.md)
 - [ErrorDetail](docs/ErrorDetail.md)
 - [ErrorResponse](docs/ErrorResponse.md)
 - [ExportCompositionEntryItems200Response](docs/ExportCompositionEntryItems200Response.md)
 - [ExportCompositionEntryItems200ResponseMeta](docs/ExportCompositionEntryItems200ResponseMeta.md)
 - [GetAiAnswersKnowledge200Response](docs/GetAiAnswersKnowledge200Response.md)
 - [GetAllCanvasesResponse](docs/GetAllCanvasesResponse.md)
 - [GetAllCanvasesResponseData](docs/GetAllCanvasesResponseData.md)
 - [GetAllCompositions200Response](docs/GetAllCompositions200Response.md)
 - [GetAllManagedUsers200Response](docs/GetAllManagedUsers200Response.md)
 - [GetCompositionContentResponse](docs/GetCompositionContentResponse.md)
 - [GetCompositionContentSchemaResponse](docs/GetCompositionContentSchemaResponse.md)
 - [GetCompositionContentSchemaResponseData](docs/GetCompositionContentSchemaResponseData.md)
 - [GetCompositionDataSourceResponse](docs/GetCompositionDataSourceResponse.md)
 - [GetCompositionDatabaseRecords200Response](docs/GetCompositionDatabaseRecords200Response.md)
 - [GetCompositionDesignResponse](docs/GetCompositionDesignResponse.md)
 - [GetCompositionDesignSchemaResponse](docs/GetCompositionDesignSchemaResponse.md)
 - [GetCompositionDesignSchemaResponseData](docs/GetCompositionDesignSchemaResponseData.md)
 - [GetCompositionEmbedSchemaResponse](docs/GetCompositionEmbedSchemaResponse.md)
 - [GetCompositionEmbedSchemaResponseData](docs/GetCompositionEmbedSchemaResponseData.md)
 - [GetCompositionEmbedSettingsResponse](docs/GetCompositionEmbedSettingsResponse.md)
 - [GetCompositionPreviewResponse](docs/GetCompositionPreviewResponse.md)
 - [GetCompositionPreviewResponseData](docs/GetCompositionPreviewResponseData.md)
 - [GetCompositionVersions200Response](docs/GetCompositionVersions200Response.md)
 - [GetCompositionsBatchRequest](docs/GetCompositionsBatchRequest.md)
 - [GetCompositionsBatchResponse](docs/GetCompositionsBatchResponse.md)
 - [GetCompositionsBatchResponseData](docs/GetCompositionsBatchResponseData.md)
 - [GetInvoicesByPartnerId200Response](docs/GetInvoicesByPartnerId200Response.md)
 - [GetManagedUserEntitlementsResponse](docs/GetManagedUserEntitlementsResponse.md)
 - [GetManagedUserEntitlementsResponseData](docs/GetManagedUserEntitlementsResponseData.md)
 - [GetManagedUserLimits200Response](docs/GetManagedUserLimits200Response.md)
 - [GetManagedUserStorageUsage200Response](docs/GetManagedUserStorageUsage200Response.md)
 - [GetManagedUserStorageUsage200ResponseData](docs/GetManagedUserStorageUsage200ResponseData.md)
 - [GetManagedUserStorageUsage200ResponseDataByPurpose](docs/GetManagedUserStorageUsage200ResponseDataByPurpose.md)
 - [GetManagedUsersByManagerIdResponse](docs/GetManagedUsersByManagerIdResponse.md)
 - [GetManagedUsersByManagerIdResponseData](docs/GetManagedUsersByManagerIdResponseData.md)
 - [GetPartnerBillingOverview200Response](docs/GetPartnerBillingOverview200Response.md)
 - [GetPartnerCreditTransactions200Response](docs/GetPartnerCreditTransactions200Response.md)
 - [GetPartnerDesignDefaults200Response](docs/GetPartnerDesignDefaults200Response.md)
 - [GetPartnerEntitlementsResponse](docs/GetPartnerEntitlementsResponse.md)
 - [GetPartnerEntitlementsResponseData](docs/GetPartnerEntitlementsResponseData.md)
 - [GetPersonalWorkspaceDomains200Response](docs/GetPersonalWorkspaceDomains200Response.md)
 - [GetPublicCompositionEmbed200Response](docs/GetPublicCompositionEmbed200Response.md)
 - [GetPublicCompositionEmbed200ResponseDataSource](docs/GetPublicCompositionEmbed200ResponseDataSource.md)
 - [GetPublicCompositionEmbed200ResponseDirect](docs/GetPublicCompositionEmbed200ResponseDirect.md)
 - [GetUserAdapterConnections200Response](docs/GetUserAdapterConnections200Response.md)
 - [GetUserApiKeyUsageLogsResponse](docs/GetUserApiKeyUsageLogsResponse.md)
 - [GetUserApiKeyUsageLogsResponseData](docs/GetUserApiKeyUsageLogsResponseData.md)
 - [GetUserApiKeys200Response](docs/GetUserApiKeys200Response.md)
 - [GetWidgets200Response](docs/GetWidgets200Response.md)
 - [GetWidgetsBatchRequest](docs/GetWidgetsBatchRequest.md)
 - [GetWidgetsBatchResponse](docs/GetWidgetsBatchResponse.md)
 - [GetWidgetsBatchResponseData](docs/GetWidgetsBatchResponseData.md)
 - [GetWidgetsBatchResponseDataErrorsInner](docs/GetWidgetsBatchResponseDataErrorsInner.md)
 - [ListPartnerPresets200Response](docs/ListPartnerPresets200Response.md)
 - [ManagedUser](docs/ManagedUser.md)
 - [ManagedUserEntriesMeta](docs/ManagedUserEntriesMeta.md)
 - [ManagedUserEntriesPageSuccess](docs/ManagedUserEntriesPageSuccess.md)
 - [ManagedUserEntryItem](docs/ManagedUserEntryItem.md)
 - [ManagedUserLimits](docs/ManagedUserLimits.md)
 - [ManagedUserOperationUsage](docs/ManagedUserOperationUsage.md)
 - [ManagedUserRemoval](docs/ManagedUserRemoval.md)
 - [ManagedUserResponse](docs/ManagedUserResponse.md)
 - [ManagedUserUsage](docs/ManagedUserUsage.md)
 - [ManagedUserUsageResponse](docs/ManagedUserUsageResponse.md)
 - [ManagedUserUsageTotals](docs/ManagedUserUsageTotals.md)
 - [MyPartner](docs/MyPartner.md)
 - [MyPartners](docs/MyPartners.md)
 - [MyPartnersResponse](docs/MyPartnersResponse.md)
 - [NewComposition](docs/NewComposition.md)
 - [NewEditorSession](docs/NewEditorSession.md)
 - [NewManagedUser](docs/NewManagedUser.md)
 - [NewWidget](docs/NewWidget.md)
 - [OperationsIdGetResponse](docs/OperationsIdGetResponse.md)
 - [OperationsIdGetResponseData](docs/OperationsIdGetResponseData.md)
 - [PartnerAnalyticsByManagedUser](docs/PartnerAnalyticsByManagedUser.md)
 - [PartnerAnalyticsByManagedUserResponse](docs/PartnerAnalyticsByManagedUserResponse.md)
 - [PartnerAnalyticsOfDay](docs/PartnerAnalyticsOfDay.md)
 - [PartnerAnalyticsOfManagedUser](docs/PartnerAnalyticsOfManagedUser.md)
 - [PartnerAnalyticsOfWidget](docs/PartnerAnalyticsOfWidget.md)
 - [PartnerAnalyticsSummary](docs/PartnerAnalyticsSummary.md)
 - [PartnerAnalyticsSummaryResponse](docs/PartnerAnalyticsSummaryResponse.md)
 - [PartnerAnalyticsTimeline](docs/PartnerAnalyticsTimeline.md)
 - [PartnerAnalyticsTimelineResponse](docs/PartnerAnalyticsTimelineResponse.md)
 - [PartnerAnalyticsTopWidgets](docs/PartnerAnalyticsTopWidgets.md)
 - [PartnerAnalyticsTopWidgetsResponse](docs/PartnerAnalyticsTopWidgetsResponse.md)
 - [PartnerBillingOverview](docs/PartnerBillingOverview.md)
 - [PartnerBillingOverviewBillingIntegration](docs/PartnerBillingOverviewBillingIntegration.md)
 - [PartnerBillingOverviewOperationalCredits](docs/PartnerBillingOverviewOperationalCredits.md)
 - [PartnerBillingOverviewPartner](docs/PartnerBillingOverviewPartner.md)
 - [PartnerContract](docs/PartnerContract.md)
 - [PartnerContractResponse](docs/PartnerContractResponse.md)
 - [PartnerCustomization](docs/PartnerCustomization.md)
 - [PartnerDataDatabase](docs/PartnerDataDatabase.md)
 - [PartnerDataDatabaseRemoval](docs/PartnerDataDatabaseRemoval.md)
 - [PartnerDataDatabaseRemovalResponse](docs/PartnerDataDatabaseRemovalResponse.md)
 - [PartnerDataDatabaseResponse](docs/PartnerDataDatabaseResponse.md)
 - [PartnerEntryContextSecret](docs/PartnerEntryContextSecret.md)
 - [PartnerEntryContextSecretResponse](docs/PartnerEntryContextSecretResponse.md)
 - [PartnerEntryContextSigning](docs/PartnerEntryContextSigning.md)
 - [PartnerEntryContextSigningResponse](docs/PartnerEntryContextSigningResponse.md)
 - [PartnerExtraCreditsInvoice](docs/PartnerExtraCreditsInvoice.md)
 - [PartnerExtraCreditsInvoiceResponse](docs/PartnerExtraCreditsInvoiceResponse.md)
 - [PartnerInvoice](docs/PartnerInvoice.md)
 - [PartnerNotification](docs/PartnerNotification.md)
 - [PartnerNotificationDefaultRecipients](docs/PartnerNotificationDefaultRecipients.md)
 - [PartnerNotificationDelivery](docs/PartnerNotificationDelivery.md)
 - [PartnerNotificationDeliveryLog](docs/PartnerNotificationDeliveryLog.md)
 - [PartnerNotificationDeliveryLogResponse](docs/PartnerNotificationDeliveryLogResponse.md)
 - [PartnerNotificationDeliveryResponse](docs/PartnerNotificationDeliveryResponse.md)
 - [PartnerNotificationEvent](docs/PartnerNotificationEvent.md)
 - [PartnerNotificationEventType](docs/PartnerNotificationEventType.md)
 - [PartnerNotificationPage](docs/PartnerNotificationPage.md)
 - [PartnerNotificationPageResponse](docs/PartnerNotificationPageResponse.md)
 - [PartnerNotificationSettings](docs/PartnerNotificationSettings.md)
 - [PartnerNotificationSettingsChange](docs/PartnerNotificationSettingsChange.md)
 - [PartnerNotificationSettingsChangeResponse](docs/PartnerNotificationSettingsChangeResponse.md)
 - [PartnerNotificationSettingsResponse](docs/PartnerNotificationSettingsResponse.md)
 - [PartnerNotificationTestEventRequest](docs/PartnerNotificationTestEventRequest.md)
 - [PartnerNotificationTestEventResult](docs/PartnerNotificationTestEventResult.md)
 - [PartnerNotificationTestEventResultResponse](docs/PartnerNotificationTestEventResultResponse.md)
 - [PartnerPreset](docs/PartnerPreset.md)
 - [PartnerPresetCopy](docs/PartnerPresetCopy.md)
 - [PartnerPresetCopyResponse](docs/PartnerPresetCopyResponse.md)
 - [PartnerPresetRemoval](docs/PartnerPresetRemoval.md)
 - [PartnerPresetRemovalResponse](docs/PartnerPresetRemovalResponse.md)
 - [PartnerPresetResponse](docs/PartnerPresetResponse.md)
 - [PartnerReportPage](docs/PartnerReportPage.md)
 - [PartnerReportPeriod](docs/PartnerReportPeriod.md)
 - [PartnerStorageDestination](docs/PartnerStorageDestination.md)
 - [PartnerStorageDestinationResponse](docs/PartnerStorageDestinationResponse.md)
 - [PartnerStorageRemoval](docs/PartnerStorageRemoval.md)
 - [PartnerStorageRemovalResponse](docs/PartnerStorageRemovalResponse.md)
 - [PartnerStorageUsage](docs/PartnerStorageUsage.md)
 - [PartnerStorageUsageOfManagedUser](docs/PartnerStorageUsageOfManagedUser.md)
 - [PartnerStorageUsageResponse](docs/PartnerStorageUsageResponse.md)
 - [PartnerStorageUsageTotals](docs/PartnerStorageUsageTotals.md)
 - [PersonalWorkspaceDomain](docs/PersonalWorkspaceDomain.md)
 - [PersonalWorkspaceDomainResult](docs/PersonalWorkspaceDomainResult.md)
 - [PersonalWorkspaceDomainResultResponse](docs/PersonalWorkspaceDomainResultResponse.md)
 - [PostPublicCompositionEmbedStatus200Response](docs/PostPublicCompositionEmbedStatus200Response.md)
 - [PostPublicCompositionEmbedStatus200ResponseData](docs/PostPublicCompositionEmbedStatus200ResponseData.md)
 - [PostPublicCompositionEmbedStatusRequest](docs/PostPublicCompositionEmbedStatusRequest.md)
 - [PublicAdapterCallError](docs/PublicAdapterCallError.md)
 - [PublicAdapterCallRequest](docs/PublicAdapterCallRequest.md)
 - [PublicAdapterCallResult](docs/PublicAdapterCallResult.md)
 - [PublicAdapterCallResultData](docs/PublicAdapterCallResultData.md)
 - [PublicAdapterFileResult](docs/PublicAdapterFileResult.md)
 - [PublicAdapterFileResultData](docs/PublicAdapterFileResultData.md)
 - [PublicAdapterFileResultDataFile](docs/PublicAdapterFileResultDataFile.md)
 - [PublicCompositionEntryCreated](docs/PublicCompositionEntryCreated.md)
 - [PublicCompositionEntryCreatedData](docs/PublicCompositionEntryCreatedData.md)
 - [PublicCompositionEntryRequest](docs/PublicCompositionEntryRequest.md)
 - [PublicEmbedFailure](docs/PublicEmbedFailure.md)
 - [PublicEmbedFailureDetails](docs/PublicEmbedFailureDetails.md)
 - [PublicEmbedFailureError](docs/PublicEmbedFailureError.md)
 - [PurposeStorageBucket](docs/PurposeStorageBucket.md)
 - [RemoveAiAnswersKnowledgeDocument200Response](docs/RemoveAiAnswersKnowledgeDocument200Response.md)
 - [RemoveUserAdapterConnection200Response](docs/RemoveUserAdapterConnection200Response.md)
 - [RequestExtraCredits](docs/RequestExtraCredits.md)
 - [ResponseMeta](docs/ResponseMeta.md)
 - [RevokeManagedUserEditorSessionsResponse](docs/RevokeManagedUserEditorSessionsResponse.md)
 - [RevokeManagedUserEditorSessionsResponseData](docs/RevokeManagedUserEditorSessionsResponseData.md)
 - [SetAdapterConnectionRequest](docs/SetAdapterConnectionRequest.md)
 - [SetCompositionDataSourceRequest](docs/SetCompositionDataSourceRequest.md)
 - [SetDynamicContentRequest](docs/SetDynamicContentRequest.md)
 - [SetDynamicContentResponse](docs/SetDynamicContentResponse.md)
 - [SetDynamicContentResponseData](docs/SetDynamicContentResponseData.md)
 - [SetDynamicContentResponseDataValidationResult](docs/SetDynamicContentResponseDataValidationResult.md)
 - [SetManagedUserLimitsRequest](docs/SetManagedUserLimitsRequest.md)
 - [SetPartnerDataDatabaseRequest](docs/SetPartnerDataDatabaseRequest.md)
 - [SetPartnerDesignDefaultsRequest](docs/SetPartnerDesignDefaultsRequest.md)
 - [SetPartnerPresetRequest](docs/SetPartnerPresetRequest.md)
 - [SetPartnerStorageDestinationRequest](docs/SetPartnerStorageDestinationRequest.md)
 - [SetUserAdapterConnection200Response](docs/SetUserAdapterConnection200Response.md)
 - [SuccessResponse](docs/SuccessResponse.md)
 - [UpdateCanvasRequest](docs/UpdateCanvasRequest.md)
 - [UpdateComposition](docs/UpdateComposition.md)
 - [UpdateCompositionStatusRequest](docs/UpdateCompositionStatusRequest.md)
 - [UpdateDomainRequest](docs/UpdateDomainRequest.md)
 - [UpdateManagedUser](docs/UpdateManagedUser.md)
 - [UpdatePartnerEntryContextSigningRequest](docs/UpdatePartnerEntryContextSigningRequest.md)
 - [UpdatePartnerNotificationSettingsRequest](docs/UpdatePartnerNotificationSettingsRequest.md)
 - [UpdateUserApiKeyRequest](docs/UpdateUserApiKeyRequest.md)
 - [Upload](docs/Upload.md)
 - [UploadLimits](docs/UploadLimits.md)
 - [UploadLimitsResponse](docs/UploadLimitsResponse.md)
 - [UploadResponse](docs/UploadResponse.md)
 - [UploadsGet200Response](docs/UploadsGet200Response.md)
 - [UploadsIdDelete200Response](docs/UploadsIdDelete200Response.md)
 - [UploadsIdDelete200ResponseData](docs/UploadsIdDelete200ResponseData.md)
 - [UserApiKey](docs/UserApiKey.md)
 - [UserApiKeyResponse](docs/UserApiKeyResponse.md)
 - [UserApiKeyUsageLog](docs/UserApiKeyUsageLog.md)
 - [ValidateCompositionContentResponse](docs/ValidateCompositionContentResponse.md)
 - [ValidateCompositionContentResponseData](docs/ValidateCompositionContentResponseData.md)
 - [ValidateToken200Response](docs/ValidateToken200Response.md)
 - [ValidateToken200ResponseData](docs/ValidateToken200ResponseData.md)
 - [Widget](docs/Widget.md)


## Documentation For Authorization


## apiKeyAuth


- **Type**: HTTP Bearer Token authentication (JWT)

## bearerAuth


- **Type**: HTTP Bearer Token authentication (JWT)

## BearerAuth


- **Type**: HTTP Bearer Token authentication (JWT)

## ApiKeyAuth


- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header

## webhookSignature


- **Type**: API key
- **API key parameter name**: X-Webhook-Signature
- **Location**: HTTP header

