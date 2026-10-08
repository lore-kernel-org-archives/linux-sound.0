Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A7371071
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 04:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434134; cv=fail; b=M169D8RaYh7hvS0y94leWHSSRsMIJPAEdnTq/4x0s8ydehHPf/iI1tbG6LDCsSTLbOAxv0wycylgBLV3AsJUSNNPv69On1/KP9qd+d6tY49CyLQuOxHK5bB+HKfjXsvWBuGgWSDAJ5NpinmQF2v3nz+jJQIz3ldLxVFUq6tcguc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434134; c=relaxed/simple;
	bh=vRj4fNPnEpAr6v4iXd+5+muCFm0/scp1fv9XQqkuj3s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ub5RhxInKGuv6nTPoJ7cOCnGDgBJuAtcLYd7RUVQ9Y/TVdNN7dt9QQB7C3wAa026zWoOABJU2TkAqTK8Shq+fwi+p6+mcFpsc8WEsvZVMH50br7CWQ7syf7u9SVlGHbos7EG9aQs8WXb2GzikzbA/Xh9Vi01tk2VH28eDMDNQdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0zuR5rwH; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0zuR5rwH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKgC+BjQ11JMqApXkCreOgspWWnpr/Ku1liVl+brxRU369EA+dyKyIz7TD2fBSMqo5Hw/V8Fe5ImL27PSud/qjvQrFhIsa4DCHH7DtwNMkFUWSjQceK45F8uuGp9ydfMFgy8bF6mI/FqrDGgj2McnPAXGddiZ+nhE62MhhsClXdXjRqgM0JEIEZ2bZYlKNJMVWgVKr+B5M7Jmu71562UaEJdeq7YoDsTt4Hu7JnhGydBbL61p70qPNaeaehMpUx2faYKhKZ7fYQ062PO6+dzKhidDN8MZ+aoZkuAtMeVu99jYfcFBWsiuczlempURfZ0Hg4BMJnJ+61sfPodtviwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYEJheNuDsbZ4+bQrj6uwKnev/3JMaFnxcBG1KNcORM=;
 b=mfo/U3GlGznRScFknKsOVCH+61pcB6cwH7bcC35uV1CZ/p2hwLhlHKsVl8xB6bRGSzYwNYlpEk5+AyEW1uV+t4mPN/3GM65aVM7Zg4To+AkmZsMmfHo638i2ImU6LvPk4eGOr20Y2eNTUv39LIRd7wWMV7LYQdFrn0+7keiCPyeMPEmvlRydGC9gf/Cm4AXKqlRHfs2bIW78UQV/otEi4/TSEkNiEHLnNJTTBD6zeZwjYMxV+kyo0O4YcD9DpkWRYwpEpeZl9Td5fyopl0U6wDfeiYfnGK20yfaKqQhDQxcYzk1YwiarN6R+gjw1mdaIa1ct26PvZpXMnyK+DavxYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYEJheNuDsbZ4+bQrj6uwKnev/3JMaFnxcBG1KNcORM=;
 b=0zuR5rwHVPtAsopnrsODECfPoljG4wimLXArG6bwNdu8koUzy/TOsMTyD4D2+J8KM4fuUc/kowrc6PcvOS3qXtw/ELRwHvLKh7mkIVKJ5P6dTIGW4B4SQcOiJxXsD6TFPmmYXV9hdjZjPZ+9LOoukMGbbOGcOLuMAY42MZRN4Z8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Thu, 8 Oct 2026 04:35:08 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 04:35:06 +0000
Message-ID: <f5a8f7a7-6446-4188-948f-7e8a9026f7de@amd.com>
Date: Thu, 8 Oct 2026 10:04:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp63: add standalone ES9356 SoundWire machine
To: Mario Limonciello <mario.limonciello@amd.com>,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Cc: Zachary Huang <zuzhenhuang365@gmail.com>, linux-sound@vger.kernel.org
References: <20261007193038.2473068-1-mario.limonciello@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261007193038.2473068-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea26e25-4440-41e4-143e-08df24f586b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|3023799007|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HTeuUB0hIkZ/6VFqABqZM5J3ENp6OZOyjr1oz0sT1nZgoa4thY6hsu6sCTEg3wn/9Y1j9nTwDBk+jHEsK2V0dfX38KTcUxRSKxM9mpo/Wx6JIsqU/CJsW7hjPY6dmMMKvaDyiiOIXSh3yNaHBDSDrDEEZfIpWRcABi6sUBCNG6KSO9b/5R8tOqhADvlXcMZ2ovDQbaxdvrsLQoWldFPhmckxwV7MU6RqeVIj7IJwWzgGj9dx3uZMGJfkbMcqDQyI1L5FcTM4ce2Gct9Y5bqnubUuVqmVVjvrcJOAZtN4r26TvNyHUf8ugAWpxDG5f7y/mCjbzCf30AyyvUc0Yohd/Sd5Hd1vXqxjEidsk2mHxT1vT+z+OymrPk5qCBg7Mc/BCMT4EX1Ivb/jsg9eVzmN+DqrmPrjT6Hmeb1njopA2CHRkqoBfPUQ++dx9NoU1RG1XVRg3qYUCtUumHU0k06MjLHua6bjob1ax7CZsRRbDCVLKkz48Jv2lHiII0Xr6WTYqyshcYfWTVrvp5ZjowUXL+gA9yg0nuZb4gXVfaA4VJpIU12U3i908LSVViH+m6AcFykeCBNkZzjsKsmjck/Ao8Tf2wMvwohsFQ0QlYFkrFpLQWlxCTl9jnCXjSD5SAiYdG+rUhgemqTOM2Yqlk7nXsfrtxGKNVaLAoV5LaU5Y5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(3023799007)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzltVUxRVE4wTWc1QXljSktPT3R0bFRvQVRDSzlTNklaWEJ6QUg0UFdJU0Q3?=
 =?utf-8?B?WGcrbURacEw5OW13N1hYK3Uzd2dDQ1pYZXRBWlNSY2ZXaDVnS0FaRlRmUlFp?=
 =?utf-8?B?WG9XZzh5U25NZk9TdjUvRkhqc0NleUU5aU85RmZyYmhIek5MN28ybm44Zy9M?=
 =?utf-8?B?RmwwUGhwS1dFV2RuRTVOSjBZOFFMUG5tVXhMTFNXK1loWkQ3NW9GazJmS3Rp?=
 =?utf-8?B?bExxVTdpM3ZNRnNnUTByNXNRMmU1dGFYRHJGQThEczFaU1RaN3lYeENCRHRs?=
 =?utf-8?B?dTZEMWM1U0NuM1R5ZTNJUjNtaXE4Q0V6U3V3NGV3REJESTE4bFlHdmVsRDY0?=
 =?utf-8?B?SWNaY2ZIaUdXczRnNDBEV1FGWG1ZQVdWb05kS0NFalVkK2pjT21nY2VNaExE?=
 =?utf-8?B?bzU4SGJzak81TU13YXRoK05jcUs5QjVDU3p3bVU1bzNuVDhGUGJURlBFbHJI?=
 =?utf-8?B?NFFOVXJNMTJ3clBDcTdhRDBaNlorYzBOZnA0N1c0TjBENldwVVNaMVJha094?=
 =?utf-8?B?M0dFRWVwUmQ0ejFvUWtLS0tTNXp1b09zOWFvVkQ1eVBndlljeDFWaFhtaWhk?=
 =?utf-8?B?Q0tBM3VRTTBRTitXNnBYOG15Y0FRa1RXOGNZODcvTkdDeUxkVU5LTXdOWUtY?=
 =?utf-8?B?SGJ2M0UrODFyOGNvb1BXSHd6KzViUjRvUXFiY0dGdDlvYTRTWW8zdXJ6Ykc5?=
 =?utf-8?B?OUlsVXVwOGhyeHFJaEpINHcvcTFmTkE4LzNRVFZVL1M4bkJaWUl1S0FvYi9z?=
 =?utf-8?B?c1JVUnV1OWkwcGNYZ0JmSTBlMkpIb1hQQzZDZ2VTQVFxMnFpVnk3a0dLaitZ?=
 =?utf-8?B?RE5XaFZvUHlDbmpRd203VVJsU2oxUkJNTStsWDV5T3pHNUlwZTMzTXhTU21a?=
 =?utf-8?B?Yk1IR2xjdVEzRFRSaTlYSUgrQ0tWcHN4alQvZmxBVjZOaFdSdjhYZVNNajFP?=
 =?utf-8?B?RFRsWGpNZTI0NUVieWJGVGlLRGZsT0Q0dmJMTk4zalZlK242YmRaNW9GTndT?=
 =?utf-8?B?c0hKQnByZVZWbmV1c3dFMUZhT3ZDZzU2cXMrM0I2N0FuQnppZklLL2NzaHI4?=
 =?utf-8?B?dHhRTVY3OGgvTmczaldpMVFmUzNKYW5STHl1NVFQbnlvNUxZV1dpRkRjYlp6?=
 =?utf-8?B?Qmd3K3YzS1ZHdFEyVmF4d2o1YnB6Zzgya0tzV1JtaUVKZ29ESmZramtPNGhx?=
 =?utf-8?B?a0twV0x5OFoyS2U0WkN2bU9hbDdoTjhEUW56azBxbW5GcjI5WmNORGplc1p3?=
 =?utf-8?B?eTcyWFROU0ROWGlkdlNQWFpSVVUwR1p2WFFoZU1XR2dNNm5jSHRDMmdyWHYw?=
 =?utf-8?B?b25aWW83bnhRQmo1MWd5Y2psdmtyclBCc2dqZlp2aE54RXI3YnhBTVBuZERn?=
 =?utf-8?B?emRLSUwwOGU5YXNGUHVTTTFCSHJDL0k3cloyRTZmcXRXaVF2WHRJS1FjZ0tR?=
 =?utf-8?B?bEJJUDY0cEpuc0FSZVlzZGhUTDBQbkQwTmNQUStPZ245WEdZd3hwRU5GMm9r?=
 =?utf-8?B?TTJWL0hYcGZJb2NYVW0rWmhzQXI0emxwZk1FaTlRVVFPZHZGNXNxWGdyKzZJ?=
 =?utf-8?B?ckJ4M1hORDk0TDY3bldyOCtsZFY5ck9JTWtVTEFFRkdZNU5Hc1J0eWUyekRI?=
 =?utf-8?B?VkJFdkUrbmF2REl5WTNwOTc5UDMyNU44ekJ1dVRBNjlRMHhZV1R5cXJNNUhL?=
 =?utf-8?B?Yng4Rkx3Ni9aTUNhWTFLK1F1L01RbTRYNDZWOGF6ditXNENnQnc4UC8vVzhh?=
 =?utf-8?B?YkQ5SGx1bENkMUZ0UGljeGYwWmlhZkRJWjBBTHJIL1daZU92T29FVHFkWmYv?=
 =?utf-8?B?LzJLTVFNa3N0M2pBOWh2WnprN01SWS9ub1hSbjNvcms2dmROa3U2ZHFZWWlN?=
 =?utf-8?B?ckVSYWpyb3hMVGRBaFJvMEJQeXpWQkQvUGJicC9kSGdkS3p6elJDaGFnaWZE?=
 =?utf-8?B?eExKMldwTk8rV2NRVWhlQkEwT3RkcUNYaVcrbjR4QmpxWXZYL0VsQjNRK3Uw?=
 =?utf-8?B?QVJ3WXcwMCtWbm1kVC93VExHeHVlT3dKTTJiM0tsa25QTnRrbUxaZlZzbTVx?=
 =?utf-8?B?K2N4UmhZS0krWGhacG9JS05iN0hONGwyclZoSmdSYUtUV2ZUQlRvNXZjakZM?=
 =?utf-8?B?ckVyUUFzWWd3SElFc3RNNTIyekluZUp0bnVKTitaUVluR0p4eW94bDBjYVJR?=
 =?utf-8?B?RjZrQVA0QTlzR0pheXRhamRJR1E5K0lNQ0ZCOGkyeG5PbVdJU1E4U09QY004?=
 =?utf-8?B?SXRoVllJN3IyOWozNkpGNW90S0h6T3Fwa0tZbGY2NlhLM2lDcnpxY0lWencz?=
 =?utf-8?B?VHJFUERMZno5V3JrMWFJbnorQXhjZWhDUjZtSWhHZ2NRK0taekFpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea26e25-4440-41e4-143e-08df24f586b0
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 04:35:05.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dszZZwS8v/q9FYSzGi1X/rcqfyTSfdKfx7osmM+rLjQb6Po56AkJkAn6/Nh5h4Yppr0lSE2xCT0jE4yeiJzTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697



On 10/8/26 01:00, Mario Limonciello wrote:
> The MECHREVO WUJIE 14SAH exposes a single ES9356 SDCA codec on ACP6.3
> SoundWire link 0. The peripheral and its UAJ, SmartMic, SmartAmp and HID
> functions enumerate, but the ACP6.3 match table has no entry for it.
> Machine selection therefore fails and no sound card is registered.
>
> Add a link 0 machine entry containing all four ES9356 audio endpoints so
> the generic amd_sdw machine driver creates jack playback and capture,
> DMIC capture, and speaker playback links. Select the ES9356 codec from
> the legacy SoundWire machine configuration when SDCA support is enabled.
>
> Reported-by: Zachary Huang <zuzhenhuang365@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222092
> Assisted-by: LLM
> Tested-by: Zachary Huang <zuzhenhuang365@gmail.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> Zach tested this and it helps AMD machine driver side.
> There are separate ES9356 changes needed that Zach will send separately.
> ---
>   sound/soc/amd/acp/Kconfig                |  1 +
>   sound/soc/amd/acp/amd-acp63-acpi-match.c | 50 ++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
>
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index b7b7b4f4a55ca..a62bf0fb1efcc 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -181,6 +181,7 @@ config SND_SOC_AMD_LEGACY_SDW_MACH
>   	select SND_SOC_RT715_SDW
>   	select SND_SOC_RT715_SDCA_SDW
>   	select SND_SOC_RT722_SDCA_SDW
> +	select SND_SOC_ES9356 if SND_SOC_SDCA
>   	select SND_SOC_TAS2783_SDW if SND_SOC_SDCA && EFI
>   	help
>   	  This option enables Legacy(No DSP) sound card support for SoundWire
> diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
> index 1dbbaba3c75b3..4f448c711c2cb 100644
> --- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
> @@ -117,6 +117,42 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
>   	}
>   };
>   
> +static const struct snd_soc_acpi_endpoint es9356_endpoints[] = {
> +	{ /* Jack Playback Endpoint */
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* DMIC Capture Endpoint */
> +		.num = 1,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Jack Capture Endpoint */
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	{ /* Speaker Playback Endpoint */
> +		.num = 3,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device es9356_0_adr[] = {
> +	{
> +		.adr = 0x00003004b3935601ull,
> +		.num_endpoints = ARRAY_SIZE(es9356_endpoints),
> +		.endpoints = es9356_endpoints,
> +		.name_prefix = "es9356"
> +	}
> +};
> +
>   static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
>   	{ /* Jack Playback Endpoint */
>   		.num = 0,
> @@ -465,6 +501,15 @@ static const struct snd_soc_acpi_link_adr acp63_rt722_only[] = {
>   	{}
>   };
>   
> +static const struct snd_soc_acpi_link_adr acp63_es9356_only[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(es9356_0_adr),
> +		.adr_d = es9356_0_adr,
> +	},
> +	{}
> +};
> +
>   struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
>   	{
>   		.link_mask = BIT(0) | BIT(1),
> @@ -478,6 +523,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[] = {
>   EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sof_sdw_machines);
>   
>   struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
> +	{
> +		.link_mask = BIT(0),
> +		.links = acp63_es9356_only,
> +		.drv_name = "amd_sdw",
> +	},
>   	{
>   		.link_mask = BIT(0),
>   		.links = acp63_rt722_only,

