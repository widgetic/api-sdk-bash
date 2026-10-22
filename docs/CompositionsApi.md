# CompositionsApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addAiAnswersKnowledgeDocument_0**](CompositionsApi.md#addAiAnswersKnowledgeDocument_0) | **POST** /compositions/{id}/adapters/ai-answers/knowledge/documents | Add a document for a widget&#39;s AI to answer from
[**checkCompositionAccess_0**](CompositionsApi.md#checkCompositionAccess_0) | **GET** /compositions/{id}/access | Check Composition Access
[**createCompositionContentItem_0**](CompositionsApi.md#createCompositionContentItem_0) | **POST** /compositions/{id}/content/{list}/items | Add a content list item
[**createCompositionDatabaseRecord_0**](CompositionsApi.md#createCompositionDatabaseRecord_0) | **POST** /compositions/{id}/database/{table} | Create Record In Composition Database
[**createComposition_0**](CompositionsApi.md#createComposition_0) | **POST** /compositions | Create Composition
[**deleteCompositionContentItem_0**](CompositionsApi.md#deleteCompositionContentItem_0) | **DELETE** /compositions/{id}/content/{list}/items/{itemId} | Delete a content list item
[**deleteCompositionDataSource_0**](CompositionsApi.md#deleteCompositionDataSource_0) | **DELETE** /compositions/{id}/data-source | Remove the composition data source binding
[**deleteCompositionDatabaseRecord_0**](CompositionsApi.md#deleteCompositionDatabaseRecord_0) | **DELETE** /compositions/{id}/database/{table}/{recordId} | Delete Record From Composition Database
[**deleteComposition_0**](CompositionsApi.md#deleteComposition_0) | **DELETE** /compositions/{id} | Delete Composition
[**describeCompositionEntries_0**](CompositionsApi.md#describeCompositionEntries_0) | **GET** /compositions/{id}/entries | Describe What a Composition Keeps
[**duplicateComposition_0**](CompositionsApi.md#duplicateComposition_0) | **POST** /compositions/{id}/duplicate | Duplicate Composition
[**getAiAnswersKnowledge_0**](CompositionsApi.md#getAiAnswersKnowledge_0) | **GET** /compositions/{id}/adapters/ai-answers/knowledge | See the documents a widget&#39;s AI answers from
[**getAllCompositions_0**](CompositionsApi.md#getAllCompositions_0) | **GET** /compositions | Get All Compositions
[**getCompositionById_0**](CompositionsApi.md#getCompositionById_0) | **GET** /compositions/{id} | Get Composition
[**getCompositionContentSchema_0**](CompositionsApi.md#getCompositionContentSchema_0) | **GET** /compositions/{id}/schema/content | Get Content Schema
[**getCompositionContent_0**](CompositionsApi.md#getCompositionContent_0) | **GET** /compositions/{id}/content | Get Current Content
[**getCompositionDataSource_0**](CompositionsApi.md#getCompositionDataSource_0) | **GET** /compositions/{id}/data-source | Read the composition data source binding
[**getCompositionDatabaseRecord_0**](CompositionsApi.md#getCompositionDatabaseRecord_0) | **GET** /compositions/{id}/database/{table}/{recordId} | Get Record From Composition Database
[**getCompositionDatabaseRecords_0**](CompositionsApi.md#getCompositionDatabaseRecords_0) | **GET** /compositions/{id}/database/{table} | Get All Records From Composition Database Table
[**getCompositionDesignSchema_0**](CompositionsApi.md#getCompositionDesignSchema_0) | **GET** /compositions/{id}/schema/design | Get Design Schema
[**getCompositionDesign_0**](CompositionsApi.md#getCompositionDesign_0) | **GET** /compositions/{id}/design | Get Composition Design
[**getCompositionEmbedSchema_0**](CompositionsApi.md#getCompositionEmbedSchema_0) | **GET** /compositions/{id}/schema/embed | Get Embed Schema
[**getCompositionEmbedSettings_0**](CompositionsApi.md#getCompositionEmbedSettings_0) | **GET** /compositions/{id}/embed-settings | Get Composition Embed Settings
[**getCompositionPreview_0**](CompositionsApi.md#getCompositionPreview_0) | **GET** /compositions/{id}/preview | Get Composition Preview
[**getCompositionVersions_0**](CompositionsApi.md#getCompositionVersions_0) | **GET** /compositions/{id}/versions | Get Composition Versions
[**getCompositionsBatch_0**](CompositionsApi.md#getCompositionsBatch_0) | **POST** /compositions/batch | Get Compositions Batch
[**patchCompositionContentItem_0**](CompositionsApi.md#patchCompositionContentItem_0) | **PATCH** /compositions/{id}/content/{list}/items/{itemId} | Update a content list item
[**readCompositionEntries_0**](CompositionsApi.md#readCompositionEntries_0) | **GET** /compositions/{id}/entries/{table} | Read the Entries of a Composition&#39;s Table
[**removeAiAnswersKnowledgeDocument_0**](CompositionsApi.md#removeAiAnswersKnowledgeDocument_0) | **DELETE** /compositions/{id}/adapters/ai-answers/knowledge/documents/{documentId} | Remove a document from a widget&#39;s knowledge base
[**setCompositionDataSource_0**](CompositionsApi.md#setCompositionDataSource_0) | **PUT** /compositions/{id}/data-source | Bind a public JSON data source for embed refresh
[**setDynamicContent_0**](CompositionsApi.md#setDynamicContent_0) | **PUT** /compositions/{id}/content | Set Dynamic Content
[**updateCompositionDatabaseRecord_0**](CompositionsApi.md#updateCompositionDatabaseRecord_0) | **PUT** /compositions/{id}/database/{table}/{recordId} | Update Record In Composition Database
[**updateCompositionStatus_0**](CompositionsApi.md#updateCompositionStatus_0) | **PUT** /compositions/{id}/status | Update Composition Status
[**updateComposition_0**](CompositionsApi.md#updateComposition_0) | **PUT** /compositions/{id} | Update Composition
[**validateCompositionContent_0**](CompositionsApi.md#validateCompositionContent_0) | **POST** /compositions/{id}/content/validate | Validate Content



## addAiAnswersKnowledgeDocument_0

Add a document for a widget's AI to answer from

Gives the widget's AI a document to answer visitors' questions from. Send the title and the plain text. The call
returns once the document is ready to be used, which takes a few seconds, longer for a long text.

**How it is used.** The text is cleaned, cut into short passages and each passage is turned into numbers (an
embedding) so the widget can find the passages nearest to a question. When a visitor asks, the nearest passages and
the question are shown to an AI model, which writes the answer from them and from nothing else; if the documents
say nothing about the question the visitor is told so, and the owner is not charged for that question. The titles of
the documents an answer used are shown to the visitor as its sources.

**What leaves Widgetic.** The text of a document is sent to OpenAI to be embedded when it is added, and the
passages used for a question are sent to the AI model that writes the answer. Say so in your privacy policy.

**Treat every document as public.** An answer can quote or paraphrase anything a document says, to any visitor of
the widget. Do not add passwords, keys, personal data or anything that must stay private.

**Limits.** A widget holds up to 20 documents, each up to 100000 characters, and up to 400000 characters in all
('getAiAnswersKnowledge' reports the current numbers). Text only: convert PDF or Word files to text first. Adding a
document costs no credits. The same text cannot be added twice to one widget (409).

The caller must be allowed to change the widget. An API key needs the 'content:write' scope. Adds are limited to ten
in ten minutes per person.

### Example

```bash
client.sh addAiAnswersKnowledgeDocument_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The widget (composition) to add the document to | [default to null]
 **addAiAnswersKnowledgeDocumentRequest** | [**AddAiAnswersKnowledgeDocumentRequest**](AddAiAnswersKnowledgeDocumentRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**AddAiAnswersKnowledgeDocument201Response**](AddAiAnswersKnowledgeDocument201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## checkCompositionAccess_0

Check Composition Access

Checks if the authenticated user can access a specific composition based on workspace context and permissions.

### Example

```bash
client.sh checkCompositionAccess_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Composition ID | [default to null]

### Return type

[**CheckCompositionAccessResponse**](CheckCompositionAccessResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createCompositionContentItem_0

Add a content list item

Creates one item in a widget content list without replacing the whole list. Item field keys are widget data (camelCase or snake_case are kept as sent). Partners use this to keep galleries in sync.

### Example

```bash
client.sh createCompositionContentItem_0 id=value list=value Idempotency-Key:value If-Match:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **list** | **string** | List name from the content schema ('contentItems') or 'items' | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createCompositionContentItemRequest** | [**CreateCompositionContentItemRequest**](CreateCompositionContentItemRequest.md) |  |
 **ifMatch** | **string** | Optional content version from ETag | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionContentItem201Response**](CreateCompositionContentItem201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createCompositionDatabaseRecord_0

Create Record In Composition Database

Creates a new record in one of the composition's tables. Only the composition's own tables (made from its 'databaseSchema' or from the tables its widget declares) can be reached; any other table name answers '404'.

### Example

```bash
client.sh createCompositionDatabaseRecord_0 id=value table=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | Name of the database table | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **body** | **map** |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionDatabaseRecord201Response**](CreateCompositionDatabaseRecord201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createComposition_0

Create Composition

Creates a new composition.

To make the composition for one of your managed users, send 'managedUserId' or 'managedUserExternalId'.
The composition stays in your account and is yours to edit; the tag lets you list one user's compositions
with 'getAllCompositions'. The managed user must be yours and active: one that is not yours, or does not
exist, is answered with 404 and 'MANAGED_USER_NOT_FOUND', and one that is switched off with 409 and
'MANAGED_USER_INACTIVE'. The tag is set here and does not change afterwards. A copy made with
'duplicateComposition' keeps the tag of the original.

An editor session with the 'creator' surface may call this to start a composition of a widget it built:
it sends only 'name', 'widgetId' (a widget made for the session's managed user) and 'content', and the
composition is always made for that managed user.

Send 'databaseSchema' to give the composition tables of its own for what visitors send it (the shape, the
allowed types and the limits are described on the field). A 'databaseSchema' that cannot be used is refused
before anything is created, with '400' and 'INVALID_DATABASE_SCHEMA'. If the composition is created but its
tables cannot be made just now, the answer is still '201' and 'meta.warnings' says so.

Leave 'databaseSchema' out and the composition gets the tables its widget declares in its own source
('src/lib/meta/database.json'), if it declares any: they are made the same way, in a schema of the
composition's own. A widget that keeps nothing leaves the composition without tables. If the widget's file
cannot be used, or its tables cannot be made just now, the answer is still '201' and 'meta.warnings' says so.
The widget is read as it was when it was last published (as it is now, when it never was).

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry, so one
composition is created, not two.

### Example

```bash
client.sh createComposition_0 Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **newComposition** | [**NewComposition**](NewComposition.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionFromWidget201Response**](CreateCompositionFromWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteCompositionContentItem_0

Delete a content list item

### Example

```bash
client.sh deleteCompositionContentItem_0 id=value list=value itemId=value Idempotency-Key:value If-Match:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **list** | **string** |  | [default to null]
 **itemId** | **string** |  | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **ifMatch** | **string** |  | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**DeleteCompositionContentItemResponse**](DeleteCompositionContentItemResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteCompositionDataSource_0

Remove the composition data source binding

Removes the binding. Asking again, or asking for a composition that had none, is not an error: the composition has no data source afterwards, and that is all 'removed: true' says.

### Example

```bash
client.sh deleteCompositionDataSource_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**DeleteCompositionDataSourceResponse**](DeleteCompositionDataSourceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteCompositionDatabaseRecord_0

Delete Record From Composition Database

Deletes a specific record from one of the composition's tables. Only the composition's own tables (made from its 'databaseSchema' or from the tables its widget declares) can be reached; any other table name answers '404'.

### Example

```bash
client.sh deleteCompositionDatabaseRecord_0 id=value table=value recordId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | Name of the database table | [default to null]
 **recordId** | **string** | ID of the record to delete | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionDatabaseRecord201Response**](CreateCompositionDatabaseRecord201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteComposition_0

Delete Composition

Deletes a specific composition, and the data it keeps (the tables it declared and what visitors left in them).

### Example

```bash
client.sh deleteComposition_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The ID of the composition to delete | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

(empty response body)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## describeCompositionEntries_0

Describe What a Composition Keeps

Names the tables a composition's widget keeps entries in (the votes, ratings, answers or sign-ups its
visitors left), their columns, and how many entries each holds. Call it first to learn the table and
column names that 'readCompositionEntries' takes.

A widget that only shows content keeps nothing of its own: the answer is 'hasData: false' with no tables,
and that is not an error. A table that could not be counted has 'rows: null', which is not zero.

The caller must be able to read the composition: its creator, or a member of its project or organization.
An editor session cannot call this route.

### Example

```bash
client.sh describeCompositionEntries_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CompositionEntriesDescriptionResponse**](CompositionEntriesDescriptionResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## duplicateComposition_0

Duplicate Composition

Creates a duplicate of an existing composition for the authenticated user.

The duplicate is made after the answer: the call returns '202' with an 'operationId'. Ask
'GET /operations/{id}' for that operation until its 'status' is 'completed'; the new composition is
named in 'metadata.newCompositionId'. A problem with the duplicate's database (for example, tables that
could not be made just now) is listed in 'metadata.warnings', which is absent when there is none.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry, so one
duplicate is made, not two.

### Example

```bash
client.sh duplicateComposition_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition to duplicate | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **duplicateCompositionRequest** | [**DuplicateCompositionRequest**](DuplicateCompositionRequest.md) |  | [optional]

### Return type

[**DuplicateComposition202Response**](DuplicateComposition202Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getAiAnswersKnowledge_0

See the documents a widget's AI answers from

The 'ai-answers' adapter lets a widget answer a visitor's question with text an AI model writes from documents the
widget's owner provides. This lists those documents, and how much room is left for more: 'totals' carries the widget's
limits next to what it uses.

The list never contains what a document says, only which documents there are: their title, size and state. A
'processing' document is not used to answer questions yet (or an add of it was interrupted: remove it and add it
again).

Add a document with 'addAiAnswersKnowledgeDocument'; remove one with 'removeAiAnswersKnowledgeDocument'.

The caller must be allowed to see the widget: its owner, a partner for a customer it manages, or a Widgetic
administrator. An API key needs the 'content:read' scope.

### Example

```bash
client.sh getAiAnswersKnowledge_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The widget (composition) whose documents to list | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetAiAnswersKnowledge200Response**](GetAiAnswersKnowledge200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getAllCompositions_0

Get All Compositions

Retrieves all compositions with pagination support.

Pass 'managedUserId' (Widgetic's id for one of your managed users) or 'managedUserExternalId' (your own
identifier for the user) to list only the compositions made for that managed user. The compositions of
your other managed users, and your own, are left out. It combines with the other filters and with paging.
A managed user that is not yours, or does not exist, is answered with 404 and 'MANAGED_USER_NOT_FOUND'.

An editor session with the 'creator' surface may call this to list the compositions of ONE widget it
built: it must send 'widgetId', and the answer holds only the compositions made for the session's
managed user.

### Example

```bash
client.sh getAllCompositions_0  page=value  size=value  sort=value  widgetId=value  workspace=value  projectFolder=value  status=value  managedUserId=value  managedUserExternalId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **integer** | Page number for pagination | [optional] [default to 1]
 **size** | **integer** | Number of items per page | [optional] [default to 20]
 **sort** | **string** | The order of the list, as '<field>:<asc|desc>'. The field is 'createdAt', 'updatedAt', 'name' or 'status'
(the snake_case spelling, such as 'created_at', is read too). 'asc' or 'desc' alone orders by 'createdAt'.
Default: 'createdAt:desc'. Any other field is a 400. | [optional] [default to null]
 **widgetId** | **string** | Filter compositions by widget ID | [optional] [default to null]
 **workspace** | **string** | Filter by workspace | [optional] [default to null]
 **projectFolder** | **string** | Only the compositions in this project (the project's id). | [optional] [default to null]
 **status** | **string** | Only the compositions in this status. Without it, every status is listed. | [optional] [default to null]
 **managedUserId** | **string** | List only the compositions made for this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. Send it as 'managedUserId'; the snake_case spelling 'managed_user_id' is refused with a 400, not ignored. | [optional] [default to null]
 **managedUserExternalId** | **string** | List only the compositions made for the managed user you registered with this 'externalId' (your own identifier for the user). Send this or 'managedUserId', not both. | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetAllCompositions200Response**](GetAllCompositions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionById_0

Get Composition

Retrieves a specific composition by its ID.

The answer carries 'direct', which says whether the widget the composition is made from is drawn straight
into your page ('true') or inside a frame ('false'), or 'null' while the widget has no published version.
Read it before you go live: a widget drawn without a frame writes its entries from your own page, so the
public entry route accepts them only from a website on the composition's allowed list, and refuses them while
that list is empty (the public JSON of the composition stays open to every website). A widget in a frame
writes from Widgetic's own frame and is accepted whatever the list says.

### Example

```bash
client.sh getCompositionById_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Composition ID | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionFromWidget201Response**](CreateCompositionFromWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionContentSchema_0

Get Content Schema

Retrieves the content schema for a composition based on its widget type

### Example

```bash
client.sh getCompositionContentSchema_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionContentSchemaResponse**](GetCompositionContentSchemaResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionContent_0

Get Current Content

Retrieves the current content of a composition

### Example

```bash
client.sh getCompositionContent_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionContentResponse**](GetCompositionContentResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionDataSource_0

Read the composition data source binding

The data source that is bound to the composition: 'url' and 'refreshSeconds'. The answer's 'data' is 'null' when none is bound, and also when what is stored does not pass the rule for a public https address (a binding written by another path, such as the general embed-settings update, is never shown to a page unless it passes the same checks as this route).

### Example

```bash
client.sh getCompositionDataSource_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionDataSourceResponse**](GetCompositionDataSourceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionDatabaseRecord_0

Get Record From Composition Database

Retrieves a specific record from one of the composition's tables. Only the composition's own tables (made from its 'databaseSchema' or from the tables its widget declares) can be reached; any other table name answers '404'.

### Example

```bash
client.sh getCompositionDatabaseRecord_0 id=value table=value recordId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | Name of the database table | [default to null]
 **recordId** | **string** | ID of the record to retrieve | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionDatabaseRecord201Response**](CreateCompositionDatabaseRecord201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionDatabaseRecords_0

Get All Records From Composition Database Table

Retrieves all records from one of the composition's tables. Only the composition's own tables (made from its 'databaseSchema' or from the tables its widget declares) can be reached; any other table name answers '404'.

### Example

```bash
client.sh getCompositionDatabaseRecords_0 id=value table=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | Name of the database table | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionDatabaseRecords200Response**](GetCompositionDatabaseRecords200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionDesignSchema_0

Get Design Schema

Retrieves the design schema for a composition based on its widget type

### Example

```bash
client.sh getCompositionDesignSchema_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionDesignSchemaResponse**](GetCompositionDesignSchemaResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionDesign_0

Get Composition Design

Retrieves only the design field from a composition.

### Example

```bash
client.sh getCompositionDesign_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionDesignResponse**](GetCompositionDesignResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionEmbedSchema_0

Get Embed Schema

Retrieves the definition of the composition's Embed tab: which settings exist, what each one holds, what it
defaults to, and when its control is shown. It is the third tab beside 'schema/content' and 'schema/design',
in the same format ('componentGroups' → 'components' → 'propertyGroups' → 'properties', each property with a
'type', a 'defaultValue' and an 'inputController'), so a client that draws those two tabs draws this one with
the same code.

The schema is the same for every composition (it is the one Widgetic's own Embed Editor draws). The
composition id decides who may ask: the caller must be able to read the composition.

Reading and saving the values:
- 'GET /compositions/{id}/embed-settings' returns what the composition saved. A composition whose Embed tab
  was never saved has nothing to return; seed the form from 'defaults', which holds the 'defaultValue' of
  every setting that declares one.
- 'PUT /compositions/{id}' with 'embedSettings' saves them. The gateway stores 'embedSettings' as given and
  does not check it against this schema; the schema is how a client knows what to put there.

A property's 'visibilityCondition' says when its control is shown: 'condition' is a comparison of the
current values of the properties named in 'dependsOn' ('useIframe === false', 'embedTarget === 'mixed' &&
keepDimensions === false'). While it is false the Embed Editor does not show the control.

A colour picker with 'showOpacityControls' saves its opacity next to the colour, under the key
'<name>_opacity' as a number from 0 to 1 ('overlayBackgroundColor' → 'overlayBackgroundColor_opacity').
Its 'defaultTransparency' is a percentage and the saved value a fraction (50 → 0.5).

### Example

```bash
client.sh getCompositionEmbedSchema_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionEmbedSchemaResponse**](GetCompositionEmbedSchemaResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionEmbedSettings_0

Get Composition Embed Settings

Retrieves only the embedSettings field from a composition.

### Example

```bash
client.sh getCompositionEmbedSettings_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionEmbedSettingsResponse**](GetCompositionEmbedSettingsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionPreview_0

Get Composition Preview

Returns the address of the page an editor shows the composition in: the page of the widget's published
version on the CDN, with the widget and version it is. Load it in a frame, then send the frame what to show
(the content, design and embed settings you read from the composition, and every change the user makes) with
'postMessage': '{ type: 'widgetic:update', design }', '{ type: 'widgetic:update', content }' or
'{ type: 'widgetic:update', contentItems }'.

The version is the one embeds show, so the editor previews what a visitor gets. The address does not carry
the composition id: an embed uses the id to fetch the saved composition itself, while an editor sends the
current state (unsaved changes included).

A widget that has never been published has no page to show: the answer is 409 'WIDGET_NOT_PUBLISHED'.

### Example

```bash
client.sh getCompositionPreview_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionPreviewResponse**](GetCompositionPreviewResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionVersions_0

Get Composition Versions

Retrieves version history for a specific composition.

### Example

```bash
client.sh getCompositionVersions_0 id=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Composition ID | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**GetCompositionVersions200Response**](GetCompositionVersions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getCompositionsBatch_0

Get Compositions Batch

Retrieves multiple compositions by their IDs in a single request.
This endpoint includes domain validation for embed contexts and is used by the embed SDK.

Each composition is checked on its own. If its owner listed the websites it may appear on (the
workspace's domain list, or the 'allowedDomains' of a partner the owner administers) and the request
comes from another website (the 'Origin' header, or the host of 'Referer' when there is no 'Origin'),
that composition is left out of 'compositions' and reported in 'errors' as
'Domain access denied: <reason>'; the others are still returned. A request that names no website, and
an owner who listed nothing, are not restricted, and a page on the visitor's own machine ('localhost',
'127.0.0.1' or '[::1]', on any port) is always allowed. So is the website where a partner integrates
Widgetic, with every subdomain of it ('platformDomain' in the answer of 'GET /partners/mine'), for the
compositions of that partner: a partner's list never has to name it.

### Example

```bash
client.sh getCompositionsBatch_0
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getCompositionsBatchRequest** | [**GetCompositionsBatchRequest**](GetCompositionsBatchRequest.md) |  |

### Return type

[**GetCompositionsBatchResponse**](GetCompositionsBatchResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patchCompositionContentItem_0

Update a content list item

### Example

```bash
client.sh patchCompositionContentItem_0 id=value list=value itemId=value Idempotency-Key:value If-Match:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **list** | **string** |  | [default to null]
 **itemId** | **string** |  | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **requestBody** | [**map[String, AnyType]**](AnyType.md) |  |
 **ifMatch** | **string** |  | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionContentItem201Response**](CreateCompositionContentItem201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## readCompositionEntries_0

Read the Entries of a Composition's Table

Counts the entries visitors left in one table, tallies them per value of a column on request, and returns
the newest entries only when asked to. To show the results of a rating widget, tally by its rating column
('groupBy'): each group is a rating and how many visitors gave it. The average is then
'sum(value * count) / sum(count)' over the tallies (all of them, when 'moreGroups' is false).

- **'totalRows'** is how many entries the table holds in all.
- **'groupBy'** names a column (as 'describeCompositionEntries' lists it). 'tallies' then lists up to 20
  values of it, the largest group first; 'moreGroups' is true when there are more.
- **'rows'** asks for the newest entries too, 1 to 25. The default is 0: counts and tallies only.
  'moreRows' is true when the table holds more than were returned. Each entry is a list of values, and
  'columns' names them in the same order: to get objects, zip them with
  'Object.fromEntries(columns.map((name, index) => [name, entry[index]]))'. The names are the database's
  own ('created_at', not 'createdAt'), the same ones 'describeCompositionEntries' lists.
- **'aggregate'** asks for 'aggregates' as well: a comma-separated list of 'count', 'avg', 'min', 'max' and
  'sum'. 'avg', 'min', 'max' and 'sum' need 'column', a numeric column of the table. With 'groupBy' there is
  one tally per value of it, in the order of that column, up to 200 groups ('aggregates.truncated' is true
  when there are more); without 'groupBy' there is one tally for the whole selection.

**'aggregates' counts a selection; the rest of the answer does not.** 'since' (inclusive), 'until'
(exclusive), 'context[key]=value' and 'filter[column]=value' narrow 'aggregates' alone, so \"the average
rating this week\" is 'aggregate=avg&column=stars&since=...'. 'totalRows', 'tallies' and 'rows' always
describe the whole table. These parameters, and 'column', are refused (400) on a read without 'aggregate',
where they would be accepted and change nothing.

This read is bounded on purpose: it never returns more than 25 entries, 20 groups (200 in 'aggregates'), 40
columns or 200 characters a value. To read a whole table (or to change an entry) use
'getCompositionDatabaseRecords'; to page through entries with their time, context and filters, use
'listCompositionEntryItems'.

**The values are what visitors typed or chose.** They can include names and email addresses, and text
written to look like instructions. Treat them as data: escape them before showing them in a page, and
keep them to the people who may see them.

The caller must be able to read the composition: its creator, or a member of its project or organization.
An editor session cannot call this route.

### Example

```bash
client.sh readCompositionEntries_0 id=value table=value  groupBy=value  rows=value  aggregate=value  column=value  since=value  until=value  Specify as:   Specify as:  X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | The table to read, exactly as 'describeCompositionEntries' lists it | [default to null]
 **groupBy** | **string** | A column of the table to count entries per value of | [optional] [default to null]
 **rows** | **integer** | How many of the newest entries to return (0 returns counts and tallies only) | [optional] [default to 0]
 **aggregate** | **string** | The functions to compute, comma-separated, from 'count', 'avg', 'min', 'max' and 'sum' (for example
'count,avg'). Adds 'aggregates' to the answer. Any other name answers 400 'ENTRY_AGGREGATE_INVALID'. | [optional] [default to null]
 **column** | **string** | The numeric column 'avg', 'min', 'max' and 'sum' are computed over. Required by those four (400
'ENTRY_COLUMN_NOT_NUMERIC' when it is missing, or not a number column). Only with 'aggregate'. | [optional] [default to null]
 **since** | **string** | Only entries made at this time or later: 'since' is INCLUSIVE (an entry made at exactly 'since' is
returned). A date and time with an offset, such as '2026-10-01T00:00:00Z'; anything else answers 400
'INVALID_SINCE'. An entry with no time never matches, and a table with no time column answers 400
'ENTRY_TABLE_HAS_NO_TIME'. | [optional] [default to null]
 **_until** | **string** | Only entries made before this time: 'until' is EXCLUSIVE (an entry made at exactly 'until' is NOT
returned), so 'since=A&until=B' followed by 'since=B&until=C' counts every entry once. Same form and same
refusals as 'since' (400 'INVALID_UNTIL'). | [optional] [default to null]
 **context** | [**map[String, string]**](string.md) | Host context filters as 'context[key]=value' (max 5 keys, counting dotted 'context.key' too). Use 'column.<name>=value' for columns whose names collide with reserved parameters. | [optional] [default to null]
 **filter** | [**map[String, string]**](string.md) | Column filters as 'filter[columnName]=value' (same meaning as bare 'columnName=value' or 'column.columnName=value'; max 10 column filters counting all spellings). A plain 'filter=value' still filters a column named 'filter'. | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CompositionEntriesReadingResponse**](CompositionEntriesReadingResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removeAiAnswersKnowledgeDocument_0

Remove a document from a widget's knowledge base

Removes one document and its passages: the widget's AI stops answering from it at once. Take the 'documentId' from
'getAiAnswersKnowledge'.

The caller must be allowed to change the widget. An API key needs the 'content:write' scope.

### Example

```bash
client.sh removeAiAnswersKnowledgeDocument_0 id=value documentId=value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The widget (composition) the document is in | [default to null]
 **documentId** | **string** | The document to remove | [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**RemoveAiAnswersKnowledgeDocument200Response**](RemoveAiAnswersKnowledgeDocument200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setCompositionDataSource_0

Bind a public JSON data source for embed refresh

Stores an https URL the widget runtime may read on load and every 'refreshSeconds'. The URL must name a public host (no loopback, link-local or metadata addresses). A composition has one binding: saving another replaces it. The answer is the binding as it was saved ('url', 'refreshSeconds').

### Example

```bash
client.sh setCompositionDataSource_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** |  | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **setCompositionDataSourceRequest** | [**SetCompositionDataSourceRequest**](SetCompositionDataSourceRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CompositionDataSourceResponse**](CompositionDataSourceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setDynamicContent_0

Set Dynamic Content

Updates the content of a composition dynamically with optional schema validation.

An editor session (see 'createManagedUserEditorSession') can send only 'content', 'validate' and
'partial', and only for a composition made for its managed user. A body that names 'version', 'source'
or any other field is refused with '403' and 'EDITOR_SESSION_FIELD_NOT_ALLOWED'.

### Example

```bash
client.sh setDynamicContent_0 id=value Idempotency-Key:value If-Match:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **setDynamicContentRequest** | [**SetDynamicContentRequest**](SetDynamicContentRequest.md) |  |
 **ifMatch** | **string** | Optional content version from ETag ('\"3\"', '3', or '*') | [optional] [default to null]
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**SetDynamicContentResponse**](SetDynamicContentResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateCompositionDatabaseRecord_0

Update Record In Composition Database

Updates a specific record in one of the composition's tables. Only the composition's own tables (made from its 'databaseSchema' or from the tables its widget declares) can be reached; any other table name answers '404'.

### Example

```bash
client.sh updateCompositionDatabaseRecord_0 id=value table=value recordId=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **table** | **string** | Name of the database table | [default to null]
 **recordId** | **string** | ID of the record to update | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **body** | **map** |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionDatabaseRecord201Response**](CreateCompositionDatabaseRecord201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateCompositionStatus_0

Update Composition Status

Updates the status of a specific composition.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry.

### Example

```bash
client.sh updateCompositionStatus_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Composition ID | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **updateCompositionStatusRequest** | [**UpdateCompositionStatusRequest**](UpdateCompositionStatusRequest.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CompositionResponse**](CompositionResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateComposition_0

Update Composition

Updates a specific composition.

The 'Idempotency-Key' header is required ('400' without it). Send the same key when you retry.

An editor session (see 'createManagedUserEditorSession') can send only 'name', 'content', 'design' and
'embedSettings', and only for a composition made for its managed user. A body that names any other field
is refused with '403' and 'EDITOR_SESSION_FIELD_NOT_ALLOWED'.

Send 'databaseSchema' to add tables to the composition: the tables that are missing are made, and
the ones that exist are left as they are. A 'databaseSchema' that cannot be used is refused before anything
is saved, with '400' and 'INVALID_DATABASE_SCHEMA'. If the composition is saved but its tables cannot be made
just now, the answer is still '200' and 'meta.warnings' says so.

### Example

```bash
client.sh updateComposition_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | Composition ID | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **updateComposition** | [**UpdateComposition**](UpdateComposition.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**CreateCompositionFromWidget201Response**](CreateCompositionFromWidget201Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## validateCompositionContent_0

Validate Content

Checks content against the composition's widget schema without saving it. Send what a content update ('PUT /compositions/{id}/content') would store, '{ \"design\": {...}, \"content\": {...} }', or the widget's values alone. Each value is checked by the kind of field the widget declares for it: text, a number within the limits of its slider, true or false, one of the choices of a dropdown, a color, a font, the address of an image, a date. The items of the widget's list are checked the same way, and their number against the limits of the list. A value that cannot be what the field holds, or a number outside its range, is an error and 'valid' is false. Text longer than the field takes, a number or true/false sent as text, and a name the widget has no field for are warnings, and 'valid' stays true. The design is not checked here. Nothing is saved and nothing in the body is changed.

### Example

```bash
client.sh validateCompositionContent_0 id=value Idempotency-Key:value X-Managed-User-Id:value X-Managed-User-External-Id:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | ID of the composition | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **requestBody** | [**map[String, AnyType]**](AnyType.md) |  |
 **xManagedUserId** | **string** | The id Widgetic gave the managed user ('POST /managed-users'). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]
 **xManagedUserExternalId** | **string** | Your own id for the managed user (its 'externalId'), when you do not keep Widgetic's. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer's work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user's compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers '404' (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers '404' with 'MANAGED_USER_NOT_FOUND'. An empty, repeated or malformed header is '400' with 'MANAGED_USER_SCOPE_INVALID'; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with '403' and 'MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE': send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer's browser holds, use an editor session. An 'Idempotency-Key' is kept apart for each managed user. | [optional] [default to null]

### Return type

[**ValidateCompositionContentResponse**](ValidateCompositionContentResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

