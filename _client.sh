#compdef client.sh

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! openapi-generator (https://openapi-generator.tech)
# ! FROM OPENAPI SPECIFICATION IN JSON.
# !
# ! Based on: https://github.com/Valodim/zsh-curl-completion/blob/master/_curl
# !
# ! Generator version: 7.9.0
# !
# !
# ! Installation:
# !
# ! Copy the _client.sh file to any directory under FPATH
# ! environment variable (echo $FPATH)
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


local curcontext="$curcontext" state line ret=1
typeset -A opt_args

typeset -A mime_type_abbreviations
# text/*
mime_type_abbreviations[text]="text/plain"
mime_type_abbreviations[html]="text/html"
mime_type_abbreviations[md]="text/x-markdown"
mime_type_abbreviations[csv]="text/csv"
mime_type_abbreviations[css]="text/css"
mime_type_abbreviations[rtf]="text/rtf"
# application/*
mime_type_abbreviations[json]="application/json"
mime_type_abbreviations[xml]="application/xml"
mime_type_abbreviations[yaml]="application/yaml"
mime_type_abbreviations[js]="application/javascript"
mime_type_abbreviations[bin]="application/octet-stream"
mime_type_abbreviations[rdf]="application/rdf+xml"
# image/*
mime_type_abbreviations[jpg]="image/jpeg"
mime_type_abbreviations[png]="image/png"
mime_type_abbreviations[gif]="image/gif"
mime_type_abbreviations[bmp]="image/bmp"
mime_type_abbreviations[tiff]="image/tiff"

#
# Generate zsh completion string list for abbreviated mime types
#
get_mime_type_completions() {
    typeset -a result
    result=()
    for k in "${(@k)mime_type_abbreviations}"; do
        value=$mime_type_abbreviations[${k}]
        #echo $value
        result+=( "${k}[${value}]" )
        #echo $result
    done
    echo "$result"
}

#
# cURL crypto engines completion function
#
_curl_crypto_engine() {
    local vals
    vals=( ${${(f)"$(curl --engine list)":gs/ /}[2,$]} )
    _describe -t outputs 'engines' vals && return 0
}

#
# cURL post data completion functions=
#
_curl_post_data() {

    # don't do anything further if this is raw content
    compset -P '=' && _message 'raw content' && return 0

    # complete filename or stdin for @ syntax
    compset -P '*@' && {
        local expl
        _description files expl stdin
        compadd "$expl[@]" - "-"
        _files
        return 0
    }

    # got a name already? expecting data.
    compset -P '*=' && _message 'data value' && return 0

    # otherwise, name (or @ or =) should be specified
    _message 'data name' && return 0

}


local arg_http arg_ftp arg_other arg_proxy arg_crypto arg_connection arg_auth arg_input arg_output

# HTTP Arguments
arg_http=(''\
  {-0,--http1.0}'[force use of use http 1.0 instead of 1.1]' \
  {-b,--cookie}'[pass data to http server as cookie]:data or file' \
  {-c,--cookie-jar}'[specify cookie file]:file name:_files' \
  {-d,--data}'[send specified data as HTTP POST data]:data:{_curl_post_data}' \
  '--data-binary[post HTTP POST data without any processing]:data:{_curl_post_data}' \
  '--data-urlencode[post HTTP POST data, with url encoding]:data:{_curl_post_data}' \
  {-f,--fail}'[enable failfast behavior for server errors]' \
  '*'{-F,--form}'[add POST form data]:name=content' \
  {-G,--get}'[use HTTP GET even with data (-d, --data, --data-binary)]' \
  '*'{-H,--header}'[specify an extra header]:header' \
  '--ignore-content-length[ignore Content-Length header]' \
  {-i,--include}'[include HTTP header in the output]' \
  {-j,--junk-session-cookies}'[discard all session cookies]' \
  {-e,--referer}'[send url as referer]:referer url:_urls' \
  {-L,--location}'[follow Location headers on http 3XX response]' \
  '--location-trusted[like --location, but allows sending of auth data to redirected hosts]' \
  '--max-redirs[set maximum number of redirection followings allowed]:number' \
  {-J,--remote-header-name}'[use Content-Disposition for output file name]' \
  {-O,--remote-name}'[write to filename parsed from url instead of stdout]' \
  '--post301[do not convert POST to GET after following 301 Location response (follow RFC 2616/10.3.2)]' \
  '--post302[do not convert POST to GET after following 302 Location response (follow RFC 2616/10.3.2)]' \
  )

# FTP arguments
arg_ftp=(\
  {-a,--append}'[append to target file instead of overwriting (FTP/SFTP)]' \
  '--crlf[convert LF to CRLF in upload]' \
  '--disable-eprt[disable use of EPRT and LPRT for active FTP transfers]' \
  '--disable-epsv[disable use of EPSV for passive FTP transfers]' \
  '--ftp-account[account data (FTP)]:data' \
  '--ftp-alternative-to-user[command to send when USER and PASS commands fail (FTP)]:command' \
  '--ftp-create-dirs[create paths remotely if it does not exist]' \
  '--ftp-method[ftp method to use to reach a file (FTP)]:method:(multicwd ocwd singlecwd)' \
  '--ftp-pasv[use passive mode for the data connection (FTP)]' \
  '--ftp-skip-pasv-ip[do not use the ip the server suggests for PASV]' \
  '--form-string[like --form, but do not parse content]:name=string' \
  '--ftp-pret[send PRET before PASV]' \
  '--ftp-ssl-ccc[use clear command channel (CCC) after authentication (FTP)]' \
  '--ftp-ssl-ccc-mode[sets the CCC mode (FTP)]:mode:(active passive)' \
  '--ftp-ssl-control[require SSL/TLS for FTP login, clear for transfer]' \
  {-l,--list-only}'[list names only when listing directories (FTP)]' \
  {-P,--ftp-port}'[use active mode, tell server to connect to specified address or interface (FTP]:address' \
  '*'{-Q,--quote}'[send arbitrary command to the remote server before transfer (FTP/SFTP)]:command' \
  )

# Other Protocol arguments
arg_other=(\
  '--mail-from[specify From: address]:address' \
  '--mail-rcpt[specify email recipient for SMTP, may be given multiple times]:address' \
  {-t,--telnet-option}'[pass options to telnet protocol]:opt=val' \
  '--tftp-blksize[set tftp BLKSIZE option]:value' \
  )

# Proxy arguments
arg_proxy=(\
  '--noproxy[list of hosts to connect directly to instead of through proxy]:no-proxy-list' \
  {-p,--proxytunnel}'[tunnel non-http protocols through http proxy]' \
  {-U,--proxy-user}'[specify the user name and password to use for proxy authentication]:user:password' \
  '--proxy-anyauth[use any authentication method for proxy, default to most secure]' \
  '--proxy-basic[use HTTP Basic authentication for proxy]' \
  '--proxy-digest[use http digest authentication for proxy]' \
  '--proxy-negotiate[enable GSS-Negotiate authentication for proxy]' \
  '--proxy-ntlm[enable ntlm authentication for proxy]' \
  '--proxy1.0[use http 1.0 proxy]:proxy url' \
  {-x,--proxy}'[use specified proxy]:proxy url' \
  '--socks5-gssapi-service[change service name for socks server]:servicename' \
  '--socks5-gssapi-nec[allow unprotected exchange of protection mode negotiation]' \
  )

# Crypto arguments
arg_crypto=(\
  {-1,--tlsv1}'[Forces curl to use TLS version 1 when negotiating with a remote TLS server.]' \
  {-2,--sslv2}'[Forces curl to use SSL version 2 when negotiating with a remote SSL server.]' \
  {-3,--sslv3}'[Forces curl to use SSL version 3 when negotiating with a remote SSL server.]' \
  '--ciphers[specifies which cipher to use for the ssl connection]:list of ciphers' \
  '--crlfile[specify file with revoked certificates]:file' \
  '--delegation[set delegation policy to use with GSS/kerberos]:delegation policy:(none policy always)' \
  {-E,--cert}'[use specified client certificate]:certificate file:_files' \
  '--engine[use selected OpenSSL crypto engine]:ssl crypto engine:{_curl_crypto_engine}' \
  '--egd-file[set ssl entropy gathering daemon socket]:entropy socket:_files' \
  '--cert-type[specify certificate type (PEM, DER, ENG)]:certificate type:(PEM DER ENG)' \
  '--cacert[specify certificate file to verify the peer with]:CA certificate:_files' \
  '--capath[specify a search path for certificate files]:CA certificate directory:_directories' \
  '--hostpubmd5[check remote hosts public key]:md5 hash' \
  {-k,--insecure}'[allow ssl to perform insecure ssl connections (ie, ignore certificate)]' \
  '--key[ssl/ssh private key file name]:key file:_files' \
  '--key-type[ssl/ssh private key file type]:file type:(PEM DER ENG)' \
  '--pubkey[ssh public key file]:pubkey file:_files' \
  '--random-file[set source of random data for ssl]:random source:_files' \
  '--no-sessionid[disable caching of ssl session ids]' \
  '--pass:phrase[passphrase for ssl/ssh private key]' \
  '--ssl[try to use ssl/tls for connection, if available]' \
  '--ssl-reqd[try to use ssl/tls for connection, fail if unavailable]' \
  '--tlsauthtype[set TLS authentication type (only SRP supported!)]:authtype' \
  '--tlsuser[set username for TLS authentication]:user' \
  '--tlspassword[set password for TLS authentication]:password' \
  )

# Connection arguments
arg_connection=(\
  {-4,--ipv4}'[prefer ipv4]' \
  {-6,--ipv6}'[prefer ipv6, if available]' \
  {-B,--use-ascii}'[use ascii mode]' \
  '--compressed[request a compressed transfer]' \
  '--connect-timeout[timeout for connection phase]:seconds' \
  {-I,--head}'[fetch http HEAD only (HTTP/FTP/FILE]' \
  '--interface[work on a specific interface]:name' \
  '--keepalive-time[set time to wait before sending keepalive probes]:seconds' \
  '--limit-rate[specify maximum transfer rate]:speed' \
  '--local-port[set preferred number or range of local ports to use]:num' \
  {-N,--no-buffer}'[disable buffering of the output stream]' \
  '--no-keepalive[disable use of keepalive messages in TCP connections]' \
  '--raw[disable all http decoding and pass raw data]' \
  '--resolve[provide a custom address for a specific host and port pair]:host\:port\:address' \
  '--retry[specify maximum number of retries for transient errors]:num' \
  '--retry-delay[specify delay between retries]:seconds' \
  '--retry-max-time[maximum time to spend on retries]:seconds' \
  '--tcp-nodelay[turn on TCP_NODELAY option]' \
  {-y,--speed-time}'[specify time to abort after if download is slower than speed-limit]:time' \
  {-Y,--speed-limit}'[specify minimum speed for --speed-time]:speed' \
  )

# Authentication arguments
arg_auth=(\
  '--anyauth[use any authentication method, default to most secure]' \
  '--basic[use HTTP Basic authentication]' \
  '--ntlm[enable ntlm authentication]' \
  '--digest[use http digest authentication]' \
  '--krb[use kerberos authentication]:auth:(clear safe confidential private)' \
  '--negotiate[enable GSS-Negotiate authentication]' \
  {-n,--netrc}'[scan ~/.netrc for login data]' \
  '--netrc-optional[like --netrc, but does not make .netrc usage mandatory]' \
  '--netrc-file[like --netrc, but specify file to use]:netrc file:_files' \
  '--tr-encoding[request compressed transfer-encoding]' \
  {-u,--user}'[specify user name and password for server authentication]:user\:password' \
  )

# Input arguments
arg_input=(\
  {-C,--continue-at}'[resume at offset ]:offset' \
  {-g,--globoff}'[do not glob {}\[\] letters]' \
  '--max-filesize[maximum filesize to download, fail for bigger files]:bytes' \
  '--proto[specify allowed protocols for transfer]:protocols' \
  '--proto-redir[specify allowed protocols for transfer after a redirect]:protocols' \
  {-r,--range}'[set range of bytes to request (HTTP/FTP/SFTP/FILE)]:range' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  {-T,--upload-file}'[transfer file to remote url (using PUT for HTTP)]:file to upload:_files' \
  '--url[specify a URL to fetch (multi)]:url:_urls' \
  {-z,--time-cond}'[request downloaded file to be newer than date or given reference file]:date expression' \
  )

# Output arguments
arg_output=(\
  '--create-dirs[create local directory hierarchy as needed]' \
  {-D,--dump-header}'[write protocol headers to file]:dump file:_files' \
  {-o,--output}'[write to specified file instead of stdout]:output file:_files' \
  {--progress-bar,-\#}'[display progress as a simple progress bar]' \
  {-\#,--progress-bar}'[Make curl display progress as a simple progress bar instead of the standard, more informational, meter.]' \
  {-R,--remote-time}'[use timestamp of remote file for local file]' \
  '--raw[disable all http decoding and pass raw data]' \
  {-s,--silent}'[silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[show errors in silent mode]' \
  '--stderr[redirect stderr to specified file]:output file:_files' \
  '--trace[enable full trace dump of all incoming and outgoing data]:trace file:_files' \
  '--trace-ascii[enable full trace dump of all incoming and outgoing data, without hex data]:trace file:_files' \
  '--trace-time[prepends a time stamp to each trace or verbose line that curl displays]' \
  {-v,--verbose}'[output debug info]' \
  {-w,--write-out}'[specify message to output on successful operation]:format string' \
  '--xattr[store some file metadata in extended file attributes]' \
  {-X,--request}'[specifies request method for HTTP server]:method:(GET POST PUT DELETE HEAD OPTIONS TRACE CONNECT PATCH LINK UNLINK)' \
  )

_arguments -C -s $arg_http $arg_ftp $arg_other $arg_crypto $arg_connection $arg_auth $arg_input $arg_output \
  {-M,--manual}'[Print manual]' \
  '*'{-K,--config}'[Use other config file to read arguments from]:config file:_files' \
  '--libcurl[output libcurl code for the operation to file]:output file:_files' \
  {-m,--max-time}'[Limit total time of operation]:seconds' \
  {-s,--silent}'[Silent mode, do not show progress meter or error messages]' \
  {-S,--show-error}'[Show errors in silent mode]' \
  '--stderr[Redirect stderr to specified file]:output file:_files' \
  '-q[Do not read settings from .curlrc (must be first option)]' \
  {-h,--help}'[Print help and list of operations]' \
  {-V,--version}'[Print service API version]' \
  '--about[Print the information about service]' \
  '--host[Specify the host URL]':URL:_urls \
  '--dry-run[Print out the cURL command without executing it]' \
  {-ac,--accept}'[Set the Accept header in the request]: :{_values "Accept mime type" $(get_mime_type_completions)}' \
  {-ct,--content-type}'[Set the Content-type header in request]: :{_values "Content mime type" $(get_mime_type_completions)}' \
  '1: :->ops' \
  '*:: :->args' \
  && ret=0


case $state in
  ops)
    # Operations
    _values "Operations" \
            "createCanvas_0[Create Canvas]" \
            "deleteCanvas_0[Delete Canvas]" \
            "getAllCanvases_0[Get All Canvases]" \
            "getCanvas_0[Get Canvas]" \
            "updateCanvas_0[Update Canvas]"             "addAiAnswersKnowledgeDocument_0[Add a document for a widget's AI to answer from]" \
            "checkCompositionAccess_0[Check Composition Access]" \
            "createCompositionContentItem_0[Add a content list item]" \
            "createCompositionDatabaseRecord_0[Create Record In Composition Database]" \
            "createComposition_0[Create Composition]" \
            "deleteCompositionContentItem_0[Delete a content list item]" \
            "deleteCompositionDataSource_0[Remove the composition data source binding]" \
            "deleteCompositionDatabaseRecord_0[Delete Record From Composition Database]" \
            "deleteComposition_0[Delete Composition]" \
            "describeCompositionEntries_0[Describe What a Composition Keeps]" \
            "duplicateComposition_0[Duplicate Composition]" \
            "getAiAnswersKnowledge_0[See the documents a widget's AI answers from]" \
            "getAllCompositions_0[Get All Compositions]" \
            "getCompositionById_0[Get Composition]" \
            "getCompositionContentSchema_0[Get Content Schema]" \
            "getCompositionContent_0[Get Current Content]" \
            "getCompositionDataSource_0[Read the composition data source binding]" \
            "getCompositionDatabaseRecord_0[Get Record From Composition Database]" \
            "getCompositionDatabaseRecords_0[Get All Records From Composition Database Table]" \
            "getCompositionDesignSchema_0[Get Design Schema]" \
            "getCompositionDesign_0[Get Composition Design]" \
            "getCompositionEmbedSchema_0[Get Embed Schema]" \
            "getCompositionEmbedSettings_0[Get Composition Embed Settings]" \
            "getCompositionPreview_0[Get Composition Preview]" \
            "getCompositionVersions_0[Get Composition Versions]" \
            "getCompositionsBatch_0[Get Compositions Batch]" \
            "patchCompositionContentItem_0[Update a content list item]" \
            "readCompositionEntries_0[Read the Entries of a Composition's Table]" \
            "removeAiAnswersKnowledgeDocument_0[Remove a document from a widget's knowledge base]" \
            "setCompositionDataSource_0[Bind a public JSON data source for embed refresh]" \
            "setDynamicContent_0[Set Dynamic Content]" \
            "updateCompositionDatabaseRecord_0[Update Record In Composition Database]" \
            "updateCompositionStatus_0[Update Composition Status]" \
            "updateComposition_0[Update Composition]" \
            "validateCompositionContent_0[Validate Content]"             "getUserCreditBalance_0[Get an account's credit balance]" \
            "getUserCreditTransactions_0[List an account's credit ledger]"             "getManagedUserEntitlements_0[Get managed user entitlements]" \
            "getPartnerEntitlements_0[Get partner entitlements]"             "getInvoicesByPartnerId_0[List a partner's invoices]"             "copyPresetForManagedUser_0[Give a managed user a copy of one of your presets]" \
            "createCompositionFromPreset_0[Create a composition from one of your presets in one call]" \
            "createManagedUserEditorSession_0[Create an editor session for a managed user]" \
            "createManagedUser_0[Create Managed User]" \
            "deleteManagedUser_0[Delete Managed User]" \
            "getAllManagedUsers_0[Get Managed Users]" \
            "getManagedUserById_0[Get Managed User By ID]" \
            "getManagedUserDesignDefaults_0[Read design defaults for one managed user]" \
            "getManagedUserLimits_0[Read monthly credit cap and usage for one managed user]" \
            "getManagedUserStorageUsage_0[Storage used by one managed user's uploads]" \
            "getManagedUserUsage_0[What a managed user's editor sessions spent]" \
            "getManagedUsersByManagerId_0[Get Managed Users By Manager]" \
            "revokeManagedUserEditorSession_0[End one editor session of a managed user]" \
            "revokeManagedUserEditorSessions_0[End every editor session of a managed user]" \
            "setManagedUserDesignDefaults_0[Set or clear design defaults for one managed user]" \
            "setManagedUserLimits_0[Set or clear the monthly credit cap for one managed user]" \
            "updateManagedUser_0[Update Managed User]"             "operationsIdGet_0[Get operation status]"             "addAiAnswersKnowledgeDocument[Add a document for a widget's AI to answer from]" \
            "addPersonalWorkspaceDomain[Allow a website to show your widgets]" \
            "callPublicCompositionAdapter[Call a gateway operation of an adapter a published widget uses]" \
            "checkCompositionAccess[Check Composition Access]" \
            "copyPresetForManagedUser[Give a managed user a copy of one of your presets]" \
            "createCanvas[Create Canvas]" \
            "createComposition[Create Composition]" \
            "createCompositionContentItem[Add a content list item]" \
            "createCompositionDatabaseRecord[Create Record In Composition Database]" \
            "createCompositionFromPreset[Create a composition from one of your presets in one call]" \
            "createCompositionFromWidget[Create a composition for a widget in one call]" \
            "createManagedUser[Create Managed User]" \
            "createManagedUserEditorSession[Create an editor session for a managed user]" \
            "createPartnerExtraCreditsInvoice[Buy extra credits for a partner]" \
            "createPublicCompositionEntry[Append a visitor entry through the gateway]" \
            "createUserApiKey[Create an API key]" \
            "createWidget[Create Widget]" \
            "deleteCanvas[Delete Canvas]" \
            "deleteComposition[Delete Composition]" \
            "deleteCompositionContentItem[Delete a content list item]" \
            "deleteCompositionDataSource[Remove the composition data source binding]" \
            "deleteCompositionDatabaseRecord[Delete Record From Composition Database]" \
            "deleteCompositionEntryItems[Delete composition entry items by id or host context]" \
            "deleteManagedUser[Delete Managed User]" \
            "deletePersonalWorkspaceDomain[Stop allowing a website to show your widgets]" \
            "deleteUserApiKey[Delete an API key]" \
            "describeCompositionEntries[Describe What a Composition Keeps]" \
            "duplicateComposition[Duplicate Composition]" \
            "exportCompositionEntryItems[Export composition entry items]" \
            "getAiAnswersKnowledge[See the documents a widget's AI answers from]" \
            "getAllCanvases[Get All Canvases]" \
            "getAllCompositions[Get All Compositions]" \
            "getAllManagedUsers[Get Managed Users]" \
            "getCanvas[Get Canvas]" \
            "getCompositionById[Get Composition]" \
            "getCompositionContent[Get Current Content]" \
            "getCompositionContentSchema[Get Content Schema]" \
            "getCompositionDataSource[Read the composition data source binding]" \
            "getCompositionDatabaseRecord[Get Record From Composition Database]" \
            "getCompositionDatabaseRecords[Get All Records From Composition Database Table]" \
            "getCompositionDesign[Get Composition Design]" \
            "getCompositionDesignSchema[Get Design Schema]" \
            "getCompositionEmbedSchema[Get Embed Schema]" \
            "getCompositionEmbedSettings[Get Composition Embed Settings]" \
            "getCompositionPreview[Get Composition Preview]" \
            "getCompositionVersions[Get Composition Versions]" \
            "getCompositionsBatch[Get Compositions Batch]" \
            "getInvoicesByPartnerId[List a partner's invoices]" \
            "getManagedUserById[Get Managed User By ID]" \
            "getManagedUserDesignDefaults[Read design defaults for one managed user]" \
            "getManagedUserEntitlements[Get managed user entitlements]" \
            "getManagedUserLimits[Read monthly credit cap and usage for one managed user]" \
            "getManagedUserStorageUsage[Storage used by one managed user's uploads]" \
            "getManagedUserUsage[What a managed user's editor sessions spent]" \
            "getManagedUsersByManagerId[Get Managed Users By Manager]" \
            "getMyPartners[Find the partner you administer]" \
            "getPartnerAdapterConnections[See which adapter keys a partner has connected]" \
            "getPartnerAnalyticsByManagedUser[What each managed user's widgets did]" \
            "getPartnerAnalyticsSummary[What was done with a partner's published widgets]" \
            "getPartnerAnalyticsTimeline[What was done with a partner's widgets, day by day]" \
            "getPartnerAnalyticsTopWidgets[Which widgets were viewed the most]" \
            "getPartnerBillingOverview[Get comprehensive partner billing overview]" \
            "getPartnerContract[Get a partner's contract]" \
            "getPartnerCreditBalance[Get partner credit balance]" \
            "getPartnerCreditTransactions[Get partner credit transaction history]" \
            "getPartnerDataDatabase[See the Neon database a partner keeps the data of its compositions in]" \
            "getPartnerDesignDefaults[Read partner-wide design defaults]" \
            "getPartnerEntitlements[Get partner entitlements]" \
            "getPartnerEntryContextSigning[See how the context of your embeds is signed]" \
            "getPartnerNotificationSettings[Where your notifications go]" \
            "getPartnerStorageDestination[Get where a partner's uploaded files are stored]" \
            "getPartnerStorageUsage[What a partner's customers store]" \
            "getPersonalWorkspaceDomains[List the websites allowed to show your widgets]" \
            "getPublicCompositionEmbed[Resolve a composition UUID to a published widget URL]" \
            "getPublicCompositionIframe[Embed a published composition with its saved values]" \
            "getUserAdapterConnections[See which adapter keys an account has connected]" \
            "getUserApiKeyUsageLogs[Read what an API key was used for]" \
            "getUserApiKeys[List the API keys of an account]" \
            "getUserCreditBalance[Get an account's credit balance]" \
            "getUserCreditTransactions[List an account's credit ledger]" \
            "getWidgets[List Widgets]" \
            "getWidgetsBatch[Get Widgets Batch]" \
            "listCompositionEntryItems[List composition entry items with paging and filters]" \
            "listManagedUserEntries[List entries across a managed user's compositions]" \
            "listPartnerNotificationDeliveries[How your notifications reached you]" \
            "listPartnerNotifications[What your partner account was told]" \
            "listPartnerPresets[List the widgets a partner offers as presets]" \
            "operationsIdGet[Get operation status]" \
            "patchCompositionContentItem[Update a content list item]" \
            "postPublicCompositionEmbedStatus[Batch-check whether compositions are currently served for embed]" \
            "readCompositionEntries[Read the Entries of a Composition's Table]" \
            "removeAiAnswersKnowledgeDocument[Remove a document from a widget's knowledge base]" \
            "removePartnerAdapterConnection[Remove an adapter key from a partner]" \
            "removePartnerDataDatabase[Stop keeping the data of a partner's compositions in its own database]" \
            "removePartnerPreset[Take a widget off the partner's presets]" \
            "removePartnerStorageDestination[Stop storing a partner's uploaded files in its own bucket]" \
            "removeUserAdapterConnection[Remove an adapter key from an account]" \
            "replayPartnerNotificationDelivery[Send a webhook delivery again]" \
            "revokeManagedUserEditorSession[End one editor session of a managed user]" \
            "revokeManagedUserEditorSessions[End every editor session of a managed user]" \
            "rotatePartnerEntryContextSecret[Make a secret to sign the context of your embeds]" \
            "rotatePartnerWebhookSecret[Make a new secret for your webhook]" \
            "sendPartnerNotificationTestEvent[Send a test event to your webhook]" \
            "setCompositionDataSource[Bind a public JSON data source for embed refresh]" \
            "setDynamicContent[Set Dynamic Content]" \
            "setManagedUserDesignDefaults[Set or clear design defaults for one managed user]" \
            "setManagedUserLimits[Set or clear the monthly credit cap for one managed user]" \
            "setPartnerAdapterConnection[Connect an adapter key to a partner]" \
            "setPartnerDataDatabase[Keep the data of a partner's compositions in a Neon database of its own]" \
            "setPartnerDesignDefaults[Set or clear partner-wide design defaults]" \
            "setPartnerPreset[Make a widget a preset, or replace a preset]" \
            "setPartnerStorageDestination[Set where a partner's uploaded files are stored]" \
            "setUserAdapterConnection[Connect an adapter key to an account]" \
            "updateCanvas[Update Canvas]" \
            "updateComposition[Update Composition]" \
            "updateCompositionDatabaseRecord[Update Record In Composition Database]" \
            "updateCompositionStatus[Update Composition Status]" \
            "updateManagedUser[Update Managed User]" \
            "updatePartnerEntryContextSigning[Require a signed context, or stop requiring it]" \
            "updatePartnerNotificationSettings[Choose where your notifications go]" \
            "updatePersonalWorkspaceDomain[Change a website on your list]" \
            "updateUserApiKey[Rename an API key, or switch it off or on]" \
            "uploadPublicCompositionAdapterFile[Send the file a visitor chose through the upload adapter of a published widget]" \
            "uploadsGet[List the account's uploads]" \
            "uploadsIdDelete[Delete an upload]" \
            "uploadsIdGet[Get an upload by id]" \
            "uploadsLimitsGet[Upload size limits and accepted file types]" \
            "uploadsPost[Upload a file]" \
            "validateCompositionContent[Validate Content]" \
            "validateToken[Validate current authentication token]" \
            "verifyPartnerDataDatabase[Check that a partner's own database still works]" \
            "verifyPartnerStorageDestination[Check that a partner's storage destination still works]"             "createPartnerExtraCreditsInvoice_0[Buy extra credits for a partner]" \
            "getMyPartners_0[Find the partner you administer]" \
            "getPartnerAdapterConnections_0[See which adapter keys a partner has connected]" \
            "getPartnerAnalyticsByManagedUser_0[What each managed user's widgets did]" \
            "getPartnerAnalyticsSummary_0[What was done with a partner's published widgets]" \
            "getPartnerAnalyticsTimeline_0[What was done with a partner's widgets, day by day]" \
            "getPartnerAnalyticsTopWidgets_0[Which widgets were viewed the most]" \
            "getPartnerBillingOverview_0[Get comprehensive partner billing overview]" \
            "getPartnerContract_0[Get a partner's contract]" \
            "getPartnerCreditBalance_0[Get partner credit balance]" \
            "getPartnerCreditTransactions_0[Get partner credit transaction history]" \
            "getPartnerDataDatabase_0[See the Neon database a partner keeps the data of its compositions in]" \
            "getPartnerDesignDefaults_0[Read partner-wide design defaults]" \
            "getPartnerEntryContextSigning_0[See how the context of your embeds is signed]" \
            "getPartnerNotificationSettings_0[Where your notifications go]" \
            "getPartnerStorageDestination_0[Get where a partner's uploaded files are stored]" \
            "getPartnerStorageUsage_0[What a partner's customers store]" \
            "listPartnerNotificationDeliveries_0[How your notifications reached you]" \
            "listPartnerNotifications_0[What your partner account was told]" \
            "listPartnerPresets_0[List the widgets a partner offers as presets]" \
            "removePartnerAdapterConnection_0[Remove an adapter key from a partner]" \
            "removePartnerDataDatabase_0[Stop keeping the data of a partner's compositions in its own database]" \
            "removePartnerPreset_0[Take a widget off the partner's presets]" \
            "removePartnerStorageDestination_0[Stop storing a partner's uploaded files in its own bucket]" \
            "replayPartnerNotificationDelivery_0[Send a webhook delivery again]" \
            "rotatePartnerEntryContextSecret_0[Make a secret to sign the context of your embeds]" \
            "rotatePartnerWebhookSecret_0[Make a new secret for your webhook]" \
            "sendPartnerNotificationTestEvent_0[Send a test event to your webhook]" \
            "setPartnerAdapterConnection_0[Connect an adapter key to a partner]" \
            "setPartnerDataDatabase_0[Keep the data of a partner's compositions in a Neon database of its own]" \
            "setPartnerDesignDefaults_0[Set or clear partner-wide design defaults]" \
            "setPartnerPreset_0[Make a widget a preset, or replace a preset]" \
            "setPartnerStorageDestination_0[Set where a partner's uploaded files are stored]" \
            "updatePartnerEntryContextSigning_0[Require a signed context, or stop requiring it]" \
            "updatePartnerNotificationSettings_0[Choose where your notifications go]" \
            "verifyPartnerDataDatabase_0[Check that a partner's own database still works]" \
            "verifyPartnerStorageDestination_0[Check that a partner's storage destination still works]"             "callPublicCompositionAdapter_0[Call a gateway operation of an adapter a published widget uses]" \
            "createPublicCompositionEntry_0[Append a visitor entry through the gateway]" \
            "getPublicCompositionEmbed_0[Resolve a composition UUID to a published widget URL]" \
            "getPublicCompositionIframe_0[Embed a published composition with its saved values]" \
            "postPublicCompositionEmbedStatus_0[Batch-check whether compositions are currently served for embed]" \
            "uploadPublicCompositionAdapterFile_0[Send the file a visitor chose through the upload adapter of a published widget]"             "validateToken_0[Validate current authentication token]"             "uploadsGet_0[List the account's uploads]" \
            "uploadsIdDelete_0[Delete an upload]" \
            "uploadsIdGet_0[Get an upload by id]" \
            "uploadsLimitsGet_0[Upload size limits and accepted file types]" \
            "uploadsPost_0[Upload a file]"             "addPersonalWorkspaceDomain_0[Allow a website to show your widgets]" \
            "createUserApiKey_0[Create an API key]" \
            "deletePersonalWorkspaceDomain_0[Stop allowing a website to show your widgets]" \
            "deleteUserApiKey_0[Delete an API key]" \
            "getPersonalWorkspaceDomains_0[List the websites allowed to show your widgets]" \
            "getUserAdapterConnections_0[See which adapter keys an account has connected]" \
            "getUserApiKeyUsageLogs_0[Read what an API key was used for]" \
            "getUserApiKeys_0[List the API keys of an account]" \
            "removeUserAdapterConnection_0[Remove an adapter key from an account]" \
            "setUserAdapterConnection_0[Connect an adapter key to an account]" \
            "updatePersonalWorkspaceDomain_0[Change a website on your list]" \
            "updateUserApiKey_0[Rename an API key, or switch it off or on]"             "createCompositionFromWidget_0[Create a composition for a widget in one call]" \
            "createWidget_0[Create Widget]" \
            "getWidgetsBatch_0[Get Widgets Batch]" \
            "getWidgets_0[List Widgets]" \

    _arguments "(--help)--help[Print information about operation]"

    ret=0
    ;;
  args)
    case $line[1] in
      createCanvas_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCanvas_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllCanvases_0)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction (e.g., \&quot;created_at:desc\&quot;)"
"createdAfter=:[QUERY] Filter canvases created after the specified date (ISO 8601 format)"
"createdBefore=:[QUERY] Filter canvases created before the specified date (ISO 8601 format)"
"updatedAfter=:[QUERY] Filter canvases updated after the specified date (ISO 8601 format)"
"updatedBefore=:[QUERY] Filter canvases updated before the specified date (ISO 8601 format)"
"managedUserId=:[QUERY] List only the canvases made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the canvases made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCanvas_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCanvas_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas to update"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addAiAnswersKnowledgeDocument_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) to add the document to"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      checkCompositionAccess_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionContentItem_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] List name from the content schema (&#39;contentItems&#39;) or &#39;items&#39;"
                    "If-Match\::[HEADER] Optional content version from ETag"
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionDatabaseRecord_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createComposition_0)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionContentItem_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] "
"itemId=:[PATH] "
                    "If-Match\::[HEADER] "
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionDataSource_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionDatabaseRecord_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to delete"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteComposition_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The ID of the composition to delete"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      describeCompositionEntries_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      duplicateComposition_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition to duplicate"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAiAnswersKnowledge_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) whose documents to list"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllCompositions_0)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] The order of the list, as &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39;, &#39;name&#39; or &#39;status&#39;
(the snake_case spelling, such as &#39;created_at&#39;, is read too). &#39;asc&#39; or &#39;desc&#39; alone orders by &#39;createdAt&#39;.
Default: &#39;createdAt:desc&#39;. Any other field is a 400."
"widgetId=:[QUERY] Filter compositions by widget ID"
"workspace=:[QUERY] Filter by workspace"
"projectFolder=:[QUERY] Only the compositions in this project (the project&#39;s id)."
"status=:[QUERY] Only the compositions in this status. Without it, every status is listed."
"managedUserId=:[QUERY] List only the compositions made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both. Send it as &#39;managedUserId&#39;; the snake_case spelling &#39;managed_user_id&#39; is refused with a 400, not ignored."
"managedUserExternalId=:[QUERY] List only the compositions made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionById_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionContentSchema_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionContent_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDataSource_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDatabaseRecord_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to retrieve"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDatabaseRecords_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDesignSchema_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDesign_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionEmbedSchema_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionEmbedSettings_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionPreview_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionVersions_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionsBatch_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchCompositionContentItem_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] "
"itemId=:[PATH] "
                    "If-Match\::[HEADER] "
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readCompositionEntries_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] The table to read, exactly as &#39;describeCompositionEntries&#39; lists it"
          "groupBy=:[QUERY] A column of the table to count entries per value of"
"rows=:[QUERY] How many of the newest entries to return (0 returns counts and tallies only)"
"aggregate=:[QUERY] The functions to compute, comma-separated, from &#39;count&#39;, &#39;avg&#39;, &#39;min&#39;, &#39;max&#39; and &#39;sum&#39; (for example
&#39;count,avg&#39;). Adds &#39;aggregates&#39; to the answer. Any other name answers 400 &#39;ENTRY_AGGREGATE_INVALID&#39;."
"column=:[QUERY] The numeric column &#39;avg&#39;, &#39;min&#39;, &#39;max&#39; and &#39;sum&#39; are computed over. Required by those four (400
&#39;ENTRY_COLUMN_NOT_NUMERIC&#39; when it is missing, or not a number column). Only with &#39;aggregate&#39;."
"since=:[QUERY] Only entries made at this time or later: &#39;since&#39; is INCLUSIVE (an entry made at exactly &#39;since&#39; is
returned). A date and time with an offset, such as &#39;2026-10-01T00:00:00Z&#39;; anything else answers 400
&#39;INVALID_SINCE&#39;. An entry with no time never matches, and a table with no time column answers 400
&#39;ENTRY_TABLE_HAS_NO_TIME&#39;."
"until=:[QUERY] Only entries made before this time: &#39;until&#39; is EXCLUSIVE (an entry made at exactly &#39;until&#39; is NOT
returned), so &#39;since&#x3D;A&amp;until&#x3D;B&#39; followed by &#39;since&#x3D;B&amp;until&#x3D;C&#39; counts every entry once. Same form and same
refusals as &#39;since&#39; (400 &#39;INVALID_UNTIL&#39;)."
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeAiAnswersKnowledgeDocument_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) the document is in"
"documentId=:[PATH] The document to remove"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setCompositionDataSource_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setDynamicContent_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "If-Match\::[HEADER] Optional content version from ETag (&#39;\&quot;3\&quot;&#39;, &#39;3&#39;, or &#39;*&#39;)"
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCompositionDatabaseRecord_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to update"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCompositionStatus_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateComposition_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      validateCompositionContent_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserCreditBalance_0)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose balance to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserCreditTransactions_0)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose ledger to read"
          "transactionType=:[QUERY] Only entries of this type, for instance &#39;debit&#39; for the credits spent. The types are listed on &#39;AccountCreditTransaction&#39;."
"limit=:[QUERY] Maximum number of entries to return"
"offset=:[QUERY] Number of entries to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserEntitlements_0)
        local -a _op_arguments
        _op_arguments=(
          "managedUserId=:[PATH] Managed user ID"
          "includeExpired=true:[QUERY] Include expired entitlements in results"
          "includeExpired=false:[QUERY] Include expired entitlements in results"
"feature=:[QUERY] Filter by specific feature"
"source=:[QUERY] Filter by entitlement source"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerEntitlements_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
          "includeExpired=true:[QUERY] Include expired entitlements in results"
          "includeExpired=false:[QUERY] Include expired entitlements in results"
"feature=:[QUERY] Filter by specific feature"
"source=:[QUERY] Filter by entitlement source"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoicesByPartnerId_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose invoices to list"
          "status=:[QUERY] Only invoices with this status"
"limit=:[QUERY] Maximum number of invoices to return"
"offset=:[QUERY] Number of invoices to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      copyPresetForManagedUser_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user to give the copy to (Widgetic&#39;s id for the user)"
"key=:[PATH] The key of the preset to copy"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionFromPreset_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"key=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createManagedUserEditorSession_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user the session is for (Widgetic&#39;s id for the user)"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createManagedUser_0)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteManagedUser_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to delete"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllManagedUsers_0)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction, &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39; or &#39;externalId&#39; (the snake_case spellings &#39;created_at&#39;, &#39;updated_at&#39; and &#39;external_id&#39; work too); &#39;asc&#39; or &#39;desc&#39; alone sorts by &#39;createdAt&#39;. Any other field is a 400."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserById_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to retrieve"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserDesignDefaults_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserLimits_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserStorageUsage_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserUsage_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user whose usage you want (Widgetic&#39;s id for the user)"
          "startDate=:[QUERY] Start of the period, included: an ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset (&#39;2026-10-01T08:00:00Z&#39;). Default: 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default: now. It must be after &#39;startDate&#39;, by at most 366 days."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUsersByManagerId_0)
        local -a _op_arguments
        _op_arguments=(
          "managerId=:[PATH] ID of the manager"
          "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction, &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39; or &#39;externalId&#39; (the snake_case spellings &#39;created_at&#39;, &#39;updated_at&#39; and &#39;external_id&#39; work too); &#39;asc&#39; or &#39;desc&#39; alone sorts by &#39;createdAt&#39;. Any other field is a 400."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      revokeManagedUserEditorSession_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user the session is for"
"sessionId=:[PATH] The &#39;sessionId&#39; of the session, from &#39;createManagedUserEditorSession&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      revokeManagedUserEditorSessions_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user whose sessions end"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setManagedUserDesignDefaults_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setManagedUserLimits_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateManagedUser_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to update"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      operationsIdGet_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Operation identifier returned when the job was created."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addAiAnswersKnowledgeDocument)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) to add the document to"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addPersonalWorkspaceDomain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      callPublicCompositionAdapter)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"adapterId=:[PATH] The id of the adapter, the name its module is known by, for example &#39;upload&#39;."
"operation=:[PATH] The name of one operation of the adapter, as its documentation gives it."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      checkCompositionAccess)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      copyPresetForManagedUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user to give the copy to (Widgetic&#39;s id for the user)"
"key=:[PATH] The key of the preset to copy"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCanvas)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createComposition)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionContentItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] List name from the content schema (&#39;contentItems&#39;) or &#39;items&#39;"
                    "If-Match\::[HEADER] Optional content version from ETag"
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionDatabaseRecord)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionFromPreset)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"key=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionFromWidget)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget id"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createManagedUser)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createManagedUserEditorSession)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user the session is for (Widgetic&#39;s id for the user)"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPartnerExtraCreditsInvoice)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    "Idempotency-Key\::[HEADER] A key of your own for this purchase, so that a retry cannot make a second invoice"
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPublicCompositionEntry)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"table=:[PATH] "
                    "X-Widgetic-Write-Token\::[HEADER] Signed per-composition write token handed to the widget in &#39;widgetic:host&#39; as &#39;entries.writeToken&#39; (and returned by &#39;GET /embed/compositions/{compositionId}&#39; as &#39;entryWriteToken&#39;). Required when the request comes from the shared Widgetic artifact origin; verified whenever present."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createUserApiKey)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key is for. For your own, your own user id"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createWidget)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] A unique value (a UUID is fine) that makes a retry of this request safe."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCanvas)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteComposition)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The ID of the composition to delete"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionContentItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] "
"itemId=:[PATH] "
                    "If-Match\::[HEADER] "
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionDataSource)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionDatabaseRecord)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to delete"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteCompositionEntryItems)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"table=:[PATH] "
          "ids=:[QUERY] "
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteManagedUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to delete"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePersonalWorkspaceDomain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
"domainId=:[PATH] The &#39;id&#39; of the entry, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteUserApiKey)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      describeCompositionEntries)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      duplicateComposition)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition to duplicate"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      exportCompositionEntryItems)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"table=:[PATH] "
          "format=:[QUERY] "
"order=:[QUERY] &#39;desc&#39; (the default) lists the newest entry first, &#39;asc&#39; the oldest. Entries are sorted by their time, then
by their id (compared as text, byte by byte) in the same direction, so the order of two entries made at the
same instant is always the same; an entry with no time counts as the oldest. A table with no time column is
sorted by its id. The managed-user feed sorts by time, then by composition id, table and id."
"since=:[QUERY] Only entries made at this time or later: &#39;since&#39; is INCLUSIVE (an entry made at exactly &#39;since&#39; is
returned). A date and time with an offset, such as &#39;2026-10-01T00:00:00Z&#39;; anything else answers 400
&#39;INVALID_SINCE&#39;. An entry with no time never matches, and a table with no time column answers 400
&#39;ENTRY_TABLE_HAS_NO_TIME&#39;."
"until=:[QUERY] Only entries made before this time: &#39;until&#39; is EXCLUSIVE (an entry made at exactly &#39;until&#39; is NOT
returned), so &#39;since&#x3D;A&amp;until&#x3D;B&#39; followed by &#39;since&#x3D;B&amp;until&#x3D;C&#39; counts every entry once. Same form and same
refusals as &#39;since&#39; (400 &#39;INVALID_UNTIL&#39;)."
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAiAnswersKnowledge)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) whose documents to list"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllCanvases)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction (e.g., \&quot;created_at:desc\&quot;)"
"createdAfter=:[QUERY] Filter canvases created after the specified date (ISO 8601 format)"
"createdBefore=:[QUERY] Filter canvases created before the specified date (ISO 8601 format)"
"updatedAfter=:[QUERY] Filter canvases updated after the specified date (ISO 8601 format)"
"updatedBefore=:[QUERY] Filter canvases updated before the specified date (ISO 8601 format)"
"managedUserId=:[QUERY] List only the canvases made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the canvases made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllCompositions)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] The order of the list, as &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39;, &#39;name&#39; or &#39;status&#39;
(the snake_case spelling, such as &#39;created_at&#39;, is read too). &#39;asc&#39; or &#39;desc&#39; alone orders by &#39;createdAt&#39;.
Default: &#39;createdAt:desc&#39;. Any other field is a 400."
"widgetId=:[QUERY] Filter compositions by widget ID"
"workspace=:[QUERY] Filter by workspace"
"projectFolder=:[QUERY] Only the compositions in this project (the project&#39;s id)."
"status=:[QUERY] Only the compositions in this status. Without it, every status is listed."
"managedUserId=:[QUERY] List only the compositions made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both. Send it as &#39;managedUserId&#39;; the snake_case spelling &#39;managed_user_id&#39; is refused with a 400, not ignored."
"managedUserExternalId=:[QUERY] List only the compositions made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getAllManagedUsers)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction, &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39; or &#39;externalId&#39; (the snake_case spellings &#39;created_at&#39;, &#39;updated_at&#39; and &#39;external_id&#39; work too); &#39;asc&#39; or &#39;desc&#39; alone sorts by &#39;createdAt&#39;. Any other field is a 400."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCanvas)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionById)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionContentSchema)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDataSource)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDatabaseRecord)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to retrieve"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDatabaseRecords)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDesign)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionDesignSchema)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionEmbedSchema)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionEmbedSettings)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionPreview)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionVersions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getCompositionsBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getInvoicesByPartnerId)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose invoices to list"
          "status=:[QUERY] Only invoices with this status"
"limit=:[QUERY] Maximum number of invoices to return"
"offset=:[QUERY] Number of invoices to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserById)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to retrieve"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserDesignDefaults)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserEntitlements)
        local -a _op_arguments
        _op_arguments=(
          "managedUserId=:[PATH] Managed user ID"
          "includeExpired=true:[QUERY] Include expired entitlements in results"
          "includeExpired=false:[QUERY] Include expired entitlements in results"
"feature=:[QUERY] Filter by specific feature"
"source=:[QUERY] Filter by entitlement source"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserLimits)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserStorageUsage)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUserUsage)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user whose usage you want (Widgetic&#39;s id for the user)"
          "startDate=:[QUERY] Start of the period, included: an ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset (&#39;2026-10-01T08:00:00Z&#39;). Default: 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default: now. It must be after &#39;startDate&#39;, by at most 366 days."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getManagedUsersByManagerId)
        local -a _op_arguments
        _op_arguments=(
          "managerId=:[PATH] ID of the manager"
          "page=:[QUERY] Page number for pagination"
"size=:[QUERY] Number of items per page"
"sort=:[QUERY] Sort field and direction, &#39;&lt;field&gt;:&lt;asc|desc&gt;&#39;. The field is &#39;createdAt&#39;, &#39;updatedAt&#39; or &#39;externalId&#39; (the snake_case spellings &#39;created_at&#39;, &#39;updated_at&#39; and &#39;external_id&#39; work too); &#39;asc&#39; or &#39;desc&#39; alone sorts by &#39;createdAt&#39;. Any other field is a 400."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMyPartners)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAdapterConnections)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose adapter keys to list"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsByManagedUser)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose managed users to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"limit=:[QUERY] How many managed users to list at most"
"offset=:[QUERY] How many managed users to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsSummary)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset (&#39;2026-10-01T08:00:00Z&#39;). Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. It must be after &#39;startDate&#39;, by at most 366 days."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsTimeline)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39;. Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsTopWidgets)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39;. Send this or &#39;managedUserId&#39;, not both."
"limit=:[QUERY] How many widgets to list at most"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerBillingOverview)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerContract)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose contract to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerCreditBalance)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerCreditTransactions)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
          "limit=:[QUERY] Number of transactions to return"
"offset=:[QUERY] Number of transactions to skip"
"type=:[QUERY] Only entries of this type, for instance &#39;debit&#39; for the credits spent. The types are listed on &#39;AccountCreditTransaction&#39;."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerDataDatabase)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerDesignDefaults)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerEntitlements)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
          "includeExpired=true:[QUERY] Include expired entitlements in results"
          "includeExpired=false:[QUERY] Include expired entitlements in results"
"feature=:[QUERY] Filter by specific feature"
"source=:[QUERY] Filter by entitlement source"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerEntryContextSigning)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose context signing to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerNotificationSettings)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notification settings to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerStorageDestination)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerStorageUsage)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage to report on"
          "limit=:[QUERY] How many managed users to list at most"
"offset=:[QUERY] How many managed users to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPersonalWorkspaceDomains)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPublicCompositionEmbed)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPublicCompositionIframe)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserAdapterConnections)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose adapter keys to list. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserApiKeyUsageLogs)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
          "limit=:[QUERY] How many calls to return, newest first"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserApiKeys)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the keys belong to. For your own keys, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserCreditBalance)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose balance to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserCreditTransactions)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose ledger to read"
          "transactionType=:[QUERY] Only entries of this type, for instance &#39;debit&#39; for the credits spent. The types are listed on &#39;AccountCreditTransaction&#39;."
"limit=:[QUERY] Maximum number of entries to return"
"offset=:[QUERY] Number of entries to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWidgets)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page to return, counting from 1. Giving &#39;page&#39; or &#39;size&#39; turns paging on."
"size=:[QUERY] How many widgets a page holds (20 when &#39;page&#39; is given without it). Giving &#39;page&#39; or &#39;size&#39; turns paging on."
"canvasId=:[QUERY] List only the widgets on this canvas. The list is returned whole."
"managedUserId=:[QUERY] List only the widgets made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the widgets made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWidgetsBatch)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listCompositionEntryItems)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"table=:[PATH] "
          "limit=:[QUERY] "
"order=:[QUERY] &#39;desc&#39; (the default) lists the newest entry first, &#39;asc&#39; the oldest. Entries are sorted by their time, then
by their id (compared as text, byte by byte) in the same direction, so the order of two entries made at the
same instant is always the same; an entry with no time counts as the oldest. A table with no time column is
sorted by its id. The managed-user feed sorts by time, then by composition id, table and id."
"since=:[QUERY] Only entries made at this time or later: &#39;since&#39; is INCLUSIVE (an entry made at exactly &#39;since&#39; is
returned). A date and time with an offset, such as &#39;2026-10-01T00:00:00Z&#39;; anything else answers 400
&#39;INVALID_SINCE&#39;. An entry with no time never matches, and a table with no time column answers 400
&#39;ENTRY_TABLE_HAS_NO_TIME&#39;."
"until=:[QUERY] Only entries made before this time: &#39;until&#39; is EXCLUSIVE (an entry made at exactly &#39;until&#39; is NOT
returned), so &#39;since&#x3D;A&amp;until&#x3D;B&#39; followed by &#39;since&#x3D;B&amp;until&#x3D;C&#39; counts every entry once. Same form and same
refusals as &#39;since&#39; (400 &#39;INVALID_UNTIL&#39;)."
"cursor=:[QUERY] "
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listManagedUserEntries)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
          "compositionId=:[QUERY] "
"table=:[QUERY] "
"limit=:[QUERY] "
"order=:[QUERY] &#39;desc&#39; (the default) lists the newest entry first, &#39;asc&#39; the oldest. Entries are sorted by their time, then
by their id (compared as text, byte by byte) in the same direction, so the order of two entries made at the
same instant is always the same; an entry with no time counts as the oldest. A table with no time column is
sorted by its id. The managed-user feed sorts by time, then by composition id, table and id."
"since=:[QUERY] Only entries made at this time or later: &#39;since&#39; is INCLUSIVE (an entry made at exactly &#39;since&#39; is
returned). A date and time with an offset, such as &#39;2026-10-01T00:00:00Z&#39;; anything else answers 400
&#39;INVALID_SINCE&#39;. An entry with no time never matches, and a table with no time column answers 400
&#39;ENTRY_TABLE_HAS_NO_TIME&#39;."
"until=:[QUERY] Only entries made before this time: &#39;until&#39; is EXCLUSIVE (an entry made at exactly &#39;until&#39; is NOT
returned), so &#39;since&#x3D;A&amp;until&#x3D;B&#39; followed by &#39;since&#x3D;B&amp;until&#x3D;C&#39; counts every entry once. Same form and same
refusals as &#39;since&#39; (400 &#39;INVALID_UNTIL&#39;)."
"cursor=:[QUERY] "
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerNotificationDeliveries)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose deliveries to list"
          "limit=:[QUERY] How many deliveries to list at most"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerNotifications)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notifications to list"
          "limit=:[QUERY] How many notifications to list at most"
"before=:[QUERY] Only the notifications made before this moment. Give the &#39;nextBefore&#39; of the previous page."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerPresets)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose presets to list"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      operationsIdGet)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Operation identifier returned when the job was created."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      patchCompositionContentItem)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
"list=:[PATH] "
"itemId=:[PATH] "
                    "If-Match\::[HEADER] "
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postPublicCompositionEmbedStatus)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      readCompositionEntries)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] The table to read, exactly as &#39;describeCompositionEntries&#39; lists it"
          "groupBy=:[QUERY] A column of the table to count entries per value of"
"rows=:[QUERY] How many of the newest entries to return (0 returns counts and tallies only)"
"aggregate=:[QUERY] The functions to compute, comma-separated, from &#39;count&#39;, &#39;avg&#39;, &#39;min&#39;, &#39;max&#39; and &#39;sum&#39; (for example
&#39;count,avg&#39;). Adds &#39;aggregates&#39; to the answer. Any other name answers 400 &#39;ENTRY_AGGREGATE_INVALID&#39;."
"column=:[QUERY] The numeric column &#39;avg&#39;, &#39;min&#39;, &#39;max&#39; and &#39;sum&#39; are computed over. Required by those four (400
&#39;ENTRY_COLUMN_NOT_NUMERIC&#39; when it is missing, or not a number column). Only with &#39;aggregate&#39;."
"since=:[QUERY] Only entries made at this time or later: &#39;since&#39; is INCLUSIVE (an entry made at exactly &#39;since&#39; is
returned). A date and time with an offset, such as &#39;2026-10-01T00:00:00Z&#39;; anything else answers 400
&#39;INVALID_SINCE&#39;. An entry with no time never matches, and a table with no time column answers 400
&#39;ENTRY_TABLE_HAS_NO_TIME&#39;."
"until=:[QUERY] Only entries made before this time: &#39;until&#39; is EXCLUSIVE (an entry made at exactly &#39;until&#39; is NOT
returned), so &#39;since&#x3D;A&amp;until&#x3D;B&#39; followed by &#39;since&#x3D;B&amp;until&#x3D;C&#39; counts every entry once. Same form and same
refusals as &#39;since&#39; (400 &#39;INVALID_UNTIL&#39;)."
"context=:[QUERY] Host context filters as &#39;context[key]&#x3D;value&#39; (max 5 keys, counting dotted &#39;context.key&#39; too). Use &#39;column.&lt;name&gt;&#x3D;value&#39; for columns whose names collide with reserved parameters."
"filter=:[QUERY] Column filters as &#39;filter[columnName]&#x3D;value&#39; (same meaning as bare &#39;columnName&#x3D;value&#39; or &#39;column.columnName&#x3D;value&#39;; max 10 column filters counting all spellings). A plain &#39;filter&#x3D;value&#39; still filters a column named &#39;filter&#39;."
          "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeAiAnswersKnowledgeDocument)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget (composition) the document is in"
"documentId=:[PATH] The document to remove"
                    "X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerAdapterConnection)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner that keeps the key"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerDataDatabase)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerPreset)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose preset to remove"
"key=:[PATH] The key of the preset to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerStorageDestination)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeUserAdapterConnection)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account that keeps the key. For your own, your own user id"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      replayPartnerNotificationDelivery)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose delivery to replay"
"deliveryId=:[PATH] The delivery to send again (must be a webhook delivery of this partner)"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      revokeManagedUserEditorSession)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user the session is for"
"sessionId=:[PATH] The &#39;sessionId&#39; of the session, from &#39;createManagedUserEditorSession&#39;"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      revokeManagedUserEditorSessions)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The managed user whose sessions end"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      rotatePartnerEntryContextSecret)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose secret to make"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      rotatePartnerWebhookSecret)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose webhook secret to replace"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendPartnerNotificationTestEvent)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose webhook to try"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setCompositionDataSource)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setDynamicContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "If-Match\::[HEADER] Optional content version from ETag (&#39;\&quot;3\&quot;&#39;, &#39;3&#39;, or &#39;*&#39;)"
"Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setManagedUserDesignDefaults)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setManagedUserLimits)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerAdapterConnection)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner that keeps the key"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerDataDatabase)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to set"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerDesignDefaults)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerPreset)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose preset to set"
"key=:[PATH] The name your code uses for the preset"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerStorageDestination)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to set"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setUserAdapterConnection)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account that keeps the key. For your own, your own user id"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCanvas)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the canvas to update"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateComposition)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCompositionDatabaseRecord)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
"table=:[PATH] Name of the database table"
"recordId=:[PATH] ID of the record to update"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateCompositionStatus)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] Composition ID"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateManagedUser)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the managed user to update"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePartnerEntryContextSigning)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose context signing to change"
                    "Idempotency-Key\::[HEADER] Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePartnerNotificationSettings)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notification settings to change"
                    "Idempotency-Key\::[HEADER] Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePersonalWorkspaceDomain)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
"domainId=:[PATH] The &#39;id&#39; of the entry, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserApiKey)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadPublicCompositionAdapterFile)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"ticket=:[PATH] The ticket the &#39;begin-upload&#39; operation answered with."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsGet)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] Maximum number of files to return"
"managedUserId=:[QUERY] List only the files uploaded for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the files uploaded for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsIdDelete)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsIdGet)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The upload to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsLimitsGet)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsPost)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      validateCompositionContent)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] ID of the composition"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
"X-Managed-User-Id\::[HEADER] The id Widgetic gave the managed user (&#39;POST /managed-users&#39;). Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
"X-Managed-User-External-Id\::[HEADER] Your own id for the managed user (its &#39;externalId&#39;), when you do not keep Widgetic&#39;s. Makes this call for one of your managed users, so that a mistake in your own code cannot reach another customer&#39;s work. Send this header, or the other one, never both. Left out, the call works on your whole account, as it always has. With it, the call reaches only that user&#39;s compositions: a list shows only theirs, a composition the call makes is filed under them, and a composition of another user, or one that does not exist, answers &#39;404&#39; (the same answer, so the call cannot be used to find out what another customer has). A managed user that is not yours answers &#39;404&#39; with &#39;MANAGED_USER_NOT_FOUND&#39;. An empty, repeated or malformed header is &#39;400&#39; with &#39;MANAGED_USER_SCOPE_INVALID&#39;; an empty header is never read as no header. A call that is about the whole account, such as the list of your managed users, is refused with &#39;403&#39; and &#39;MANAGED_USER_SCOPE_ROUTE_NOT_AVAILABLE&#39;: send it without the header. Only your API key can send it. The header is a limit the call asks for: whoever holds the key can leave it out, so for a credential that a customer&#39;s browser holds, use an editor session. An &#39;Idempotency-Key&#39; is kept apart for each managed user."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      validateToken)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      verifyPartnerDataDatabase)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to check"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      verifyPartnerStorageDestination)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to check"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPartnerExtraCreditsInvoice_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    "Idempotency-Key\::[HEADER] A key of your own for this purchase, so that a retry cannot make a second invoice"
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getMyPartners_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAdapterConnections_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose adapter keys to list"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsByManagedUser_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose managed users to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"limit=:[QUERY] How many managed users to list at most"
"offset=:[QUERY] How many managed users to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsSummary_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset (&#39;2026-10-01T08:00:00Z&#39;). Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. It must be after &#39;startDate&#39;, by at most 366 days."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsTimeline_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39;. Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerAnalyticsTopWidgets_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose widgets to report on"
          "startDate=:[QUERY] Start of the period, included. An ISO 8601 date (&#39;2026-10-01&#39;) or date-time with its offset. Default 30 days before &#39;endDate&#39;."
"endDate=:[QUERY] End of the period, not included, in the same forms. Default now. At most 366 days after &#39;startDate&#39;."
"managedUserId=:[QUERY] Report only on this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] Report only on the managed user you registered with this &#39;externalId&#39;. Send this or &#39;managedUserId&#39;, not both."
"limit=:[QUERY] How many widgets to list at most"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerBillingOverview_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerContract_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose contract to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerCreditBalance_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerCreditTransactions_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] Partner ID"
          "limit=:[QUERY] Number of transactions to return"
"offset=:[QUERY] Number of transactions to skip"
"type=:[QUERY] Only entries of this type, for instance &#39;debit&#39; for the credits spent. The types are listed on &#39;AccountCreditTransaction&#39;."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerDataDatabase_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerDesignDefaults_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerEntryContextSigning_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose context signing to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerNotificationSettings_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notification settings to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerStorageDestination_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPartnerStorageUsage_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage to report on"
          "limit=:[QUERY] How many managed users to list at most"
"offset=:[QUERY] How many managed users to skip"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerNotificationDeliveries_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose deliveries to list"
          "limit=:[QUERY] How many deliveries to list at most"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerNotifications_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notifications to list"
          "limit=:[QUERY] How many notifications to list at most"
"before=:[QUERY] Only the notifications made before this moment. Give the &#39;nextBefore&#39; of the previous page."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      listPartnerPresets_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose presets to list"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerAdapterConnection_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner that keeps the key"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerDataDatabase_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerPreset_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose preset to remove"
"key=:[PATH] The key of the preset to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removePartnerStorageDestination_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to remove"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      replayPartnerNotificationDelivery_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose delivery to replay"
"deliveryId=:[PATH] The delivery to send again (must be a webhook delivery of this partner)"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      rotatePartnerEntryContextSecret_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose secret to make"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      rotatePartnerWebhookSecret_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose webhook secret to replace"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      sendPartnerNotificationTestEvent_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose webhook to try"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerAdapterConnection_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner that keeps the key"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerDataDatabase_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to set"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerDesignDefaults_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerPreset_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose preset to set"
"key=:[PATH] The name your code uses for the preset"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setPartnerStorageDestination_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to set"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePartnerEntryContextSigning_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose context signing to change"
                    "Idempotency-Key\::[HEADER] Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePartnerNotificationSettings_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose notification settings to change"
                    "Idempotency-Key\::[HEADER] Optional: without it the call is carried out every time it is sent. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      verifyPartnerDataDatabase_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose database to check"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      verifyPartnerStorageDestination_0)
        local -a _op_arguments
        _op_arguments=(
          "partnerId=:[PATH] The partner whose storage destination to check"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      callPublicCompositionAdapter_0)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"adapterId=:[PATH] The id of the adapter, the name its module is known by, for example &#39;upload&#39;."
"operation=:[PATH] The name of one operation of the adapter, as its documentation gives it."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createPublicCompositionEntry_0)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"table=:[PATH] "
                    "X-Widgetic-Write-Token\::[HEADER] Signed per-composition write token handed to the widget in &#39;widgetic:host&#39; as &#39;entries.writeToken&#39; (and returned by &#39;GET /embed/compositions/{compositionId}&#39; as &#39;entryWriteToken&#39;). Required when the request comes from the shared Widgetic artifact origin; verified whenever present."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPublicCompositionEmbed_0)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPublicCompositionIframe_0)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      postPublicCompositionEmbedStatus_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadPublicCompositionAdapterFile_0)
        local -a _op_arguments
        _op_arguments=(
          "compositionId=:[PATH] "
"ticket=:[PATH] The ticket the &#39;begin-upload&#39; operation answered with."
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      validateToken_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsGet_0)
        local -a _op_arguments
        _op_arguments=(
                    "limit=:[QUERY] Maximum number of files to return"
"managedUserId=:[QUERY] List only the files uploaded for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the files uploaded for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsIdDelete_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] "
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsIdGet_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The upload to read"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsLimitsGet_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      uploadsPost_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      addPersonalWorkspaceDomain_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createUserApiKey_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key is for. For your own, your own user id"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deletePersonalWorkspaceDomain_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
"domainId=:[PATH] The &#39;id&#39; of the entry, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      deleteUserApiKey_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getPersonalWorkspaceDomains_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserAdapterConnections_0)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account whose adapter keys to list. For your own, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserApiKeyUsageLogs_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
          "limit=:[QUERY] How many calls to return, newest first"
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getUserApiKeys_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the keys belong to. For your own keys, your own user id"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      removeUserAdapterConnection_0)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account that keeps the key. For your own, your own user id"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      setUserAdapterConnection_0)
        local -a _op_arguments
        _op_arguments=(
          "userId=:[PATH] The account that keeps the key. For your own, your own user id"
"adapterId=:[PATH] The adapter the key is for"
"credentialKey=:[PATH] The key&#39;s name within the adapter"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updatePersonalWorkspaceDomain_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the list belongs to. For your own, your own user id"
"domainId=:[PATH] The &#39;id&#39; of the entry, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      updateUserApiKey_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The account the key belongs to"
"keyId=:[PATH] The &#39;keyId&#39; of the key, as the list shows it"
                    )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createCompositionFromWidget_0)
        local -a _op_arguments
        _op_arguments=(
          "id=:[PATH] The widget id"
                    "Idempotency-Key\::[HEADER] Required: a call without it is refused with &#39;400&#39;. A key of your own that names this one request; a UUID is ideal. It is 8 to 50 characters of letters, digits, &#39;-&#39; and &#39;_&#39;. Send the same key again when you retry (after a timeout, a dropped connection or a &#39;5xx&#39;) and the call is carried out once: the retry gets the first answer back, marked &#39;X-Idempotency-Cached: true&#39;. The same key with a different body is refused with &#39;422&#39;, and a retry that arrives while the first call is still running with &#39;409&#39; (see &#39;Retry-After&#39;)."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      createWidget_0)
        local -a _op_arguments
        _op_arguments=(
                              "Idempotency-Key\::[HEADER] A unique value (a UUID is fine) that makes a retry of this request safe."
)
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWidgetsBatch_0)
        local -a _op_arguments
        _op_arguments=(
                              )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
      getWidgets_0)
        local -a _op_arguments
        _op_arguments=(
                    "page=:[QUERY] Page to return, counting from 1. Giving &#39;page&#39; or &#39;size&#39; turns paging on."
"size=:[QUERY] How many widgets a page holds (20 when &#39;page&#39; is given without it). Giving &#39;page&#39; or &#39;size&#39; turns paging on."
"canvasId=:[QUERY] List only the widgets on this canvas. The list is returned whole."
"managedUserId=:[QUERY] List only the widgets made for this managed user (Widgetic&#39;s id for the user). Send this or &#39;managedUserExternalId&#39;, not both."
"managedUserExternalId=:[QUERY] List only the widgets made for the managed user you registered with this &#39;externalId&#39; (your own identifier for the user). Send this or &#39;managedUserId&#39;, not both."
          )
        _describe -t actions 'operations' _op_arguments -S '' && ret=0
        ;;
    esac
    ;;

esac

return ret
