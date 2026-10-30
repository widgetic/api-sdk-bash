# ManagedUsersApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**copyPresetForManagedUser_0**](ManagedUsersApi.md#copyPresetForManagedUser_0) | **POST** /managed-users/{id}/presets/{key}/copy | Give a managed user a copy of one of your presets
[**createCompositionFromPreset_0**](ManagedUsersApi.md#createCompositionFromPreset_0) | **POST** /managed-users/{id}/presets/{key}/composition | Create a composition from one of your presets in one call
[**createManagedUserEditorSession_0**](ManagedUsersApi.md#createManagedUserEditorSession_0) | **POST** /managed-users/{id}/editor-sessions | Create an editor session for a managed user
[**createManagedUser_0**](ManagedUsersApi.md#createManagedUser_0) | **POST** /managed-users | Create Managed User
[**deleteManagedUser_0**](ManagedUsersApi.md#deleteManagedUser_0) | **DELETE** /managed-users/{id} | Delete Managed User
[**getAllManagedUsers_0**](ManagedUsersApi.md#getAllManagedUsers_0) | **GET** /managed-users | Get Managed Users
[**getManagedUserById_0**](ManagedUsersApi.md#getManagedUserById_0) | **GET** /managed-users/{id} | Get Managed User By ID
[**getManagedUserDesignDefaults_0**](ManagedUsersApi.md#getManagedUserDesignDefaults_0) | **GET** /managed-users/{id}/design-defaults | Read design defaults for one managed user
[**getManagedUserLimits_0**](ManagedUsersApi.md#getManagedUserLimits_0) | **GET** /managed-users/{id}/limits | Read monthly credit cap and usage for one managed user
[**getManagedUserStorageUsage_0**](ManagedUsersApi.md#getManagedUserStorageUsage_0) | **GET** /managed-users/{id}/storage-usage | Storage used by one managed user&#39;s uploads
[**getManagedUserUsage_0**](ManagedUsersApi.md#getManagedUserUsage_0) | **GET** /managed-users/{id}/usage | What a managed user&#39;s editor sessions spent
[**getManagedUsersByManagerId_0**](ManagedUsersApi.md#getManagedUsersByManagerId_0) | **GET** /users/{managerId}/managed-users | Get Managed Users By Manager
[**revokeManagedUserEditorSession_0**](ManagedUsersApi.md#revokeManagedUserEditorSession_0) | **DELETE** /managed-users/{id}/editor-sessions/{sessionId} | End one editor session of a managed user
[**revokeManagedUserEditorSessions_0**](ManagedUsersApi.md#revokeManagedUserEditorSessions_0) | **DELETE** /managed-users/{id}/editor-sessions | End every editor session of a managed user
[**setManagedUserDesignDefaults_0**](ManagedUsersApi.md#setManagedUserDesignDefaults_0) | **PUT** /managed-users/{id}/design-defaults | Set or clear design defaults for one managed user
[**setManagedUserLimits_0**](ManagedUsersApi.md#setManagedUserLimits_0) | **PUT** /managed-users/{id}/limits | Set or clear the monthly credit cap for one managed user
[**updateManagedUser_0**](ManagedUsersApi.md#updateManagedUser_0) | **PUT** /managed-users/{id} | Update Managed User



## copyPresetForManagedUser_0

Give a managed user a copy of one of your presets

Copies the preset 'key' (see 'setPartnerPreset') onto a new canvas for one of your managed users, so their
widget creator opens on a widget of their own that starts from yours. The copy is a draft widget in your
account, filed under the managed user: 'getAllWidgets' with 'managedUserId' lists it, and no other managed
user's editor can reach it.

The copy carries the preset's code, design and content schemas, and thumbnail, and starts from a fork of its
code repository, so the user's chat edits begin where yours left off. It does not carry the preset's
database or its compositions. It is not a preset itself, and changing or removing the preset afterwards
never touches it.

To start a composition (the content and design editor) instead, you do not need a copy: call
'createComposition' with the preset's 'widgetId' (from 'listPartnerPresets') and the managed user.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry, so one copy
is made, not two. A copy that could not be made leaves nothing behind (503 'PRESET_COPY_FAILED').

The managed user must be yours and active.

### Example

```bash
client.sh copyPresetForManagedUser_0 id=value key=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The managed user to give the copy to (Widgetic's id for the user) | [default to null]
 **key** | **string** | The key of the preset to copy | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **copyPartnerPresetRequest** | [**CopyPartnerPresetRequest**](CopyPartnerPresetRequest.md) |  | [optional]

### Return type

[**PartnerPresetCopyResponse**](PartnerPresetCopyResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createCompositionFromPreset_0

Create a composition from one of your presets in one call

Validates the name, optional content, design, embed settings and locale, then creates a draft composition
filed under the managed user, built on the preset's widget, in a single insert. A failure never leaves a
half-made composition.

The preset's widget must be published. The managed user must be yours and active.

A widget that keeps what visitors send (a form, a vote, a rating) declares its tables in its own source
('src/lib/meta/database.json'); they are made for the composition here, in a schema of its own, as the widget
was when it was last published. A widget that keeps nothing leaves the composition without tables. If the
tables cannot be made just now, or the widget's file cannot be used, the composition is still created ('201')
and 'meta.warnings' says why; the tables are made the next time the widget is generated.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry, so one
composition is created, not two.

### Example

```bash
client.sh createCompositionFromPreset_0 id=value key=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **key** | **string** |  | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createCompositionFromPresetRequest** | [**CreateCompositionFromPresetRequest**](CreateCompositionFromPresetRequest.md) |  |

### Return type

[**CreateCompositionFromWidget201Response**](CreateCompositionFromWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createManagedUserEditorSession_0

Create an editor session for a managed user

Makes a short-lived credential that lets the browser of ONE of your managed users use Widgetic's editor
pieces, such as the File Browser and the composition editor, without your API key ever reaching that
browser. Call this from your server when the page that hosts the editor opens, and hand the 'token' in
the answer to that page.

The token is shown once. It starts with 'wgt_ses_' and the browser sends it as
'Authorization: Bearer <token>'. It can do only what the 'surfaces' you name allow, and only for this
managed user:

- 'files': upload a file ('uploadsPost') and list the files uploaded for this user ('uploadsGet'). Every
  file is filed for this user and stored in your own storage destination, never in Widgetic's: a file a
  customer uploads is yours to keep, and takes none of your storage allowance. Partner storage is not
  optional, so no session, whatever its surfaces, can be made until you have set a destination
  ('setPartnerStorageDestination'); until then it is refused with 409 and 'PARTNER_STORAGE_REQUIRED', and
  when the destination cannot be used with 503 and 'STORAGE_DESTINATION_UNAVAILABLE'. A destination you
  remove after the session was made stops its uploads too (the same 409; the browser is only told that
  the feature is not available right now). To keep a customer from uploading, leave 'files' out of the
  session and hand the editors your own media library instead ('mediaLibrary').
- 'editor': edit one of this user's compositions: read it ('getCompositionById', its content, design,
  embed settings and schemas), check a content change ('validateCompositionContent'), and change its
  name, content, design and embed settings ('updateComposition', 'setDynamicContent'). For a widget that
  answers visitors' questions from documents (the 'ai-answers' adapter), it also lists those documents,
  adds one as text or as a file (a text file or a picture; a PDF once PDFs are read), and removes one
  ('getAiAnswersKnowledge', 'addAiAnswersKnowledgeDocument', 'addAiAnswersKnowledgeFile',
  'removeAiAnswersKnowledgeDocument'); adding costs no credits, and is limited for each of your users
  separately. It can reach
  only compositions you created for this managed user (tag them with 'managedUserId' when you create
  them); any other composition, including another of your users', answers 404.
- 'creator': use Widgetic's widget creator for this user, including its AI. Draw on canvases and save
  them ('getAllCanvases', 'getCanvas', 'createCanvas', 'updateCanvas', 'previewDeleteCanvas',
  'deleteCanvas'); make, change, copy and delete the widgets on them ('createWidget', 'getWidgets',
  'getWidgetsBatch', 'updateWidget', 'uploadWidgetThumbnail', 'duplicateWidget', 'deleteWidget');
  list and make the compositions of a widget it built ('getAllCompositions', 'createComposition'), which
  is how it shows the widget with sample values; keep the
  conversation of each widget ('getConversationsByWidgetId', 'createConversationForWidget',
  'updateConversation', 'getMessages', 'createMessage', 'updateMessage', 'restoreCheckpoint'); and read a
  widget's schemas and give it its repository ('getWidgetContentSchema', 'getWidgetDesignSchema',
  'updateWidgetRepository'). The AI that builds a widget is part of it: list the models
  ('agentModelsGet'), open the widget's repository ('agentRepositoriesPost',
  'agentRepositoriesRepoIdGet'), start a generation and follow or cancel it ('agentCodeGeneratePost',
  'operationsStreamGet', 'operationsIdGet', 'operationsIdCancelPost'), build and preview the result
  ('agentWidgetBuilderRepoHeadWidgetIdGet', 'buildWidgetFromRepo', 'previewWidgetVersion'), publish a
  version of the widget and move between its versions ('agentWidgetBuilderPublishWidgetIdPost',
  'getWidgetPublishHistory', 'setWidgetPublishHistoryLive', 'renameWidgetPublishHistoryTitle'), and
  turn a stroke or a sentence into a decision ('agentShapeRecognizePost', 'agentDesignResolvePost'). It can
  also offer the customer your presets as starting points: read them and ask for a copy for this customer
  ('listMyPresets', 'copyMyPreset'; you choose the presets with 'setPartnerPreset').
  What the session makes is filed for this managed user, and the lists it reads hold only this user's
  canvases, widgets and compositions. It can reach only canvases, widgets, compositions, repositories,
  uploaded files and operations made for this managed user (tag the canvases and widgets you create
  with 'managedUserId'); any other canvas, widget, composition, conversation, message, repository, file
  or operation, including another of your users', answers 404. The creator also saves the composition
  it is editing ('updateComposition', from the 'editor' surface) and attaches pictures to its chat
  ('uploadsPost', from the 'files' surface), and the surfaces do not imply one another: to open the
  whole creator for a user, ask for 'creator', 'editor' and 'files' together. A generation or a build
  one user starts can be followed and cancelled by that user and by you, never by another of your
  users. The AI is paid for by your account, as your own calls are: its credits and allowances are
  yours. A session cannot make a widget public (publishing a version does not), file one under a
  project or an organization, or set anything the creator does not set: a body with another field is
  refused with 403 and 'EDITOR_SESSION_FIELD_NOT_ALLOWED'.
- 'workflows': use Widgetic's Workflows editor for this user. List their workflows and the compositions
  a workflow of theirs can chain ('listWorkspaceWorkflows', 'listWorkspaceWorkflowCompositionOptions');
  list the starting points you offer them and make a workflow from one, which gives the user their own copy
  of every widget it chains, a composition of their own on each copy, and a draft
  ('listWorkspaceWorkflowPresets', 'createWorkspaceWorkflowFromPreset'; you offer them with
  'setPartnerWorkflowPreset');
  make, open, change and delete one ('createWorkspaceWorkflow', 'getWorkspaceWorkflow',
  'saveWorkspaceWorkflow', 'deleteWorkspaceWorkflow') and copy it ('duplicateWorkspaceWorkflow'); publish
  it or discard the changes of its draft ('publishWorkspaceWorkflow',
  'discardWorkspaceWorkflowChanges'); read and restore its versions ('listWorkspaceWorkflowVersions',
  'getWorkspaceWorkflowVersion', 'restoreWorkspaceWorkflowVersion'); pause, resume, archive and unarchive it
  ('pauseWorkspaceWorkflow', 'resumeWorkspaceWorkflow', 'archiveWorkspaceWorkflow',
  'unarchiveWorkspaceWorkflow'); and read its counts ('getWorkspaceWorkflowStats'). The workspace in each
  path is 'personal': a session has no other, and a path that names an organization is refused. What the
  session makes is filed for this managed user ('managedUserId'), the lists hold only this user's workflows,
  and it can reach only workflows made for this managed user; any other workflow, including one of yours
  or of another of your users, answers 404. A workflow can chain only the compositions you made for this
  managed user (tag them with 'managedUserId'): one that belongs to anybody else is not available, and
  publishing a workflow that uses it is refused. A customer can have at most 50 workflows, and what a
  customer's session reads never says who published a version. A session cannot set who a workflow belongs
  to or which workspace it is in: a body with another field is refused with 403 and
  'EDITOR_SESSION_FIELD_NOT_ALLOWED'.

Everything else is refused with 403 and 'EDITOR_SESSION_ROUTE_NOT_ALLOWED': a session cannot read your
account, make more sessions, change your presets or delete a composition, and a session without the 'creator' surface cannot
create or list compositions. Create the composition yourself with your API key, then open the editor on it.

A session ends at 'expiresAt' (at most four hours), when you end it ('revokeManagedUserEditorSession'),
or when the managed user is switched off or deleted. A managed user can have at most 100 live sessions at
once ('429 EDITOR_SESSION_LIMIT_REACHED'). A session that is bound to a web page ('allowedOrigin') is
refused from any other origin.

The AI the session runs is paid for with your credits. Set 'maxCredits' to hold the session to a number
of them: once its generations have taken that many (a generation that fails is refunded and does not
count), the next one is refused with 402 and 'EDITOR_SESSION_CREDIT_LIMIT_REACHED', and the browser is told
only that the feature is not available right now. Without it, the limit Widgetic has set for your account
applies when it has set one (the same limit for every session you make, and 'maxCredits: null' asks for
none), and otherwise the credits of your account are the only ceiling. What each of your users' sessions
has spent is in 'getManagedUserUsage'.

Each call makes a new session. It does not take an 'Idempotency-Key': the answer holds the token, and
the token is never stored where a retry could read it back. The answer is sent with
'Cache-Control: no-store'.

### Example

```bash
client.sh createManagedUserEditorSession_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The managed user the session is for (Widgetic's id for the user) | [default to null]
 **newEditorSession** | [**NewEditorSession**](NewEditorSession.md) |  |

### Return type

[**EditorSessionResponse**](EditorSessionResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createManagedUser_0

Create Managed User

Creates a new managed user for a partner account.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry, so one
managed user is created, not two.

### Example

```bash
client.sh createManagedUser_0 Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **newManagedUser** | [**NewManagedUser**](NewManagedUser.md) |  |

### Return type

[**ManagedUserResponse**](ManagedUserResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteManagedUser_0

Delete Managed User

Deletes a managed user by ID. Its editor sessions end with it. What was filed under it (compositions, widgets, uploads) stays in your account, untagged.

### Example

```bash
client.sh deleteManagedUser_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the managed user to delete | [default to null]

### Return type

[**DeleteManagedUser200Response**](DeleteManagedUser200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getAllManagedUsers_0

Get Managed Users

Retrieve the managed users you manage, with pagination support. (Admins see every partner's managed users.)

### Example

```bash
client.sh getAllManagedUsers_0  page=value  size=value  sort=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer** | Page number for pagination | [optional] [default to 1]
 **size** | **integer** | Number of items per page | [optional] [default to 10]
 **sort** | **string** | Sort field and direction, '<field>:<asc|desc>'. The field is 'createdAt', 'updatedAt' or 'externalId' (the snake_case spellings 'created_at', 'updated_at' and 'external_id' work too); 'asc' or 'desc' alone sorts by 'createdAt'. Any other field is a 400. | [optional] [default to createdAt:desc]

### Return type

[**GetAllManagedUsers200Response**](GetAllManagedUsers200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUserById_0

Get Managed User By ID

Retrieves a specific managed user by ID.

### Example

```bash
client.sh getManagedUserById_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the managed user to retrieve | [default to null]

### Return type

[**ManagedUserResponse**](ManagedUserResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUserDesignDefaults_0

Read design defaults for one managed user

### Example

```bash
client.sh getManagedUserDesignDefaults_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**GetPartnerDesignDefaults200Response**](GetPartnerDesignDefaults200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUserLimits_0

Read monthly credit cap and usage for one managed user

### Example

```bash
client.sh getManagedUserLimits_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**GetManagedUserLimits200Response**](GetManagedUserLimits200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUserStorageUsage_0

Storage used by one managed user's uploads

### Example

```bash
client.sh getManagedUserStorageUsage_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]

### Return type

[**GetManagedUserStorageUsage200Response**](GetManagedUserStorageUsage200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUserUsage_0

What a managed user's editor sessions spent

Says how many credits the editor sessions of one of your managed users took from your account over a
period, in total and for each operation. A generation costs one credit, taken from your account when it
starts; one that fails is refunded and is counted as refunded, not as spent.

Only what was spent through editor sessions is here, and only since usage was first recorded: what you
spend with your API key, and anything from before, is not. Use it to see which of your users spend the
most, or to charge them for it. To hold one session to a number of credits, set 'max_credits' when you
make it ('createManagedUserEditorSession').

The period runs from 'startDate' (included) to 'endDate' (not included): the 30 days before now when you
give neither, and at most 366 days. A date without a time is midnight UTC at the start of that day, so for
all of October give 'startDate=2026-10-01' and 'endDate=2026-11-01'.

### Example

```bash
client.sh getManagedUserUsage_0 id=value  startDate=value  endDate=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The managed user whose usage you want (Widgetic's id for the user) | [default to null]
 **startDate** | **string** | Start of the period, included: an ISO 8601 date ('2026-10-01') or date-time with its offset ('2026-10-01T08:00:00Z'). Default: 30 days before 'endDate'. | [optional] [default to null]
 **endDate** | **string** | End of the period, not included, in the same forms. Default: now. It must be after 'startDate', by at most 366 days. | [optional] [default to null]

### Return type

[**ManagedUserUsageResponse**](ManagedUserUsageResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getManagedUsersByManagerId_0

Get Managed Users By Manager

Retrieve managed users for a specific manager with pagination support.

### Example

```bash
client.sh getManagedUsersByManagerId_0 managerId=value  page=value  size=value  sort=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **managerId** | **string** | ID of the manager | [default to null]
 **page** | **integer** | Page number for pagination | [optional] [default to 1]
 **size** | **integer** | Number of items per page | [optional] [default to 10]
 **sort** | **string** | Sort field and direction, '<field>:<asc|desc>'. The field is 'createdAt', 'updatedAt' or 'externalId' (the snake_case spellings 'created_at', 'updated_at' and 'external_id' work too); 'asc' or 'desc' alone sorts by 'createdAt'. Any other field is a 400. | [optional] [default to createdAt:desc]

### Return type

[**GetManagedUsersByManagerIdResponse**](GetManagedUsersByManagerIdResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## revokeManagedUserEditorSession_0

End one editor session of a managed user

Ends the session at once: its token stops working on the next request (on another server of ours, within
a few seconds). Ending a session that has already ended is fine.

### Example

```bash
client.sh revokeManagedUserEditorSession_0 id=value sessionId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The managed user the session is for | [default to null]
 **sessionId** | **string** | The 'sessionId' of the session, from 'createManagedUserEditorSession' | [default to null]

### Return type

[**DeleteManagedUser200Response**](DeleteManagedUser200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## revokeManagedUserEditorSessions_0

End every editor session of a managed user

Ends all of the managed user's live editor sessions at once, for example when the user signs out of your
platform. Their tokens stop working on the next request (on another server of ours, within a few seconds).
It is fine to call it for a user who has none.

### Example

```bash
client.sh revokeManagedUserEditorSessions_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The managed user whose sessions end | [default to null]

### Return type

[**RevokeManagedUserEditorSessionsResponse**](RevokeManagedUserEditorSessionsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setManagedUserDesignDefaults_0

Set or clear design defaults for one managed user

Send '{ \"design\": { ... } }' to store a JSON object (at most 64 KB, nesting depth 32), or '{ \"design\": null }'
to remove the override. New compositions for this customer merge this layer over the partner default and
under the request body.

### Example

```bash
client.sh setManagedUserDesignDefaults_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **setPartnerDesignDefaultsRequest** | [**SetPartnerDesignDefaultsRequest**](SetPartnerDesignDefaultsRequest.md) |  |

### Return type

[**GetPartnerDesignDefaults200Response**](GetPartnerDesignDefaults200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setManagedUserLimits_0

Set or clear the monthly credit cap for one managed user

Send monthlyCredits as a whole number from 0 up to 2147483647 to cap what this customer's editor sessions may spend in a UTC calendar month, or null to remove the cap. The cap counts the credits the customer's sessions spent that month (refunded credits do not count) and applies to all of the customer's sessions together, beside any 'max_credits' a single session was given. A cap of 0 stops all paid work by this customer until you raise it. The cap starts counting from the first of the month (UTC); a cap set below what was already spent this month stops further work at once.

### Example

```bash
client.sh setManagedUserLimits_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **setManagedUserLimitsRequest** | [**SetManagedUserLimitsRequest**](SetManagedUserLimitsRequest.md) |  |

### Return type

[**GetManagedUserLimits200Response**](GetManagedUserLimits200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateManagedUser_0

Update Managed User

Updates an existing managed user. Only 'externalId', 'metadata' and 'isActive' can change, and 'metadata'
is replaced as a whole, so send all of it. 'isActive: false' switches the managed user off: what it
already has stays, and nothing new can be filed under it until you send 'isActive: true'. Switching it
off also ends all of its editor sessions, and they do not come back when you switch it on again.

The 'Idempotency-Key' header is required ('400' without it).

### Example

```bash
client.sh updateManagedUser_0 id=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the managed user to update | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **updateManagedUser** | [**UpdateManagedUser**](UpdateManagedUser.md) |  |

### Return type

[**ManagedUserResponse**](ManagedUserResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

