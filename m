Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579694204E;
	Mon,  6 Apr 2026 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452940; cv=fail; b=gNLK8O8ntxzQ+zqp+JyPXtcFIimYv7+JcPZMbDZYa+tKqd7H8uKqlQNYqaW93HjZ8TPahi8XFVGQLZeT8ec84APK3WrwExw/N1U0+SfsMpdwgOR0kcIGY8BulNY7C6nkyuJzfwQLK6MsGQSXaC8GaH90+6lNJQ1PKrtlmZ4GeyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452940; c=relaxed/simple;
	bh=QIJP0k9tatkiz9bH+AfnYdfwg1DuAGOhyNiZf+977u4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UKwIIG+pDCCL33KMMjALNNzyeg3iSX9dhHFj55Qa0/yNOoKoMvdFOhJ5vRFIFcSn/9BHvd9hzBwYDR0gfssdvJF/HAJ5EEzTp9vBbehCrPlmNAWpBiUBsZnyiwE0xxZBMy7FIth2qIOrna8KkOxpmbfrkKyCpL+VXNFWAUCcarM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GG2jxKX6; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GG2jxKX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pywIYRXgWD4fvcu8u44+biWywXf0kAs3rwgxhRtZ141KhjR0KxNd9j7oKVMk0O8iLBzqIWTgKJzQaqD9lpfloKMefT7duUUs9ERaXkIQEqdI1vnTRVxBM2KcrPuQNZ6ZSQlYpaZl5BhPtzNE9gbW/xXPUD9CXYtzdfPzoYfP7fS9GSxduGCHuA/GZczEjqeDaHSIHMdeQxDBFZCKjCuYjZx1hyG0S6qTYl6PXL29IO1q5gmiCEdMfRrmbfUZF1dfJWnuzu6tk11ab/kPGWx7JMff5aVGkTD94MF9BQKFeml+0jAgF3OOQegNMZg3P0iUaI0SKRX7aRpM+wpsOe+T+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L8O75fELqtrxqTVv5h028ftfB2ixMKRqCFBq0VSxkA=;
 b=FYfPyAo3jhcokR+GzewO4Ihyhn+fMzuYPXZbAhb56wGMiiVh/b2N/UtrBmrNGizDEXsnQ9vlVyYvcBCCGzmTjv2wuWS51eqY2loiLQH/SyQrntPeQiPkcRMaTwdEwSatFFLWeDnKjVprBoKNrmiT8l1Q06yCIGahGQIWT5P3zjp2r/gii1Uj//igsUZngg0uOslsSO+fqqut1egk+NAw16Qhbh3XQPWothghlQobVcYknLEZ6X18/6lK8L8b/ZuKsUv+MCZMNmMGh4hHUt9fmnQ2np5zdkoS4XJdP0V/srYzc4WcPzoBVeVdbSnG8qV+qqggLgBGj4bw3ag1myOGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L8O75fELqtrxqTVv5h028ftfB2ixMKRqCFBq0VSxkA=;
 b=GG2jxKX6IqHPFAUcEG45FPP75JY5y/BdtO2ajQDprIo6LW6gcvE6AVizIHVod27g9lolCpp8avh+AGApDRHt+M2hmfa8PnAS5pIoky+/WbMUltBOFkIx13BlLSn5hUCGXdihWz/W0sAt/hrg5yOHtndBBcQLevFXPmgrFakG5A8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 6 Apr
 2026 05:22:14 +0000
Received: from PH0PR12MB8098.namprd12.prod.outlook.com
 ([fe80::9ac5:6cbb:1296:fc22]) by PH0PR12MB8098.namprd12.prod.outlook.com
 ([fe80::9ac5:6cbb:1296:fc22%2]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 05:22:14 +0000
Message-ID: <0bd34325-db7d-4074-9a42-3f2dd580dc5b@amd.com>
Date: Mon, 6 Apr 2026 10:52:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC : amd: acp: Update Quirk for Lenovo Platforms
To: Mario Limonciello <mario.limonciello@amd.com>,
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
 <c415c13e-0532-49fb-8a52-488a28870d71@amd.com>
Content-Language: en-US
From: Syed Saba Kareem <syed.sabakareem@amd.com>
In-Reply-To: <c415c13e-0532-49fb-8a52-488a28870d71@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To PH0PR12MB8098.namprd12.prod.outlook.com
 (2603:10b6:510:29a::17)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8098:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6a2525-ba75-4a5a-9005-08de939c762c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1BSu7hJ25cja2sxiTLT+CFVyLP7Ja4N9FKt+G6wtfwizTKT/kl7jxkfYoVQVOMg7H8Zd/FBapBcgmjJu+ZgKlSlUI4dhwW+0V80cJLsjVIVmbUkIIQGm4Kc7AT1TR8HI5J8YndoetUQ2+Uk06MYYORGnHHE8lKHkicG3fDMqdXvHiIejiSPLsvVM8++qPBhqNZxES+n62E4Wz1uZZ+bnq7mJFZRIqOBcxshFe0fUvuUaC/usM9JHNUsumsi5CJfiUkXvSELx1DOPoNoGzPX73wDsD+Oa2ACgo3rxjpLVhxPXX/Ickk68ZiZMZ57/uucwJjjcp7X2EXx36+7Y/0WzuvM5RbsNz/90LGvEhcT4MWwyO6T3TWmFQRDYEsdtFq+9qDx67D3mZvj/bWZYbIL2jzJmEffwwSYhFkzgfqz3Hi9Uz3TZWAoLj79MqH6/AM2oL+Kvr4XbHJkuooZ21qWsQ3bsCCXvlLto+S0IGNC5hSN/AkGM87xt23DJQ62JrL7467OzaOE+EvxAwmx3eOSssZPBvrstUN89i+Lkjg/AQYAFRgbKNVJIGSUg8W7GtvOsPNIFFyB/h/vYtO8/nKhi4xQEHZbDfmfZF9dtT2FZs7vUKl5cNjy/OQFRK5L67EFKiTW/UYNeHEXF51WDp9ETrjP7mv2a9tjRYq6SS5V5bvEHrtyE3U1Fz3zwyFexVQFl8HxUtfL35LFRWNChXFrwTJfuat4SlAuQjXL/Aqhby4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di8rUkpxeHBVYUYyWlNLamlIa0h3TmVKbGFvSXJOK09FZ1h4OXRUUGF1YTRU?=
 =?utf-8?B?UVgvc25tVjg2REEvQXYraUZDNGxBWS92ZDFZWHFYK1BySmhZUG9zTlRCTE1E?=
 =?utf-8?B?aW1lS0hvZ0EzZGFZQUZiVE1EYW9kYThxcUd6ZmVyRUFkOXlSRUUxMVFINThG?=
 =?utf-8?B?UGdCMkszZmgyd25rMFVoNGlObWdFNHVOdlBSSWZrWXp2R211VkhoQVpJL0NI?=
 =?utf-8?B?REhnNy9NQU9EL3BiWjNVVFRBcVVlSzlVVVJtQ29jc3pEeXZRS1ZLOGpRa0Vs?=
 =?utf-8?B?cEFGdkpwUFlVU0V4aCtOQmlNOGladkExZ1FzVTM1ZEoyVVJLQTNRTDlQMFhY?=
 =?utf-8?B?K3ZZYllHQWpHZGRzNnJPNnRBS1MzYTdvakNsQnBzcytDOVhiYU1iSXlYOUVo?=
 =?utf-8?B?Uy83WnZQVm5VazJrRHpKMk0yN3lWcGdMZlFXMVI0MmFoM28xZ1hjOC81RE9z?=
 =?utf-8?B?OHZWcUNHRHlLWm5FRVU3a2E1YisvR25QSWJqcS9QTzB3dVNpOVU5NmZmR2tL?=
 =?utf-8?B?cEo3VHhMWWpLdEYyZEtGVEs3OExXL2NpZ053M2NxQzM1ZERTb3hGVEYzdUJL?=
 =?utf-8?B?ZzlsNjlXemVQYUlyazhUdTZoQ3daRVVoMm1oQUZrZUI3SFlhT3k2c2NFQXJB?=
 =?utf-8?B?akdjWnhScXM0VzZ2SnV4c2x2Y1pDMkJ0WWY1aWFZbXRHTzEzTU1wUlNQbW5G?=
 =?utf-8?B?SjF4MDIxNzhQVk5SK0V1SC9iQWcrRnF6blFCNXVVNVpmdHNXVkVHU0FJOFZZ?=
 =?utf-8?B?RUFITXVCT1RFNHI2LzlURzFvOSt0dkI0U1dYZjlIMDE1OENDbndtTXYvL1cy?=
 =?utf-8?B?VjdJMlNRQWIzazQ4MW1wSDI5NlAwWjRRNkRmZ3FHS2FvdEVNOUZqeGxGS05M?=
 =?utf-8?B?REJ5alFFeGhIelFaY3NXRW9LK0RWQmhvcUFhZi93YVNJcHJTSWc4TndhblYw?=
 =?utf-8?B?YVQxeG9XS2NZMTJyRHFFdU9hYlNvdVdJVW9sV0h2b2RXZHdydEpKMlcwakxG?=
 =?utf-8?B?ZWpoQmxoZUZmQm9oTHFrMWQwcUZ0Sm84TzNXMUVSR2UrV2Z5bVY0eTNqTmV5?=
 =?utf-8?B?SmFEenhJa25kNmRreE52STdpNmY4SnBYaVltNTNNNi9tRGdwbWFQN2xCMFFo?=
 =?utf-8?B?UXFobHZiZk9KbDB3Z0RuNWhGV01iMHBNb1BQbUdyNTdaRkhoSVNRV2t4RU5z?=
 =?utf-8?B?T29sNnAxTWJnei9SRDVsMHhYWTBWcEc1K3R1Q1FSQXR4dG9yZUgwdmdISWpr?=
 =?utf-8?B?bHM5cjVVcjdrNWlGSDU5K29PbEVzZ2lERXo2cHZkY041TDJjN25DaWcvYjY3?=
 =?utf-8?B?bUR4bEp5WUJTZGlhNERZOGtLOXBMdlpabzBtRnJWUXpjRHF0TUp2YXMzOWJ0?=
 =?utf-8?B?c2M3VXcwRHNhaENWdGdxMU9vdE1XQXZkMnIzOEF3SGxpZ2E5dUYrU2tDMGVx?=
 =?utf-8?B?M21Za2VQMU1UMTkwd0I4NkhjVEMrbmZDbUpWRWpKaENuZ0NOZ1YrNUVpL3B6?=
 =?utf-8?B?M0FENHhVbk5wNDd3Nnpob2pJS21ZYi9hRTExV3VlL0h4akVkZHVWdnpnSlgv?=
 =?utf-8?B?alpRek9zN29QWW5SOGh2U1d3SmdhYlN5WEdjZzU2cFJLMjFUSVd3UVhLZ0Ir?=
 =?utf-8?B?Nmkva3ltMEJ1b0hObGMvTmFrbmFYd3ZuSU5ZaHgrN2svMHJ5a09tcEhPN0p0?=
 =?utf-8?B?clV6akdGbjI2dmVQNHM2THVRa1gyZlRkUTlBZWIvNUtwNVZiMGREaTFoVDQ2?=
 =?utf-8?B?VUJLcElVcklzY0ZvcVY2ZUhiMUQ4c245T1YxMVBPYm1PZU0rVkVucEJENWZT?=
 =?utf-8?B?R0QvTDVPWEsyN0NKUkFsMGR4WWthTXlnY1p4OUZtOGxiMExXWDdpWkpOOFlh?=
 =?utf-8?B?TWc1RHU1MzY3YmNFeDFjY2dUVGxOZWdtL1BVZ1RTdlIwZFAxQm1LK1M4U0ZB?=
 =?utf-8?B?b1VIVjFoSXZOeDdHaHNYUU9xWkY1bE51YllvRWphbzIrY2MwUXJrbDdSYWsy?=
 =?utf-8?B?VGpWWGU2VU00UzVZZTNobGZGVzNRVlMwdjF0N0hrRVJkb1p1NFYrZ1J4YUxY?=
 =?utf-8?B?c2c4NEhsbkhwQjlvVzVHMEhudGlLSHJZOEd4ajNoZDJ0THZlUWpuZG1PKzlQ?=
 =?utf-8?B?ZUR0VFZiYWNoR0NEMjQyQ3crSjFSMjl4RmcxaVBmRGlZME8va0c1TFljV2hD?=
 =?utf-8?B?R3B4UXl2bXdlMkFiaUgwaUZVWWVOd2F4L1JQaEhlT1ZJWHY1VldXVTFoOW9V?=
 =?utf-8?B?ekhXL2txMU1VQkZ1bnU0T1BRV3phNnAydmNsVmZpZHB0SHhNekRwTUNMOFFE?=
 =?utf-8?B?U2lFZ2ZKWDFONVVXWGRxM2JnVmVOUDJ3bXdNOGs0U3pCT0dEajk1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6a2525-ba75-4a5a-9005-08de939c762c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:22:14.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73tnL+9sF/9VHgZ25kjMj4BGrcMs5iRmG1sYNfNtrJjjo3ENOfc7/nqCxVhFcdjFWommudn5MWaLm+yu9sR7YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565


On 4/3/26 21:03, Mario Limonciello wrote:
> On 4/3/26 5:09 AM, Syed Saba Kareem wrote:
>> Use DMI_MATCH instead of DMI_EXACT_MATCH for the Lenovo SKU,
>> So the quirk is applied to all variants of this model.
>
> This seems to do more than the patch description indicates as it also 
> adds the  | (ASOC_SDW_ACP_DMIC).
>
> Could you add that to the description?
>
> Will send a fresh patch with updated commit description.
>>
>> Fixes: 3acf517e1ae0 ("ASoC: amd: amd_sdw: add machine driver quirk 
>> for Lenovo models")
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
>> ---
>>   sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c 
>> b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
>> index 05484c72f9a8..986fefd0de08 100644
>> --- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
>> +++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
>> @@ -99,17 +99,17 @@ static const struct dmi_system_id 
>> soc_sdw_quirk_table[] = {
>>           .callback = soc_sdw_quirk_cb,
>>           .matches = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> -            DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YW"),
>> +            DMI_MATCH(DMI_PRODUCT_SKU, "21YW"),
>>           },
>> -        .driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
>> +        .driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | 
>> (ASOC_SDW_ACP_DMIC)),
>>       },
>>       {
>>           .callback = soc_sdw_quirk_cb,
>>           .matches = {
>>               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> -            DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YX"),
>> +            DMI_MATCH(DMI_PRODUCT_SKU, "21YX"),
>>           },
>> -        .driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
>> +        .driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | 
>> (ASOC_SDW_ACP_DMIC)),
>>       },
>>       {
>>           .callback = soc_sdw_quirk_cb,
>
