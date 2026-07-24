Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44532C937;
	Fri, 24 Jul 2026 05:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869564; cv=fail; b=LJYT1czKWP7JrknizAucYWJ1av7E05llIWxaE9swOpPdHQUv3EwLqdBM4J8oa4keyBeAMhawYo7fPq//2phF4a/hCwJfp5ROx37OMMIDR+od0dwLaOCgZOs0x8GmUX6LArrdC3muCuk6MOysvkRtTcbf3Wg6ew/tMRJXbiYt7Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869564; c=relaxed/simple;
	bh=pwiqfcDCWCR1c177le4tCesHhxEjiiKORS1qk7GxFck=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MyXL3cmzbjilFVoSvaRk8vYIsgIntBODSpCBLLISrBm+GTa0SMfxud+CXjanIsI59MvcCR/TBh17MkW5ivAVmYAzoHsqa2WsKsG10Kg7yjB/X1kAyJKTXHSiJhhp71eeprIEib/F4UOFh2vPMW6n6xR/ztSVdEcJMCyEVRWFQB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qbCKKz2a; arc=fail smtp.client-ip=52.101.85.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qbCKKz2a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMaq29DqcOES40g+rxuqPQtDJQqiYY96c01F4YeT5nsbriclYjZZaLOOlwfOtpzKNCCgigZkaJwRv6MZVQusaE6nEAXhG7+/27SHsnis+iPhEasgDC0A4p6e/r32OJjnVzctdedafSaWWdMn+x4f17FgzgBmhBIcRR1KF9qQLH95a++hY6aOJYWW1QfDf+ozc+iaSWx4aoYnyvouQBmQ4FfD81jlB/cQhsKZVOINETc4yfgQizx6PfkAXe36611Y3hJLVPb3wtgpXGilxqNitY/U3nAPlHLl/Ld5BiK1uQN8kxjgpTBLXJzY2IKM4tu9cVmtDM9i9luODBLkDemKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/We2fES3DvWZfOA0GaOmUB9kcX+Pood0ugmqxojMX1s=;
 b=K1aA4gf8NKkOv9f8PqN9ZPorULBe7HVE+hup33RN/Z1BId4RapjnJLmjbJ6d153of2DwdS5qAWpm0wRZ77bmsqgxjV3bIJ5Va5hRS9YoZ+sjbzbG0RekdnGrq9zfH1WnIoXyjgu7ZfdP0xsPpFCesUdMTUy3s9uopmkDoHnNUqEkVwpW5HvmoV9W13lZupMn6ezTN98/ddgg/H+edMzrKoGrzUuXwQXxVNkTumi9F78E3aIbVH9VbxzoSWwYwco/UTeKT3eRlKXTzow3k62ymKvE0gbogtUWOnF41OMsOn+DcsQoBKx9abVIYDskTi1pTZ7cqtAAzXBF/D34UDvv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/We2fES3DvWZfOA0GaOmUB9kcX+Pood0ugmqxojMX1s=;
 b=qbCKKz2aXxzhKhsd925mKjh6O+A4im+1Kf4U+zM0VOa94P0Tg0F1lHnziRiY2lRltzno0rEr1jk+hMp4zoSdKHEwCdq15dle6Vm4dPCozfOm7Gw2yVEK9gJNhIx7LP2YmL+zp9tA6miGNczHO21LqYPa23XWCouuNfWobU8Yh30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH1PPF989868826.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 05:05:53 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 05:05:53 +0000
Message-ID: <53a757fb-c716-4f71-bb43-80a3e04a3b8f@amd.com>
Date: Fri, 24 Jul 2026 10:35:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/36] ASoC: remove conditional return with no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Julia.Lawall@inria.fr,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 sound-open-firmware@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-15-ekffu200098@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260723184538.3888637-15-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH1PPF989868826:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d16d970-d60f-4a7f-d693-08dee9413c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|921020|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	YSv43cWBvKYvDaYm/mLR6UOqoRfLgrXlwE2v4bfev8ILYsreK8V9luI68cxM1jGI5Co1gSgVHzD5yzC1h3iNlAHB+mW/vr1YGMFGVHIsXOiGwhCd9gc1KGULtAXe9rmNFW0KkdB5qGc5qShfG7gYJSMmcY4E15pSl6TdOFyUBar/rkBp2L947bQW+E2QtiOizjtpykxmV/dntjiJRMY4dzkHwpzdVQspwyGszgYbEst5lG5Bei76M9ECeQa/BSQZceJGm9IqUlN/Mq40W3GbKfUCRQfSLfqMdafw6U0dQ+W8hNygKVPTFOrRhVgYLld+j6tb4QDrexcbeAl0+BU8CQhDGb2UxVKE6AK7U7kmgLlAo4PsiKCVUIWhDoD1YKhRiX2SJZuw7kA9qmzR2W9u4cNbfVLrX/EQTq/unFo617LC4n4ybeLljnx8z1CYpC+xM5QHAjeZbWQRgdICZYbqCekY6T5UlfkDJOpa+4V0FTWUo6S2qRkh+9kQ5pHzNpLqBtSLI2CI5LesNJUvwh3qsqxFA2hXjzY4PdV45cskr23OS+F0dFkFEPo0Fn+MgiTL7EINCefo0V0VkBR7lTS9eb5NJnuRtAxUntPRMCsqg/M8v+VTkujkJoUhuIrkgi0Yfdfs6V1smf3f+vtBrB2MnD7sl4cg6EpZ9rh6xPU/XM9GWafqGczRQ0vqx+ZMaj74l6OlmlVi+pGcFiELg8PHRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU1PTnVuN2c3ZUwyWVpJREdiUHRleW9LU0ZwdDNFQWRwQjFiR09MUmVNdmJ6?=
 =?utf-8?B?ME1OYWZtU3FUZzNQcnZGMU14NmVveE1VQUdxY2RIK2x4K0RCajZlSHVPZ3Zt?=
 =?utf-8?B?ckpzZHNyc0gyMk1iTlV1Vjl3MGpyVDF6NTA1QkNwbjR5ajF2TjdGVmFYVmRj?=
 =?utf-8?B?T2NROTRlRFd1SnU3SGhCN2Y3Q2hjVjR2YjJzaEZGUDJnK00yRlNrOXNGZVEz?=
 =?utf-8?B?UWQwcDJZaW1GYU1jZEVxN2dIcHYrSEN6a1JJSXVLODRycmpSZm5CeUIxVmwr?=
 =?utf-8?B?Ykw1Yml6L3ZyU0xtaFNyb0ZLV002Q1ZCdUhtSnQ2OWNrYmVGS2JFOGRWeW1E?=
 =?utf-8?B?YXM1SUYwK0tiTlZVVWxUSHVmUWtGYWlDaXR4VVlBU0ZTdFJVN2lrelE5ZVhp?=
 =?utf-8?B?UHpFWjBqVWZHaG1WQ1kyeWNRZW9wUzlxanFCS0psUVdVWDVhVjNSME92NjF3?=
 =?utf-8?B?ejZxVmwwL0taR2hXUHdWaWNxUlJiOWZnekIrcmQ3ekF0Wkh3Z21HdHJHSFlK?=
 =?utf-8?B?UDRsR2hUWldndGFaT0VrUWJWUVcweWJnT3p6TVI2RkdOdUQ4SkI3V3dNbjNW?=
 =?utf-8?B?S2J0R01GOHZ4YWptc3ZSMDg5aDExdC85a1o3YWYyYjcyM3RvU2U3YkVWRElG?=
 =?utf-8?B?T2p6SlBwMkJKQStPQWhqS1R6dXZHS0ExR0NVQkxxNUxuZjQ5VHdoQ25YZisr?=
 =?utf-8?B?M2o0ZWJUYnFGTWNFN2JuOUVFTVF2QnRyMVluaHg5SzdrWnAwV0JIcGt1UVBQ?=
 =?utf-8?B?VFBOR2REL1l1R2pYdG12K3FKN1Q0N21rUmhBRXQ3Q0hMYlBZZHpRbFE0UWk5?=
 =?utf-8?B?dzBrTUNKZ0MxczdMdHRaSWJFU3pYU3FHNXl1TWZiTDdvdzJnd3ovNDhRWXpj?=
 =?utf-8?B?Z1ZHR1hDcUpOenBoZkt2OXpEc2grMFhvK2U1OVBzclIxNVZqeld5NSsyWTcz?=
 =?utf-8?B?UnNmUzc4YTEzQ000U2IycGtsZWpxMi95UFFNVWdINDNuRGNUYmIramk2VkNB?=
 =?utf-8?B?S0Z1RGhYajNBTnVMdXBCbVQzcW50SFNFNDkwbUdrVlA2QzgvL0hlYTVkY2tC?=
 =?utf-8?B?cTdCQnVNVlhaY3g2emdwbzFDa3hWaitzaE1QZytmWGFZYlVUeW1JaXNFR3Jl?=
 =?utf-8?B?SkJ2MERrd3VqeExJc21IY2JIdzlURXlnOTB5K215U2paRjBHRGJZS01yOGt4?=
 =?utf-8?B?aXA2eEM0V2FQN0lCT2JDMG9vc2lWSTFvRmlWTnRZUnlKSUQ1UENrOU1iMlVJ?=
 =?utf-8?B?bUNUd0hZcXY1WDMranpYNmU2U0RtUFhDQ1dVL0E3S1gxZDVTNzA2Q3drbEFq?=
 =?utf-8?B?bEZaN2w5RlVKajRWcWN3N0ZlZmhGNEtCMTBFUjhQVXR6K0NUa3IyVUlhK0V6?=
 =?utf-8?B?ek5lVGZ2VWorcXhjaGVUYzdHWnJZMHNlTjRwQ3ZVbDg4QzV0T0xYNHhiVGV2?=
 =?utf-8?B?ZGJjR25QVlZxSWxraWF0cko5UzY4cmJZMk8vTDMxRUR4VlNVcm13YTZFaE95?=
 =?utf-8?B?UkxWZFV2c2YvektUZ1BUdWlGNWNYQlFzb0NYNWtYbmxWYWVHYis2YlQvVUc0?=
 =?utf-8?B?dzUrQVF1Z2UwNUhMTytWSXk1c3ZMd1VMbmVTSlZBTVllcjFwU3RFUmZsUyti?=
 =?utf-8?B?dUY0dVdqN0dwYk9JZW12enFMb0JEeUpmTWJNMStGcmhBanhLZWRKaEJLUFJ6?=
 =?utf-8?B?VzdhT2V4UFp3Y1Y5S0dFMHFUdTRrKzdPc1hBK2d4a2g4b1VWVURSUEdiR00x?=
 =?utf-8?B?QUtEdHJjWGM5eXUyRk83NkpqL0ZXT1NUMHRrb3kxaWlHMDFjTWt4a3V2NTZP?=
 =?utf-8?B?UWptOXdjY2JqVkJhd0R1NlhoU1RhZWxOZFpPR0xFV2JPVnU3bHRzSlIrRHVX?=
 =?utf-8?B?ZlowRXRVSjg2VVlmaEpDWnpWem1jbkY0L0pMby9VZ291V0x6NUJaV0Y2eWJB?=
 =?utf-8?B?VElyUUx3ZkdzZkpNeHJUTmtBMnJqRU5VVDdWTUk4Vjc2Rkh5bXMrS1l1U1ZY?=
 =?utf-8?B?YlpTcUJrRnE3TERmcUtydEFiQkw4QUZEVHZxblFVSnVkWUxPUDBQNThyMm4r?=
 =?utf-8?B?RnlLSjZnNG0rWHlsWVJVVEhoQzVjelRLd2dnblVkV3V5WkRLRnNpT3d6VEk4?=
 =?utf-8?B?V1pLSDJQOWFBMVJvNTFWajJPRlBXcXFNTEZvWUp1cFR6WjRDYUg2Y0VYTC8w?=
 =?utf-8?B?TnBiU09ub1pWbEtWVkJUdit3TjE4WnZGTmUzaXhsc3BrclowUkRPdFBndFNw?=
 =?utf-8?B?bWRmZ3JLdDFLdTBsTDFpQ0RLSDlwbkRWVkloZ0pNK3RHSEpPRXc0RHJwZVJt?=
 =?utf-8?B?VEgxcFhVcm5QVnQwK3RrRmIzK29taFRabG5GbENXOUZnYzVXZXFWUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d16d970-d60f-4a7f-d693-08dee9413c9c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 05:05:53.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU7JnGtL4jLNEYq4jlancYrAtSWwNSfjD4VKxiWlyiRXZ57TndQjerd8aHGOzEVdGBBwisl4YzecvR2N5jnnPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF989868826



On 7/24/26 00:15, Sang-Heon Jeon wrote:
> [You don't often get email from ekffu200098@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
Could you please separate the changes in to vendor specific patches?
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>   sound/soc/amd/acp/acp-mach-common.c          | 11 +++--------
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 +------
>   sound/soc/samsung/smdk_spdif.c               |  8 ++------
>   sound/soc/sof/intel/hda-dsp.c                |  6 +-----
>   4 files changed, 7 insertions(+), 25 deletions(-)
>
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index ef784cca13f2..01a0aaa60246 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -938,15 +938,10 @@ static int acp_max98388_hw_params(struct snd_pcm_substream *substream,
>          struct snd_soc_dai *codec_dai =
>                          snd_soc_card_get_codec_dai(card,
>                                                     MAX98388_CODEC_DAI);
> -       int ret;
>
> -       ret = snd_soc_dai_set_fmt(codec_dai,
> -                                 SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
> -                                 SND_SOC_DAIFMT_NB_NF);
> -       if (ret < 0)
> -               return ret;
> -
> -       return ret;
> +       return snd_soc_dai_set_fmt(codec_dai,
> +                                  SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
> +                                  SND_SOC_DAIFMT_NB_NF);
>   }
>
>   static const struct snd_soc_ops acp_max98388_ops = {
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index 9ee4d9926e06..a4c8cbfba096 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -236,12 +236,7 @@ static int sst_platform_alloc_stream(struct snd_pcm_substream *substream,
>
>          stream->stream_info.str_id = str_params.stream_id;
>
> -       ret_val = stream->ops->open(sst->dev, &str_params);
> -       if (ret_val <= 0)
> -               return ret_val;
> -
> -
> -       return ret_val;
> +       return stream->ops->open(sst->dev, &str_params);
>   }
>
>   static void sst_period_elapsed(void *arg)
> diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
> index 2474eb619882..515e4dfc1432 100644
> --- a/sound/soc/samsung/smdk_spdif.c
> +++ b/sound/soc/samsung/smdk_spdif.c
> @@ -130,12 +130,8 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
>                  return ret;
>
>          /* Set S/PDIF uses internal source clock */
> -       ret = snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
> -                                       rclk_rate, SND_SOC_CLOCK_IN);
> -       if (ret < 0)
> -               return ret;
> -
> -       return ret;
> +       return snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
> +                                     rclk_rate, SND_SOC_CLOCK_IN);
>   }
>
>   static const struct snd_soc_ops smdk_spdif_ops = {
> diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
> index e9f092f082a1..b9b2bdff4ccb 100644
> --- a/sound/soc/sof/intel/hda-dsp.c
> +++ b/sound/soc/sof/intel/hda-dsp.c
> @@ -1114,11 +1114,7 @@ static int hda_dsp_s5_quirk(struct snd_sof_dev *sdev)
>          usleep_range(500, 1000);
>
>          /* Restore state for shutdown, back to reset */
> -       ret = hda_dsp_ctrl_link_reset(sdev, true);
> -       if (ret < 0)
> -               return ret;
> -
> -       return ret;
> +       return hda_dsp_ctrl_link_reset(sdev, true);
>   }
>
>   int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
> --
> 2.43.0
>

