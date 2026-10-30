# UsersApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addPersonalWorkspaceDomain_0**](UsersApi.md#addPersonalWorkspaceDomain_0) | **POST** /users/{id}/workspace/domains | Allow a website to show your widgets
[**confirmUserAdapterConnection_0**](UsersApi.md#confirmUserAdapterConnection_0) | **POST** /users/{userId}/adapter-connections/{adapterId}/{credentialKey}/confirm | Confirm an adapter address with the code that was emailed to it
[**createUserApiKey_0**](UsersApi.md#createUserApiKey_0) | **POST** /users/{id}/keys | Create an API key
[**deletePersonalWorkspaceDomain_0**](UsersApi.md#deletePersonalWorkspaceDomain_0) | **DELETE** /users/{id}/workspace/domains/{domainId} | Stop allowing a website to show your widgets
[**deleteUserApiKey_0**](UsersApi.md#deleteUserApiKey_0) | **DELETE** /users/{id}/keys/{keyId} | Delete an API key
[**getPersonalWorkspaceDomains_0**](UsersApi.md#getPersonalWorkspaceDomains_0) | **GET** /users/{id}/workspace/domains | List the websites allowed to show your widgets
[**getUserAdapterConnections_0**](UsersApi.md#getUserAdapterConnections_0) | **GET** /users/{userId}/adapter-connections | See which adapter keys an account has connected
[**getUserApiKeyUsageLogs_0**](UsersApi.md#getUserApiKeyUsageLogs_0) | **GET** /users/{id}/api-keys/{keyId}/logs | Read what an API key was used for
[**getUserApiKeys_0**](UsersApi.md#getUserApiKeys_0) | **GET** /users/{id}/keys | List the API keys of an account
[**removeUserAdapterConnection_0**](UsersApi.md#removeUserAdapterConnection_0) | **DELETE** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from an account
[**setUserAdapterConnection_0**](UsersApi.md#setUserAdapterConnection_0) | **PUT** /users/{userId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to an account
[**updatePersonalWorkspaceDomain_0**](UsersApi.md#updatePersonalWorkspaceDomain_0) | **PUT** /users/{id}/workspace/domains/{domainId} | Change a website on your list
[**updateUserApiKey_0**](UsersApi.md#updateUserApiKey_0) | **PUT** /users/{id}/keys/{keyId} | Rename an API key, or switch it off or on



## addPersonalWorkspaceDomain_0

Allow a website to show your widgets

Adds a website to an account's own list. Give a website name such as 'example.com', or '*.example.com' for a website and all of its subdomains. A scheme, a port, a path, capital letters and a leading 'www.' are dropped, so 'https://www.Example.com/shop' is kept as 'example.com', and 'example.com' covers 'www.example.com' too. Something that is not a website name is refused, not stored.
Until the first website is added nothing is restricted, and a widget can be shown anywhere. Once the list has one, a widget of the account is shown on the listed websites (and on Widgetic's own) and nowhere else. A page on your own machine ('localhost', '127.0.0.1' or '[::1]', on any port) is always allowed, so there is nothing to add to test locally. So is the website where a partner your account administers integrates Widgetic, with every subdomain of it ('platformDomain' in the answer of 'GET /partners/mine'), so there is nothing to add for it either and a list can never lock it out. A change can take about 15 seconds to reach every server.
The list is a safeguard against other websites showing your widgets in a visitor's browser. It is not access control: anyone who knows a widget's id can still fetch its published content with a plain request that names no website.
There is no limit on the list of an account that administers a partner, so a partner can add the website of each of its customers as they publish on their own domain, one call each. Any other account can list at most 50 websites, and the 51st is answered with a 409 ('BUSINESS_STATE_CONFLICT'). A wildcard such as '*.example.com' counts as one website, not one per subdomain, so use it instead of listing each subdomain.
A page that frames a widget can name only so many websites to the browser (about fifty of ordinary length). Past that, the browser no longer checks the list for that page; the lookup that the Embed SDK makes for the widget still refuses every website that is not on the list.

### Example

```bash
client.sh addPersonalWorkspaceDomain_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the list belongs to. For your own, your own user id | [default to null]
 **addDomainRequest** | [**AddDomainRequest**](AddDomainRequest.md) |  |

### Return type

[**PersonalWorkspaceDomainResultResponse**](PersonalWorkspaceDomainResultResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## confirmUserAdapterConnection_0

Confirm an adapter address with the code that was emailed to it

Some credentials are an email address Widgetic sends a widget's messages to ('confirmation: email_code' in
'getUserAdapterConnections'). Saving one with 'setUserAdapterConnection' emails a six-digit code to it; this gives
the code back. Only then is the address used: until it is confirmed, the widgets that need it are not charged and
their visitors are told the feature is unavailable.

The code works for 30 minutes and for five wrong tries. After that, save the address again and a new code is
emailed (not sooner than a minute after the last one). A code that is not made of digits is refused without
counting as a try.

Confirming an address that is already confirmed answers 200 with the same state, so a retry of a request that
went through is harmless. Saving a different address, or the same one before it was confirmed, starts again.

This needs an API key with full access. The caller must be the account itself or a Widgetic administrator.

### Example

```bash
client.sh confirmUserAdapterConnection_0 userId=value adapterId=value credentialKey=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account that keeps the address. For your own, your own user id | [default to null]
 **adapterId** | **string** | The adapter the address is for | [default to null]
 **credentialKey** | **string** | The credential's name within the adapter | [default to null]
 **confirmAdapterConnectionRequest** | [**ConfirmAdapterConnectionRequest**](ConfirmAdapterConnectionRequest.md) |  |

### Return type

[**SetUserAdapterConnection200Response**](SetUserAdapterConnection200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## createUserApiKey_0

Create an API key

Makes a new API key for an account and returns its secret in 'key'. That is the only time the secret is shown: Widgetic keeps a hash, so a key that was not stored cannot be recovered, only replaced. To rotate a key, make the new one, switch the integration over to it, then delete the old one.
Only a person signed in on widgetic.com can make a key: a request made with an API key, or with an SDK token, is refused with 403. That way a leaked key cannot be used to make a second one that survives its revocation. Make keys from the dashboard; a key can still list, rename, switch off and delete keys.
An 'Idempotency-Key' header is required (8 to 50 characters: letters, digits, '-' and '_'). A retry with the same header and the same body returns the same answer instead of making a second key, and the same header with a different body is refused with 422. Make keys one at a time: two requests for the same account that run at the same moment can overwrite each other.
A key can be limited to what it needs. Send a 'preset' ('read_only', 'content' or 'full_access') or a list of 'scopes', never both. Send neither for a key that can do everything its owner can, as every key made before scopes existed. A limited key is refused with 403 and the code 'API_KEY_SCOPE_MISSING' on anything outside its scopes, so a key held by a build server or by a partner's backend can be given only the part of the API it uses. The scopes of a key are fixed when it is made: to widen one, make a new key and delete the old one. A limited key cannot make, change or delete keys, exchange tokens or reach the administration routes. The list of scopes is in the 'ApiKeyScope' schema.
Accounts with API access (Solo, Teams and partner accounts) have no limit on how many keys they hold. An account on a plan without API access cannot make one (a partner account is not asked about a plan).

### Example

```bash
client.sh createUserApiKey_0 id=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the key is for. For your own, your own user id | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **createUserApiKeyRequest** | [**CreateUserApiKeyRequest**](CreateUserApiKeyRequest.md) |  |

### Return type

[**CreatedUserApiKeyResponse**](CreatedUserApiKeyResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deletePersonalWorkspaceDomain_0

Stop allowing a website to show your widgets

Removes one entry from an account's own list. When it was the last one, nothing is restricted any more and a widget can be shown anywhere again. A change can take about 15 seconds to reach every server.

### Example

```bash
client.sh deletePersonalWorkspaceDomain_0 id=value domainId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the list belongs to. For your own, your own user id | [default to null]
 **domainId** | **string** | The 'id' of the entry, as the list shows it | [default to null]

### Return type

[**DeletePersonalWorkspaceDomainResponse**](DeletePersonalWorkspaceDomainResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## deleteUserApiKey_0

Delete an API key

Deletes a key and the record of what it was used for. The key stops working at once on the server that took the request and within a minute on the others, and cannot be brought back: make a new one instead. To stop a key without losing it, switch it off with 'updateUserApiKey'.

### Example

```bash
client.sh deleteUserApiKey_0 id=value keyId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the key belongs to | [default to null]
 **keyId** | **string** | The 'keyId' of the key, as the list shows it | [default to null]

### Return type

[**DeleteUserApiKeyResponse**](DeleteUserApiKeyResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPersonalWorkspaceDomains_0

List the websites allowed to show your widgets

Lists the websites on an account's own list, newest first. It is the list Widgetic checks when a widget of the account is embedded: when it holds at least one website, the widget is shown on those websites (and on Widgetic's own) and nowhere else; when it is empty, the widget can be shown anywhere. If the account administers a partner, the websites set on the partner record by Widgetic are added to them. Widgets that belong to an organization use the organization's list instead.
The answer holds the whole list, however long it is: a partner's list has no limit.

### Example

```bash
client.sh getPersonalWorkspaceDomains_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the list belongs to. For your own, your own user id | [default to null]

### Return type

[**GetPersonalWorkspaceDomains200Response**](GetPersonalWorkspaceDomains200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUserAdapterConnections_0

See which adapter keys an account has connected

Widget adapters are capabilities a widget can use, and some of them act through a service the owner has an
account with: an adapter that sends email needs the owner's email provider key, one that sends texts needs the
owner's SMS provider key. This lists every key an adapter takes from an owner and whether this account has
connected it, so a settings page can show what is missing.

An empty list means no adapter takes a key from an owner at the moment. The list never contains a key: only
whether one is connected and when it was last set.

Connect a key with 'setUserAdapterConnection'; take it away with 'removeUserAdapterConnection'. The widgets of
customers a partner manages use the partner's keys instead ('getPartnerAdapterConnections').

The caller must be the account itself (an API key of that account works, with the 'account:read' scope), or a
Widgetic administrator.

### Example

```bash
client.sh getUserAdapterConnections_0 userId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account whose adapter keys to list. For your own, your own user id | [default to null]

### Return type

[**GetUserAdapterConnections200Response**](GetUserAdapterConnections200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUserApiKeyUsageLogs_0

Read what an API key was used for

Lists the calls made with one key, newest first: when, which path and method, and the status each ended with. Use it to see whether a key is still in use before deleting it, or to see what a key that should not be in use has been doing.

### Example

```bash
client.sh getUserApiKeyUsageLogs_0 id=value keyId=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the key belongs to | [default to null]
 **keyId** | **string** | The 'keyId' of the key, as the list shows it | [default to null]
 **limit** | **integer** | How many calls to return, newest first | [optional] [default to 500]

### Return type

[**GetUserApiKeyUsageLogsResponse**](GetUserApiKeyUsageLogsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getUserApiKeys_0

List the API keys of an account

Lists the API keys of an account, in the order they were made: name, the first characters of the key, when it was made, when it expires, when it was last used, whether it is switched on and what it is limited to ('scopes' and 'preset'). The secret of a key is never part of the list. A caller can list its own account's keys; Widgetic staff can list any account's.

### Example

```bash
client.sh getUserApiKeys_0 id=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the keys belong to. For your own keys, your own user id | [default to null]

### Return type

[**GetUserApiKeys200Response**](GetUserApiKeys200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removeUserAdapterConnection_0

Remove an adapter key from an account

Removes a key an adapter was given. The adapter stops working for the widgets that need it: their visitors are
told the feature is unavailable. Nothing else of the widgets changes, and connecting a key again brings them
back.

Removing a key that is not connected answers 200 with 'removed: false': the state asked for is the state it is
in. A key of an adapter that has since been retired from the catalog can still be removed.

This needs an API key with full access. The caller must be the account itself or a Widgetic administrator.

### Example

```bash
client.sh removeUserAdapterConnection_0 userId=value adapterId=value credentialKey=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account that keeps the key. For your own, your own user id | [default to null]
 **adapterId** | **string** | The adapter the key is for | [default to null]
 **credentialKey** | **string** | The key's name within the adapter | [default to null]

### Return type

[**RemoveUserAdapterConnection200Response**](RemoveUserAdapterConnection200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setUserAdapterConnection_0

Connect an adapter key to an account

Gives an adapter the key it needs to act through a service you have an account with, for the widgets you made.
Take the 'adapterId' and 'credentialKey' from 'getUserAdapterConnections'. Saving a key that is already
connected replaces it.

**What Widgetic does with it.** The key is stored encrypted, bound to this account, this adapter and this
credential, so that a stored value cannot be moved to another. It is never returned, never logged and never
shown to a visitor of a widget. A server of Widgetic opens it for the one call a widget makes through the
adapter, uses it to call the provider on your behalf, and discards it. To cut that off, remove the key here, or
revoke it with the provider.

**What is checked.** That the adapter exists and takes this credential, that an owner may keep it (some are
for a partner only) and that the text is one line of at most 2048 characters. Whether the provider accepts
the key is not checked here: it shows the first time a widget uses it, and the widget tells its owner.

**An address that has to be confirmed.** Some credentials are not a key but the email address Widgetic sends a
widget's messages to ('confirmation: email_code' in 'getUserAdapterConnections'). Saving one checks that it is one
email address and emails a six-digit code to it; the answer says 'awaitingConfirmation: true', and nothing is sent
to the address until the code is given back with 'confirmUserAdapterConnection'. Saving the same address again
before it is confirmed emails a new code (not sooner than a minute after the last); saving the address that is
already confirmed changes nothing. If the code cannot be emailed, nothing is saved.

A widget whose adapter has no key connected, or whose address is not confirmed yet, is not charged and does not
run that adapter: its visitors are told the feature is unavailable, and the owner is told once a day what to do.

This needs an API key with full access. The caller must be the account itself or a Widgetic administrator. A
retry is harmless: saving the same key twice only refreshes when it was set.

### Example

```bash
client.sh setUserAdapterConnection_0 userId=value adapterId=value credentialKey=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **string** | The account that keeps the key. For your own, your own user id | [default to null]
 **adapterId** | **string** | The adapter the key is for | [default to null]
 **credentialKey** | **string** | The key's name within the adapter | [default to null]
 **setAdapterConnectionRequest** | [**SetAdapterConnectionRequest**](SetAdapterConnectionRequest.md) |  |

### Return type

[**SetUserAdapterConnection200Response**](SetUserAdapterConnection200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updatePersonalWorkspaceDomain_0

Change a website on your list

Replaces the website of one entry on an account's own list. The same rules apply as when adding one ('addPersonalWorkspaceDomain'): a website name such as 'example.com' or '*.example.com', kept in its cleaned form, and refused when it is not a website name or is already on the list.

### Example

```bash
client.sh updatePersonalWorkspaceDomain_0 id=value domainId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the list belongs to. For your own, your own user id | [default to null]
 **domainId** | **string** | The 'id' of the entry, as the list shows it | [default to null]
 **updateDomainRequest** | [**UpdateDomainRequest**](UpdateDomainRequest.md) |  |

### Return type

[**PersonalWorkspaceDomainResultResponse**](PersonalWorkspaceDomainResultResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updateUserApiKey_0

Rename an API key, or switch it off or on

Renames a key, or switches it off ('isActive: false') or back on. A key that is switched off is refused at once by the server that took the request and within a minute by the others, and can be switched on again; deleting is for a key that is not coming back. The secret, the expiry and the scopes of a key cannot be changed. Only a key with full access can make these requests: a key limited to some scopes is refused with 403 and the code 'API_KEY_SCOPE_MISSING'.
Renaming and switching off can be done with an API key. Switching a key on needs a person signed in on widgetic.com: a request that asks for it with an API key or an SDK token is refused with 403, so a leaked key cannot bring a dormant key back to life.

### Example

```bash
client.sh updateUserApiKey_0 id=value keyId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string** | The account the key belongs to | [default to null]
 **keyId** | **string** | The 'keyId' of the key, as the list shows it | [default to null]
 **updateUserApiKeyRequest** | [**UpdateUserApiKeyRequest**](UpdateUserApiKeyRequest.md) |  |

### Return type

[**UserApiKeyResponse**](UserApiKeyResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

