# PartnersApi

All URIs are relative to */v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPartnerExtraCreditsInvoice_0**](PartnersApi.md#createPartnerExtraCreditsInvoice_0) | **POST** /partners/{partnerId}/credits/extra-invoice | Buy extra credits for a partner
[**getMyPartners_0**](PartnersApi.md#getMyPartners_0) | **GET** /partners/mine | Find the partner you administer
[**getPartnerAdapterConnections_0**](PartnersApi.md#getPartnerAdapterConnections_0) | **GET** /partners/{partnerId}/adapter-connections | See which adapter keys a partner has connected
[**getPartnerAnalyticsByManagedUser_0**](PartnersApi.md#getPartnerAnalyticsByManagedUser_0) | **GET** /partners/{partnerId}/analytics/managed-users | What each managed user&#39;s widgets did
[**getPartnerAnalyticsSummary_0**](PartnersApi.md#getPartnerAnalyticsSummary_0) | **GET** /partners/{partnerId}/analytics/summary | What was done with a partner&#39;s published widgets
[**getPartnerAnalyticsTimeline_0**](PartnersApi.md#getPartnerAnalyticsTimeline_0) | **GET** /partners/{partnerId}/analytics/timeline | What was done with a partner&#39;s widgets, day by day
[**getPartnerAnalyticsTopWidgets_0**](PartnersApi.md#getPartnerAnalyticsTopWidgets_0) | **GET** /partners/{partnerId}/analytics/top-widgets | Which widgets were viewed the most
[**getPartnerBillingOverview_0**](PartnersApi.md#getPartnerBillingOverview_0) | **GET** /partners/{partnerId}/billing-overview | Get comprehensive partner billing overview
[**getPartnerContract_0**](PartnersApi.md#getPartnerContract_0) | **GET** /partners/{partnerId}/contract | Get a partner&#39;s contract
[**getPartnerCreditBalance_0**](PartnersApi.md#getPartnerCreditBalance_0) | **GET** /partners/{partnerId}/credits/balance | Get partner credit balance
[**getPartnerCreditTransactions_0**](PartnersApi.md#getPartnerCreditTransactions_0) | **GET** /partners/{partnerId}/credits/transactions | Get partner credit transaction history
[**getPartnerDataDatabase_0**](PartnersApi.md#getPartnerDataDatabase_0) | **GET** /partners/{partnerId}/data-database | See the Neon database a partner keeps the data of its compositions in
[**getPartnerDesignDefaults_0**](PartnersApi.md#getPartnerDesignDefaults_0) | **GET** /partners/{partnerId}/design-defaults | Read partner-wide design defaults
[**getPartnerEntryContextSigning_0**](PartnersApi.md#getPartnerEntryContextSigning_0) | **GET** /partners/{partnerId}/entry-context-signing | See how the context of your embeds is signed
[**getPartnerNotificationSettings_0**](PartnersApi.md#getPartnerNotificationSettings_0) | **GET** /partners/{partnerId}/notifications/settings | Where your notifications go
[**getPartnerStorageDestination_0**](PartnersApi.md#getPartnerStorageDestination_0) | **GET** /partners/{partnerId}/storage | Get where a partner&#39;s uploaded files are stored
[**getPartnerStorageUsage_0**](PartnersApi.md#getPartnerStorageUsage_0) | **GET** /partners/{partnerId}/storage/usage | What a partner&#39;s customers store
[**listPartnerNotificationDeliveries_0**](PartnersApi.md#listPartnerNotificationDeliveries_0) | **GET** /partners/{partnerId}/notifications/deliveries | How your notifications reached you
[**listPartnerNotifications_0**](PartnersApi.md#listPartnerNotifications_0) | **GET** /partners/{partnerId}/notifications | What your partner account was told
[**listPartnerPresets_0**](PartnersApi.md#listPartnerPresets_0) | **GET** /partners/{partnerId}/presets | List the widgets a partner offers as presets
[**removePartnerAdapterConnection_0**](PartnersApi.md#removePartnerAdapterConnection_0) | **DELETE** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Remove an adapter key from a partner
[**removePartnerDataDatabase_0**](PartnersApi.md#removePartnerDataDatabase_0) | **DELETE** /partners/{partnerId}/data-database | Stop keeping the data of a partner&#39;s compositions in its own database
[**removePartnerPreset_0**](PartnersApi.md#removePartnerPreset_0) | **DELETE** /partners/{partnerId}/presets/{key} | Take a widget off the partner&#39;s presets
[**removePartnerStorageDestination_0**](PartnersApi.md#removePartnerStorageDestination_0) | **DELETE** /partners/{partnerId}/storage | Stop storing a partner&#39;s uploaded files in its own bucket
[**replayPartnerNotificationDelivery_0**](PartnersApi.md#replayPartnerNotificationDelivery_0) | **POST** /partners/{partnerId}/notifications/deliveries/{deliveryId}/replay | Send a webhook delivery again
[**rotatePartnerEntryContextSecret_0**](PartnersApi.md#rotatePartnerEntryContextSecret_0) | **POST** /partners/{partnerId}/entry-context-signing/secret | Make a secret to sign the context of your embeds
[**rotatePartnerWebhookSecret_0**](PartnersApi.md#rotatePartnerWebhookSecret_0) | **POST** /partners/{partnerId}/notifications/webhook-secret | Make a new secret for your webhook
[**sendPartnerNotificationTestEvent_0**](PartnersApi.md#sendPartnerNotificationTestEvent_0) | **POST** /partners/{partnerId}/notifications/test-event | Send a test event to your webhook
[**setPartnerAdapterConnection_0**](PartnersApi.md#setPartnerAdapterConnection_0) | **PUT** /partners/{partnerId}/adapter-connections/{adapterId}/{credentialKey} | Connect an adapter key to a partner
[**setPartnerDataDatabase_0**](PartnersApi.md#setPartnerDataDatabase_0) | **PUT** /partners/{partnerId}/data-database | Keep the data of a partner&#39;s compositions in a Neon database of its own
[**setPartnerDesignDefaults_0**](PartnersApi.md#setPartnerDesignDefaults_0) | **PUT** /partners/{partnerId}/design-defaults | Set or clear partner-wide design defaults
[**setPartnerPreset_0**](PartnersApi.md#setPartnerPreset_0) | **PUT** /partners/{partnerId}/presets/{key} | Make a widget a preset, or replace a preset
[**setPartnerStorageDestination_0**](PartnersApi.md#setPartnerStorageDestination_0) | **PUT** /partners/{partnerId}/storage | Set where a partner&#39;s uploaded files are stored
[**updatePartnerEntryContextSigning_0**](PartnersApi.md#updatePartnerEntryContextSigning_0) | **PUT** /partners/{partnerId}/entry-context-signing | Require a signed context, or stop requiring it
[**updatePartnerNotificationSettings_0**](PartnersApi.md#updatePartnerNotificationSettings_0) | **PUT** /partners/{partnerId}/notifications/settings | Choose where your notifications go
[**verifyPartnerDataDatabase_0**](PartnersApi.md#verifyPartnerDataDatabase_0) | **POST** /partners/{partnerId}/data-database/verify | Check that a partner&#39;s own database still works
[**verifyPartnerStorageDestination_0**](PartnersApi.md#verifyPartnerStorageDestination_0) | **POST** /partners/{partnerId}/storage/verify | Check that a partner&#39;s storage destination still works



## createPartnerExtraCreditsInvoice_0

Buy extra credits for a partner

Asks Widgetic for an invoice for extra credits, on top of the credits of the contract. Name the dollars; the
invoice is for the most whole credits they buy at the **list price** of a credit (the price a contract may
lower belongs to the contract), so it is never for more than you asked: 12.34 buys 123 credits and the invoice
says 12.30. The smallest purchase is 10 dollars and one request buys at most 100000 (ask Widgetic for an
invoice for more).

Pay the invoice with the link in the answer. When it is paid the credits are added **once, for good**, to the
account of the person who administers the partner, which is the account everything the partner builds is
charged to ('getPartnerCreditBalance' shows it). Extra credits **do not expire**, unlike the credits of a
contract period, which end with it. Nothing is added before the invoice is paid, and an unpaid invoice for
extra credits never stops the partner: only an unpaid invoice of the contract does ('payment_arrears').

Allowed whatever the partner's standing: a partner that has run out of credits, or is stopped for an unpaid
contract invoice, can still buy. No contract is needed.

An 'Idempotency-Key' is required, and it is what makes a retry safe: the same key with the same body returns
the invoice already issued, the same key with a different body is refused with 422, and a duplicate that
arrives while the first is still running is refused with 409. Use one key per purchase you mean to make, and
a new key for the next one. At most 10 requests an hour.

Who may ask: the person who administers the partner, or a Widgetic administrator. A key limited to scopes
needs 'billing:write'.

### Example

```bash
client.sh createPartnerExtraCreditsInvoice_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | Partner ID | [default to null]
 **idempotencyKey** | **string** | A key of your own for this purchase, so that a retry cannot make a second invoice | [default to null]
 **requestExtraCredits** | [**RequestExtraCredits**](RequestExtraCredits.md) |  |

### Return type

[**PartnerExtraCreditsInvoiceResponse**](PartnerExtraCreditsInvoiceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getMyPartners_0

Find the partner you administer

Returns the partner (nearly always one) that the signed-in account administers, with the id every other
partner route asks for and the standing it is in: 'active', 'inactive' (not activated yet), 'suspended'
(paused, with the reason Widgetic gave) or 'payment_arrears' (a contract invoice is past its due date and
unpaid, since 'overdueSince'; the partner is stopped until it is paid). A partner API key is that account's
key, so it reads its own partner here.

An account that administers no partner is not refused: it gets 'standing: not_a_partner' and an empty
list, so a dashboard can tell \"this is not a partner account\" from \"something failed\".

The call stays open while the partner is paused, not yet active or in payment arrears: that is when its
dashboard has to say why.

### Example

```bash
client.sh getMyPartners_0
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**MyPartnersResponse**](MyPartnersResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerAdapterConnections_0

See which adapter keys a partner has connected

Widget adapters are capabilities a widget can use, and some of them act through a service the account that
made the widget has with a provider: an adapter that sends email needs an email provider key, one that sends
texts needs an SMS provider key. For the widgets of the customers a partner manages, those keys are the
partner's. This lists every key an adapter takes from a partner and whether the partner has connected it.

An empty list means no adapter takes a key from a partner at the moment. The list never contains a key: only
whether one is connected and when it was last set.

Connect a key with 'setPartnerAdapterConnection'; take it away with 'removePartnerAdapterConnection'. A managed
customer never holds a key: the widgets of a managed customer use the partner's, and never the personal key
of the person who administers the partner.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerAdapterConnections_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose adapter keys to list | [default to null]

### Return type

[**GetUserAdapterConnections200Response**](GetUserAdapterConnections200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerAnalyticsByManagedUser_0

What each managed user's widgets did

Lists every one of your managed users with what their widgets and compositions did in a period: views,
interactions and visitors, and how many widgets and compositions they have made. A managed user whose widgets
were not viewed is listed too, with zeros. The most viewed come first, and 'page.hasMore' says whether more
follow.

Only the compositions made for a managed user count for it: file them under the user when you create them
('managedUserId' on 'createComposition'), or let the user's editor session do it, which files everything under
its user. What a visitor did with a composition that is not filed under anyone is in the summary of the whole
account ('getPartnerAnalyticsSummary') and in no managed user's row.

The period works as it does for 'getPartnerAnalyticsSummary'. The caller must be the person who administers the
partner (an API key of that account works, with the 'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerAnalyticsByManagedUser_0 partnerId=value  startDate=value  endDate=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose managed users to report on | [default to null]
 **startDate** | **string** | Start of the period, included. An ISO 8601 date ('2026-10-01') or date-time with its offset. Default 30 days before 'endDate'. | [optional] [default to null]
 **endDate** | **string** | End of the period, not included, in the same forms. Default now. At most 366 days after 'startDate'. | [optional] [default to null]
 **limit** | **integer** | How many managed users to list at most | [optional] [default to 50]
 **offset** | **integer** | How many managed users to skip | [optional] [default to 0]

### Return type

[**PartnerAnalyticsByManagedUserResponse**](PartnerAnalyticsByManagedUserResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerAnalyticsSummary_0

What was done with a partner's published widgets

Counts what the visitors of the compositions made through your account did in a period: how many times a
composition was **viewed**, how many times a visitor **interacted** with one, and how many different visitors
there were. It covers every composition of your account, your own and the ones made for your managed users;
narrow it to one managed user with 'managedUserId' or 'managedUserExternalId' (not both).

The numbers come from the events the embedded widgets send while they are shown (the Widgetic embed SDK sends
them by itself), counted when you ask. Only views and interactions are counted; the events that describe a
visit (its start, its end, the device and the referrer) are not.

The period runs from 'startDate' (included) to 'endDate' (not included): the 30 days before now when you give
neither, and at most 366 days. A date without a time is midnight UTC at the start of that day, so for all of
October give 'startDate=2026-10-01' and 'endDate=2026-11-01'.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerAnalyticsSummary_0 partnerId=value  startDate=value  endDate=value  managedUserId=value  managedUserExternalId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose widgets to report on | [default to null]
 **startDate** | **string** | Start of the period, included. An ISO 8601 date ('2026-10-01') or date-time with its offset ('2026-10-01T08:00:00Z'). Default 30 days before 'endDate'. | [optional] [default to null]
 **endDate** | **string** | End of the period, not included, in the same forms. Default now. It must be after 'startDate', by at most 366 days. | [optional] [default to null]
 **managedUserId** | **string** | Report only on this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. | [optional] [default to null]
 **managedUserExternalId** | **string** | Report only on the managed user you registered with this 'externalId' (your own identifier for the user). Send this or 'managedUserId', not both. | [optional] [default to null]

### Return type

[**PartnerAnalyticsSummaryResponse**](PartnerAnalyticsSummaryResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerAnalyticsTimeline_0

What was done with a partner's widgets, day by day

Counts views, interactions and visitors for each day of a period (UTC days), oldest first, for a chart. Every
day of the period is in the list, also one on which nothing happened (all zeros), so the list can be drawn as
it is. Narrow it to one managed user with 'managedUserId' or 'managedUserExternalId' (not both).

The period works as it does for 'getPartnerAnalyticsSummary'; 'startDate' and 'endDate' are best given as dates,
so that the first and the last day are whole days. The caller must be the person who administers the partner
(an API key of that account works, with the 'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerAnalyticsTimeline_0 partnerId=value  startDate=value  endDate=value  managedUserId=value  managedUserExternalId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose widgets to report on | [default to null]
 **startDate** | **string** | Start of the period, included. An ISO 8601 date ('2026-10-01') or date-time with its offset. Default 30 days before 'endDate'. | [optional] [default to null]
 **endDate** | **string** | End of the period, not included, in the same forms. Default now. At most 366 days after 'startDate'. | [optional] [default to null]
 **managedUserId** | **string** | Report only on this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. | [optional] [default to null]
 **managedUserExternalId** | **string** | Report only on the managed user you registered with this 'externalId'. Send this or 'managedUserId', not both. | [optional] [default to null]

### Return type

[**PartnerAnalyticsTimelineResponse**](PartnerAnalyticsTimelineResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerAnalyticsTopWidgets_0

Which widgets were viewed the most

Lists the widgets whose compositions were viewed the most in a period, with their views, interactions,
visitors and how many of their compositions were viewed. A widget that nobody viewed or used is not listed. The
most viewed come first (then the most used), and at most 'limit' are listed. Narrow it to one managed user with
'managedUserId' or 'managedUserExternalId' (not both).

The period works as it does for 'getPartnerAnalyticsSummary'. The caller must be the person who administers the
partner (an API key of that account works, with the 'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerAnalyticsTopWidgets_0 partnerId=value  startDate=value  endDate=value  managedUserId=value  managedUserExternalId=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose widgets to report on | [default to null]
 **startDate** | **string** | Start of the period, included. An ISO 8601 date ('2026-10-01') or date-time with its offset. Default 30 days before 'endDate'. | [optional] [default to null]
 **endDate** | **string** | End of the period, not included, in the same forms. Default now. At most 366 days after 'startDate'. | [optional] [default to null]
 **managedUserId** | **string** | Report only on this managed user (Widgetic's id for the user). Send this or 'managedUserExternalId', not both. | [optional] [default to null]
 **managedUserExternalId** | **string** | Report only on the managed user you registered with this 'externalId'. Send this or 'managedUserId', not both. | [optional] [default to null]
 **limit** | **integer** | How many widgets to list at most | [optional] [default to 10]

### Return type

[**PartnerAnalyticsTopWidgetsResponse**](PartnerAnalyticsTopWidgetsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerBillingOverview_0

Get comprehensive partner billing overview

Retrieves the partner's credits ('operationalCredits'), the partner's contract terms ('partnerCustomization', the same fields as 'getPartnerContract') and billing integration status. Internal negotiation notes are not part of it.
'operationalCredits' is the one account a partner has for its credits: the account of the person who administers it. It holds 'balance' (the same balance 'getPartnerCreditBalance' reads), 'reservedBalance', 'availableBalance' (what a new operation can use) and 'recentTransactions' (the ten newest entries of the ledger 'getPartnerCreditTransactions' lists). A partner with no administrator has no account, and reads 0 and an empty list.

### Example

```bash
client.sh getPartnerBillingOverview_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | Partner ID | [default to null]

### Return type

[**GetPartnerBillingOverview200Response**](GetPartnerBillingOverview200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerContract_0

Get a partner's contract

Returns the commercial terms agreed with the partner: price, included credits and storage, billing
cycle, commitment, support level, and the dates the contract runs between.

A partner reads its own: the caller must be the person who administers the partner (an API key of
that account works), and anyone else is refused with 403 whether or not the partner exists. Widgetic
administrators can read any partner's. Responds 404 while no contract has been recorded for the
partner, which is the case until Widgetic sets its terms.

### Example

```bash
client.sh getPartnerContract_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose contract to read | [default to null]

### Return type

[**PartnerContractResponse**](PartnerContractResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerCreditBalance_0

Get partner credit balance

Returns the credits the partner has, and how much of that is reserved by operations that are still running.
A partner has ONE account for its credits: the account of the person who administers it, the same account
its API key acts as. There is nothing else to create or to fund. What its customers' editor sessions and its
own API calls spend comes out of that account, and the credits a paid invoice carries are added to it, so
this is the same balance 'getUserCreditBalance' reads for that person.

A partner with no administrator has no account to hold credits, and reads a balance of 0.

Access: the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh getPartnerCreditBalance_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | Partner ID | [default to null]

### Return type

[**AccountCreditBalanceResponse**](AccountCreditBalanceResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerCreditTransactions_0

Get partner credit transaction history

Lists what happened to the partner's credits, newest first: the entries of the credit ledger of the account of
the person who administers it, the one account a partner has for its credits. Every operation that spends
credits is a 'debit' entry, and the credits an invoice carried arrive as 'credit' entries when the invoice is
paid, so this is also how the partner's usage is read. It is the same ledger 'getUserCreditTransactions'
reads for that person.

A partner with no administrator has no account, and an empty ledger.

The page is always bounded: 'limit' defaults to 20 and is capped at 100, 'offset' defaults to 0.

Access: the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh getPartnerCreditTransactions_0 partnerId=value  limit=value  offset=value  type=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | Partner ID | [default to null]
 **limit** | **integer** | Number of transactions to return | [optional] [default to 20]
 **offset** | **integer** | Number of transactions to skip | [optional] [default to 0]
 **type** | **string** | Only entries of this type, for instance 'debit' for the credits spent. The types are listed on 'AccountCreditTransaction'. | [optional] [default to null]

### Return type

[**GetPartnerCreditTransactions200Response**](GetPartnerCreditTransactions200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerDataDatabase_0

See the Neon database a partner keeps the data of its compositions in

Returns the database set with 'setPartnerDataDatabase', without its password: the host, the database and the
role, when it last passed the check, and why the latest re-check failed if it did. Responds 404 while the
partner has no database of its own, which means the data of its compositions is kept by Widgetic.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerDataDatabase_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose database to read | [default to null]

### Return type

[**PartnerDataDatabaseResponse**](PartnerDataDatabaseResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerDesignDefaults_0

Read partner-wide design defaults

### Example

```bash
client.sh getPartnerDesignDefaults_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** |  | [default to null]

### Return type

[**GetPartnerDesignDefaults200Response**](GetPartnerDesignDefaults200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerEntryContextSigning_0

See how the context of your embeds is signed

Says whether you have a secret to sign the 'context' of your embeds with, when it was made, whether the secret
it replaced is still accepted, and whether an entry without a valid signature is refused ('required'). The
secret itself is never part of the answer: it is shown once, when it is made
('rotatePartnerEntryContextSecret', which also explains what signing is for and how to sign).

Signing covers the entries written through the gateway into the compositions of your managed users and into
those of your own account. The caller must be the person who administers the partner (an API key of that
account works, with the 'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerEntryContextSigning_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose context signing to read | [default to null]

### Return type

[**PartnerEntryContextSigningResponse**](PartnerEntryContextSigningResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerNotificationSettings_0

Where your notifications go

Returns who gets the emails, which events you want by email and by webhook, the address of your webhook, and
whether it has a secret to sign with. The secret itself is never returned: it is shown once, when it is made.
'events' lists every kind of event there is, for a settings screen.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerNotificationSettings_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose notification settings to read | [default to null]

### Return type

[**PartnerNotificationSettingsResponse**](PartnerNotificationSettingsResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerStorageDestination_0

Get where a partner's uploaded files are stored

Returns the partner's storage destination without its secret: the endpoint, bucket, folder and public
address, the last four characters of the access key id, when the destination last passed the check, and
why the latest re-check failed if it did. Responds 404 while the partner has no destination, which means
the partner cannot be activated, its uploads are refused, and no editor session is made for its customers
until a destination is set.

The caller must be the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh getPartnerStorageDestination_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose storage destination to read | [default to null]

### Return type

[**PartnerStorageDestinationResponse**](PartnerStorageDestinationResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## getPartnerStorageUsage_0

What a partner's customers store

Says how many files, and how many bytes, your account keeps, in total and for each of your managed users, and
how much of it is in Widgetic's storage and how much in your own storage destination
('setPartnerStorageDestination'). Use it to see which customers store the most, or to charge them for it.

A file is counted for a managed user when it was filed under that user: by naming 'managed_user_id' or
'managed_user_external_id' when you upload it ('uploadsPost', or the metadata of a resumable upload), or
because it was uploaded through that user's editor session, which files everything under its user. The files
that are not filed under anyone (your own, and the ones uploaded without naming a managed user) are the row
whose 'managedUserId' is null. Deleted files are not counted. To list the files of one managed user, use the
'managed_user_id' filter of 'uploadsGet'.

The answer is counted when you ask, so it is always current. The groups are ordered by size, the heaviest
first, and 'page.hasMore' says whether more follow.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh getPartnerStorageUsage_0 partnerId=value  limit=value  offset=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose storage to report on | [default to null]
 **limit** | **integer** | How many managed users to list at most | [optional] [default to 50]
 **offset** | **integer** | How many managed users to skip | [optional] [default to 0]

### Return type

[**PartnerStorageUsageResponse**](PartnerStorageUsageResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listPartnerNotificationDeliveries_0

How your notifications reached you

Lists the sends of your notifications, the newest first: each email to one address and each call to your
webhook, with whether it was delivered, when it is tried again if not, how many attempts it had, and why the
last one failed. Use it to find out why a webhook of yours did not receive an event.

An email counts as delivered when it was handed to the mail service; a call to your webhook counts as
delivered when your endpoint answered with a 2xx status. Anything else is tried again, after 1 minute, then
5 minutes, 30 minutes, 2 hours, 6 hours, 12 hours and a day, eight attempts in all, because your address is
read again at each attempt and you may have mended it. Two answers end the delivery at once: '410 Gone' and
'413 Payload Too Large'.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh listPartnerNotificationDeliveries_0 partnerId=value  limit=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose deliveries to list | [default to null]
 **limit** | **integer** | How many deliveries to list at most | [optional] [default to 100]

### Return type

[**PartnerNotificationDeliveryLogResponse**](PartnerNotificationDeliveryLogResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listPartnerNotifications_0

What your partner account was told

Lists the notifications of a partner, the newest first: the invoices Widgetic issued and their payments, the
reminders to pay them, a warning when your credits run low, and the changes to the standing of the account
(activated, paused, resumed). It is the same list your dashboard shows, and each entry is what your webhook
receives as 'data' when you have one ('updatePartnerNotificationSettings').

A page holds 'limit' notifications (20 by default, at most 100). When there are older ones 'nextBefore' is
set: ask again with it as 'before' to get the next page.

The caller must be the person who administers the partner (an API key of that account works, with the
'partner:read' scope), or a Widgetic administrator.

### Example

```bash
client.sh listPartnerNotifications_0 partnerId=value  limit=value  before=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose notifications to list | [default to null]
 **limit** | **integer** | How many notifications to list at most | [optional] [default to 20]
 **before** | **string** | Only the notifications made before this moment. Give the 'nextBefore' of the previous page. | [optional] [default to null]

### Return type

[**PartnerNotificationPageResponse**](PartnerNotificationPageResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## listPartnerPresets_0

List the widgets a partner offers as presets

Returns the partner's presets, ordered by 'position' and then by 'key': the widgets it offers its managed
users as starting points. The list is the same for every managed user.

Use a preset in one of two ways:
- **Make a composition of it** (the content and design editor): call 'createComposition' with the preset's
  'widgetId' and the managed user. The widget itself stays yours; a composition is the user's own content.
- **Give the user a copy to build on** (the widget creator): call 'copyPresetForManagedUser'. The user gets
  a widget and a canvas of their own.

Presets are not the same as the widgets Widgetic puts on every new Widgetic account. Those are chosen by
Widgetic and are copied at sign-up. A preset here is yours, and is copied only when you ask.

The caller must be the person who administers the partner (an API key of that account works), or a
Widgetic administrator.

### Example

```bash
client.sh listPartnerPresets_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose presets to list | [default to null]

### Return type

[**ListPartnerPresets200Response**](ListPartnerPresets200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removePartnerAdapterConnection_0

Remove an adapter key from a partner

Removes a key an adapter was given. The adapter stops working for the widgets of the partner's customers that
need it: their visitors are told the feature is unavailable. Nothing else of the widgets changes, and connecting
a key again brings them back.

Removing a key that is not connected answers 200 with 'removed: false': the state asked for is the state it is
in. A key of an adapter that has since been retired from the catalog can still be removed.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator.

### Example

```bash
client.sh removePartnerAdapterConnection_0 partnerId=value adapterId=value credentialKey=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner that keeps the key | [default to null]
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


## removePartnerDataDatabase_0

Stop keeping the data of a partner's compositions in its own database

Removes the partner's database from Widgetic: Widgetic forgets the connection string, and from then on the data
of the partner's compositions is kept in Widgetic's database again. Nothing in your database is deleted.

Removing is refused with 409 'PARTNER_DATABASE_HOLDS_DATA' while any composition of the partner keeps its data in
your database: it would read as empty from then on, and what it holds would stay where nothing reads it. Delete
the compositions you no longer need, or keep the database. If Widgetic cannot check what your database holds
(it cannot be reached) the answer is 503 'PARTNER_DATABASE_UNAVAILABLE'; check it with
'verifyPartnerDataDatabase', or set the same database again to repair its connection.

Removing a database the partner does not have is not an error: the answer is 'removed: false'.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator.

### Example

```bash
client.sh removePartnerDataDatabase_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose database to remove | [default to null]

### Return type

[**PartnerDataDatabaseRemovalResponse**](PartnerDataDatabaseRemovalResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removePartnerPreset_0

Take a widget off the partner's presets

Removes the preset under 'key'. The widget itself is not touched, and neither are the copies and the
compositions already made from it.

Removing a preset the partner does not have is not an error: the answer is 'removed: false'.

### Example

```bash
client.sh removePartnerPreset_0 partnerId=value key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose preset to remove | [default to null]
 **key** | **string** | The key of the preset to remove | [default to null]

### Return type

[**PartnerPresetRemovalResponse**](PartnerPresetRemovalResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## removePartnerStorageDestination_0

Stop storing a partner's uploaded files in its own bucket

Removes the partner's storage destination. Partner storage is not optional, so after this every upload of
the account, on any route, and the uploads of your customers' editor sessions are refused (409
'PARTNER_STORAGE_REQUIRED') until a destination is set again, and no editor session can be made. Files
already in the partner's bucket are not touched and are not moved: they stay where they are, at the
addresses they were given.

Removing a destination the partner does not have is not an error: the answer is 'removed: false'.

The caller must be the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh removePartnerStorageDestination_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose storage destination to remove | [default to null]

### Return type

[**PartnerStorageRemovalResponse**](PartnerStorageRemovalResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## replayPartnerNotificationDelivery_0

Send a webhook delivery again

Sends one earlier **webhook** delivery again to your **current** webhook address, with the same event 'id'
('webhook-id') as the original notification so a receiver that remembers ids can ignore a duplicate, and a
new 'createdAt' and signature made with your current secret. The attempt is recorded in the delivery log as a
new row that points at the delivery you replayed.

Set a webhook address (and secret) under notification settings before you replay. Changing the settings needs
an API key with full access. The caller must be the person who administers the partner, or a Widgetic
administrator.

### Example

```bash
client.sh replayPartnerNotificationDelivery_0 partnerId=value deliveryId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose delivery to replay | [default to null]
 **deliveryId** | **string** | The delivery to send again (must be a webhook delivery of this partner) | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]

### Return type

[**PartnerNotificationDeliveryResponse**](PartnerNotificationDeliveryResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## rotatePartnerEntryContextSecret_0

Make a secret to sign the context of your embeds

Makes a secret to sign the 'context' of your embeds with, and returns it in 'secret': **keep it now, it is
shown once** and cannot be read again. Keep it on your server only: whoever holds it can write contexts your
compositions accept. Call this again to make a new secret; the one it replaces is still accepted for a day, so
that your server can switch without an entry being refused (making another within that day ends the overlap
with the first).

**What signing is for.** '<widgetic composition-id=\"...\" context='{\"customerId\":\"c_42\"}'>' hands attribution to
a widget, which sends it with every entry it saves. The page is yours but the browser is the visitor's:
anybody can change that attribute and file an entry under another customer's id. When your server signs the
context, the gateway refuses an entry whose context was changed, and the entries you keep hold attribution
your server wrote.

**How to sign** (on your server, for each page you render):

1. Take the context to give the widget. It may hold text and whole numbers only (within ±2^53, written without
   a fraction or an exponent).
2. Choose when the signature stops being good: 'widgetic_exp', in seconds since 1970 (UTC), no more than
   seven days from now. A minute of difference between clocks is forgiven.
3. Write the text to sign, with no spaces except those inside values:
   'widgetic-context.v1.<compositionId>.<widgetic_exp>.<json>'. '<compositionId>' is the id of the composition
   in lower case. '<json>' is the context as JSON with the keys in character-code order (so 'Z' comes before
   'a', and '10' before '9'), no spaces, strings escaped as JSON escapes them, and the two keys of the
   signature left out.
4. Sign that text: HMAC-SHA256 with the 32 bytes the secret stands for (the base64 text after 'ctxsec_'), and
   write the result as base64url without padding.
5. Give the widget the context with two keys added: 'widgetic_exp' and 'widgetic_sig' (the signature). The whole
   attribute, the two keys included, stays within the limits of any context: at most 20 keys, 2048 bytes of
   JSON, strings up to 500 characters. The two keys take two of the 20 keys and 87 bytes of the 2048.

A test vector, to check your code against before you rely on it. Secret
'ctxsec_AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8=' (the bytes 0 to 31), composition
'7c9e6679-7425-40de-944b-e07fc1f90ae7', 'widgetic_exp' 1792000000 and context
'{\"customerId\":\"c_42\",\"plan\":\"pro\",\"seats\":3}' sign the text
'widgetic-context.v1.7c9e6679-7425-40de-944b-e07fc1f90ae7.1792000000.{\"customerId\":\"c_42\",\"plan\":\"pro\",\"seats\":3}'
and give the signature 'j6g7151F54tl9C8oEY9levaYSppHME4fAPZ7WPwL8C8'. (The secret is the example's, not a
real one.)

**What the gateway does with an entry.** When you have a secret, an entry whose context carries a signature is
checked: a signature that does not match is refused with 403 'CONTEXT_SIGNATURE_INVALID', and one that is past
'widgetic_exp' with 403 'CONTEXT_SIGNATURE_EXPIRED'. When you also require signatures
('updatePartnerEntryContextSigning') an entry whose context carries none is refused with 403
'CONTEXT_SIGNATURE_REQUIRED'. The two keys are taken out before the entry is stored or announced: your entries
and your 'entry.created' events hold the context you wrote. A change you make reaches every part of the
gateway within a minute.

**What it does not do.** A signed context that has been seen (a page's source is public) can be sent again by
anyone until 'widgetic_exp'; when you must not accept the same context twice, put a value that is new for each
page view in it (a 'submissionId' you made up) and keep the ones you have seen. The signature covers the
entries that reach Widgetic's gateway: a row that gets into a table another way (your own code writing
straight into a database you brought, or the record calls of the composition's owner) does not pass
through it, and carries no context.

Retry this call with the same 'Idempotency-Key' if its answer was lost: the answer, secret included, is then
given again, and no second secret is made. This needs an API key with full access. The caller must be the
person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh rotatePartnerEntryContextSecret_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose secret to make | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]

### Return type

[**PartnerEntryContextSecretResponse**](PartnerEntryContextSecretResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## rotatePartnerWebhookSecret_0

Make a new secret for your webhook

Makes a new secret to sign your webhook with, and returns it in 'webhookSecret': **keep it now, it is shown
once** and cannot be read again. Use it when the secret was lost, or may have leaked.

The secret you had keeps signing beside the new one for a day, so that your receiver can switch without a
call being rejected: during that day each call carries two signatures (see 'updatePartnerNotificationSettings'
for how they are verified). Rotating again within the day ends the overlap with the first secret.

Retry this call with the same 'Idempotency-Key' if its answer was lost: the answer, secret included, is then
given again, and no second secret is made.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator.

### Example

```bash
client.sh rotatePartnerWebhookSecret_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose webhook secret to replace | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]

### Return type

[**PartnerNotificationSettingsChangeResponse**](PartnerNotificationSettingsChangeResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## sendPartnerNotificationTestEvent_0

Send a test event to your webhook

Sends ONE signed call, right now, to the webhook address you saved under notification settings, with a sample
of what an event of the type you name carries, and answers how it went: whether your receiver answered with a
2xx status, which status, how long it took, and why not when it did not arrive. Use it to write and try your
receiver (above all the signature check) before a real event happens.

The call is made like every other: it is signed with your current secret (and the previous one while a
rotation overlaps), it carries the headers 'webhook-id', 'webhook-timestamp', 'webhook-signature' and
'x-widgetic-event' (the event type), and its body is '{ \"id\", \"type\", \"createdAt\", \"partnerId\", \"data\" }'.
Three things differ. 'id' starts with 'evt_test_' and is new every time, so a receiver that remembers ids can
tell a test from an event and drop it. 'data' holds made-up values of the shape a real event of that type
carries ('PartnerNotification' describes each), never anything about your account. And the call is made once:
it is not tried again, nothing is stored, and it appears neither in the delivery log nor in the notification
list.

It is sent whatever 'webhookEvents' says: a test is not filtered by what you subscribed to. The answer is 200
whether or not your receiver took the call (read 'delivered'); a call that gets no answer within ten seconds
is given up and reported as a 'timeout'.

A webhook address and a signing secret must be saved first ('updatePartnerNotificationSettings'); until then
the answer is 409. This needs an API key with full access, and 'Idempotency-Key' is required: a retry with the
same key gets the first answer back and no second call is made. The caller must be the person who
administers the partner, or a Widgetic administrator. Five tests a minute.

### Example

```bash
client.sh sendPartnerNotificationTestEvent_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose webhook to try | [default to null]
 **idempotencyKey** | **string** | Required: a call without it is refused with '400'. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [default to null]
 **partnerNotificationTestEventRequest** | [**PartnerNotificationTestEventRequest**](PartnerNotificationTestEventRequest.md) |  |

### Return type

[**PartnerNotificationTestEventResultResponse**](PartnerNotificationTestEventResultResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setPartnerAdapterConnection_0

Connect an adapter key to a partner

Gives an adapter the key it needs to act through a service the partner has an account with, for the widgets of
the customers the partner manages. Take the 'adapterId' and 'credentialKey' from
'getPartnerAdapterConnections'. Saving a key that is already connected replaces it.

**What Widgetic does with it.** The key is stored encrypted, bound to this partner, this adapter and this
credential, so that a stored value cannot be moved to another. It is never returned, never logged and never
shown to a visitor of a widget or to your customers. A server of Widgetic opens it for the one call a widget
makes through the adapter, uses it to call the provider on the partner's behalf, and discards it. To cut that
off, remove the key here, or revoke it with the provider.

**What is checked.** That the adapter exists and takes this credential, that a partner may keep it (some are
for an owner only) and that the text is one line of at most 2048 characters. Whether the provider accepts the
key is not checked here: it shows the first time a widget uses it.

A widget whose adapter has no key connected is not charged and does not run that adapter: its visitors are told
the feature is unavailable, and the partner is told once a day what to connect.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator. A retry is harmless: saving the same key twice only refreshes when it was set.

### Example

```bash
client.sh setPartnerAdapterConnection_0 partnerId=value adapterId=value credentialKey=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner that keeps the key | [default to null]
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


## setPartnerDataDatabase_0

Keep the data of a partner's compositions in a Neon database of its own

Points the partner at a Neon database of its own. From then on, what visitors leave in the compositions of
the partner's managed users, and of the compositions made in the partner's own account (the votes, ratings,
answers and form submissions of the widgets that collect them), is stored in that database and nowhere else.
Widgetic's own database is not used for them any more, and nothing of it is copied there.

**What to give.** The connection string of a Neon database and a role made for this, as Neon shows it under
*Connect* ('postgresql://<role>:<password>@ep-<name>.<region>.aws.neon.tech/<database>'). Only Neon databases
are accepted; a string for any other host is refused with 400. What the database needs:
- an empty database of its own, so that nothing else of yours shares it. Widgetic makes one schema in it for
  each composition (named 'comp_' followed by the composition's id). In that schema go the tables the widget
  declares for what its visitors leave, and two small tables of Widgetic's own, whose names start with
  '_widgetic_': the context a host page sent with an entry, and how far Widgetic has read the entries to tell
  you about new ones. It touches nothing else;
- a role that may create schemas and tables in it (the CREATE privilege on the database). The role Neon makes
  with a project has it. A role made in the Neon console can also read and write every other database of the
  same project, so if you keep other data in Neon give Widgetic a project of its own, or make the role with
  SQL ('CREATE ROLE ... LOGIN PASSWORD ...') and grant it only the CREATE privilege on this database;
- connections from anywhere: Widgetic's addresses are not fixed, so a Neon project that only accepts
  connections from an allow list of addresses cannot be used. A suspended compute is fine: it wakes on the
  first request.

**It is checked before it is saved.** Widgetic makes a schema in your database, creates a table in it, writes
a row, reads it back, and removes the schema again, all in one step, so that nothing is left if anything
fails. If it cannot be done nothing is saved and the answer is 422 'PARTNER_DATABASE_UNVERIFIED':
'details.reason' says why ('INVALID_CREDENTIALS', 'DATABASE_NOT_FOUND', 'ACCESS_DENIED', 'ACCESS_BLOCKED',
'ENDPOINT_NOT_FOUND', 'ENDPOINT_UNREACHABLE', 'TIMEOUT', 'READ_ONLY', 'RATE_LIMITED', 'DATABASE_UNAVAILABLE',
'PROBE_MISMATCH' or 'DATABASE_ERROR') and 'message' says what to do.

**Existing data does not move.** The data of a composition lives in one database. If any composition of the
partner already keeps data somewhere else (in Widgetic's database, or in the database you had set), and the
new database does not hold it, the change is refused with 409 'PARTNER_DATABASE_HOLDS_DATA' and nothing is
changed: those compositions would read as empty from then on. 'details.compositionsWithData' says how many.
Set your database before your customers collect data, or delete the compositions you no longer need. Saving
the same database again (a new password) moves nothing and is never refused.

**It is never a fallback.** Once a database is set, a request that needs it while it cannot be used (the
password was changed, the project was deleted) is refused with 503 'PARTNER_DATABASE_UNAVAILABLE'. What the
visitor sent is not stored with Widgetic instead. Fix the connection and set the database again, or check it
with 'verifyPartnerDataDatabase'.

**When it takes effect.** A change reaches every part of Widgetic within about a minute.

**What Widgetic keeps.** The connection string is stored encrypted and is never returned or logged; a response
shows the host, the database and the role, never the password. Widgetic's servers open it to read and write the
data of your compositions while they handle a request for it. To cut that off, change the role's password in
Neon: the compositions stop saving until you set the new string.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator. A retry is harmless: saving the same database twice only refreshes when it was
checked and saved.

### Example

```bash
client.sh setPartnerDataDatabase_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose database to set | [default to null]
 **setPartnerDataDatabaseRequest** | [**SetPartnerDataDatabaseRequest**](SetPartnerDataDatabaseRequest.md) |  |

### Return type

[**PartnerDataDatabaseResponse**](PartnerDataDatabaseResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setPartnerDesignDefaults_0

Set or clear partner-wide design defaults

Send '{ \"design\": { ... } }' or '{ \"design\": null }' to remove. New compositions merge this layer over the
widget base and under each managed user's default and the request body.

### Example

```bash
client.sh setPartnerDesignDefaults_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** |  | [default to null]
 **setPartnerDesignDefaultsRequest** | [**SetPartnerDesignDefaultsRequest**](SetPartnerDesignDefaultsRequest.md) |  |

### Return type

[**GetPartnerDesignDefaults200Response**](GetPartnerDesignDefaults200Response.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setPartnerPreset_0

Make a widget a preset, or replace a preset

Offers one of the partner's own widgets as a preset under 'key'. If the partner already has a preset under
that key it is replaced, so sending the same request twice is safe. Saving replaces the whole preset: a
'title', 'description' or 'position' you leave out goes back to its default.

Keys are 1 to 64 characters: lowercase letters, digits, hyphens and underscores, the first a letter or a
digit ('rating', 'quiz-3').

The widget must belong to the partner's account; a widget that does not exist and one that belongs to
somebody else are refused in the same way (404 'PRESET_WIDGET_NOT_FOUND'). A widget is a preset under at
most one key (409 'PRESET_WIDGET_ALREADY_USED'; 'details.key' says which), and an account can have at
most 100 presets (409 'PRESET_LIMIT_REACHED').

Later changes to the widget reach new copies and new compositions; copies made earlier are not touched.
Deleting the widget removes its preset.

### Example

```bash
client.sh setPartnerPreset_0 partnerId=value key=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose preset to set | [default to null]
 **key** | **string** | The name your code uses for the preset | [default to null]
 **setPartnerPresetRequest** | [**SetPartnerPresetRequest**](SetPartnerPresetRequest.md) |  |

### Return type

[**PartnerPresetResponse**](PartnerPresetResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## setPartnerStorageDestination_0

Set where a partner's uploaded files are stored

Points the partner at a bucket of its own on an S3-compatible service (Cloudflare R2, Amazon S3,
Wasabi, MinIO and the like). From then on, every file the account that administers the
partner stores is kept in that bucket instead of with Widgetic, whichever way it arrives: a file sent with
'uploadsPost' (with an API key, an SDK token, an editor session or from the Widgetic website), a resumable
upload, the media library, and the files the agent tools and the MCP server save. It takes none of the
account's storage allowance, and its 'url' is served from 'publicBaseUrl'. The chunks of a resumable
upload wait in Widgetic's temporary staging area until it is completed and are removed then: the finished
file is stored in your bucket and nowhere else.

A destination is required. Partner storage is not optional: your customers' files, and your own however they
arrive, are kept in this destination and nowhere else. An editor session
('createManagedUserEditorSession') of any surface cannot be made until a destination is set (409
'PARTNER_STORAGE_REQUIRED'), a destination removed later stops the uploads of the sessions already made
(the same 409), and your own upload with no destination (on any route, including a resumable upload, which
is refused when it is started) is refused in the same way instead of being stored with Widgetic. A partner
cannot be activated until it has a destination that works.

The destination is checked before it is saved. Widgetic writes a small test file under
'<keyPrefix>widgetic-check/', reads it back from '<publicBaseUrl>/<its key>', and deletes it. If any
step fails nothing is saved and the answer is 422 'STORAGE_DESTINATION_UNVERIFIED': 'details.step' says
where ('endpoint', 'write' or 'public_read'), 'details.reason' says why, and 'param' names the field most
likely to be wrong.

What the bucket needs:
- an access key that may put objects into it (it may also delete objects, which lets the test file be
  cleaned up, but that is not required);
- its files publicly readable at 'publicBaseUrl', either because the bucket is public or through a CDN.

The secret access key is stored encrypted and is never returned or logged; a response shows only the last
four characters of the access key id ('accessKeyHint'). Saving replaces the whole destination, so send
every field again, including the secret. Files already stored stay where they are, and keep working for
as long as that bucket stays publicly readable.

Once a destination is set, an upload is never stored with Widgetic instead: when the destination cannot be
used the upload is refused with 503 'STORAGE_DESTINATION_UNAVAILABLE', and when the bucket rejects the
file with 502 'STORAGE_DESTINATION_WRITE_FAILED'.

The caller must be the person who administers the partner (an API key of that account works); anyone else
is refused with 403 whether or not the partner exists. Widgetic administrators can set any partner's.

### Example

```bash
client.sh setPartnerStorageDestination_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose storage destination to set | [default to null]
 **setPartnerStorageDestinationRequest** | [**SetPartnerStorageDestinationRequest**](SetPartnerStorageDestinationRequest.md) |  |

### Return type

[**PartnerStorageDestinationResponse**](PartnerStorageDestinationResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updatePartnerEntryContextSigning_0

Require a signed context, or stop requiring it

Chooses what the gateway does with an entry whose 'context' carries no valid signature.

With 'required: false' (the default) an entry that carries a signature is checked and refused when the
signature is wrong or out of date, and an entry that carries none is accepted, as it always was. With
'required: true' an entry without a valid signature is refused with 403 'CONTEXT_SIGNATURE_REQUIRED': use it
once every page of yours that embeds a composition signs its context.

Signatures cannot be required before you have made a secret ('rotatePartnerEntryContextSecret'): the answer
is 409, so that you cannot lock your own compositions out of taking entries. The change reaches every part of
the gateway within a minute.

Saving the same choice twice leaves the same state, so a retry is harmless and 'Idempotency-Key' is optional.
This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator.

### Example

```bash
client.sh updatePartnerEntryContextSigning_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose context signing to change | [default to null]
 **updatePartnerEntryContextSigningRequest** | [**UpdatePartnerEntryContextSigningRequest**](UpdatePartnerEntryContextSigningRequest.md) |  |
 **idempotencyKey** | **string** | Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [optional] [default to null]

### Return type

[**PartnerEntryContextSigningResponse**](PartnerEntryContextSigningResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## updatePartnerNotificationSettings_0

Choose where your notifications go

Changes who gets the emails, which events you want by email and by webhook, and the address of your webhook.
A key you leave out of the body is left as it was; send only what changes.

**Email.** 'emailRecipients' is the list of addresses (at most five). While it is empty the emails about
invoices go to the billing emails of your billing profile (your contact email when there are none), and the
others to your contact email. The events about money and about the standing of your account are always
emailed, whatever 'emailEvents' says; it narrows the others.

**Webhook.** 'webhookUrl' is where Widgetic sends a signed 'POST' for each event, so that your own system
can act on it (mark an invoice paid, warn your team that credits are low). The address must be 'https' on the
standard port, on a public site, and must not redirect. Setting an address when you have no secret yet makes
one, and the answer carries it as 'webhookSecret': **keep it now, it is shown once**. 'webhookEvents' narrows
what is sent.

Each call has a JSON body, '{ \"id\": \"evt_...\", \"type\": \"invoice.paid\", \"createdAt\": \"...\", \"partnerId\": \"...\",
\"data\": { ... } }' ('data' is the 'data' of 'PartnerNotification'), and these headers:
'webhook-id' (the same as 'id', and the same on every retry), 'webhook-timestamp' (seconds since 1970) and
'webhook-signature' ('v1,' and a base64 HMAC-SHA256). It is the Standard Webhooks scheme, so any of its
libraries verifies it. By hand: take your secret without the 'whsec_' prefix, decode it from base64, and sign
the text '<webhook-id>.<webhook-timestamp>.<the raw body>' with it; the header holds 'v1,<base64 of the
result>' (two signatures separated by a space while a rotated secret overlaps). Reject a 'webhook-timestamp'
that is more than five minutes old.

Answer with a 2xx status within ten seconds. Anything else is tried again, eight attempts in all over about
two days ('listPartnerNotificationDeliveries' shows each). Delivery is at least once: if your answer was lost
the same event arrives again with the same 'id', so drop what you have already handled by it.

Changing the settings needs an API key with full access: they decide where your notifications go.
The caller must be the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh updatePartnerNotificationSettings_0 partnerId=value Idempotency-Key:value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose notification settings to change | [default to null]
 **updatePartnerNotificationSettingsRequest** | [**UpdatePartnerNotificationSettingsRequest**](UpdatePartnerNotificationSettingsRequest.md) |  |
 **idempotencyKey** | **string** | Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, '-' and '_'. Send the same key again when you retry (after a timeout, a dropped connection or a '5xx') and the call is carried out once: the retry gets the first answer back, marked 'X-Idempotency-Cached: true'. The same key with a different body is refused with '422', and a retry that arrives while the first call is still running with '409' (see 'Retry-After'). | [optional] [default to null]

### Return type

[**PartnerNotificationSettingsChangeResponse**](PartnerNotificationSettingsChangeResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verifyPartnerDataDatabase_0

Check that a partner's own database still works

Runs the same check as 'setPartnerDataDatabase' against the database already saved: a schema is made in it, a
table created, a row written and read back, and the schema removed again. Use it after changing the role's
password or the project's settings in Neon, or when saving is failing with 503 'PARTNER_DATABASE_UNAVAILABLE'.

The result is recorded either way. A pass refreshes 'verifiedAt' and clears 'lastVerificationError'; a failure
answers 422 'PARTNER_DATABASE_UNVERIFIED' and is recorded in 'lastVerificationError' and
'lastVerificationFailedAt', so the database shows what went wrong the next time it is read. A failed check does
not remove the database. 'details.reason' is one of the reasons 'setPartnerDataDatabase' lists, or
'STORED_STRING_UNREADABLE' when the connection string Widgetic stored can no longer be read: set the database
again, with its connection string.

This needs an API key with full access. The caller must be the person who administers the partner, or a
Widgetic administrator.

### Example

```bash
client.sh verifyPartnerDataDatabase_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose database to check | [default to null]

### Return type

[**PartnerDataDatabaseResponse**](PartnerDataDatabaseResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## verifyPartnerStorageDestination_0

Check that a partner's storage destination still works

Runs the same check as 'setPartnerStorageDestination' against the destination already saved: a test
file is written, read back from the public address and deleted. Use it after rotating a key or changing
a bucket policy, or when uploads are failing with 502 or 503.

The result is recorded either way. A pass refreshes 'verifiedAt' and clears 'lastVerificationError'; a
failure answers 422 'STORAGE_DESTINATION_UNVERIFIED' and is recorded in 'lastVerificationError' and
'lastVerificationFailedAt', so the destination shows what went wrong the next time it is read. A failed
check does not remove the destination or stop uploads from using it.

The caller must be the person who administers the partner, or a Widgetic administrator.

### Example

```bash
client.sh verifyPartnerStorageDestination_0 partnerId=value
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partnerId** | **string** | The partner whose storage destination to check | [default to null]

### Return type

[**PartnerStorageDestinationResponse**](PartnerStorageDestinationResponse.md)

### Authorization

[apiKeyAuth](../README.md#apiKeyAuth)

### HTTP request headers

- **Content-Type**: Not Applicable
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

