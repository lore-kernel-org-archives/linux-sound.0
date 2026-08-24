Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4E3AC0F6
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 05:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549675; cv=fail; b=uSjTiXSYTLbErI/lTne0dY0qdtGZRoSAWPwRXtNOE6j4F79CQzvHmPEWp3uHz9OUu4JmlHlIoG3tfA+A2j1AnlQeMvs+B/Ipjw26n4c39zmldhUTaHAyVC9iMs1Waq/sBnUXFjv84X6KD1PhZKXdRITv/rgs6BhMyPIapGnG2OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549675; c=relaxed/simple;
	bh=Ke+WCT/yFYn3e/SW1Z4pfaqLhN2cWyYBRFB+w867Vss=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5jZ95Bht8Gko6momRFlrj/aieWY4V2XvVbNcU6BH69RaZaYSiG9l9xtwWQmnr7W0fi5adJMGootrWRJdPY2aKi/ZyCrSfbFYihi9idGlJ4wPQpOLRn5sHp33TGMNs0lcxrwD5dQI51uiX+tzsWaYsxEHNK9OBScI+4el2rN2Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jbLX6DPk; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jbLX6DPk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7AF6mKm+zt+tNUTnQ844SKBvS6yS4LOjZ1iJhVD1OZ4SjvodCMRnYsG9ODMGmPD9gHAOHCIB5/ze7ZK9lw/nZWV1X/tu4m+GYlbeljKZ1gb2PaYKG+HGMvbVdRTKkEKN4Tc6lud8g72RHW0ziAii7xkvAw2Qqq6NeSd416s6PNZ87j5Shc9YZzK6zdJr49aEm9BjEaD2tFSU+TxxAgD4e7gW+KOQ5ZXtCT+f6kz2YrMYR0Xy75utPyaFkKghCtlyNonq1+CJ7I0qM+3th4FtKUpKl4aK3gt/KVj/UDkoLQcmSxrgkJUqcgNVcUbAMk30n05mxUSYC4iYXDUC480YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNekpVxdrEK8W8amgcfZTym3NCunb/LM8LASgREUwAk=;
 b=QodI0J0JST1kFwvs56coUyxOxqv59eQn0NLaOSf915YT9MEg718pSP2u1EFUgWt7Nx6QKNoN678YC5uYukYEfZXB+1F9jhqhB+eQ5waSjW1qqqvxgwW33cJYfvShkB4tmWX9Nm6dV8QHqAjqRV2N1Lzi5ebUvXP934euaTBaYIUSb8g3xvKo6Hr8o8g1BratjtmO8FkHnXCvZcxxjxpR3MrF+qzvABC0ZCUNuZcIaOllEVpwfe+IPz2Q1E5ZhlKA1lZLEef2plkztsBHz+C377AK76R41olUUdRyY8B/nnU9ieME7gowmR2zGF9ARGWqclhxbdevxL6rmopojG+Uhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNekpVxdrEK8W8amgcfZTym3NCunb/LM8LASgREUwAk=;
 b=jbLX6DPkMStAAxCpn4B5RdbhO8KbEpv7SEyYyI9JYXv57XTe0FEAmrutLfULAAtmqMVcGY7enrHcdfy48l8UcoTFfKfG5Qjd7m389XJUXSMPRaeyfaH69SDx4Tz7tB+ELFS0fAgqvqpdrLoAiBLDDDl0CZzJ4QUjZzj4do9SF7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Mon, 24 Aug 2026 05:34:22 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 05:34:22 +0000
Message-ID: <aaf48710-f1f8-4fe8-a6c2-e54019c3eec5@amd.com>
Date: Mon, 24 Aug 2026 11:03:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: amd: acp-config: override ACP config flag on
 HP OmniBook X Flip 14
To: jml <jml@carbonforge.ai>, shenghao-ding@ti.com, broonie@kernel.org
Cc: venkataprasad.potturu@amd.com, kevin-lu@ti.com, baojun.xu@ti.com,
 sen@ti.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20260824034153.50193-1-jml@carbonforge.ai>
 <20260824034153.50193-2-jml@carbonforge.ai>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260824034153.50193-2-jml@carbonforge.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::17) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: e11b8d42-23fc-40fc-5343-08df01a159cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ShmibpL4PMCXhUbNUrFhfdA7m2dhElQruUWiyAUjNkQvpUeRJs7wpWgWbt5Le2ZapYX0cbn1MXKPiTBTYg4lK8YPWbCP/47S00hgZinwMqrP8MHINvrkqI4+Zf+eQj54wFkZ7HWSMTRWaCsx1LV2otb1olApMtteKXQ92j48IGWVgTDaHZ+fjGM7hPdxM2QvuzxxdLtHdjYuyoeJ7WOttt/PbjJcHNXs9MJtMTFEP5DsAciyv7PV6akP6xum1Nm3xcthPKCXrYMSJIsIV6IyfT9iTH6Sh/Kv4w8oDZvo9h48lWhnOq/FVGnGyrXf9OpJb0UdQrXVtO/CDpegVzxjYAZvqLIliEZPHnPAmn1k75A6GQOqt36bA0RBPbuouKJ4dSY800TmFQHZS5aW7LEjkokf/GWI8EaOb41y/JIcG5JBiTI4Q+hVKKTKoYCwko3rCWb+zfAOXlR9rq3VuOSKTh4ohyxe5FcwaY1dwbKWxG1sW6dO8oONSAApabLqwXQKQxKD5A4V1S7oTNcv88PP08agqQVtE1KrilY5UCVpiCuSueaSHoCwcAbDjEvtu9TwQthM1KO3fnG0z8TLYl+ZRJSkWkSgi9/T2oebyXovrRq/J31+JRD/542+QVo/2RhEaH/NEczNwo4f7vaxUvoxFWKLW4KBM6phvCV+qr4MUnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzBrQ2s2NVR0VWZmMm53anI3Mlh3bnZZdk5OSjAyK0lRMjRZVnEvME1XbXB3?=
 =?utf-8?B?TDErWHYrcDBSOFRMeTNKMXdDcmRJWWpYZFp3L1hIQWJJYlR2RGMwRGNBcE9y?=
 =?utf-8?B?eTJtc2dSRTg1bTRDalE2NXBOdnlLQWhDa215MzBmWjBPMVpCaGhvekVxbSts?=
 =?utf-8?B?NUdyaDBrcWwvK1NjQXFVWHB3VW45cFJ6OFRaUkRHbUkvUE5EblFMQkozSjFz?=
 =?utf-8?B?ZVFDMjRkZzdBWFR4NGpPU3lxckVEenVvUHp0ZlVRUmpYK2VqRVJLZUtKUjRS?=
 =?utf-8?B?YWlwSTZDU0dQT09YSzlTNnpBUGtCL1JuQy9BblMrbWc2MU9LM2tmSGtSTzN6?=
 =?utf-8?B?VW5uYURDOU5RNEluMDVRN25jZVdQOVZQNG9aZmo3WitlZTh5QnFqVFFqdXcx?=
 =?utf-8?B?azd1ci9sSEZZVTB0RVNIQ016Y1N3US9LSmJsK0lWWDNoT21ZckMyc08rTW5t?=
 =?utf-8?B?UkVDSU93NjdqUGV0M2VCb1NUbUlaQzZiUms1b3plclVHTHlaOHIxdndXZWhF?=
 =?utf-8?B?ZUdKQmFmMjh0SnVML0dwUmlOa0FTNW9hRkkyRklsV2JlL1BLcjJzRFI3SnNa?=
 =?utf-8?B?bW40UWVTNFRTdUhoRDNvYXRqeVFUaVFpdFpDUFVydXpacEFZWTB3SVdFeUh5?=
 =?utf-8?B?N3ZFaTRLQTc0ME8zRDNKSU9UOE1wN0NjeHR4a3Y0MTlJSVZxcUp6N3FlUWNx?=
 =?utf-8?B?N3FnbThMeUdyMFZwdE9Rd3IzUkYxMnhiY042dElQMmxnUWJ1VmRnVi84Q0VI?=
 =?utf-8?B?MzIvRXlSNGl1bCtoeTRJQ0tEWVQrRlF2UHphQ3Y0T1h3OFordkZja2JSdTUw?=
 =?utf-8?B?aGdnZEwvazlOZFluWEh2dkdXU3VkNVZsNk1IeFN2SXhydkROYm9KbzlJNzN0?=
 =?utf-8?B?Q0RuRUhIWjVwcllWcmJvcm1FVTV1NlNqdVMyQTlLOGN3MisxdnFzYnBDbkNG?=
 =?utf-8?B?ZTUvOWZBRXBXUmowa2RrcVZPeHFkRCtyS2ZKMlp2aytTS1B1SDNVaEtGbE1H?=
 =?utf-8?B?bUtBVFN4ckJwOHZvd1ZWQnFFM2M2UjdoRUVKby81UnV1emE0WWdTcGlLeGdt?=
 =?utf-8?B?K0UvclJxMXRDeG9wekxsa2laQUdJUFZZa3Y3UGVMR3ZybkZzRkdhcHNOSTFS?=
 =?utf-8?B?cktRMWR2UDh5M2ZmRVRSV2wwZnVoSkNJUGVLQXNMZWJWby9oUWZ2clFDODZZ?=
 =?utf-8?B?SGF1c1ZQaFpVR0x5MTFlMUtxRmo2Q2pzczY2R1pka3lOeWZEWTZCVC9PY1hp?=
 =?utf-8?B?VzVZQ2I5RE5uSjRsdGhBdzhJbWZqWTgrM2VIMGVQNzd1SUhIRmtBcVhVTzRz?=
 =?utf-8?B?ekNuNllWelI3aDQ2cWk5VFRLWGd6KzdYblFUcHU0cGI1Ry8wTys5SktIUFJk?=
 =?utf-8?B?cGt1bUxiVUdOME10dFRua00vS1U0OWZZMFlFWW5PSVBPVVMvT2IyYzN5N0lh?=
 =?utf-8?B?Y2pXcmNmOTR3Q1BIeG5LbzFKeTVCaSttb1RyOEVWeVcxUDJqSHozdk9ScVdF?=
 =?utf-8?B?c0ZHNVBRS3ZLeTc4OENrT3JKVzhJZGVXTVlROGdyM1pBbHBMdmVQdm0wenVq?=
 =?utf-8?B?QVF1UFpBMjNwaXBtTldmR2hYcUZSbklaTEZVaEdHYjluWGpTQlB5aVdzL0dZ?=
 =?utf-8?B?cmRsOGNIeXNRUm1KUFh2a3E1SWpSNzUxajFnUDZLd3NrMWxwVTQyOXpTQnhH?=
 =?utf-8?B?Vnlsa1hBVkFBanYxbTQzV2hJZEs1V3N3RHQ0UE9GQmpPMk5XR1g4ZG5PMTNp?=
 =?utf-8?B?cG50K0x6UkovdnFCeEh6MFordXVnZ2hwZnJPalhOK3o3TTZ3elJDejI0UmIx?=
 =?utf-8?B?bjExTGwvZUM3UkcrMFpyVS8wK2JSRDVPblNuWjVvaEVyS0pScCtZSTFVMjdS?=
 =?utf-8?B?TjR6YU80T09iTEhHdzlpckhaZVRndkpmN1FyejJ3eXFFMkJRUkdwSWI4WHhY?=
 =?utf-8?B?akl4MmlET0JMcU1GZE8zbDcya1U1dHQ1ZFBqR1ovczN6ci9mOGdYT1BlL3du?=
 =?utf-8?B?OE9KdXRvNlJpclhqdEx3d0pnTW1IYi96WXhHYmR4bTdEWXp6WGF3QXo4Y25U?=
 =?utf-8?B?MU05L21DblVXdHAyTW8rVEVDZUpmNTRQSUZqRXF0MzNuekFPM1hMUEJWTVBI?=
 =?utf-8?B?Y0VIVGc1Z1BISWl5OWx6L0RxVWtjWW9NOW5YdXEzOU1KcnF5UW5UQ0UyMEJT?=
 =?utf-8?B?bnltdFRsNjc3Qk1nZ2RDSXNnOVJ4VzczTUlnYUFWTkVYUGVIN2U0dElPNDlJ?=
 =?utf-8?B?L0I2eHFjdnBOZzhhVFExbFFhMGNCOEZGV3d3RS9QdEpwZ1FoMjFVK3lIcEJQ?=
 =?utf-8?B?RjkvUExBbGlqNWJXeHZuQ1pxcm5Wd3dSMXZRaWx1aXNKeVNkTDJ5UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11b8d42-23fc-40fc-5343-08df01a159cd
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 05:34:22.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip1GKjAmO2Y88+TJ6ymf9F1KKPbHJBvoPSnb7fACIDUGw0WxDfx9cOENxDPpPeho0y2jh3EPJ/CPfDJgAvxebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871



On 8/24/26 09:11, jml wrote:
> [You don't often get email from jml@carbonforge.ai. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The HP OmniBook X Flip 14-kc0xxx (board 8EA1, ACP 7.1) does not expose
> the "acp-audio-config-flag" ACPI property on its ACP device, so
> snd_amd_acp_acpi_find_config() falls back to its
> FLAG_AMD_LEGACY_ONLY_DMIC default. snd_pci_ps then declines to probe and
> snd_acp_pci binds instead, which has no SoundWire support at all.
>
> The result is a machine with only the PDM microphone and HDMI: the
> SoundWire codecs driving the speakers and the headset jack never come
> up, even though a matching entry for this board already exists in
> snd_soc_acpi_amd_acp70_sdw_machines[].
>
> Add the board to acp70_acpi_flag_override_table so the config lookup
> returns 0 and snd_pci_ps can claim the device.
>
> Signed-off-by: jml <jml@carbonforge.ai>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp-config.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 3021dc498..a545dd679 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -30,6 +30,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
>                          DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
>                  },
>          },
> +       {
> +               /* HP OmniBook X Flip 14-kc0xxx (Krackan Point, ACP 7.1) */
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
> +               },
> +       },
>          {
>                  /* ASUS Zenbook S16 UM5606GA (Strix Point, ACP 7.0) */
>                  .matches = {
> --
> 2.53.0
>

