Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4563033EC;
	Tue, 11 Aug 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458712; cv=fail; b=r1Aa9TTRqjQHpo15zbfGaAKK3JgGIDCvaYu0GXmvsoXgXUkiECPXfLa5+fVTaC55bDO1NPzBX+Crvm2mAgsti/Gf1tMwBBWnU5Ap+MUkxvMIa9nXPLcNzAaPiF9ARfXoO6biwnyGnmduk0qDsYkyPsbr8y/ibFCeS7xMq6bVw4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458712; c=relaxed/simple;
	bh=KjE1l77EafIML2EjP9eoHTnDokL6eM4FIwo/8zonks0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p8Co5et3UX/gmUIeKEXuS7mJ4mG33HkjkfnRG6mvQXq3QuSkAbY0dgP0X6sHwrJdSdJRECm2dErD7UJRUUIz9G80FYTPHDMe1n7iEggVVoQSsec1a3orHiFLcPFEuoxIlxuwNCp5l0VQgpJOG1M3KtH8SHZXNjX4mC+g5FPLNww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hiLrCSax; arc=fail smtp.client-ip=52.101.48.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hiLrCSax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YARz2cG408EEM87B7V8FrBBlFTZnj+D8U4Nt1wkKRepwuLZ+zJAoWEOUCgvlyetA74GvolO3d4bCAfprH0798F1DoYsZnU3XKR5csy/lBzhsS5PHpdcQy3uiX/DLTUrtCOrR58ZcAH84apJN0aIMuhpamoW9TDwMQcILzJOHDP/BsjmoqO9Xwjp0ao33IwDHB/B3IVqP8JsPpCKkGeOF46jpDbDxZwJHvHIadoJbBvJcfYtBvEXlpkDVo5a1mTSmCATSrYW29NBgLcdBCl0tgtM6bzQ1gQociBvnc9gkNv1/lwXP3T0J84Dr54VwqtD1Axml5OAquzS0gTeYJmD7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqx7VvheKSq5gids1/ZCg2FX0g/OvfXxbBdwqvV77fw=;
 b=BcvuK4iWLsSoVvDEelt7ckrGkshthFriI4zBl1CBK36ZMsNWUz2+cqGYrd7UIqRgdH/McbhlJZFG8w1ToqVYvEYIUUVBGO8AoSsC9+6TA+LFZdgg5lCiOXKRltvWgZAgqlsLEZwcIfvzg36tRJEZHGU1oc53s663u9RRP3xUtT4+oPFjeIiQGl/DlOxlU0obj2j62ZfqMiPodYZH1cwMtwpRRskhHNYFv3M7jauUXsKf2l3dcLnQ+KNmmQccte3RNCZDmK96UjswKvQuHJfI8DI654fFdeeOxeXjxhRkEQWhfw3LXreYojcFg5qxAQ+Keg3ETQYqqChuFCoUDkhoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqx7VvheKSq5gids1/ZCg2FX0g/OvfXxbBdwqvV77fw=;
 b=hiLrCSaxxltyz/SuBpMf1+QNb4gYMkk2Q5NlNdhge1y3fxflyGSFRhIUJIoRsFnUKQAw5aZqqQrE/GyFVphL9OodPtW2yP45veTIC4/pziGoKAOWx2gwrcYs/F7O/84UqGvBEuaJYIr3o+d/EjqPJEU3j8RB2QWQN6w/eDUP+bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by EAYPR12MB999179.namprd12.prod.outlook.com (2603:10b6:303:2bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 14:31:46 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:31:43 +0000
Message-ID: <c9c55a58-5d1b-44b0-8bda-e5ae8b539481@amd.com>
Date: Tue, 11 Aug 2026 16:31:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: use devm_clk_get_enabled and
 simplify probe
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260806233812.31851-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260806233812.31851-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:610:e5::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|EAYPR12MB999179:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b840d8-998b-4a53-eb37-08def7b54417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AaSKdEVu7PqOLmpZuFmVnzqZ2RgukwmNx3UPOrqRedUlPIshFqkd12zQXEyLdFLdNU5kY5SjXkVhHeNGbG5MXON2XrEWwQEOgcTlOQJToH/NvGobAAzrxafXK3CL55825uCdGoA4qDDzI2fPb8EPvphkov27GKZulucqY+MnWybyX5eaBoSt1wDp+PakV+e+wYxlZqzQ6PH49wjpoMnPkWQm3fWnSJ/8azrE7leke7RK4vXyywLiokB+GmDRyUn32dlbM4aIIkMDgVTu8zd9n5mHD1u5l3RA8dys5HfpuO+VWQwjjQN91Pa+7qYtb38FhnqkPMMjNz8pCerRckdzJeOdvLIVholbww3wGwKgemr3Zaqnlq1YU+wmh1zjKOC/BP62ryN5eSI0WSRm01YoPOWWPLKnpW9F8mWBTSOSfT/IuEyWIifJFHmIw0OQ2Ivx1+mWfn5YGt6O73rwcWamVMqB5FRgff9Sa14iNtY1580KejTp6HutugbpCaFgMjerTGIoi8/AAcgKtruIV50YH8/D7lff0JZuufk7iXlUSIF03mimNNj4nztKWeTSdEfef09HmKbVCJXiJIdCYDlTvVHfQVu2OWLHa3FTOkDynpBkqa+7Ke2BIBFpd85jmAcO/HE3Be+nsGBoTRcYOXh54c1WVPhCDz2knbg28C6+3Jw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG5qNDNReHhVYllmc3NFTWdzTnNwNmhNVm5EbnMwamRLRE9leHJpdE9sYVcr?=
 =?utf-8?B?UVJ4Tloxc3NmajFLS3c3bTNTR2tzWVNSWWp6Ylo3OVdCL0g4SzNQa1dFcmtl?=
 =?utf-8?B?K0NzTXBLOHBUSDd0WFI2dEVFc0RURG0xZFc3V0hETWRFdDl1OUJhT2toODZQ?=
 =?utf-8?B?bFN3cVJTeWhnTVRkbTlFSGFJbDAvd0hoTmpsUHA3YWV5OXk4NzRCOTBRZSsx?=
 =?utf-8?B?cy84TWZFbFpnWWZaWjN0VG53U2ptb2J1WU41QmFDT2tjaDNMZEEzcE53M2E0?=
 =?utf-8?B?cFdiTTFTL0M2L3QvZlVVYldyMDdUSXdZK2h6a21JTEx3cENJWmtWd0ozVnp6?=
 =?utf-8?B?V1JZUExrZlJKdEI2OHdiUS83cjJxUHNBanh5aVBQYTBqZWR4SFVBbE04M2ZN?=
 =?utf-8?B?YkZJYnhuRnk3amVmZ2lhNEZNQ3NrYXF6b3RoMmxtWDFlSGtCWUwzRVJzN1Rk?=
 =?utf-8?B?cFNGYVhuSU1Fd3hnWDdBVXh3YlhVVkQxYW55ZzJuUjhjRDZxZVJsZXpTZVNL?=
 =?utf-8?B?amNOM21PNDZMRlUwOFA5M1g4MXdYM3VpYjZlY0JNK2wrTUFrYUNKOEFOTlg0?=
 =?utf-8?B?OElralJmN2RnbGt6d1VMWDVXUDJBWlRza2xtWW5QTmtCTG1xVEV5VXpZNlpI?=
 =?utf-8?B?b09KbFNjNlpEVVlwSitnMmYxSEpUNDk4OW9zNVBWa05KN0dyeUYxMUYwUHBH?=
 =?utf-8?B?SHZFQkxMSkUyMGRTc2VKOTBzOEs4RFRFMUs0Q2VuTmtTakhYdHVlR0tLY0FF?=
 =?utf-8?B?NUVlM2FJendWRVM4WDY1b3E1MnBNdDhiRmE5enlYR21TOE5jK09jV1FVaEQz?=
 =?utf-8?B?bjBTcEZmSnk2ZVdFTXlKRDhtUjVzUGxGWC84Y3doUFdER2lQZDd4anVid1dC?=
 =?utf-8?B?Mnp5TXlmcGVzdS91S2U5UzV2UHBmWDZYUUF6ZlR3UmswMXk1UGUwMzNyanl5?=
 =?utf-8?B?Z1Y2NEE5UTB5Y29LQW9pblpFZUZybUVBM3RpbnFKOElDSGE5ZVV4ZDJ2NkdH?=
 =?utf-8?B?b0FFMExJeldnQjdYSHdPM3FEdGVXbnVuYUc4SDBDN0Z2WTROQ2xEUGxrY1Fr?=
 =?utf-8?B?RnFZcFEzamcrUi92eVB1cWc2eDNnS2F6SU1NZVpUaTRvUFNGbm56UU5pVm1x?=
 =?utf-8?B?aWJZU3Z0K1JLdHdRZ2ErVnFqZUNTWFVaclppVEJRaXpNWmFoOHFZQm01bjZu?=
 =?utf-8?B?SU5KRS9lYUtDQ3RMY3VXcDZPOUpTZ0M2VWVlQ2IvTXRuTnpRSzBjZkdxYk80?=
 =?utf-8?B?QlVsdEp6WklieHRsMnNhWVZKT3RkeWUwQUltTlo5V2I4YThNMjBheXJGRzZ5?=
 =?utf-8?B?VVd1WGtqUCt1Wk42M2NUY2R3OHhnbjFVeThyZWgxdEMyd0g5b1pGNDRvNU9p?=
 =?utf-8?B?SU81RG1JMWo1YW5lT3R4OHdqT3J3ZG1OcTVyamZTOWNXZmFSOG5iU0RFd0xK?=
 =?utf-8?B?aFJaM0FkWXpoM3dQVW9hQUZsTitzVWZ6Ly8veWZCUHFlYUhqVkw3eHJOTUhi?=
 =?utf-8?B?UlJWNDNUV0lsa1dkMTJVeEpodUxJTGk2MFlrTjRoRVBkNGkvejFQemJieXVP?=
 =?utf-8?B?TTdoWXFBMC9aMEtrMUV3VStxa0RjUEppU0NvekR3RzZXbm45dm9FU3Q4M25L?=
 =?utf-8?B?ZEJDK2pnVHFjendIa0xmTFFrL1ZicXVpeFpVWlYwWVhFV3dVcnNkTU9EK3N3?=
 =?utf-8?B?ZWRTT1E5c0Y0dlBNY1A5MGJ3UktWSTVUN0RFZWRyeGtCcWZCaXNwVTVVOS8y?=
 =?utf-8?B?b20wOTVlUDNLaUpnYVMxbXJvQ1U4TkcwZVVTZ2JQR3hVdmhWTnUxUEUrMG9Z?=
 =?utf-8?B?Qkp5TlB0R0lOOUVDeVl3MVBQcHVUdlpDVVM5clhWVmRCTGI1VHZ2bTRJRzVi?=
 =?utf-8?B?L2h6TlkvdmlUNDUwTzgvOU55RUt3VzVZQTJBTkNobS9ySFpHN1JFTlN5dHp3?=
 =?utf-8?B?MFhzQUxLRTRyeEJyLzZoRDNNeEdxM2ZITU9JeWFlNHlQejMzR3I3Ulc2azRw?=
 =?utf-8?B?TFZOMndpZ3JWNytOdGFBdVN1WVNVNFBhc2xUYXJWbnBnajZYRFZJTGNmbkNO?=
 =?utf-8?B?bEludW9QVlhscHFsclVLQkZSMWJyVUQ4NGJPM1B0Ump2NWphS01ZRmVMSVFV?=
 =?utf-8?B?UXQ1bW1oMHRRT3JyRHlSaGpyUEtvNmdxYTZKWWZ0MnV2K1dJTzlFRDVCTnly?=
 =?utf-8?B?S1NDSkN2Z1h3NHBQRXJ3UlFEOCtxVmhnMm9xNDFoU05zb2dHZHdGbjNPZ3J5?=
 =?utf-8?B?N3ZaVVgvaVZoemhJeEFYZFdUS0lPZkFlbEVBUmZERUhDZ3JXR2k5N2tVZW5J?=
 =?utf-8?B?V0xDYzVBNTF6WGJCYW5UMWh0NWRjRGhFcDU5RUxjaFhVUWo3L1VLQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b840d8-998b-4a53-eb37-08def7b54417
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:31:43.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm5yhqYWNdWmfBVqAYGLfoO4y1oj+BnemdoL2wR4imKNluVOfPInBa7ecSYZuiDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999179



On 8/7/26 01:38, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly.
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> ---
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 47 ++++++++-------------------
>   1 file changed, 13 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index b50306b0fc06..948bc604738a 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -593,24 +593,17 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   	if (!aud_drv_data)
>   		return -ENOMEM;
>   
> -	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
> +	aud_drv_data->axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
>   	if (IS_ERR(aud_drv_data->axi_clk)) {
>   		ret = PTR_ERR(aud_drv_data->axi_clk);
>   		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
>   		return ret;
>   	}
> -	ret = clk_prepare_enable(aud_drv_data->axi_clk);
> -	if (ret) {
> -		dev_err(dev,
> -			"failed to enable s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
>   
>   	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(aud_drv_data->mmio)) {
>   		dev_err(dev, "audio formatter ioremap failed\n");
> -		ret = PTR_ERR(aud_drv_data->mmio);
> -		goto clk_err;
> +		return PTR_ERR(aud_drv_data->mmio);
>   	}
>   
>   	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
> @@ -620,7 +613,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   					       XLNX_MM2S_OFFSET);
>   		if (ret) {
>   			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>   					    XLNX_MM2S_OFFSET,
> @@ -628,16 +621,15 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   
>   		aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
>   								 "irq_mm2s");
> -		if (aud_drv_data->mm2s_irq < 0) {
> -			ret = aud_drv_data->mm2s_irq;
> -			goto clk_err;
> -		}
> +		if (aud_drv_data->mm2s_irq < 0)
> +			return aud_drv_data->mm2s_irq;
> +
>   		ret = devm_request_irq(dev, aud_drv_data->mm2s_irq,
>   				       xlnx_mm2s_irq_handler, 0,
>   				       "xlnx_formatter_pcm_mm2s_irq", aud_drv_data);
>   		if (ret) {
>   			dev_err(dev, "xlnx audio mm2s irq request failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   	}
>   	if (val & AUD_CFG_S2MM_MASK) {
> @@ -646,7 +638,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   					       XLNX_S2MM_OFFSET);
>   		if (ret) {
>   			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>   					    XLNX_S2MM_OFFSET,
> @@ -654,34 +646,23 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>   
>   		aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
>   								 "irq_s2mm");
> -		if (aud_drv_data->s2mm_irq < 0) {
> -			ret = aud_drv_data->s2mm_irq;
> -			goto clk_err;
> -		}
> +		if (aud_drv_data->s2mm_irq < 0)
> +			return aud_drv_data->s2mm_irq;
> +
>   		ret = devm_request_irq(dev, aud_drv_data->s2mm_irq,
>   				       xlnx_s2mm_irq_handler, 0,
>   				       "xlnx_formatter_pcm_s2mm_irq",
>   				       aud_drv_data);
>   		if (ret) {
>   			dev_err(dev, "xlnx audio s2mm irq request failed\n");
> -			goto clk_err;
> +			return ret;
>   		}
>   	}
>   
>   	dev_set_drvdata(dev, aud_drv_data);
>   
> -	ret = devm_snd_soc_register_component(dev, &xlnx_asoc_component,
> +	return devm_snd_soc_register_component(dev, &xlnx_asoc_component,
>   					      NULL, 0);
> -	if (ret) {
> -		dev_err(dev, "pcm platform device register failed\n");
> -		goto clk_err;
> -	}
> -
> -	return 0;
> -
> -clk_err:
> -	clk_disable_unprepare(aud_drv_data->axi_clk);
> -	return ret;
>   }
>   
>   static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
> @@ -698,8 +679,6 @@ static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
>   
>   	if (ret)
>   		dev_err(&pdev->dev, "audio formatter reset failed\n");
> -
> -	clk_disable_unprepare(adata->axi_clk);
>   }
>   
>   static const struct of_device_id xlnx_formatter_pcm_of_match[] = {

As Mark mentioned SOB is missing but the patch is correct.
When SOB is added feel free to add
Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

