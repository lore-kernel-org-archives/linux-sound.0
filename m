Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A537FF6D;
	Thu, 13 Aug 2026 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636887; cv=fail; b=I3zcZVol3wawux/FIW/x+96nKhLKQv7SX1dJAlLD6/0r+5DJV/iqAtyeFV2oKxE1KLl8Hk+0JNA3cxzug3QiilS7g8KtGPLm89T3nenGxekJBv0WtkvChYpP1gO1D5mPLxgqr2g5yc+Mhd0RTDR91iztrZQD1/sjYUq0V1RX4Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636887; c=relaxed/simple;
	bh=NcfNOliD4A9UC/tbTOl6pxN3wbLG6AfviaLtZe2IOOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l4Zbg48x0wI9cLjU5XiMiXCNgDnv2S3FfeR2Tcgindt78nGXbKQPgw4byMTVz7HMdziwSuf5jBzTIYblcJ2WD8zbFg/pTtxkAm5A0ljqaMI03+97VSQ6wzvEs32NfLjaYMw/XYvl6C3ARoygKQLKaDKoIuo932uiA9yt/cySqzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=P9xApBoD; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="P9xApBoD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byOZTlajXgwc6wtohE/vfRfzAsiGE33PXmr5uR5Vx0ccvXmmyUYgRVWYl6835K+I1gtV4Wo7CPRDK34noIHIf+F2F8tHsA5ILBiUiUqB76W7ar+aRI+LVc5fOjbjtXKRR7Lqs9rq6x3a2PNpngMiIAivU0rU3K6H8SLHgYFLnS3TBlakPxgOw9B8cxZM9Ej7HwZUkAAr5ybKPoYD6LZ4pQSFFzc0/NDfE8pOFJDyDJKKrjN2yoD3akyuhaoCWlq3et6FMmN3altroCwDHz2Tb4lbfdkSNfrZ/gH3RP921zmN4unwC+HG4JJjT9fqvdUcBXz2zQvg+Qzh7ppn2PtPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urJRHMfqXbj51qK0WDLVMpLDeWdyj41rZwWgpYdrD0U=;
 b=Za00st2o09y8kEBpO/84ZPBp2XFP6+tg7+1itb3DSMXct6U80wDZxrZBTEKCjGjeN7izont0MKyO7+HQLBZZANkjMrS3csGtBV1hL3WHFDE9O6DkiU9rmc0hzNFj70/6Yc7qxWHB9517Eu+BLeHd+n9aG/JU8DGjAKSI5ll8MW3XLMYbW7rEicuSeco+EjHcKFJY8+Xnjb4HyuEQSQkXKZCZBHRsylVA7HBbAtz6Ds7pmrShQycHpndEYAP0s5ZMPQgqd5Y9aUGRup1nd6UKrUaY2zypQFmA69hBrR2qZ34Erp9ZpoRSww/wWfhUefVGykbJy9TVjyeVk4QflTCE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urJRHMfqXbj51qK0WDLVMpLDeWdyj41rZwWgpYdrD0U=;
 b=P9xApBoDDLgVbReFKG/Wts8N9En9adgmfY8IDlna4vRw0EUnZVsscq2MNi4V+1MFusNA9Pu1t0sMH4I/43uBDQH5Bs8UAg5I+Fj5HbM6u/HfXNZvEGS4yhW0r/uFJK2WQgYaVT2coxMyfjKKTUfpN6xoI9HTHtwNTR5WtoRnDP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9576.namprd12.prod.outlook.com (2603:10b6:610:2ad::14)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 16:01:21 +0000
Received: from CH1PR12MB9576.namprd12.prod.outlook.com
 ([fe80::149b:7b16:cbb9:59]) by CH1PR12MB9576.namprd12.prod.outlook.com
 ([fe80::149b:7b16:cbb9:59%6]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:01:21 +0000
Message-ID: <44f8d013-cb85-4d88-9742-4fb3e34d4267@amd.com>
Date: Thu, 13 Aug 2026 21:30:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing
 the port
To: Mark Brown <broonie@kernel.org>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "Holalu Yogendra, Niranjan"
 <niranjan.hy@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260813001500.9218-1-andrey.golovko@gmail.com>
 <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <213117c2-02d0-4e94-be2f-c172ebedcfe4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::10) To CH1PR12MB9576.namprd12.prod.outlook.com
 (2603:10b6:610:2ad::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9576:EE_|DM4PR12MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: dbebefcc-325c-46f9-233b-08def9541dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	54lRgVQGNTRiagO94aLjFlRRvgeQ3yCaS4AMW+Dt9r4NpiNUPy22hARiFPK6NF7rZEjaZKefFt/khP9H+KAdi7M/RjEh4WJOOHBaii7mcbGFd/lxDZSBN2bdpHQF5i//0yxeYU9l/cgwPDKPj7GZa3jDMMl5f+ZYzVIcmvcxAKJlrHNbt2TnkXxz6ujobgI/Lz0PoJYKx+V1HDzd9TCss/LXnpeqPtHq3aRnbl4yFQrTGVsYlBsfnlQgmG6W5buQr7ZsLB8r98rQhLK5Or3IXVPz9IoPUys7Y+fWj88ef/C9cqZ2SpnpwYetHirLNv5+bUJ4W6Of8sGbex3w08RRZlAtidr4lbaXvQxXYE/BSUnmoJaPx4qiQa2GRlm8LTw+EQo3S8ngPXO2OXW0aJGQ2Dul3fljJxY8makUUzJyIk4/nLm/miHBmzNNc33HmKRmxRERHmaonRSVHexCv/theizsiyAjRabWqe3C85qQVVc0sbhDT6sdDE1GMT6bRk30gGI4DsiFF9WzJbm5RxSzW9Xj1vPklwcER4kPZ2m3u0/gRj4c5Iu6qo/9Fe0wCt42OIoe4IZmHh02z9o6LxjHfz80OTR+fxWfwI6CxhqL618ZwX91nMxPaoovKS6SrE8y6QsYXqhZxzlEtqPVQZNOy5DQe3V/npphy+Sl0iQrUP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9576.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czNsRlByZkJiMFRiTCtZc3Jvb2VweVFMK0ZrY2NXVTBxWVdkaUpyRFYwcnN5?=
 =?utf-8?B?UGZSenRydjhaZEhhUHlFV1BnRVhLMWpvVTRZSWVLVFYyS2NPM0N0MHlkc1Vx?=
 =?utf-8?B?OEdvSzlhQXpvNVM5dkZucnBHMWJMNlg0eFMzOS9JdzN0MmFoS0ZvdXF3RGxO?=
 =?utf-8?B?SjY0Z0h4SGdaN0wrOVJzbXI2dUExVkNnMmVGQUVUS3c0L1ZRWWVUdDdydnRW?=
 =?utf-8?B?R1NHaUNPQWV3US9zQWExTHhsOFBVMHJNYXQzWEs2NmFyZkFUUitmLzVheUsz?=
 =?utf-8?B?Q0F1V1RJaGRxQjVwUDJzcFJoSU9ZdnFJbnpKb3MrcWpjR3llTFVDMVNhU0Fp?=
 =?utf-8?B?K1d6QUE3TlJpRVZYcXkvc2lVNlM2VUhwajlodzBHRHVqaVQ2a3lyamUvYS9P?=
 =?utf-8?B?Z25GNUVVM2NraXc3Q0JzMG9HNEYwTXM0dU5aK3k1emc0LzNYWSt4S1EvREs2?=
 =?utf-8?B?dDF5VFE3YVZ6WkNSY2lmdisvZGNaK3FRQ2dESVg5M3ZxQTNQaEtoU1dkcjdX?=
 =?utf-8?B?czVBaGNRenFRbWJPN3pMWEcrZ3h3cWU0dnk0UUhjRVc4WjJudkszcjJuQVR6?=
 =?utf-8?B?SnhxSEk3bGZWeWpPWXVVNm5vVERvelBHWFZLeTE5QzhCeDROWnhSQmRGK3d5?=
 =?utf-8?B?c3RYbTlPMHJiVGNUaVFpRFRXTWVtYzJqYVZkZlg5bDYvaHNRaUU5eEJkdVJi?=
 =?utf-8?B?MlpmTEMyZldwV0NxZlZ6Q2d3UGJycG5UUWVNZHRDMGhheTdkUHZ1V056aFZ6?=
 =?utf-8?B?bUplSWJCRFVpdEJNWGdjci9pZDk5OWdKTFpjWEQvTWN5UjVTTFFzQlpjeW92?=
 =?utf-8?B?VVdRWDlLRllFTEVPb1pHSFBWclhPZWM4OGxsR1FBNCtMNjJOcGFzQTdXRm10?=
 =?utf-8?B?T2h0Z3NLRktPSlhSU0laY0xiMzAxcE9Dc3JWVHR4QlAxWFI4RklmRDBQQXo2?=
 =?utf-8?B?WlRRRjBUU25MdFJZVGtrKzNoSXFBMTNORlZGQklWMkNVTUpYMzVHbVRpUnQr?=
 =?utf-8?B?TjgwV1ZEODdvcGUwYXdyajBOZzJ0TEJXMmdMbXpXWGZTZWtnYkR4MDNSNmJB?=
 =?utf-8?B?Z2RVcEZCbHhrcGl6aGFNR1BGeE14Rlh4RG1iWU9laHEyV1dSQWJzZHhXM1Ni?=
 =?utf-8?B?NEM3UXMzcS9GK2tETzI5Q09KZDNIWmh3MTdyYk5LV3ZrVnM4QVBTWm1NWWsz?=
 =?utf-8?B?MXZDNGV1TnphTit5SS9aQVVPR2dVbmNXYkcyOVdWYVhTeE85YkM4TnlIMlFn?=
 =?utf-8?B?RUN6aGV3ZHlnL1BKS0w1WHloRFl0b3JrSDk1SWxZbVVyZWFPMCs4NWszU1NK?=
 =?utf-8?B?RS9kYm45c3dLdEpJeitFQTY5bE5GT1N4MnRMSVZramw3TUU4YWFEei92Tm5Q?=
 =?utf-8?B?UHZ0RjV1NndLd0c4TFpMSm5uc05VbCtLNWJNdDdQVDJUc3dqUkdIWWhZQjRl?=
 =?utf-8?B?S1NtZDM4MkJtMnpIdk5tL3JXbnVVUjQ5M1hSSDR4d1JKTTBjcHUza2w4b2R2?=
 =?utf-8?B?RjhmTDBNT0pNSVdLMjU1TmlzTHFhS1JaaXY3ZDBOcE5QUlRnRTFYVWNBMGZE?=
 =?utf-8?B?K3paQnJqL1JMUXZCZnRWR1dzbU9oQkZyNlQyRW11djh0UHhaU3RQUlFYcGJX?=
 =?utf-8?B?N3N4Y0p3YTA3RHhoQzI4UXA0WDBCRWNqa3B3ZVlTMmU1THVhNVcyK2NwM0Rw?=
 =?utf-8?B?QjhEbk5EbmFOSGQ5S2lDYkJZcmdzdHRZSit3NFBMNUc1aWt3VmhDTVZSUit0?=
 =?utf-8?B?a1lFZzBENXhpSmIrU2wvNW02R2d6b0hFQVo0SlpVOG9CY2ZHaXlsbkNQVkg1?=
 =?utf-8?B?TUpJQjVqbFJEWURWVTI3YjI1UXVQWkl5MXlaMUxuL240U3ovMEtvMlMzQkNo?=
 =?utf-8?B?YitNWnQ0WTE4R3N0QkNTb0hFMkQ0RWxZejlRTUpDbkV6Sk9VNXZidWcxUE5R?=
 =?utf-8?B?MHlSMFZtY0FDMjJjM3VJVkRWUllYWjRUTU9IZUxzR01DRnlQT1ZNckdpa0tX?=
 =?utf-8?B?K2xrdWp6WndnRnpUTEdDQkZYb3VaT05mUytRdU8rRmVnNDZDa01JYTNRNVda?=
 =?utf-8?B?ZmtSOG1CTDBhR21NZjJmNkY5UDF3cnFyalV2QVd6Q1M5VmRoYlFhd2xHeUxj?=
 =?utf-8?B?QklNSXZIaGNRb3VCNURXVGYwSytEdDg3dGppQ05hUHVndE5FUFdlNm5YaGZp?=
 =?utf-8?B?anIxbFNMR3UvZk1lZXl6c3lyRUdEdFFORWdBZWp3VjhtYUh3U3FPME43VGtt?=
 =?utf-8?B?NlA3Mkl1ZVhYT3ZnejZtczhzTkZyQ09pTWhNT0ZicnRVaGM0WFQvZEhhVkhI?=
 =?utf-8?B?UzRaSWQyaCtPVmZLYU1RaFFzL3dJTEsweVNsZXJreVRqTFNnQThkdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbebefcc-325c-46f9-233b-08def9541dbb
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:01:20.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tizDEUbNH1jm/FUQe//06bxr9G6xk2Q9rNhljwLGX/iBRV18XmqJVcDim3TwqSLe2BpXTmmi4Etjm26+rQm6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230

On 13/08/26 18:52, Mark Brown wrote:
> On Thu, Aug 13, 2026 at 12:28:10AM +0300, Andrey Golovko wrote:
>
>> A Data Port cannot complete channel preparation while the SDCA Function
>> is powered down: the peripheral raises the channel's bit in
>> DPn_PrepareStatus and never clears it.
> ...
>
>> Power the Function up in the PRE_PREP callback, immediately before the
>> PrepareCtrl write it already performs, so that preparation has what it
>> needs on every path that prepares a port.
>>  	case SDW_OPS_PORT_PRE_PREP:
>> +		/*
>> +		 * The Function has to be powered before the port can complete
>> +		 * channel preparation.  hw_params() does that when a stream is
>> +		 * set up, but a stream that is only re-prepared - as userspace
>> +		 * does after the peripheral lost power in S0i3 - does not go
>> +		 * through hw_params() again, and the peripheral is back at its
>> +		 * PS3 reset default.  Power it up here, where it is needed.
>> +		 */
>> +		scoped_guard(mutex, &tas_dev->pde_lock)
>> +			ret = regmap_write(tas_dev->regmap,
>> +					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
>> +							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
>> +					   TAS2783_SDCA_POW_STATE_ON);
>> +		if (ret) {
>> +			dev_err(dev, "power up failed for port %d, err=%d\n",
>> +				prep_ch->num, ret);
>> +			return ret;
>> +		}
> Does this DTRT if userspace restartss the stream by directly calling
> SNDRV_PCM_IOCTL_RESUME (AMD adverise SNDR_PCM_INFO_RESUME...)?
> Similarly we can suspend while prepared.  Either something needs to
> force us to prepare again or this needs to be moved somewhere that's
> always called.
I agree with Mark's observation. For drivers advertising SNDRV_PCM_INFO_RESUME,
userspace may resume a stream via SNDRV_PCM_IOCTL_RESUME without going through
a new prepare cycle. Similarly, a stream may be suspended while already
prepared and later resumed without re-running PRE_PREP.
If those paths do not guarantee port preparation is executed again, we either
need to force a re-prepare after power loss or move the power-up sequence to a
callback that is always hit before data transfer resumes.

>
>> +
>>  		ret = sdw_write_no_pm(slave, addr, prep_ch->ch_mask);
>>  		if (ret)
>>  			dev_err(dev, "prep failed for port %d, err=%d\n",
>>
>> base-commit: 6f6fb37f9f9a8ae88faa1b5b1978e57381488502
>> -- 
>> 2.53.0
>>

