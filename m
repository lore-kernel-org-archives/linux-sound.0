Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC042749C1;
	Tue, 21 Jul 2026 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605773; cv=fail; b=IeO/KS/wKT2UGEDt8myF0eRX8dD3qNQD39HxbvJXjZGRTZcyxwtLdwkI9f3mNr0gbJ3HjbpJpDXdQUlGUTkvf8N7ntoPHLMbXU+5bpEUQHHEZFCOILiIEhUylBmRVyS3nxM7bsmfAuKS6mNz/5qHFcGFi3eYzoTjsLiMV2lkybk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605773; c=relaxed/simple;
	bh=IopRkvUV9KxXjErTZKqDI74XDHu63nmqDYwJhZ9y2b4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j5ouUzcmKFwGzDX5o8yjnw/ncMpgd7Yq2HFmlEphx9mPyo8L4pHCXx7RQYGRfcYtgq21asbS1Igbnhkb2UeYwTxNX3NgUvp/8K+zgQkOFDGQg9z/61kE2KyGvKrQyh7FvL3FhBmYVOfUWO6AgnmUIIUTU3BkDf3a1fK2voynt64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P1reaMuU; arc=fail smtp.client-ip=52.101.61.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P1reaMuU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+1t1NGzoFXmu4qhF1IhRgzg3QqMYRrsq9nSUd1Jf6wi4tAINv8Xa22evpzBzydDY2IvbgU6NtdgSrcrY218UQCBtEXZTWJlJXZ6BPvn4JK1g+IpCjN5NToKkXRSS46rcPOUrSIgSZNKfcmlHLvDyZSyzpsAfJoffCQ8bcNaTYfLoGbu6Zm1irPGjIx4JStuoQHOOxn/3VRMCHYDLUl/BG4GUXpemDwpcZRUCV9QPPU+i3wgtziwUiBlqTb9no58zep4eEIab1Sl1cKFOCJtlw3wUDUJRtILZp4D0lBqkkikeIKAgcmJfuTruo0gt2oMXxFS5ivC9vw8i0OjqIk1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L292Qx0BrdOu9qDrxzxYBiCX8+WB510aMBbBgXSM8I0=;
 b=SLzFexqwhmWJsEP+/t/2EvhmT101GTeIS8ewqZ275iYEjpgjNuCBZ/3YnR41XjQfEDOHhRoD3YgCG5nLEUg+5bl8ZY+KZTfI8LHvglICnq03So8UjElF4Mn3sHzopVWaxfHBEHYZ6YkukDf0R+kjbkl55D+10GD1g/dYomrGbbwCqgzl+KjLPyRgGj38Kr/a7nJ6eIL3XUVjGcBzrt+zKj8zxv5b57NKLJheHcgAX1ZTgmUSAAGfDlNeCOAJAu0wrXBwqXC9zZxDIqD94jyDwAi4FjXsUAuNHHwwCWMIrQOgl8rKI7mqR0CNUh/Ub4FVBY3/KpFgtVK3nGR9prGJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L292Qx0BrdOu9qDrxzxYBiCX8+WB510aMBbBgXSM8I0=;
 b=P1reaMuUVGNrAM9DrhlYZfst49L96ePnbxQFRyllgeTnIEBQMjPL4y8P8YCdcIyc1qLyOLToIJKKh6nqesfWlVHA3vuCHTBBf6vEu905W1Iybj+eQctWjWcqWU1tsueot/LToyxyRseGJZwUzTS7WivDK1bfXoVIopE1c9Omwjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.18; Tue, 21 Jul 2026 03:49:29 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 03:49:29 +0000
Message-ID: <717b3ae5-f21c-423f-9121-ea87d165916c@amd.com>
Date: Tue, 21 Jul 2026 09:18:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: amd: acp: Use named initializers for
 platform_device_id arrays
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Aaron Ma
 <aaron.ma@canonical.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hasun Park <hasunpark@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Kees Cook <kees@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <a23fa9f649eaab706c704b671527c238f211ee26.1784528081.git.u.kleine-koenig@baylibre.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <a23fa9f649eaab706c704b671527c238f211ee26.1784528081.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 055792a3-cda5-4c84-59a6-08dee6db1109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|5023799004|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9c8gGEKYykrO/+4zZGOQFMfpPS8EqfqAudP1z2A9rLXfZWzAqwUxFLMJFJfK24SugofK1X4DmvDtZHrTw9TasL3LDnusCekF7eOy7YmY0V/Y2+EyiWRTJdQVzpmXP9P0WBnQMbwOsUCCQYpK4OZklm2sZm2d3psIeWyiXRmFPC/RVmj3f7Rbv+pnOLmrFW0d9VTtsKHdXxb68tafJx5dRg+UJ33pAancwG+Ka6yqvWpjs5MWguB3rN1uLh4MDBI9kjjOrTGUxlB36R+wErCKQl556bdcXRoVZfmBIq4+8Rt8hcbvkZIst9KzPSMdIfQBUpP+cRYLLh5yw8srDkj66dBlT61DEUjGTKbZ7IBkPEBV9QqMygtCZexbIn4pj4jRFksvIJ339jhZ8m+AuOQm887l8SwZONlw8zVsVFfuY/bpxqwJ2jahqljR+9XtN9wFM6IUV96A9BeETtR5IKrr8gF74XkAmpIActoR6iYCTd0aTjvj0J+ZK7OOiLfO3dqZrj6a8q+bewD0LHsBTDKzcZVqxoU2RmiPzxtkbzhf/qlr6DkDkWJw7qFUNJ8rcwPldi72AUptNwkVR1KhnJ2q2Uhby+OZNk+3F0vpolR9Tcuz2c1OONd04EsOrKtR9VK5px1CwZ/gpKRgDAealOgbU73RGBzNJyqVKZoeaAH5Flc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG93aGI1NllyYnE3dVFtMHBqN1RaRW0zelpyRjV4ejRpM2ptSGx5YVphcXFR?=
 =?utf-8?B?dXBqUTMzS2k5YWlMTjFLZlpCeXh5aTZ4YktKU2hPclMwNFUvZ0hwNjN0V3Y0?=
 =?utf-8?B?M0d5Zndwc2pFcXlZSGtzb1BlZ2JkWFFLMU9qNTRmOGVLWWM4ZGNTZTR6L1Ar?=
 =?utf-8?B?YXR5RWFKSzAvamRBWTRRVER6TVU5eDdJVGJvYVdEdlZGSVFNUFdhc1hoSkl0?=
 =?utf-8?B?MmxocTU0R2xGcW5Wd2pPRDZobUp2V0pLL0Zwa0xneW9LMUJNZHFnSmZOZjlJ?=
 =?utf-8?B?ejMxOXFYeE9Nb3lJNVZIejY3Q0RVcDRmSldNUnFnZVYrZTN3clBlYUpsSTVK?=
 =?utf-8?B?Szc2ajBXYmFjTVVmMTRhNVNwTlBPVVNJTmh0U3l4dDNBeUQ2aHg3cFArdGF6?=
 =?utf-8?B?ZWpiZW5NN0I3QSttMXNMUGNwZXFUTUt4Q1ZVdUNiRXlWLzhzdnEySHRiSXF2?=
 =?utf-8?B?L2ZIUmRodlpZa3M2L1dZajhUOXBJMmh5amdlVHB5cklGejcwc1FPTEc5eS94?=
 =?utf-8?B?WWFleENlRXBTSllWbDlJdnQzY2lITk85YUN1R3Zxb29ZbFJDY0ZzR1NZNmxl?=
 =?utf-8?B?b25KdWZySzlzdVZGSVZUTTFObjZHbmVlVmE5L3kwZnNvaVFoRzQwbklmWWEz?=
 =?utf-8?B?R21xWXR3Um04RzczSjRtMzJSRGI3dUpIUlE2QkUwME9iN0NrZ3dtMVhGdW5T?=
 =?utf-8?B?M0ZFUmU3R0laUmZnQmRaZ3lDeE56L1crZ1JuNncrQk1VNjBjbU13c1Z0NWdv?=
 =?utf-8?B?L2VIWXBhcDVueXZJVkFvVnJIVGpMN2FFYkY3SVVYYnNLa05Edmxycmdib3pS?=
 =?utf-8?B?VWg0YzJHc0VCdGRqZUVPVlBCZnVzaEU0WmtYbEhWbEgvMWtKSnNrVWJxMWIx?=
 =?utf-8?B?Kzh1aTBpeG5RTlZrTUhwOWdnN0x2Szd1V29MbnJZWjFiWm1ienRZRkVHaDRT?=
 =?utf-8?B?M3NqcEo3ZktwWTFhcHNPbk54NnU0Sm4wTUpXcmJzR2dWcmZQd2NYYlVWaDQr?=
 =?utf-8?B?NlQ1dDNkOWF6dkZNUitLWVdLVmhFVUE4Ulk2VTNCdFgxQndNcXpXcWVCTTZk?=
 =?utf-8?B?WW13N3dIWlZxT0dPUHM3ODBZRVF2ZVA3UXBwRThQYzF5NkhZVzlSdWlFc2F0?=
 =?utf-8?B?WUZGYWtJNTQvNDhwYURwVW1EbzBSTm5PaU1Zc0M3QVpJYlhzN0U4S045Tm9v?=
 =?utf-8?B?ZWsrQUpsd2ZIM0pzTXAwTmlyUnZjeFR5eXZZQnZJSzMyV3JGUnlJZ09mU3B2?=
 =?utf-8?B?NW5IL0ZYUzF1dEs5SnBqcWJ4VHVSTXhvd2V0RzQ1RXJDWEpUaFpFbHZjUnB5?=
 =?utf-8?B?TTBVditTLzRsRDVTZTAwRkczdmUvb1hFVW9tM2IvOCtaRXNXR3Fmd2NqUDhF?=
 =?utf-8?B?UDd1NmpJakttQm05QUxpZEtkY2JGc2VGY0VsOXhoc1Nsdk0rSVZxYlNEbHUy?=
 =?utf-8?B?bldNMHdxVFZSczBsY29jRENQQXU1VWRKSGwycm9IWjBESDVNem9yWnMzLzRo?=
 =?utf-8?B?TU9qUWxYc3lQMlZEaDhXWlF3Ry8xVnAyQ1UwRUVRTjhBcTB3UThZWWJSc3Ax?=
 =?utf-8?B?aWJEakNiTFFWVEE1MDRmUFg1bVhFdHFLSEJLQ3o1dERmamJXWXorNVRyQWN6?=
 =?utf-8?B?clpvREFVZk9MeUlvS1E3VTZZdnhvVG5adFljOWdkQTZlZ09OeHkyVXgwOEtt?=
 =?utf-8?B?NGpCUy9HOW5ZNksvWmRBQTE2Nkx3cks4aml4YUhYTFlNQTVFUUpCdTBhY1Z2?=
 =?utf-8?B?alBIWVFmOFlFSk9PMVNBVnpwc0hmb1A1RkFUQVEzR3JESzM5VncwNjU1QTNR?=
 =?utf-8?B?a0syRlNUc0lCR3IvVitFNENRcEJrRlczNlE5TC9XZVZ4NU8zNVc0K0lNdVV6?=
 =?utf-8?B?bWdUY05jZjdXcFBtQlhJRUVZNmxrdGhQdXdEYzllNDFqRmRNczZYSG9sbGZ1?=
 =?utf-8?B?RS9mc0VaRmZraGhlVy9Zam5nRzVmNU83OTdEUThnZ2V0dHg2K08rWE5aMDgv?=
 =?utf-8?B?Mkp3OWx3M016TmFDeVBOL3JnWmRxMHNtcXk1bjlGTjh0Mi9qRGZ0K2RNMWNu?=
 =?utf-8?B?YUJ1VlZnRmNjUEY2b0VMY0JHSis3VmhSZHNCcksySld3RGVhdW56d3Zab3A3?=
 =?utf-8?B?R0JnbTBjNGZrS2VHWU5UeEZTOTNwTEdxQkNzdG9wOWNhb0FvQ2tFNmw1UkZM?=
 =?utf-8?B?eVppaHhuRWtsV0V4WFVkQjlKT0ZwbUFPay9zNlZkcVhhblJzSEJCdW9jYWdm?=
 =?utf-8?B?T2RGbDNLSm9iek9jUXhUZHNXclloZ2I5TTVDQ0JJcFlpTWM0TFIvcUg1OTA3?=
 =?utf-8?B?cFU3d1E5ZzMvRmdaUSsrVEs0YSt0QUNVaDl0SnZZNmNzK1FjNmVDdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055792a3-cda5-4c84-59a6-08dee6db1109
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 03:49:29.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMHW6kiYQQMhSkilp8vOzyXmA7hHnKvK959ryksVJiuRfNZeigYBYImQ7CfSjwJChVH0J+gxTNuiU2TsiWy5Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132

On 20/07/26 11:53, Uwe Kleine-König (The Capable Hub) wrote:
> [You don't often get email from u.kleine-koenig@baylibre.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/acp/acp-sdw-legacy-mach.c | 4 ++--
>  sound/soc/amd/acp/acp-sdw-sof-mach.c    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index 9726a9d33ec6..637dd2deebfa 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -580,8 +580,8 @@ static void mc_remove(struct platform_device *pdev)
>  }
>
>  static const struct platform_device_id mc_id_table[] = {
> -       { "amd_sdw", },
> -       {}
> +       { .name = "amd_sdw" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(platform, mc_id_table);
>
> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> index 963ce6fd4012..8db889d824f6 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
> @@ -438,8 +438,8 @@ static void mc_remove(struct platform_device *pdev)
>  }
>
>  static const struct platform_device_id mc_id_table[] = {
> -       { "amd_sof_sdw", },
> -       {}
> +       { .name = "amd_sof_sdw" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(platform, mc_id_table);
>
> --
> 2.55.0.11.g153666a7d9bb
>

