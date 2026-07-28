Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010005.outbound.protection.outlook.com [52.103.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6A33AD82;
	Tue, 28 Jul 2026 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253575; cv=fail; b=Ffn4SOLSQ3Wekcc8Vuar+mfYKKFt4u8Kv8Pp72MPqHWpWswqKqIvDvpF2pAsv554NKMUIjMFU/ImISuYpaeO0GEUPlDnNutSrJSnwAkOglhAonRVp9gHri3YV5xRcN0eK/1E8cCUnmldSQNhEh8/MOU2jMnXTbK4s55/Gg3wFb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253575; c=relaxed/simple;
	bh=C/AX9+4e9FziNWiu+Oh3tNPLnVWop/+YnYVm4IruF9A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fUfBi8loVIMB1RL9REewNSGlY0k1msG8dWey1ZVabdbPYwhphozlQWOFLER55l/Y6Z4ZgAw37zlfWKOtoEXw9mf27Kfjy3EJU9gQs9vRjnBJIxmtRNSDuuXJf2EicKbismUjF22VdN7Q0BgdjN6uleM4c/YM3HPCCTWWEYY7qew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=GZBUrkyJ; arc=fail smtp.client-ip=52.103.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="GZBUrkyJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7kTEIEz4YYx7Z15vUZNHG4cKO/GNR+b9v5lqmByeivGvC24kweugWX2NXu6qGMeFOOnV7Yii68Cj25lrSCFzZfJ399uEY1iLVVP2X7nI1oDHxoeRWgOq1muLXvDbGeNIsJy4btRFuQJ27dDa2ww1X0yBHept8KBkvaHEhpLhCcqlNP7vuJCw9V2vbSwc0C/+y1RCCA0DQJ1vSs8y7e3aR6bPkJFqJqXTGRPJOmYoN1+EP6/fXQ6PykAY0VMvhTGPmptKWVv4R5r23lPCpw02tGpPoyatTpOxatMtknz00Pxdx3zh0crdAWUljZBdJURCxaM+Q+8uJz0DMQwdHgcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+gTOqmlz5FttM3LWoX7hqXk41d2TsdjMnoYQmbjBSw=;
 b=DjFvfN6DuWfbynnMNkJZ7kDsZxvm+RZnGR53VcEGv597SiaHGbw/rDNdTI3By9t1iZ/vLs/3rcIoHkORbtxRk9+YpWwQT54WA5NvT53rEfMCZ1S89FMhu3GqATxCvDkmwox7bXk57qfXjtOyP0ZuWzEWFEnXfhIcIfOMvb0sDic92m01SAVTtf7+whh78X3JcTd63St/SLF7i013mYFRNKLqatzEpkBhGQ1t5LAqdohGXH5pRUkqK2Ziz6GfCpb4OreVJXt+CeBHk54h3FPlYLIg9H2x12Kij1MmcPyRyVNYa9hJvRadUYE495Ly3ezk5rduBsY/pHIURNbq7/Q9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+gTOqmlz5FttM3LWoX7hqXk41d2TsdjMnoYQmbjBSw=;
 b=GZBUrkyJC0hi1ZKXvbt26xUX0aOztlpmtTsE6nHuK1UHBgAZyz05qLozvnAPu8at6P7XobazzOQux4GgBy1z71gYZMEExDf2UGl16SaG4J7tExoI/HsVG5cHFUzNEwopwqaFTLddr0refvhrzqukh/jI6i9tPmuZD9SZsg5T4K9AZyK5bJ+2EdiDDMqwQnDP8o2A947fkXM9+9XOgo7BTcrrrC6edQbVs7otoLvduVKo41Z3JH/lFQnVSd4GRR8KwRIzjb5Ut19gYejnGXgA/6srFuJMv4MKHp266LGyfqYApDYz9Q/FRZmr0F2q5/pObV0NKiqBbbHByFRriv+qyg==
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com (2603:1096:604:153::9)
 by OS9PR01MB18258.jpnprd01.prod.outlook.com (2603:1096:604:4a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:46:08 +0000
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f]) by OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:46:08 +0000
Message-ID:
 <OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
Date: Tue, 28 Jul 2026 23:46:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for
 Behringer Flow 8
To: Takashi Iwai <tiwai@suse.de>
Cc: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
References: <20260526072906.90106-1-chengordon326@gmail.com>
 <OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
 <87bjbr6tth.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Shi <liaronce@hotmail.com>
In-Reply-To: <87bjbr6tth.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4PR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:370::19) To OS3PR01MB8827.jpnprd01.prod.outlook.com
 (2603:1096:604:153::9)
X-Microsoft-Original-Message-ID:
 <b7a12fbb-557b-4541-bb97-2b4e1e2e1871@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8827:EE_|OS9PR01MB18258:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ecdcea-adf3-46a9-92e3-08deecbf577d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|25010399006|37011999003|6090799003|41001999006|24021099003|15080799012|19110799012|8060799015|51005399006|23021999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDlZbHl0NG9DUnNTejJyZHR2aVpPYm5VUGQrWndSaTU0RkliYnk2M2ZMdE9O?=
 =?utf-8?B?OXhLQzJBcDBJa0lBcWdyZXhyRXhCbkRQR2NEdExKMnI1WGlha0hkLzBoYzNL?=
 =?utf-8?B?clEvYi9UWVlySjB1b3cvNnZ3M0I0dDlOQm9pcXdZZDRvUkptNGRaTFRNT2xJ?=
 =?utf-8?B?bjl3ZDl2NGNxTGdOd05sSklYaWxOOGJLWUIyUDFqRjlISjc3VnJOS1FpSSti?=
 =?utf-8?B?WEhZQWZyTnU2L25RWEUvVVp1bnRLdTlPYTFtMDBwSTVLOWMzM3ZjQU92Q3ZG?=
 =?utf-8?B?c0NSRCtBWnFFN0JQMmVDT2dKOGVGV2psL3QveGEvcSs3ek13WDlwSE8wcVM3?=
 =?utf-8?B?RXcyR0p2L1hxWnVxWHJzZUljdnoxWmM1Zko5WVVqV295WDFKMmJBenlCVW5T?=
 =?utf-8?B?K0d5bWdkU0NwTXFkemwyYjhtTXUzN05mNDRLekswanpOdm8zTC83RHRxdFZu?=
 =?utf-8?B?cmovSzFqVWtYLy8wK1lQOEd4ejR3dWpYbDhla05VYndhckdvWFBncndMazhE?=
 =?utf-8?B?eldIdXMxbWc2K1ZHdUtDdzlpeFRXZGdaRkhPYS9WSmpBL0RVYXYrL2x1a2E3?=
 =?utf-8?B?QVlYbUdqUzRmUUNjVUkzbkwvaGxHS0JRWG43dmZsSVZOTll4Zkh3RzhuTyta?=
 =?utf-8?B?RnNZYklpbFNQTEpwOGYvNjJDbmhWM0V6ZkxBbTFJWU83bW9GemZZZ2FMdXdE?=
 =?utf-8?B?TnhEVENnU2xnOFQ0RkRzWEpHajNkbmdjSC95emF1Ty9PRmNQOEdCckQ3aW5y?=
 =?utf-8?B?ZnZhdFdCQ0x2OWQ2MmlVbGQreGpuajY4TzhENW1oRCtXTlQrMDlEdmxnUTJv?=
 =?utf-8?B?eGkveitaMDhCZ09DUnRTSjVNQllFcGEzL3B5ajcvM2pwZlN4R21MS0hXTVdZ?=
 =?utf-8?B?L2wvTlVWa0Y0TkxrZjVrYTFQVU9Ob0xwbWxYQUhNSlh0WXRsbENvT3FvTVpN?=
 =?utf-8?B?c2NrbDZlUWhkWGNuM3JUSkE0N3ViMklJYWxnOGZQUnRtYnZkRjQ5UWlyODlC?=
 =?utf-8?B?dVBnMEZzWDNCSkl1eXZXUEFXN0lZUFU2QzFJdDVjZzQ1MlQ2c2tuS0s2T0pa?=
 =?utf-8?B?YnhiTzN6NExYL09MUjBKRGdxNXBNaXhmRGFBSjQxVCs2S3loRW5BQ2VXYkQy?=
 =?utf-8?B?dlBtekFZdWlMbDhmajRpWHp6dlNsRk40OWxIeVExSlhKRnFiQjQ2UEoyYTUz?=
 =?utf-8?B?d0RyazFaNmNteER5d3JTdkZJcm9GeFcwVnQ1aVZaaE5WUmM2YXNpL3krckFM?=
 =?utf-8?B?Y0xGMVVTcGZEeElzbStSQTROQURRQXhDWmhqUHNaMEtDd2hWVzI4bXZYaks1?=
 =?utf-8?B?RndCenBreDJJN1Roa1RwYitteGFGS2YvL1RpWGV3LzVrTEttVk9DK3ZMMFc5?=
 =?utf-8?Q?0DcCgzupEq9Bb+1mayTDjpy7aklJqNaA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1Danc3dkw2T1VDM1IyRnRlQWZMSUo5Mm5VK1ZhbmRjN2V2dWEzOUZBNnZW?=
 =?utf-8?B?czFYV0poQ1g5a3g0WHVtOWxzZmJ4aEdRdlFWaGl2S0F2UUt4Nnd5Uk54TTk3?=
 =?utf-8?B?d2JVcmJKSVFlY2E5NDZEQUF5TTI3WlVDaEwvazJ5eE5GODBPZE4xM3IyN2FR?=
 =?utf-8?B?MGYxSlppMmgzR1o1NzZka1FVWkZabHlrRmozaHZ6czFRSzVPTHZ5WGk3Si9x?=
 =?utf-8?B?Q3dyb2pKUXV0YzhUTEJ6WTZZWElxSC9JYjBscU9SYXVxSGVLdXNFU3NQb2NP?=
 =?utf-8?B?YkF0ZGJLTkNXZVh1ZC9Na2NIMFZnTGNlSFR2SC9tVHpzS1V0TTBBUGdvWm0v?=
 =?utf-8?B?RnMxQTQxaTJVaTVKT0VOZ3hnblV0dmVVL1l6bjNwQzZCVDlEWDdYM0JTaTZC?=
 =?utf-8?B?d3ptUXlRdDM5UWlNVFQvL3VPc2FVOGpGVDNhUHJKSjkvSnpoTUY1V2ZabnlM?=
 =?utf-8?B?OW82RFpHT0hUUSsraHZOdXFPOGNtSU9ob25BU1ZPcUE5Nm5QRmFjRXBwREJj?=
 =?utf-8?B?bGJlY3NBeHVlbmtyc1NsYStqK2dHNmp0cis0TlRLaElXR25LY1ZFSWJRdm01?=
 =?utf-8?B?ejFXcWYzbmFiTmNpeWtoSE54YUYvTEV4VVZHcWVidXI3bXhGa2ZzcDBnQWZt?=
 =?utf-8?B?R3k2K2o0TnBlQ0lOLzhRRW90b3dCK3luTjNjMUlMTHVGWnkwRVAycVBMWmhI?=
 =?utf-8?B?dVp1MG05VkNlYXdCRjc0TGpBb09mTEg0UGphLzlCWW9IUGtWb2VkUVd0Wkg0?=
 =?utf-8?B?dE5ZZkhCVk13YTRLMEpud3lSclk1ZUVZbkxMbTBXN3dUbk1QZE1WcHVwTnFm?=
 =?utf-8?B?TWpqQ2RoUXpmNWc0QUpwb25TUDU3UmxHMUNrZTg1UUkwcXJ4U2s5UnYrMDcw?=
 =?utf-8?B?akFJV0xwc2xwc2R0a0pseUw0QkdwNWJ4VWVseE1nYjB0NWNtdzZGaXBrOXFu?=
 =?utf-8?B?eXVNMkJJVmxLV05oQm9YNW1ocXhkQzVDU2RsbHNJTElNSlo5UGJCMlFweGY0?=
 =?utf-8?B?ZEd0ZmpRcE4wMk1vYkdBcWlhUVVGSERmVmlsL0hUMjA4L1p2NlMxWlFQaVR6?=
 =?utf-8?B?S29pQjBvMm5qaXRTWjZmNnNvQnhkRXgrZHRSZHJDcHlYS2ZGRjVHZklvVkgw?=
 =?utf-8?B?NFM4ZXlEcnNMbmc3ZGVHcGhQc0tJNWQrdUhuWXR3Tm1lU3A4elpkd1NIR3Jm?=
 =?utf-8?B?Yzc3TldxYTdKSHJpdURoSW9FRDYrUG5UVklNaUpQSEcvb0RSeE94NjVMc1Bv?=
 =?utf-8?B?d2czUGdwc2prcmFQUHpiY0hIR1RJT0pnWXRlOFVDUDhvbmJXQWY3ZTVTUm9t?=
 =?utf-8?B?ZzRETE1YV1Y1R2c0dHZkWGtVd1NIQlJEZzE2TWp0RkRuaDkxY2JIYnZtS3BL?=
 =?utf-8?B?ZmVFOHM5RHcrWENwcXBtSE5lcnFWZXRnNG0xQXE2VXVueHQzZmVoRm9CdURj?=
 =?utf-8?B?OXBjUDNwcHV3c0xxeXlxaGtWQUc2a3Z5NXBmekVQdTJHcUVHeVo4Z1hqZVMw?=
 =?utf-8?B?THBJWldabWNiWDdOMXlhVE1HUnRUc3B4VzZxRTdxbUhIdnBPL0w2ZVJEaXF2?=
 =?utf-8?B?V1Rhb1doZ3AyTTljeUhQRVpOWmxwZzRUSTg4WjNVMklad05NeTJsSmJMVEF0?=
 =?utf-8?B?amtBK2JabzNJWTJ2MTIwM0FJK3lFZHZUWWE4TlUvWS9lRlc4amV2VW1JeGxr?=
 =?utf-8?B?c3FpMzdaMDh1Y0YwVXZJM2RqM2dsQTYxSUVmNmVZb21IbC9ONTNDZ0Y1OUtG?=
 =?utf-8?B?Rko4VFpUdG9YTTFvSkxLVEdNMm9MNHNjekp0NGdMWm8yWHpLaTZRNXFwTjgy?=
 =?utf-8?B?MnB6WmFzNy9rYVBzbHFBZFJMVVB4TFBEQmxyWkxmT0RCSDRPRVFLWjB1bHRE?=
 =?utf-8?Q?HtxY95ZuoM5up?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ecdcea-adf3-46a9-92e3-08deecbf577d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8827.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:46:08.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18258

Hi Takashi,

在 2026/7/28 23:02, Takashi Iwai 写道:
> On Tue, 28 Jul 2026 16:27:35 +0200,
> Mark Shi wrote:
>> Hi Gordon,
>>
>> 在 2026/5/26 15:29, Gordon Chen 写道:
>>> The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
>>> declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
>>> its UAC2 endpoint companion descriptor. After 5-35 minutes of
>>> continuous playback, the device occasionally returns a capture URB in
>>> which every iso_frame_desc has a non-zero status (-EXDEV bursts,
>>> visible as rate-limited "frame N active: -18" lines in dmesg from
>>> pcm.c).
>>>
>>> In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
>>> and falls into the early "skip empty packets" return originally added
>>> for M-Audio Fast Track Ultra. As a result the playback EP loses its
>>> sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
>>> stops advancing while substream state remains RUNNING. Only USB
>>> re-enumeration recovers.
>>>
>>> Three independent ftrace captures (taken at the moment of stall via a
>>> userspace watchdog) consistently show:
>>>
>>>     - 60-70 capture URB completions in the 70ms window before the marker
>>>     - 0 retire_playback_urb / queue_pending_output_urbs /
>>>       snd_usb_endpoint_implicit_feedback_sink calls
>>>     - every usb_submit_urb in the window comes from
>>>       snd_complete_urb+0x64e (capture self-resubmit), none from the
>>>       queue_pending_output_urbs path
>>>
>>> Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
>>> early return is skipped and we fall through to enqueue a packet_info
>>> whose packet_size[i] are all 0 (the existing loop already maps
>>> status!=0 packets to size 0). prepare_outbound_urb then emits a
>>> silence packet, the OUT ring keeps moving, and the device rides
>>> through the glitch.
>>>
>>> The default behaviour (early return) is preserved for all existing
>>> devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Gordon Chen <chengordon326@gmail.com>
>>>
>> Device: Mechrevo WUJIE14Pro A-7BC4U
>> CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
>> Firmware Version: T140_PHX_V20
>> Firmware Release Date: 2024.1.8
>> Kernel version: 7.1.4
>>
>> In Linux kernel 7.1.4, I found that my laptop couldn't wake up from S3
>> suspend; I had to hold down the power button to force a shutdown and
>> then restart it.
>>
>> Using `git bisect`, I discovered that if I revert this patch, the
>> laptop resumes from S3 normally.
> Do you have this USB-audio device (Behringer Flow 8 with USB ID
> 1397:050c)?  The commit must be harmless unless you have this device.
> That is, if you don't have this device, it's likely a false-positive
> bisection result.
>
>
> thanks,
>
> Takashi

I don't have that device, but I partially reverted the code in that 
section, and it went back to normal.


Thanks,

Mark Shi

---
  sound/usb/endpoint.c | 10 +---------
  1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 24cd7692bd01..6fbcb117555c 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1780,16 +1780,8 @@ static void snd_usb_handle_sync_urb(struct 
snd_usb_endpoint *ep,
          /*
           * skip empty packets. At least M-Audio's Fast Track Ultra stops
           * streaming once it received a 0-byte OUT URB
-         *
-         * However, on devices where bytes==0 means every sync-source
-         * packet errored (e.g. Behringer Flow 8 returning -EXDEV bursts
-         * for entire capture URBs), an unconditional return starves the
-         * IFB-fed OUT ring permanently. Such devices set
-         * QUIRK_FLAG_IFB_SILENCE_ON_EMPTY to fall through and enqueue a
-         * packet_info with size 0 packets, so playback emits silence
-         * and the OUT ring keeps moving.
           */
-        if (bytes == 0 && !(ep->chip->quirk_flags & 
QUIRK_FLAG_IFB_SILENCE_ON_EMPTY))
+        if (bytes == 0)
              return;

          spin_lock_irqsave(&ep->lock, flags);
-- 
2.55.0
