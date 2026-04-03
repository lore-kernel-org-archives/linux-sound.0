Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7342048;
	Fri,  3 Apr 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230419; cv=fail; b=cAfMyXRpqQRkQRvleS+Qm1M/n3wA0ZjkRvP4wtYzzR7fv+g1ESH/VTPBpVEcgosz9kxXzboiVS91Ld0l4oNBS5izhJ3ZiW/QuZQEq2FIWokJk0WUF/tU/Uc/z5w8OgnuYman3PFVxqNIjeO+9aU9E0Uv5tfJMIisHuyGg9iMO6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230419; c=relaxed/simple;
	bh=jf5oHo+F3ppwIJGADeEyoTxvuEGSQzKNr8un+VdW0jE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mJjYLR9EiCx8AzELjIY2bG8YbCUM+H2+De2xO/v1W9ZOuA8LZnNeEHe7fV2huvBgicLYbURhqacZs/7tTIUdqm8kDhOLuhcaRFOXXKqgrigRuAZz708+I1AiNx8Hp4/nzqEHnUQOy8L+wrmN96qttymUUfDL7WKi/22QFCnFm5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LWZ6PRTM; arc=fail smtp.client-ip=40.93.194.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LWZ6PRTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9GIgqWNkH03R+UNnWVMEYAUo+CbRupu86YVSVaBrD7WipRQWalwBhXoBOu/TMDHId/qMSMNbbtJ/ANJ3xPsM7GPeiNea/mI/tbegmx3LWeVX36QAr1+H734cAOxtXE+LmW2K+UuC6H19uy4qBvbA+BDXhEAFal11hz8UwPsJmYICesZosXlmIK3OjbUYoAYS0S6DzTZr3MVPwMVDqI3jQRvJ3Frl8v0vO9aRbu1zPiSfcEbK/74u+YNNqGQdk7AJw34vRKuSeHKrsntWJ2zjStkGMKZoQmpp105Yk6MptWJU3t946nmo9clpKn9Ll3aEsHuykdEaNMo/JBNoz/EbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvuUFadLS1wS2Iq2MdZfsQogB6P/JNEAQRMhTQwYGLg=;
 b=eJeUCNB4ouZtw8vcNvuSQYNaC86XZWNb1jyPeg8yKL0wvkW+Tp/WYC8vaAeDSteh1Iq8C1BAOTY3e6cv5vyp77VRxTzGgtU6Wq28VCe1ZFGUg+7LoCOQDutlOubE7h4eddnIQ50odWyl9WyYRTKIUzgbBxPowXb4ahwq4KixdUdmc4rDeluPzA1RWkq+x8RgsF32pXjyCG8gteWpafDG3MQ6DPgNKjSqvLRo7Wrzupx0TI00xPjipkqYwftctRfJgK6xtKedQfkLatQZaO/tM42bLe+9GxVBkDiSZQqUwgA9HgWhxP+iIfqs9bInZTaNOQgJvKjON7+xQmm0KMbxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvuUFadLS1wS2Iq2MdZfsQogB6P/JNEAQRMhTQwYGLg=;
 b=LWZ6PRTMDYiqSryMGedhU53G6DbFMlaLpX13ZnC/TFlc2Beho0OU6WL5NFGtoIGDD4EAZurxjPdvAGAbXF8ST0GYGlMGJPiKOG75wef2n9l1e876Pc3lleOjnDr95VKN0kXMCpWchtSAPE9tO66+fzxffGGky6NMlqN1gtwiL4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 15:33:35 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 15:33:35 +0000
Message-ID: <c415c13e-0532-49fb-8a52-488a28870d71@amd.com>
Date: Fri, 3 Apr 2026 10:33:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC : amd: acp: Update Quirk for Lenovo Platforms
To: Syed Saba Kareem <syed.sabakareem@amd.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, "Mario Limonciello (AMD)"
 <superm1@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Hasun Park <hasunpark@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Kees Cook <kees@kernel.org>,
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260403100948.678548-1-syed.sabakareem@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260403100948.678548-1-syed.sabakareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::22) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA1PR12MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c89611-e75d-40f4-06d6-08de91965e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	arAe+eUHypO8iNpLUZFUWUTGbBPnvgvJUTHyMGk/4irWSrZfusqL0OsnJeJtl9YvLTFGWHraYztwN8iUSt7h7CHgkfBJPNhAlCuyJwGmiS1d/R5y2TJpqwI9u6kJaXwxNXRqKeUkjXDUj5sZQPn7xdV00WWaSgu9QgrvTVbBNwl9S+c9t2NZ7ggsKVedPxtuwTmbzam1fKUgSccogKyJMG7O4TS01T+nUOLiUmWcxLUqxcZoaHMKCaksut2P4LArWoLrUVdItkSdfjv4BTYjDNnW1HViCHsXZAd2Sgo0x4HUjYOY7zQ2alltN1/e6nDMFoFkAaq5g9DPby78fV6qlha7sjqja7m5nde81c0aQusXoYihFRPKlwUZCz2i/RZEUdBrwHp2SE8ldj3+A5br67BSwZV+zdMNEI60QERDsU/kReTy+RMwSuQOSvlpVY9fkDC7cd8IU4HsUQ6S+E16XTIa4NDXIx/hPvvPa5M/2YrvBIalkxk6xjLJaW7Nl3qab6k5jURGcW/T0hR1EfrJ1lfXyhNHE1E93fwLIxAv8ayo/f5rFL2ANXq9HqybChybUcJs+1/Sw248U9lsqTH+bSMb3N14jq+ec4q/53TY58E/jRyPIazda98WSRQVh7BkGGDC5NFpCS/xFC4k4oHiSisY/CYYODFQ3rLxKxT96c8e+CKHAGhG3DxUz9NYEGlicEfCkyWAlIf+Al2zSsfIiWlm0ksaZl/4qADpnbOTWrE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDk4UktrUk9JRE5aSm9iQ3RLZmVWQkxGOXZPYUk5OWd2Rkx0RVV3YjBXOEJs?=
 =?utf-8?B?TjUxemxTTTh0aldHQlhsVDQwUTZROTEzajltRjN3cVhjTWNGQWhjZ2dkQnJp?=
 =?utf-8?B?bFdTOXlPL2Jqd0N0WGhHUW5uVWQ4Q0Y5emxnSmd4UFZVbEJqTzhNSm40ak1v?=
 =?utf-8?B?QWkxQzhNdy9HMkdsSmVlR05YVWtZRy9aeU5VaVRFTDBuZnN5MUVQbWlBYURM?=
 =?utf-8?B?NU9zYVhiWXhBVVpwQmVjMjZ3MjgvM3FKMWIvQ256NW42Y3hrUDRtaDZoRWlP?=
 =?utf-8?B?VmlISlcwOElvd3B2UURYbml5NHg2M2lzb3FwRktxdjZ6OUI1dG4vRkJhOVFJ?=
 =?utf-8?B?ZFBtMDhscU1NZzZveVpadW9DZEJvcUlVNHhxOUZZSWxFS29velA1NGxFeFlL?=
 =?utf-8?B?WDVyMDF2dTY1ellNenNWUFMyemxra093elpsZmpDUTRlV0Y5OURtZ2wvTzVZ?=
 =?utf-8?B?TWZFenp1b0xydzFSd0syaGEvMHhBQThtbW1ZeUZKSjF4aW9VSGJ4a1NDdUJs?=
 =?utf-8?B?OXRvdmZTbzliU0dBOEkyaVlqdkJlSncvYmNtdEQ3VzJBSDQzVVJJZ3NuR1U4?=
 =?utf-8?B?QzFxSW15S2RyenFnMWljNVM3T1BySkYwY1dZK2h3U05TT3Q1SmRCeUVIcmpO?=
 =?utf-8?B?dVlkTHBpYy81V1VWYzl0aktEdDIxMFhPSHRCaWZhU3d2U0FrRHJZYVpTRldv?=
 =?utf-8?B?ZHRXNjZZZTZ4S2NUZElGUk4xVDQrL0FlUWNvdTNyempuM01JRmF2VGlHZzd0?=
 =?utf-8?B?SWFJSE1SNUUyUXBCR0F6RGhZd3hsS3ZHcmNscXJpVnFxQlBUaDcwR2lRNFhB?=
 =?utf-8?B?MmFhaElqYms0TE9GRyt0ZmdjbFlGUWp6SkJIR0N3SDFhRVNYby91ZmxUSzZt?=
 =?utf-8?B?UloreGo2VFNWVnBwOWR2cnpWa2FpVVp0d0YvU2RZQVBXcTRkeGNNMUkzN2tS?=
 =?utf-8?B?cHJvT3VXTDJTNmdWUXpLbVNUSmJlQmhSbE84TWFzZWxNa1dkdlVvZUdtVVEy?=
 =?utf-8?B?WS9EWlJqWURaZ3oxK1VtV3BnVklyLzVVaTluU2thb09qS0VjU3JXeUt4dlFp?=
 =?utf-8?B?b1JGSGRJVUJKRTRDRkExQmx1Y3RVVWcxaVVHTWZQNXlHcWptcU5NdXZFUkJI?=
 =?utf-8?B?bndUem5rSTBxTFo4Sm1uUGFXdkluVHZSMUZVYmw5SWYwSjZIUmFoZUFXdTA5?=
 =?utf-8?B?eVUrTE5FRURoY3BMd0x1YjZ4Z1NlaHRTbjJ1ek5NYUZBeXh2TVdLa3hURlUz?=
 =?utf-8?B?SkpncTNOY0h2STI4MlhRVWhaenNzdkxSaTIveUNieHN0QUhHTlQ3SUQ1V1R3?=
 =?utf-8?B?WTE1TlA5a3I3T0RTTzYvNUFCU0JNR0dSYVdmR3ZnNmJFVTVmellCUHhZS3E4?=
 =?utf-8?B?TGNGaDVYTThTWkdMcnZFY2ZZcFRBaVFPNVYzWE1BS2llald2bDlTUzM2TTJ4?=
 =?utf-8?B?WkRvbnAzZ0RDVk5HY2xvQ2RRTGJBaWJYY0J5YzhtOWtFZ3MyZU1qV2tuNEFr?=
 =?utf-8?B?QTJGRFUvajBJZ2Iwbld3cTRLdzVJaUZUU2JsMjc0V2ZFNXNmTTU3OVVycGFH?=
 =?utf-8?B?QUFkMUpIQTJWSGxyR1l1aXJIQUg4SHp4ZHJ3TnpYc1A0ZnNkU0RzTWxKUjFu?=
 =?utf-8?B?dHhxelJDdDBwaXNzd1dXMTBnREovaWhoWnJIeDBVSnVGSk9lcXV0N090RXc3?=
 =?utf-8?B?MkNGSEhlZWJWVWd3WHNGZXNxR0NpWGZtckNBclRLTVdKOFVOc1VTcGZRYnl5?=
 =?utf-8?B?QkRMSkNyalg5UVRaU254NW92TG4vOVg1ZE5zZGxwZ3QwakZyc2xnZUFiMEVh?=
 =?utf-8?B?K2pnUTkrNU12R0t6N3ZtNW96WmFYWHlCanFvbXhUbW9tZEFVZTAzVm5zcFlw?=
 =?utf-8?B?ZDhWU1l3eFJGeE5LdnhtcWVFWm1lQ04xK25SZTVNUzkvcFpNQUxSVmdwQ1VW?=
 =?utf-8?B?RjBwdGVadWdrbWUrczlpemNxOWRNZElqMTJZYkN3QmRESlBzTEJRc3dhaUtU?=
 =?utf-8?B?cjkxbkNMMGNqMms0WEs0aEc5ZlNVOWl3YjJyUjJWR1E4Vlc4SlNuVzVLWlBG?=
 =?utf-8?B?cEVnekZkMlJabDVhMVRUQVFxVjFEbEl3STQrQnE3R3JFU01yR29nMGV0cmx1?=
 =?utf-8?B?WnJaUVNudVhSUUFNY3RQdElWMjR5a0xVc1JML0c5THAyYnhSdXBDTnBHdDl4?=
 =?utf-8?B?OWlmb245Y29JbWFBMzRVcy9Hd242ald3alBTQnoxRitmZDkzd3dSQVlCa01S?=
 =?utf-8?B?ZzQ0dEoxL0MyaU1WQUtDNkVkTzY1WXBuMHVrWXRycFdueXgvRURVL1k1Skp5?=
 =?utf-8?B?Q0ttQXh2Q1pEU0VmcTJ3Z1hrcW92YWNYendKNjVlN0U2WWVIanlNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c89611-e75d-40f4-06d6-08de91965e6e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 15:33:35.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWjrcSxw9rZSTz4/NkRB3vVJMgTTDCy4iaanpoQuz16AkrToR19EtWzd2TQpBvThZwAwHVjqvJ5f0NS83Oeg5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524

On 4/3/26 5:09 AM, Syed Saba Kareem wrote:
> Use DMI_MATCH instead of DMI_EXACT_MATCH for the Lenovo SKU,
> So the quirk is applied to all variants of this model.

This seems to do more than the patch description indicates as it also 
adds the  | (ASOC_SDW_ACP_DMIC).

Could you add that to the description?

> 
> Fixes: 3acf517e1ae0 ("ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models")
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> index 05484c72f9a8..986fefd0de08 100644
> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
> @@ -99,17 +99,17 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
>   		.callback = soc_sdw_quirk_cb,
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YW"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "21YW"),
>   		},
> -		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
> +		.driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | (ASOC_SDW_ACP_DMIC)),
>   	},
>   	{
>   		.callback = soc_sdw_quirk_cb,
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YX"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "21YX"),
>   		},
> -		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
> +		.driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | (ASOC_SDW_ACP_DMIC)),
>   	},
>   	{
>   		.callback = soc_sdw_quirk_cb,

