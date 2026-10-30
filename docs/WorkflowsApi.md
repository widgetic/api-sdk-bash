# WorkflowsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**archiveWorkspaceWorkflow_0**](WorkflowsApi.md#archiveWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/archive | Archive a Workflow
[**createWorkspaceWorkflowFromPreset_0**](WorkflowsApi.md#createWorkspaceWorkflowFromPreset_0) | **POST** /workspaces/{workspaceId}/workflows/from-preset | Start a Workflow from a starting point
[**createWorkspaceWorkflow_0**](WorkflowsApi.md#createWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows | Create a Workflow
[**deleteWorkspaceWorkflow_0**](WorkflowsApi.md#deleteWorkspaceWorkflow_0) | **DELETE** /workspaces/{workspaceId}/workflows/{workflowId} | Delete a Workflow
[**discardWorkspaceWorkflowChanges_0**](WorkflowsApi.md#discardWorkspaceWorkflowChanges_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/discard | Discard the Unpublished Changes of a Workflow
[**duplicateWorkspaceWorkflow_0**](WorkflowsApi.md#duplicateWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/duplicate | Duplicate a Workflow
[**getWorkspaceWorkflowStats_0**](WorkflowsApi.md#getWorkspaceWorkflowStats_0) | **GET** /workspaces/{workspaceId}/workflows/{workflowId}/stats | Get what Visitors Did in a Workflow
[**getWorkspaceWorkflowVersion_0**](WorkflowsApi.md#getWorkspaceWorkflowVersion_0) | **GET** /workspaces/{workspaceId}/workflows/{workflowId}/versions/{versionId} | Get a Published Version of a Workflow
[**getWorkspaceWorkflow_0**](WorkflowsApi.md#getWorkspaceWorkflow_0) | **GET** /workspaces/{workspaceId}/workflows/{workflowId} | Get a Workflow
[**listPartnerWorkflowPresets_1**](WorkflowsApi.md#listPartnerWorkflowPresets_1) | **GET** /partners/{partnerId}/workflow-presets | List the workflows a partner offers as places to start
[**listWorkspaceWorkflowCompositionOptions_0**](WorkflowsApi.md#listWorkspaceWorkflowCompositionOptions_0) | **GET** /workspaces/{workspaceId}/workflows/composition-options | List the compositions a workflow can show, and what each can do
[**listWorkspaceWorkflowPresets_0**](WorkflowsApi.md#listWorkspaceWorkflowPresets_0) | **GET** /workspaces/{workspaceId}/workflows/presets | List the starting points for a new Workflow
[**listWorkspaceWorkflowVersions_0**](WorkflowsApi.md#listWorkspaceWorkflowVersions_0) | **GET** /workspaces/{workspaceId}/workflows/{workflowId}/versions | List the Published Versions of a Workflow
[**listWorkspaceWorkflows_0**](WorkflowsApi.md#listWorkspaceWorkflows_0) | **GET** /workspaces/{workspaceId}/workflows | List the Workflows of a Workspace
[**pauseWorkspaceWorkflow_0**](WorkflowsApi.md#pauseWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/pause | Pause a Workflow
[**publishWorkspaceWorkflow_0**](WorkflowsApi.md#publishWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/publish | Publish the Draft of a Workflow
[**removePartnerWorkflowPreset_1**](WorkflowsApi.md#removePartnerWorkflowPreset_1) | **DELETE** /partners/{partnerId}/workflow-presets/{key} | Stop offering a workflow as a place to start
[**restoreWorkspaceWorkflowVersion_0**](WorkflowsApi.md#restoreWorkspaceWorkflowVersion_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/versions/{versionId}/restore | Restore a Version of a Workflow into the Draft
[**resumeWorkspaceWorkflow_0**](WorkflowsApi.md#resumeWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/resume | Resume a Paused Workflow
[**saveWorkspaceWorkflow_0**](WorkflowsApi.md#saveWorkspaceWorkflow_0) | **PUT** /workspaces/{workspaceId}/workflows/{workflowId} | Save the Draft of a Workflow
[**setPartnerWorkflowPreset_1**](WorkflowsApi.md#setPartnerWorkflowPreset_1) | **PUT** /partners/{partnerId}/workflow-presets/{key} | Offer a workflow as a place to start, or replace what a key offers
[**unarchiveWorkspaceWorkflow_0**](WorkflowsApi.md#unarchiveWorkspaceWorkflow_0) | **POST** /workspaces/{workspaceId}/workflows/{workflowId}/unarchive | Unarchive a Workflow



## archiveWorkspaceWorkflow_0

Archive a Workflow

Takes a workflow out of the default list and stops it serving: its embeds show only their first composition,
as when paused. It is kept, with its versions and counts, until it is deleted.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can archive.

### Example

```bash
client.sh archiveWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SaveWorkspaceWorkflow200Response**](SaveWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createWorkspaceWorkflowFromPreset_0

Start a Workflow from a starting point

Makes your own copy of a starting point ('listWorkspaceWorkflowPresets'): a copy of every widget it chains (an
ordinary private widget that serves the starting point's published code), a composition of your own on each copy
(a draft, with the content, design, embed settings and tables of the original), and a draft workflow wired like the
starting point's live version. The workflow is named as you ask, or after the starting point. Nothing you do to the
copy reaches the starting point, and nothing its offerer changes afterwards reaches your copy. The workflow stays a
draft: publish it when it is ready.

A start takes a few seconds, because each widget is copied. Send an 'Idempotency-Key' so that asking again after
a timeout makes one copy. When a start fails (503 with 'details.reason' 'preset_copy_failed') the compositions it
made are removed again, so asking again is safe; the widget copies it made stay in the workspace as ordinary
widgets. The workspace's limit of workflows is checked before anything is copied.

A starting point that is not offered to you, or that can no longer be started, is 404.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can start one.

### Example

```bash
client.sh createWorkspaceWorkflowFromPreset_0 workspaceId=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createWorkspaceWorkflowFromPresetRequest** | [**CreateWorkspaceWorkflowFromPresetRequest**](CreateWorkspaceWorkflowFromPresetRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createWorkspaceWorkflow_0

Create a Workflow

Makes a draft workflow. Give it a composition and the workflow is born with one block, which starts it; without
one it starts empty. A workspace holds up to 500 workflows.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can create one.

### Example

```bash
client.sh createWorkspaceWorkflow_0 workspaceId=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createWorkspaceWorkflowRequest** | [**CreateWorkspaceWorkflowRequest**](CreateWorkspaceWorkflowRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteWorkspaceWorkflow_0

Delete a Workflow

Deletes a workflow, in whatever state it is in (draft, live, paused or archived), with all its versions and
counts. It cannot be undone: archive the workflow instead to keep it. The compositions it chained are not
touched, and a page whose embed still names the workflow shows the embed's first composition, as for a paused
one. Asking for a workflow that is already gone is \"not found\".
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can delete.

### Example

```bash
client.sh deleteWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**DeleteWorkspaceWorkflow200Response**](DeleteWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## discardWorkspaceWorkflowChanges_0

Discard the Unpublished Changes of a Workflow

Puts the draft back to the live version (its graph and its time zone). Only for a workflow that has been
published; one that never was has no live version to go back to. Names the 'revision' the editor read.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can discard.

### Example

```bash
client.sh discardWorkspaceWorkflowChanges_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **publishWorkspaceWorkflowRequest** | [**PublishWorkspaceWorkflowRequest**](PublishWorkspaceWorkflowRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## duplicateWorkspaceWorkflow_0

Duplicate a Workflow

Makes a draft copy of a workflow (its draft graph, not its versions or counts), named \"<name> (copy)\".
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can duplicate.

### Example

```bash
client.sh duplicateWorkspaceWorkflow_0 workspaceId=value workflowId=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getWorkspaceWorkflowStats_0

Get what Visitors Did in a Workflow

Counts per block and per connection over a range of UTC days (the last 30 days when not given, up to 366), for one
version or for all of them. Only counts: how many visitors reached a block, took a connection, or could not be
moved on. No visitor and no value a visitor typed is ever stored.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read.

### Example

```bash
client.sh getWorkspaceWorkflowStats_0 workspaceId=value workflowId=value  versionId=value  from=value  to=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **versionId** | **string** | Count one version only | [optional] [default to null]
 **from** | **string** | First UTC day (YYYY-MM-DD) | [optional] [default to null]
 **to** | **string** | Last UTC day (YYYY-MM-DD) | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetWorkspaceWorkflowStats200Response**](GetWorkspaceWorkflowStats200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getWorkspaceWorkflowVersion_0

Get a Published Version of a Workflow

One published version with its graph, for the read-only preview and for the Runs view.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read.

### Example

```bash
client.sh getWorkspaceWorkflowVersion_0 workspaceId=value workflowId=value versionId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **versionId** | **string** | The id of a published version of the workflow | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetWorkspaceWorkflowVersion200Response**](GetWorkspaceWorkflowVersion200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getWorkspaceWorkflow_0

Get a Workflow

Reads a workflow with its draft graph and the version that is live.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read it.

### Example

```bash
client.sh getWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listPartnerWorkflowPresets_1

List the workflows a partner offers as places to start

The partner's starting points, ordered by 'position' and then by 'key': the published workflows it offers its managed
users when they make a new workflow. Each says whether people can start from it now and, when they cannot, why. The
list is the same for every managed user, and a managed user is shown only what is available.

A starting point is one of the partner account's own published workflows, built from compositions the account made
for itself (not for a customer or a team) and from widgets the partner already offers as presets
('setPartnerPreset'), and it uses at most 10 widgets. A partner offers up to 50.

The caller must be the person who administers the partner (an API key of that account works), or a Widgetic
administrator.

### Example

```bash
client.sh listPartnerWorkflowPresets_1 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose starting points to list | [default to null]

### Return type

[**ListPartnerWorkflowPresets200Response**](ListPartnerWorkflowPresets200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listWorkspaceWorkflowCompositionOptions_0

List the compositions a workflow can show, and what each can do

The workspace's compositions as the workflow editor offers them, newest first. For each one: whether it can be
shown (its widget has a published version), the websites it may be embedded on, and which triggers it supports.

- **Input added** ('inputs') is enabled only for a composition that declares at least one table a visitor's
  entries can be written to. Its 'tables' are all of them; its 'fields' are the columns a rule may read (not
  'id' and 'created_at', not a column that is not text, a number or yes/no, and not one whose name says it holds
  a person's private details, such as an email or a phone number).
- **Action in the widget** ('actions') is enabled only when the published widget version declares at least one
  goal. Its 'items' are the goals a trigger can wait for.

When one of them is not enabled, 'reason' says why ('widget_keeps_no_data', 'widget_reports_no_actions' or
'widget_not_published'), so the editor can show the trigger disabled with an explanation. Publishing checks every
reference again against what the composition can do at that moment.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read it.

### Example

```bash
client.sh listWorkspaceWorkflowCompositionOptions_0 workspaceId=value  search=value  ids=value  limit=value  offset=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **search** | **string** | Text the composition's name must contain | [optional] [default to null]
 **ids** | **string** | Only these compositions (comma-separated ids, at most 50), those of them you may see. Ask for the
compositions a workflow shows with this, so each is found whatever page it would be on. An id you may not
see is left out, as one that does not exist is. | [optional] [default to null]
 **limit** | **integer** | Page size (1-100, 50 when not given) | [optional] [default to null]
 **offset** | **integer** | How many to skip (0 when not given) | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**ListWorkspaceWorkflowCompositionOptions200Response**](ListWorkspaceWorkflowCompositionOptions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listWorkspaceWorkflowPresets_0

List the starting points for a new Workflow

The workflows you can start from in this workspace: published workflows that Widgetic offers or, for one of a
partner's managed users, that the partner offers (a managed user is never shown Widgetic's, and a person is never
shown a partner's). Only what can be started now is listed, in the order the offerer set (smallest 'position'
first, then by 'key'). Each shows what you would get, and none shows who made it or any id of its own.
Start from one with 'createWorkspaceWorkflowFromPreset'.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read the list.

### Example

```bash
client.sh listWorkspaceWorkflowPresets_0 workspaceId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**ListWorkspaceWorkflowPresets200Response**](ListWorkspaceWorkflowPresets200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listWorkspaceWorkflowVersions_0

List the Published Versions of a Workflow

Every version the workflow has had, newest first, with who published it and when. The one visitors get is marked
'isLive'.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read.

### Example

```bash
client.sh listWorkspaceWorkflowVersions_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**ListWorkspaceWorkflowVersions200Response**](ListWorkspaceWorkflowVersions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listWorkspaceWorkflows_0

List the Workflows of a Workspace

Lists the workspace's workflows, newest first unless 'sort' says otherwise. Archived workflows are left out
unless 'status' asks for them ('archived', or 'all').
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can read the list.

### Example

```bash
client.sh listWorkspaceWorkflows_0 workspaceId=value  search=value  status=value  sort=value  limit=value  offset=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **search** | **string** | Text the workflow's name must contain | [optional] [default to null]
 **status** | **string** | One state to list ('draft', 'live', 'paused', 'archived'), or 'all' for every state. Without it, the ones in use (draft, live and paused). | [optional] [default to null]
 **sort** | **string** | '<field>:<asc|desc>' where field is createdAt, lastPublishedAt, runsCount or name (or just asc / desc for createdAt). Newest first when not given. | [optional] [default to null]
 **limit** | **integer** | Page size (1-100, 50 when not given) | [optional] [default to null]
 **offset** | **integer** | How many to skip (0 when not given) | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**ListWorkspaceWorkflows200Response**](ListWorkspaceWorkflows200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## pauseWorkspaceWorkflow_0

Pause a Workflow

While a workflow is paused, its embeds show only their first composition (the 'composition-id' of the embed) and no
visitor moves on. The live version is kept, and visitors partway through carry on from where they were when it is
resumed. Only a live workflow can be paused.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can pause.

### Example

```bash
client.sh pauseWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SaveWorkspaceWorkflow200Response**](SaveWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## publishWorkspaceWorkflow_0

Publish the Draft of a Workflow

Checks the draft and, when nothing stops it, makes it the next version and the one new visitors get. Versions never
change once published. A visitor already partway through keeps the version they started on (for up to 30 days).
The check reads what each composition can do right now (a table the visitor adds to, a goal the widget reports,
the websites it may be embedded on), so a workflow never goes live pointing at something that has gone.
It is refused with 422 ('BUSINESS_OPERATION_INVALID') when the draft has errors; the 'issues' in the error's
'details' name the blocks to fix: an unconnected trigger, a condition without rules, a composition that is not
published, a field or action that is gone, a composition whose allowed websites exclude the site the workflow
starts on. Nothing is published when the draft has no changes since the live version.
The 'revision' is the one the editor read, and a publish of a draft that has moved on is refused with 409.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can publish.

### Example

```bash
client.sh publishWorkspaceWorkflow_0 workspaceId=value workflowId=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **publishWorkspaceWorkflowRequest** | [**PublishWorkspaceWorkflowRequest**](PublishWorkspaceWorkflowRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**PublishWorkspaceWorkflow200Response**](PublishWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removePartnerWorkflowPreset_1

Stop offering a workflow as a place to start

Removes the starting point under 'key'. The workflow itself is not touched, and neither are the workflows people
already started from it.

Removing a starting point the partner does not offer is not an error: the answer is 'removed: false'.

### Example

```bash
client.sh removePartnerWorkflowPreset_1 partnerId=value key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose starting point to remove | [default to null]
 **key** | **string** | The key of the starting point to remove | [default to null]

### Return type

[**RemovePartnerWorkflowPreset200Response**](RemovePartnerWorkflowPreset200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## restoreWorkspaceWorkflowVersion_0

Restore a Version of a Workflow into the Draft

Copies a published version into the draft, so it can be changed and published again. Nothing is published and
nothing visitors see changes: the version stays in the history as it was. Names the 'revision' the editor read.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can restore.

### Example

```bash
client.sh restoreWorkspaceWorkflowVersion_0 workspaceId=value workflowId=value versionId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **versionId** | **string** | The id of a published version of the workflow | [default to null]
 **publishWorkspaceWorkflowRequest** | [**PublishWorkspaceWorkflowRequest**](PublishWorkspaceWorkflowRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateWorkspaceWorkflowFromPreset201Response**](CreateWorkspaceWorkflowFromPreset201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## resumeWorkspaceWorkflow_0

Resume a Paused Workflow

Makes a paused workflow live again, on the version that was live when it was paused.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can resume.

### Example

```bash
client.sh resumeWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SaveWorkspaceWorkflow200Response**](SaveWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## saveWorkspaceWorkflow_0

Save the Draft of a Workflow

Saves the name, the time zone and/or the graph of the draft. Send at least one. The save names the 'revision' the
editor started from and is refused with 409 ('BUSINESS_STATE_CONFLICT') when the draft has moved on, so two
people editing do not overwrite each other without knowing; read the workflow again and apply the change to it.
A save is never refused for what is wrong with the graph (a block with no connection yet is normal in a draft):
only the shape is judged here, and what stops a workflow going live is told when it is published. A graph larger
than 200,000 bytes, or with more than 100 blocks or 300 connections, is refused.
An archived workflow cannot be saved. Saving a live workflow changes the draft only: visitors keep getting the
published version until the changes are published.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can save.

### Example

```bash
client.sh saveWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **saveWorkspaceWorkflowRequest** | [**SaveWorkspaceWorkflowRequest**](SaveWorkspaceWorkflowRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SaveWorkspaceWorkflow200Response**](SaveWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setPartnerWorkflowPreset_1

Offer a workflow as a place to start, or replace what a key offers

Offers one of the partner account's own published workflows to its managed users under 'key'. If the partner already
offers something under that key it is replaced, so sending the same request twice is safe. Saving replaces the whole
starting point: a 'title', 'description' or 'position' you leave out goes back to its default.

Keys are 1 to 64 characters: lowercase letters, digits, hyphens and underscores, the first a letter or a digit.

A workflow is offered once. What people get is the workflow's live version as it is when they start, so publishing
the workflow changes what new starts get; workflows people already started are never touched. The offer is
refused, and 'error.details.reason' says why, when the workflow:

- is not the partner account's own (a workflow of a team or of a customer, or of somebody else), or does not exist:
  404, the same for both;
- is archived (409 'workflow_archived'), or was never published (409 'workflow_not_published');
- shows no composition (422 'workflow_empty'), or a block shows a composition made for a customer or a team
  (422 'composition_not_own');
- chains more than 10 widgets (422 'too_many_widgets'), or a widget that the partner does not offer as a preset
  (422 'widget_not_preset'; 'error.details.widgets' lists them, each with its 'id' and 'name', so they can be offered
  first with 'setPartnerPreset');
- is already offered under another key (409 'workflow_already_offered'; 'error.details.key' says which), or the
  partner already offers 50 (409 'too_many_presets').

The caller must be the person who administers the partner (an API key of that account works), or a Widgetic
administrator, who offers the partner's workflow on its behalf.

### Example

```bash
client.sh setPartnerWorkflowPreset_1 partnerId=value key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose starting point to set | [default to null]
 **key** | **string** | The name your code and the picker use for the starting point | [default to null]
 **offerWorkflowPresetRequest** | [**OfferWorkflowPresetRequest**](OfferWorkflowPresetRequest.md) |  |

### Return type

[**SetPartnerWorkflowPreset200Response**](SetPartnerWorkflowPreset200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## unarchiveWorkspaceWorkflow_0

Unarchive a Workflow

Brings an archived workflow back into the list: as paused when it was ever published (resume it to serve visitors
again), as a draft when it never was.
For personal workspace, use 'personal' as workspaceId.
For organization workspace, use the organization UUID as workspaceId. Any active member can unarchive.

### Example

```bash
client.sh unarchiveWorkspaceWorkflow_0 workspaceId=value workflowId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **workspaceId** | **string** | The workspace: 'personal' for your own workspace, or the UUID of an organization. A call made for one of your
managed users ('X-Managed-User-Id') always uses 'personal': a managed user has no other workspace, and a call
that names an organization is refused with 403. | [default to null]
 **workflowId** | **string** | The workflow's id | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions and workflows: a list shows only theirs, a composition or a workflow the call makes is filed under them, and one of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SaveWorkspaceWorkflow200Response**](SaveWorkspaceWorkflow200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

