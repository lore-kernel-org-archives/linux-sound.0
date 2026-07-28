Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010074.outbound.protection.outlook.com [52.103.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB893446C5;
	Tue, 28 Jul 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248866; cv=fail; b=lv0JQkLrqjgCuQYLrHLiVGqb0sRQpnBZoQCd6RbuprlSY1SPCGAbEUvmo4BdFkeUJLc9fqIrUlmrmL+AvWMs50XVS4KnaqeMDZZOLUINlXrE6o8SNKQera2dpe3L1hR8WYKyU0sfkheChelDtufpG//sUpvmhKi+eQHrRarE7wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248866; c=relaxed/simple;
	bh=32aau/G2/6CYLir1hPtZ/1dVyyfllR/LkYsNLdi/P1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RC1X2RwZjKnYsjZTWCMSkmFDVNvtW9QgdTcXOVEt8fSmRchDXMjK6GKiWW2roMSAuELBT7FtBXuCnEUyrgZXne7OnSq01NfReeeg4s/BRHLoHN+aV98esYXtCstCE5xBlAPpVVg0QfCafk/erB92refeEQzbq2ErbBa5vkFRgQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=MtE6WkDC; arc=fail smtp.client-ip=52.103.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="MtE6WkDC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvBekhmJwYrN/jUYH/N40IiKA9O4e8z2dnhIyXUPJMKoSRm8bh6+9MMUKWg/VvVwxwhD8G7FIwBui9wL9uUR+8cV73+vBEEl6P39V9WI/mFCnyYc/hWeLv0jH8Akm1sduU3QNDacx9E5tuPJlSkXlEKKXbIGbMbcgh0QMOAwxr5n/+XlMceL9xd94JMeA9rI6RBEAIP2mo+OJIWL3TOUEOoygyV3v3EV+Owf/wJwXubiyYL37sHgE7jTcx9xtGeZij3JGAXGCtERKVYiKICwQpBggb9D2Z8B0+krzRWBOG4TTH0w0iVFw8oQnsVoib0UMWu7hnNu9Kugx291lXX7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nMUca0YbMZYZ8G9F8CpqIwl23cbh5ceAGsAOT0yHFE=;
 b=NKsXFoUt77f4jhc4Nt+xzDijFJuRYb2vX44ehzwFdoDjZs1nhuPNtPa9/obhyIftOwLsWa2RJibUDzEmRY2awqoVplRL2bG7tRAoNwoZw2NmrSGUrkgtEmrBG5nhUbvo/PcfmH4yJQwX9ZC8i1QVs858bZaZs0JELksHLT3QOYawbYazzta5tFPQkKhMrNvE6/gD/qm6zXvIQGqFDEUGzlaYzCf1TH6fTjFi98E148ckNwmEjkz97NPzC+HSacp77guHyHfoR0j27tk74+iR5E/HIf4aGZc2XJXnnafpjLHuvmk+N90nTmI1eJRbCYyVIeCz2Bv47VPHicx+F62Lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nMUca0YbMZYZ8G9F8CpqIwl23cbh5ceAGsAOT0yHFE=;
 b=MtE6WkDC3jFRkf+slLWvVg48n7E5+Xyvq+8/1vm7trefbVW8u14wa9uBaKYo2B8SxNgC6lGfx54KkDs37TBElCn83EMn2YGzRWAg80MThvcQjtRVyLEoDFkIp4OU2CxWlfYk4nu20heJm/TcWazZhMaU87YGox1v0dINlsUGOD77lqWh+K7WmRSKrwYeMXm4ZvbnVMTACk1UGexfCbzn71FLTRRa+aHmMCEZwrkv6AnaGeoUUyONzfTFyDHFYRAwP4DR6BBe4z/qct8UcaSTS3XunKeGXu8K6vqrrF92KYrQOq6yD3Mlb5C3qDHjqJXpiX27IewxOEtD3PU7Qj60QA==
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com (2603:1096:604:153::9)
 by TY7PR01MB14890.jpnprd01.prod.outlook.com (2603:1096:405:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:27:42 +0000
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f]) by OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:27:42 +0000
Message-ID:
 <OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
Date: Tue, 28 Jul 2026 22:27:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for
 Behringer Flow 8
To: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org
References: <20260526072906.90106-1-chengordon326@gmail.com>
Content-Language: en-US
From: Mark Shi <liaronce@hotmail.com>
In-Reply-To: <20260526072906.90106-1-chengordon326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To OS3PR01MB8827.jpnprd01.prod.outlook.com
 (2603:1096:604:153::9)
X-Microsoft-Original-Message-ID:
 <3d2721f9-9904-42c1-8095-21457a8c7b5f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8827:EE_|TY7PR01MB14890:EE_
X-MS-Office365-Filtering-Correlation-Id: e245f8b8-8867-46f6-a128-08deecb4615d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|5072599009|25010399006|41001999006|23021999003|6090799003|37011999003|8022599003|19110799012|8060799015|440099028|3412199025|3071699003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXFLRDU4YzE5dS8vTExDbFMvS3VQV2xnT1dvSWJkeFlMblZhdU1RN0pueVNQ?=
 =?utf-8?B?c21ZM3ZFcFNHaUYvRHhmOUJtVWVEV2hsbUVESHB1c0duSUs1V1NkbFBheFBk?=
 =?utf-8?B?NUNSYmZFczRlaTA0ZXg2SG9pKzhtMDYybVlNWVdCNDFPWmlua2JLa0Q4YlE4?=
 =?utf-8?B?b1JCY3FvczlDRW5VMUpxblp3Qnc0cDl6RDJwdStlT2R2bk41NVN1LzBFcG5s?=
 =?utf-8?B?NUdHdlZPeWlxYmYwQ0pSb29leFd3aWlXZkhEZTFPQVdTNFBqTUU0RGUwZXVk?=
 =?utf-8?B?RU0vSFZCL1BuTjVCdmlKZnlvbHZtWEk2ZklldlBTdEd2NVJUUmUvd0RkZnUr?=
 =?utf-8?B?SWV1QnlnMXV3TldXd0N1S0tlOFliSFdoRmpEcHRpUXl4Y2hYc1VCRWh3N3hS?=
 =?utf-8?B?aml3MjJUc1Njd283TTE3TU5FRTg5YzZULzlFampmMlFKak5zaU9Zc2pCSW1k?=
 =?utf-8?B?ZkJta090bVBzUkFpYzBvZS8vOUJ2ZS9uTWsxYUdsUk9wN05jWXZ2V21XbUtw?=
 =?utf-8?B?SlBMb3RkMEFIZW1JSklTVFhqZ0hQajQ3RmU4THN2enQrOGZRTU1xZkFKbXJX?=
 =?utf-8?B?OFhpemFzaDdWSXhZbklQdGJiZUVsYk56UnQvU3doYW16bHRtYWs5Nmg1VEM2?=
 =?utf-8?B?ckYxbE9ITis5TkliaDk1YTczL0ZrTXd4RjBMOHdsaFhINGJybGlVQXN3cGcy?=
 =?utf-8?B?dk80U3BkSE9CelNDWmdhWDVwa0o5cVlCV0VFN2U1VVVTcStsSC9uek14Z3pt?=
 =?utf-8?B?TkpMejNKdkN6d2dTeWUzNTNTV0I3blFUa3owam1yNkNtYUQxUU5DMXg5UURP?=
 =?utf-8?B?T0FMc3RwRHVoZU1FVEhPcGRPQVVxMGgrQnhXNGVoVUgxdHRFVElNYzQwcm96?=
 =?utf-8?B?Sk9KSGErYnpoVzlxSlcxV1VCQXk1SnNiYkxqUFlrbXRoYVpsdG9UQzRBSFNR?=
 =?utf-8?B?RzFFVFRNMVhac0hLQmgvRVFtTGdQOUw0ZUhZWWpZYlYzSHR6K1VMSnQzS2R5?=
 =?utf-8?B?VGVYa3QwTkRKY3RPVHJjdWpLVzB0eUlRMnM2Z1BBdGdIVkJRSnhsNnVPa0dR?=
 =?utf-8?B?OS9RTDNqdUFqU2kxVTNVWTZlM2dYOTR3b3FBbG41bTJ3dlMzSWFQdDZSSmx5?=
 =?utf-8?B?eDJFNXd1bjNrN3gybm9RbGlobkh3K3hrODB1TlhTQnlpSTdQM3JnYU5STnEy?=
 =?utf-8?B?eGRFRStCbW5iUzJTeG9OSFdSMThRVXRsSUxxT0dFaDVVTWtmNFVpMGswT25k?=
 =?utf-8?B?aGdkZVpvZmQ2RmFCMUFteTJDZ2E2S1RTUmRSSFNTSDh1eFZzZzhGT1BERmVJ?=
 =?utf-8?B?R1FCMG5ZcDl1NXMwQnozQ3dQdjlQNVNjQS9QdFhlOEtDL0ttQkZmVC9qbGkr?=
 =?utf-8?B?S01ZQjRhOWlrNWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk9JMjN5bzlpMm03SVZucnk3OTFLTmZkK2VudC9pQmhQWDFNSEQ5T2FLYWRv?=
 =?utf-8?B?cTNZTzVrU2FIQWcwQ0FIT29BcXBUOWFUdnh2d0xCSjRaRmxOSENHV1BUck0x?=
 =?utf-8?B?aVE5K2gyVlBjY0NuMkU2NHZBTjd6KzcrRUpGNldpMzlhWUJJd0ZlaE4vQWxJ?=
 =?utf-8?B?TyttS0xmWFpHWFJnY3R6cTFWM1pjQmliMFVTVjRjSXQ2dk9ScEtObk1yOTJE?=
 =?utf-8?B?TEtDVWc2anZBZVZmMmtmWXEyMnBWdmdpaUtBbzhXN1I4NnJUREVaM2owOVFx?=
 =?utf-8?B?RXZyZy9zZTJOZnhKZjhqNTVKTzl5VldlTWgwSFd6U2kwV01hQWVROUFlRjdu?=
 =?utf-8?B?Qm5paVFISHFkVW5BT2ZHdFgwaW5QWFkzY2NGVno4WU40cmd2ZzdwVUZCb2Fk?=
 =?utf-8?B?YXhqMTJHTUxEbDVVNUNmVVNSU2FCWldQV1FVZ0sxSnNqZVNsOW9RSXpqU0Zz?=
 =?utf-8?B?YkRpdGorMlFFN2pYMWJQT25TN0ozeWJrZ0FsaUYzalFMeXlDQ0VYUGttQnFP?=
 =?utf-8?B?cjE2ZTRsaitRQkw0Q2p6NmZZeUZsblhSdFZHVVdFcnRJZUtoZUJwMXRFak14?=
 =?utf-8?B?ZmR0bHNhdWtpU1lKZzVFbDFUYkpnelpuaUJCNWJPaWVHWThpb2wxR3J4TU1L?=
 =?utf-8?B?TS8xc2l0aVREZnEyVzVCc1UrVDNXRG9lUjgxS0M1c2NWeXdpaU5wQWh6SlYw?=
 =?utf-8?B?aHlyTjZJaFlvM21YUVJ2ZGNHeWpwaXdiK0tEd1lBeVVVeEpVY3gxZTJjY2xS?=
 =?utf-8?B?MFF2c3N1TE1uZ0hBcVU0d0xzU3QxbzJUWlZDdXE2cmNqdEdDMXhHb2lmNFZt?=
 =?utf-8?B?czFxM0hWOTJ3VXZkeFh2bVZGN3MxdkJMTWhtK05PTnEzYkFtZ0cvK2ttRFhj?=
 =?utf-8?B?a3Jrc2N6MTM4ems0R2tUK1VaRHJmb2JuOWpKS2NXOXFkVFRpUlR1U1hZWllB?=
 =?utf-8?B?bU9JMStLWE4xNmZoemMyNzdzeVNGWHJHY0RjWmlySWVzcGovU0xyakdYMmpy?=
 =?utf-8?B?cUdqekxGN1g5dWRIRzNxSXNRSHhBcVNBMHppajdQdnIyN1VMcThDRmRBbS91?=
 =?utf-8?B?MTcxTlNvcXpOSEFRWkRHWGkzNHByNnEvbnNERUl5ZXo5bzd2NUNmdGlSNWxG?=
 =?utf-8?B?OW9mR2hvTnpBTDFaWXNXTWVBU3dGblhmVDZObVRXNUFuRDYwVkhoL1RlS1Zy?=
 =?utf-8?B?TmU4NExmMVpRKzlLWXBFZi9rRG8wVjR4WDZySkpKdjZxRXY3WDRoZW1ENnhJ?=
 =?utf-8?B?V3VJd1hqa3JidmJSQ0pYdmU2bXBLSC9WOW1HZEM5TUh0Yyt3VERWZUZ5S3d3?=
 =?utf-8?B?R2F3Nk1qUkMrQzZBaDQvRVBUdUhjWHlCVlcrcnNjTHdGWGR5MFBMNW9BZC9p?=
 =?utf-8?B?M1RNZTYvMGhtdnUyZWpQZmRwNjJKUEhSb3hmUjU5elVaRUxqc01BUERvV3Na?=
 =?utf-8?B?NXdrS2l2S2dYSkhIOGt6QnQrM3RSY0VQL0t4Vm5MSlRyZEIydjdkbi9DWU5J?=
 =?utf-8?B?bVlvazVSdXQ5b09zVklwaDFLWkovSkNZT21UcG0vR0U1RHRrTmVWRzBLVnAy?=
 =?utf-8?B?QVdOWmptSndOUjlvckU3dFJiazZsekdxdGt4NHQwTnhTOGYzWVVQbFk2cDJU?=
 =?utf-8?B?Uk9Gd2U1T3g4UWg2SUIvdDlnS0FLb1ZhMHUrYmtjRXdBQ3lDOXBGWUZyQ0J3?=
 =?utf-8?B?RlljVW45MkdqSGNWSXFsM2FLSnhlY2N0bTBmdHM5MTdBeGF2VHE5eExTam9U?=
 =?utf-8?B?UWp2WlBaeUVmZnNubGM2cWo5YUdMQS9URW5URXd3Mk9OdHhLZ21uNUdjSEh4?=
 =?utf-8?B?WkdzeXdSUzM5Rmh6UWR5b0w2Y2QwcVQ1QWhEY1U5ZmN4U0pjbXZaSVhTaXZy?=
 =?utf-8?Q?MemXqdpJ+LLCK?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e245f8b8-8867-46f6-a128-08deecb4615d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8827.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:27:42.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14890

Hi Gordon,

在 2026/5/26 15:29, Gordon Chen 写道:
> The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
> declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
> its UAC2 endpoint companion descriptor. After 5-35 minutes of
> continuous playback, the device occasionally returns a capture URB in
> which every iso_frame_desc has a non-zero status (-EXDEV bursts,
> visible as rate-limited "frame N active: -18" lines in dmesg from
> pcm.c).
>
> In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
> and falls into the early "skip empty packets" return originally added
> for M-Audio Fast Track Ultra. As a result the playback EP loses its
> sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
> stops advancing while substream state remains RUNNING. Only USB
> re-enumeration recovers.
>
> Three independent ftrace captures (taken at the moment of stall via a
> userspace watchdog) consistently show:
>
>    - 60-70 capture URB completions in the 70ms window before the marker
>    - 0 retire_playback_urb / queue_pending_output_urbs /
>      snd_usb_endpoint_implicit_feedback_sink calls
>    - every usb_submit_urb in the window comes from
>      snd_complete_urb+0x64e (capture self-resubmit), none from the
>      queue_pending_output_urbs path
>
> Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
> early return is skipped and we fall through to enqueue a packet_info
> whose packet_size[i] are all 0 (the existing loop already maps
> status!=0 packets to size 0). prepare_outbound_urb then emits a
> silence packet, the OUT ring keeps moving, and the device rides
> through the glitch.
>
> The default behaviour (early return) is preserved for all existing
> devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Gordon Chen <chengordon326@gmail.com>
>
Device: Mechrevo WUJIE14Pro A-7BC4U
CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
Firmware Version: T140_PHX_V20
Firmware Release Date: 2024.1.8
Kernel version: 7.1.4

In Linux kernel 7.1.4, I found that my laptop couldn't wake up from S3 
suspend; I had to hold down the power button to force a shutdown and 
then restart it.

Using `git bisect`, I discovered that if I revert this patch, the laptop 
resumes from S3 normally.

Best Regards,
Mark Shi
