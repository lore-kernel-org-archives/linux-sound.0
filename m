Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC27404BE6
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499162; cv=fail; b=cBXFxyqwE8W3ZWn58nriK4FKFO9L462ZRDZE3bolLejQXC2J6daKCjxnxg68UaaugB3cj+7M2VcuoGQKTP+u+/qDk0l+PfNFADvUmPfgQPf1QVqthpfWvH04Y2W05YPNH0rNb061cDiV3jugYDwW2FlFOrHfZvJN5MT1Lpu63n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499162; c=relaxed/simple;
	bh=Ily7NaOJQW7wfpfqdMiPu93bKJdJgXN5Aq8BdmLISG8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a+flsRK+iiCZf6IClg4vvO9w/b8vzzo7P55ENbvYg4mDqTC484HN90mTDB1IdKvP1VDdrk4CwxZBug0eLVgdCps4OFtkdrk0UVoZ266+XvoClxmgJHb/J5f8mEZ5QiV1r8GQ4ipGgCYcdAvRg1aK/vORUDkD1JvfKP2IFh9PzWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MPBcTddy; arc=fail smtp.client-ip=40.93.196.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MPBcTddy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=at571E2sf6uqULu+vOosn6VcayPIwZbNv3yjCs8+oLLdkci9tpNSmyMKDlA2q61QNEsxmGOQ7xnPZbzf4RjRSGWUEF3LHkfRHawEM3lkOhW57QOjXHKNIyCMBW0+BFyZKRrwv57PE1LdBk0kYbuAZuG3fVhXzZ4kIBEd+eJVSjrUsCpzg9IkZUSgl11otBE8TxC0T6mmME4NUBaasP7tdOKkkUH4UBYqIjihMDro8fwwcBwMagEIxqsssGWmZmgAzQ6KzqbxUfQMVNBwJqWpIwReh6jUJ8IgzxO5kA6USE04IT18qH96uH6KlEpmh/ua2DIFn9CHkKqLmaad98N47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnsrlC3FZctSKlfFwuQAl5qlF8W3d0HJ9D+23dWsDDQ=;
 b=R0N2CI9FaTe1Ebj3lQlP9oKCjZZitL8mJu/8bWAIfjRjteyw9hvPmD/efk23+PoLMq6X0QoYMuMnnplLJaunrsCA0dgCDmncaeZLskg6CCkBpb58DJfszXpNUhvedUKOqx7S17M24PnGeHOm6eyA8Xf0mKvGidt4MEzJTK+upeYmiveSYB024D0v7uIqfbQ1m5RfQus9X+jK1/ZU7RxiVvBw9PGueZ6wlDh9if4qThoE4fn8b7hZXcWI2gbYHnwKkX0jOKnEld1whTWeZeQfiqQGLtDjdVCXrJwGXlt3ch6RyLK68HpGA2H3TQqhCV1uwBQDomuo7vels2T6QrLbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnsrlC3FZctSKlfFwuQAl5qlF8W3d0HJ9D+23dWsDDQ=;
 b=MPBcTddyStkdf7kez1Tvu2fk0QEXO4NpWcldgAtTwU+U7L3TRG7FIWYS0vuldWxSnPhZXbZgtQFbsld33/7SSuiB5dxiKdn930PXlIbFoIFF4AW7sPcfioQqIgTwoZmL/LWamENaV2VyjciAcsFGAyntSviZWgkx3beFt7wA6Ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Wed, 8 Jul 2026 08:25:55 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:25:55 +0000
Message-ID: <d328dc05-2da6-4a80-b9ad-2ab3e6554e09@amd.com>
Date: Wed, 8 Jul 2026 13:55:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp6x-mach: tidyup strange alignment
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: linux-sound@vger.kernel.org
References: <874iiageo4.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <874iiageo4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::32) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 862e16ab-2dcb-453e-1972-08dedcca879f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uEwNBRgTv/wBIN8GRxIhet5Uv4RzE7DOewUVBxr4mneaOs8jcv6qIDvTDB32XmKNi4WWF7JITt7nP6TESJqgCCsrKlLfl0ZWcwis3zqvmnh5WrcMEDyT+4FkUekajny1BahumN+RIzNRCJn6Dlb7U7xAyEWZQIKCPokop0ODGPD4Wb7EcWi0Jn7Ut5iSvjp3l6K2lmkD9fJwIucqVRML2o6GRHcpDJGzzufezxp7ErjLNEhIeBnvt701vUeHc5KOH+q28lOdOXttPIpCDZyLKnwYypBIQLQpavFZfQrzSHDzOnSZzPo+FKYh5X8aK7cbHLTLnbWWBakrdz3AuNSALY2ZXAOa2zXVQDs8TQAPQMhOW4zwBo4U6tkUUB65OqWOr/Tko6S1Iw4z97V21wX4Da85fJ2WM3FjXaFUlXzHI2KzN/aUKpgxlQR8KZMvsDQcxblsxIEZwwg9j7KShVPUDEB7KEwRLLVduIfKNoL4J7ztr8Bt0/goa8z/qlviS6L+1B8QGRc2XSOlhzdZg6ebDzO/BVPO1tQxNBokDaAmqneik5F9NcS+cEg66fB4xEgOcTdjLzSpYZIVne+PpizX5FMP+ym98czQClho+dgEGk0Jxp0wbU4UueU9UAYRsFFPfgnu6b38aBQ6yw9W9zSqSXgQMPqC4xbndo8w8eDKqnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG52TnBybzZycjh5L1JtZTBWWTJ2a2FRVy9vWUVFT0RHd0Z4UlRkZ256Sktk?=
 =?utf-8?B?VlUwekZuMGxIOWx4TUhqclZWY01iMDRsWDFJWk95OHZsUmluSlBlaUoyQTNj?=
 =?utf-8?B?YUhIYmtPYWVxQjlBSmxSd2gyMmpudm45OEIzOUptL0xEaUZ6eUdEa3V1L2dJ?=
 =?utf-8?B?Vk80UXJSbDlKMDVMOGJPbGVNOUdqUWg1WXhEKzYxYTVPMmtLbWE1a1ZtT0JX?=
 =?utf-8?B?aHF5aHg0Sk9RaStUdWRXc3Y3ekt4TFBuUnRpZHA2VjJWc3ZXSjBsY3d0MExv?=
 =?utf-8?B?ME5LTnJ0bzlibFUwMUR3b3FaN0xTUEs2RXlVS3N1eDlCRm1ITFJZaDFVOUNZ?=
 =?utf-8?B?M3F4MGpyZ0NTZmlFWHNCUUlZcXMydW83RUpXT0JqVWRETFZWRTdIa2Q4ZUJJ?=
 =?utf-8?B?cGpNWUpZeHVHdlp1Vm5xTUQ4SStOT3k5Y3RKK1BhL3FIaVYxdWw2Nis2b0JN?=
 =?utf-8?B?Zk95NUxJVm02UFg0MXdrY0N3dUFhUDhLS1UxRldmTTJBVUFwNWhTZjJESU9P?=
 =?utf-8?B?b2lHRnRIOHIvQXhUaUJkbG9tZTNkNElnRE9IL1ZsN09zQ2drYlRCTFIyK2gx?=
 =?utf-8?B?cWsxalFvWmlUVUlod3FvZjByL1lmUXZ0bU1xWDRmU3NPMnNENjVXMDRRenRG?=
 =?utf-8?B?aEE3YW5tVVgvdUFuaWYxVWp0OG14OE9VQ05rV3diSkppV0FWdWRXOWdXQ21I?=
 =?utf-8?B?LzhVSDl3SUZLMEJRa1pBZlZHVmUzbnNJc0Q2WXdUbGN4QkdmK0RPRGd1RGpw?=
 =?utf-8?B?eEE0cEdLeW9Pc091OWZjM0pDVEpJbVpHaklKcmN1S0FNQ0lOVENtaitXMEZ3?=
 =?utf-8?B?MzhEUXhXZlUyUkllaFhoVXZDZ0c4dDE3Rjd6ZW5MdEhRUnBTL081bXF5USsx?=
 =?utf-8?B?TXdmZDF4QllBMnhEZkRBVmZTakFEMHZuNHdWeGxpaEhnazk0VmV1Yk4zeU1I?=
 =?utf-8?B?dkJ5WVh0b0duY2NYQTZMaG9IRkNENnArZ0U5RW84eHVTRVJWQzREMEJud2d6?=
 =?utf-8?B?UkpkSmtJU0wwVjBVdWxaMWR0SStyUHA3ckM0NGdwekJTSGVtMnJkb3lQME5q?=
 =?utf-8?B?M0hLdFhWdDlyOExjUDdRczkrVnc0ejdHNjNQQmgxSlN2MEZ4Nm9YR3M2L1Fz?=
 =?utf-8?B?RjNUcnJsSzR3RjhOdGt2ZEhzK3V5ZWJGY29mUTVmTkRVcXROUE5GR2kvQVl5?=
 =?utf-8?B?bnlsNFhlL1JtMk40MkJ6N2kwZEZyWklXTUp4dmNoYUlXa2luVWhsSGlIeVBz?=
 =?utf-8?B?cXVvVEoreUxXclJQbEs3NFJnbkZmY2t4V0R0SW9yWEwwOHduVzhMVzY0Wlhu?=
 =?utf-8?B?WWVvQVhZWUw0eUZJdmdvR2JoVkRvU3ZvZjk5YThzODdCWmRPOHEvcjV5dTM2?=
 =?utf-8?B?Q01rUzIyb05JOWFleU5OekorTVNFRXpSYXIxS3YyZEg2dHVxdnBWNHY0MFFU?=
 =?utf-8?B?eFcxdjM5Y1ErVFlEL0ZXZzRyekU5S29yNUtpd092eGUyd0lnd0FMWVJZZU9L?=
 =?utf-8?B?OHh6eVR4M3o0bUJ5MTI3K2JraG9FZG1wY2dSeGN5aCtIbTdEMnhJOWtBbFBk?=
 =?utf-8?B?VmlyMHhsRENRc21DMGIxQU5FUkJ4ODNZOEY5LzRTRXlrODNiQXFySDV4cjlY?=
 =?utf-8?B?U2wyTzRnQ1ZkQTIxZ2t5ckx3K0Mvb242cEIzV1VKK0VLM3U4YjFCSjRiQ1N0?=
 =?utf-8?B?cE5QL25FT3pFZm9qaU16YjZxK0M5RWZ1QVV4KzFzcmY5OEsra3Y2NGZoWThT?=
 =?utf-8?B?eGZUM1RzZ093VWxRcTlDM21TYlk2eldMdFFMV2FVaUhYQmxmaWQxT1NpcGRM?=
 =?utf-8?B?MzF3RW0wTzFSNnhnejk4cVF2Wjdpem9ncUpPSlo4dm5TbnVFYTIvQldoODJm?=
 =?utf-8?B?bU5VcnpuMDVNRng4R3gzUFZ2Wjhndis1eEszbGNSQU4zdXMvM1lVcnltRDUx?=
 =?utf-8?B?Nk1VWXRxL3QvTldLbnlxc2tXUzJpVzNkOWNOQXgxd1dXRFAvWmVrV2kxT2xE?=
 =?utf-8?B?T0U1bVJVdThGdEx4UjN5SG1BcmlnaWNSUVRRdGlvRWE4OGVGUThtakRVaWx0?=
 =?utf-8?B?aTRkRTVYMWxyaWNxRGxRSENsWjREVThPb0QyV0JmYjRsazh6V0dJaFYwNGtV?=
 =?utf-8?B?d2xvcmJyUmJSa3Z2SFdCREdlSGQwaDl0NnZvekVKdS9LRzBlcVZWbzMrQm5C?=
 =?utf-8?B?ai96cUhXVUw0ZjN6RmpRN3Mwb24zeFpUbnBtdUxZV1RMcFU3MXcvQnpEN2lk?=
 =?utf-8?B?WjVUOGUyY2xNa1NlbjRxVDdSdHdSU2pzVWQ2OEExcmJJMnBnQ3NQUXBxbXpG?=
 =?utf-8?B?MVA4UCsyVkhaK2UzbmpkOUlNZTN2MGJkSU9XaEQ1Z3k5TDVqYVhidz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e16ab-2dcb-453e-1972-08dedcca879f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:25:55.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLeYxPZn8qdxBsAJ+dRJm/gl+5yUH1fTEtti+jZ0ppb9UvwWIc2lH2tuYAqCc3pAVXsgLmsPUqazdHmyqKZG/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416



On 7/8/26 12:18, Kuninori Morimoto wrote:
> yc_acp_quirk_table[] has strange alignment item.
> Tidyup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index e8238788cab60..285ff3dce25e3 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -753,12 +753,12 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>   		}
>   	},
>   	{
> -			.driver_data = &acp6x_card,
> -			.matches = {
> -				DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> -				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
> -			}
> -		},
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {

