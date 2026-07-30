Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010016.outbound.protection.outlook.com [52.103.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8338DC5E;
	Thu, 30 Jul 2026 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414835; cv=fail; b=Zur2h5r5G0qQHpqCkB/+61LncCsDva9LOT/LyJR+DHSs6gKTmuIYXLdq1kau0pT4yLpMzd7g52DcghPYEJb8bKmg+p2bGrLpSLKmYGoCWrnmLr7Cu6a99qDg0GPEyahs8Px4kcVSegmJmPYZVCBVe//3obtkC5ZE1YLWrNpsTgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414835; c=relaxed/simple;
	bh=YDADOOun7ds1TCRzqUA1Jkr/QF+HOk+Sd9roLPr2Hl8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jQ1OglpnZuToQ5LE+/RAJzAWnITYtEhwR+nS7Pdl6/oCa1haBsbbW0pXGKPygAoIxCgt0QWxcTnVxY1S5bW8ih5ZLOOhxpYXWhhyAVbE2mzufKHDZSGVK0lEqI3tJe/KGSsU6FPSSttdnWzhG9GIMU9Q3uFGZj3c+6eMi/VrNKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=ePsti7sW; arc=fail smtp.client-ip=52.103.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="ePsti7sW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLG0JiX2mb5XyhT1yataNH49XGLrX62U7HYltcrch8fyZjmtRN3GFO69DtIDNV8sjUdlBtUfnw5TibOKLZflEGbbg7eFkYTNVNuJF6g2HB+LJ4ri0xRo/OQUMYLlB1E7BuIzKigtmGfrTqqQBsRYM4u1E/K9VyYxMOEx1W61NU+Vcsi0DDSnI2dPPg5GkwGH2yjm3vjE/bkqadJDlFU+ZCzKtDFR1bgdg148BwChLGMmz+UsdXtnLferPJjzxuWT7HlIZxMlq1DaFnaXDEz4fyTHF/Gk+wg+Xezho4x3bR9nzr6AfP1/7B6utP9rUi5KCyVo8VkG236yWb9E5GlhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnqeZdi2xA87DhbuMVgW52qpSXOVBGx/CKOPnJ9q600=;
 b=KZal0JtfYVCXzhbHeXsQONWaqTlNBUzqcKnLOhAkITa7waxfTbhNS1QxYyvEw+4yHOP3iZOwt5XFy1vV9IHVN7dSCifjSTlv/EhO91wCGBzgHER/aVh/0yLC5owGyfpu7xFlLQrrmeY9+lq9xo2NJkp0Ps0k8xEgzLdgtv738fAIEQYF9ddxjeg+Z8VcNRPRCKzb8M9y4pttNxK1MlYa8A1Owbq8471oZDLIhuhQ8tKdtmEl0mdi/PwU592Fo25TtQ9QakVk5kIqOJX6FKD3yAo6N5boWPqi8uTEaQyv2GD2PS8s7esSe2Xp7/HiVAXPhdJXjvcotisd9EJHP0yxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnqeZdi2xA87DhbuMVgW52qpSXOVBGx/CKOPnJ9q600=;
 b=ePsti7sWXlOD4s6wXoPiSSQHFOSy19lwrmVpqllGSQPUr47cKAIpGbqLeN/BobhQ8hLaqfpkhG/42m3aypLSHx3kMcFTCigGt6HskJJYDowxg4bRK6RJt683n2/uIBCbn/YPNLUPuJUafk5VPh5buyyBt56EEVJ8ZHRitu7MNawVjKrJ4u6Xgn8uBMWMKWynZjKNDgGB+XMA8gfmqT3wHiCI+RzgH/Rtl6N8aQQ4IwxB1aAhmW/pQ00uqfmiSTZnjyPMXsTmVBz2vB/Zp8ZBpepHJ15yfPlRCKH31ruFx3MQDGRp7aB+q0j3Ho7NfeXd6Ptj+UoerftM+xlPs2C2dg==
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com (2603:1096:604:153::9)
 by OS3PR01MB8225.jpnprd01.prod.outlook.com (2603:1096:604:173::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 12:33:51 +0000
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f]) by OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 12:33:50 +0000
Message-ID:
 <OS3PR01MB882785126324D216CD667577DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
Date: Thu, 30 Jul 2026 20:33:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for
 Behringer Flow 8
To: Takashi Iwai <tiwai@suse.de>
Cc: Gordon Chen <chengordon326@gmail.com>, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
References: <20260526072906.90106-1-chengordon326@gmail.com>
 <OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
 <87bjbr6tth.wl-tiwai@suse.de>
 <OS3PR01MB8827BF7068BF30726C2C8A1BDECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
 <875x1z6q0t.wl-tiwai@suse.de>
 <OS3PR01MB88275E7D7BCF41FE0689E701DECA2@OS3PR01MB8827.jpnprd01.prod.outlook.com>
 <87a4r95007.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Shi <liaronce@hotmail.com>
In-Reply-To: <87a4r95007.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0129.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::14) To OS3PR01MB8827.jpnprd01.prod.outlook.com
 (2603:1096:604:153::9)
X-Microsoft-Original-Message-ID:
 <ff7f593d-0a06-41d7-934f-e86f7846f9f9@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8827:EE_|OS3PR01MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 859698a2-f730-4c60-7780-08deee36cdc8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8060799015|19110799012|37011999003|8022599003|15080799012|23021999003|24021099003|25010399006|6090799003|5072599009|3071699003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VllYVzkyL29tR0NKVlV6RWg1T2dHZ3ZCanNGUE9RdGhkNVVTaVF0MXdsM0Qy?=
 =?utf-8?B?VGMyN0hCeThPUm1sUTJHYVpBZTV1K1YwMC9uS21DTEx2dkxzeHBNNzBhL2E1?=
 =?utf-8?B?RmRpTzA3TjdaQ0RlY1NDWjNMTkFiMzZ4ZVN4VFBONXd0ejkyRXVpRnB3TGRK?=
 =?utf-8?B?UXNqY3FCbEh5RzJFZlRaU1ZZdU15OHJMalNnZ3VuTUpKRUc5elQ2M1QxRFll?=
 =?utf-8?B?MnhFL2xPZSsyV21US2lnQUNrYjFDSlJwWGJNc0lXTUJmaHBzSE0xRU5PcUtN?=
 =?utf-8?B?YkhtU0puVzJiRlRvb3hQUDM2ajRGelF2bGVlanBVcGJhdnR2dklpV1loY041?=
 =?utf-8?B?aVBGUmp3dTYram9ma1FDYjN3dXZCWFE1ZWJRUURGVm8yRmEyNjJ1aDUwYXMv?=
 =?utf-8?B?Y2VhSnRxb0RMcitUVEN5V3FsWVBKTjErM0xnZDN3dHBhQkpWZWVxVm0wQVpU?=
 =?utf-8?B?Snl1QnVLenF0UkExU3gyaTNqZGhxUmNKRUhrR1lrcWl1a2dmTFNvZnhEeWpT?=
 =?utf-8?B?TTNjS0Jnb0QwOGc1RDFkRWNITkVvTHBGaTQ3d0w1Zk1ING5Ld0FxNDN5REFj?=
 =?utf-8?B?U2J3M3o1eTZWd0JXL3dkczJkUHk0eUZ0dk1YZnFZSjhZczFLcjJnaHNCZEt4?=
 =?utf-8?B?SC9xeGRESVljY2FGNzErWTlpcm5PazlUUkFiK29aM1U2R05nYTl3Y2Z2ekdD?=
 =?utf-8?B?OW5KODBkeWl2bDBjTWpOZldqM2U2V1BvaHhhZGdMaWJFVk9uclBQaGhySTNW?=
 =?utf-8?B?RWUwWlFmYVZTQWRpcVZFNW9XUXdIdHBmZC9nY09Hd3FNMGJuZG9CbkREcEZs?=
 =?utf-8?B?KzVQam9iekl5ajI0dm92UFg5M2tMaVBiOGhEMUxONndIc2h0c1hYVjU5VFRn?=
 =?utf-8?B?VVZxb2Z2VW9sUUZtZnR4Z3B1eFdXUWpPeC91NTN1cERESzZyeUpHbm54S3h0?=
 =?utf-8?B?MmgweGZHT3NlYm04RDVQU2xwbkRwNk1yV1Z6QkVpVzNtbytKbnBTdFpNbTIr?=
 =?utf-8?B?Uy9QSkpEZjNhK3d1L0htZTdzYVphVEkxNTVlcExmRnFuTVFSK2w4MTlXS0E4?=
 =?utf-8?B?ZFNLak1ISDFMUUMyU1poanNhMDgwSWVRMFdCOEFsYTN4WGg4bmxlZWNNa2d6?=
 =?utf-8?B?QUNTclZ1S29xZktTZVdtQVJXVEVQcXU4d25Uamp5OXkyRWxOWjlGSmxCUTRH?=
 =?utf-8?B?eUdaWVBYOEkzaXk4bTNYTEwrQzdGTDhoNUJKRkJCSTFORDBUcm1odGMyZmsz?=
 =?utf-8?B?RHBmQUJXYmduRFRMNUt6TU9TWUlRc252MC93dlczamIyR29IWkl3R0FwYnpR?=
 =?utf-8?B?VjhkT0t5WmFWbXpONnBJTGNleXlEN0xPM3ZabzdTd0JpUVArOXdROG5sZEE0?=
 =?utf-8?B?cGJma3R5RjhVc1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGdtWnBIUHZjQ0tBdmJxSXVZSUJvNGordmJHRUlSWUtWL2VESEYvdjcxUVhn?=
 =?utf-8?B?NXRuWXRjVnFtRGU3QTVCMysxSEpLWFN0V04rdE1KcXRNdTFMWEYzd1NUeEtO?=
 =?utf-8?B?cTN5T05TY25BUWJjV0FyQU02Qzh4Nng3cE5JU01xdnU4NWdqcGxvUkZZRFgv?=
 =?utf-8?B?c3JCMXFjWWNpb2IzRUhwUXVZeXRNbzAvQ0pYd09hMkVlQ0JyaTNraDI3eHpo?=
 =?utf-8?B?SDRUU05yOFA0eXpSQ2lUMVRPL3FKbDY2UDMrbGw1V2Uvck1lTzhQTmdJT3pK?=
 =?utf-8?B?NTlpbVlkZkVvaUVOY00rcXhTSFVvQ0xaOHY1Q1I1RkY0VysrWWp0cUdscG1L?=
 =?utf-8?B?dWhYMEZsekR3dkVHZmtXOHhhaFpnWHM0TjN2YlByRXRkUHJKNC9iSnJ6NFVs?=
 =?utf-8?B?OVY1dVJUR3dPWkk1bzhkb2c2VHdsbXYzNFA0M0ROd21EUFpuQnZZZVVpeUE0?=
 =?utf-8?B?c2k5N2tnYWFadGJQaEh5Q0pDdTdQSzh0ZVI1Nkl1ZmFRY01oZ0hhZmlTVGJ4?=
 =?utf-8?B?aDFPQ2hwRVRENGZGazdMdThGcTVGQmhyTEVPWEt2ZDJueTlBZDEzWmpoRlkx?=
 =?utf-8?B?WXBjUWZoSlpVWHdDR1R0ekxsV2U2eldpSFRrSm56YTQ4REhuWGlNdklHbS9O?=
 =?utf-8?B?NS9VcjdRckFqbUZFOXVYNktEUkRkTk5OSTVlZHJKYXBLWWFPUm00VHRtOUd5?=
 =?utf-8?B?bDUvc1YzUS9TQk1sMEh0MDVhUXlaZnRjVnhXMkNrVnNXenlLZTQxRVNPNUs2?=
 =?utf-8?B?SzJsQlpHN21xRURCNUJNNm5RZHYzNE9OL3lyMks1b2IwdmlWWTJZSUFiT2NC?=
 =?utf-8?B?VGxCeXZraWhEaDJnL1ZUQktqaWlYbnBFZndGWmpnbTArOGlNTEtSRGdIWExl?=
 =?utf-8?B?ZGJiMGdPWnZKejlRdU9sanRtcHNTL2tMTk1kTWJiSyt5ZittdWc1VHhKMEFh?=
 =?utf-8?B?YWI3TGNnTXAwSXFERHZVaFA2M2VnYWhmcUNLdStGdHlVYVByQ29TYTlVTW9i?=
 =?utf-8?B?a0d4WG5jWFQ3ZEx4bjEveE13R0JtaW5YQ2xpQXBHMGwzd2N0UTBKNUZPbW9l?=
 =?utf-8?B?TEtwbjE5WEoyUUpwUkZ5VGdpd0RhRU1aeEdhZFg1RnlydGlZeWRta1RpeUU0?=
 =?utf-8?B?SWlkQ1QvK0tJVGU5SEIvdVBoSnFaaURpaVZYZlh1SVMwMWIvLzhpeUZrT2RK?=
 =?utf-8?B?Y3ZYZVZMaDFPdWF6blJzNDNWajQrVzdQOFJFL3d5L1BEWGcwd09hSEtGcHJW?=
 =?utf-8?B?S1JwaFBqTitXYzhyRnRocDA0KzZRUDVhc0ozUHB6T01lUHdQZXBJajVwYnEr?=
 =?utf-8?B?L0VYSHd3RjJhNlR5WlhaY1d6d2MyQm5GdXMxcXlHc24wT0xLeW9TelFwL05k?=
 =?utf-8?B?U2lNcTVYdktkWkZpNXI3cWV4RUtaZGpTODN4Q0FPMkQ5NnVnNnU4ZFBDOFNI?=
 =?utf-8?B?NVhPMS9UTVl3SllRN3RxU2NyUDdXdzA5M0pPYlU4c3g4aTZRRTBBV28xUXJy?=
 =?utf-8?B?UWUvZEdYOWljUElGbkxSRk1OL291YkZuZnNTd25LV2E5N3k4dkI0R2gya0lt?=
 =?utf-8?B?Y0J3Z2R1T1cvZzQvRkx1TDdIdkRhMkN3TngzZUtVRzZ0SGdFRDJYQWxvbXJj?=
 =?utf-8?B?Mit0dDllUURjOGNOSFBkbG56Q0hWUEcxUXVobmtMYjdXY2ZqMTkwMnlvVS9V?=
 =?utf-8?B?YWZRN3pNRFY2cVBuMHBOUmVGbFdDb0h5ekhXSFhjb0FxcHVKQnlqeXZpNjVi?=
 =?utf-8?B?K2FRQVFHWkRGTWxuMDRSUkp5cjdWc0ttSFgxdHVHM0ZiVTVSbmZMangya1N1?=
 =?utf-8?B?c29KQzdJYWRnKzFmM2RwOWVKVlJWWTdsVzNMVjQzOWt0NGp6UTBqTHFpWkds?=
 =?utf-8?Q?PxmvmYPEQgFwy?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 859698a2-f730-4c60-7780-08deee36cdc8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8827.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 12:33:50.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8225

Hi Takashi,

> On Wed, 29 Jul 2026 16:28:23 +0200,
> Mark Shi wrote:
>>
>> Hi Takashi,
>>
>>      On Tue, 28 Jul 2026 17:46:05 +0200,
>>      Mark Shi wrote:
>>      
>>          Hi Takashi,
>>          
>>          在 2026/7/28 23:02, Takashi Iwai 写道:
>>          
>>              On Tue, 28 Jul 2026 16:27:35 +0200,
>>              Mark Shi wrote:
>>              
>>                  Hi Gordon,
>>                  
>>                  在 2026/5/26 15:29, Gordon Chen 写道:
>>                  
>>                      The Behringer Flow 8 (1397:050c) is an 8-channel USB mixer that
>>                      declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
>>                      its UAC2 endpoint companion descriptor. After 5-35 minutes of
>>                      continuous playback, the device occasionally returns a capture URB in
>>                      which every iso_frame_desc has a non-zero status (-EXDEV bursts,
>>                      visible as rate-limited "frame N active: -18" lines in dmesg from
>>                      pcm.c).
>>                      
>>                      In that case snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
>>                      and falls into the early "skip empty packets" return originally added
>>                      for M-Audio Fast Track Ultra. As a result the playback EP loses its
>>                      sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
>>                      stops advancing while substream state remains RUNNING. Only USB
>>                      re-enumeration recovers.
>>                      
>>                      Three independent ftrace captures (taken at the moment of stall via a
>>                      userspace watchdog) consistently show:
>>                      
>>                          - 60-70 capture URB completions in the 70ms window before the marker
>>                          - 0 retire_playback_urb / queue_pending_output_urbs /
>>                            snd_usb_endpoint_implicit_feedback_sink calls
>>                          - every usb_submit_urb in the window comes from
>>                            snd_complete_urb+0x64e (capture self-resubmit), none from the
>>                            queue_pending_output_urbs path
>>                      
>>                      Add a new opt-in quirk QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
>>                      early return is skipped and we fall through to enqueue a packet_info
>>                      whose packet_size[i] are all 0 (the existing loop already maps
>>                      status!=0 packets to size 0). prepare_outbound_urb then emits a
>>                      silence packet, the OUT ring keeps moving, and the device rides
>>                      through the glitch.
>>                      
>>                      The default behaviour (early return) is preserved for all existing
>>                      devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
>>                      
>>                      Cc: stable@vger.kernel.org
>>                      Signed-off-by: Gordon Chen <chengordon326@gmail.com>
>>
>>                  Device: Mechrevo WUJIE14Pro A-7BC4U
>>                  CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
>>                  Firmware Version: T140_PHX_V20
>>                  Firmware Release Date: 2024.1.8
>>                  Kernel version: 7.1.4
>>                  
>>                  In Linux kernel 7.1.4, I found that my laptop couldn't wake up from S3
>>                  suspend; I had to hold down the power button to force a shutdown and
>>                  then restart it.
>>                  
>>                  Using `git bisect`, I discovered that if I revert this patch, the
>>                  laptop resumes from S3 normally.
>>                  
>>              Do you have this USB-audio device (Behringer Flow 8 with USB ID
>>              1397:050c)?  The commit must be harmless unless you have this device.
>>              That is, if you don't have this device, it's likely a false-positive
>>              bisection result.
>>
>>              thanks,
>>              
>>              Takashi
>>              
>>          I don't have that device, but I partially reverted the code in that
>>          section, and it went back to normal.
>>          
>>      Hmm, that's odd.
>>      
>>      Could you put a debug print what value does ep->chip->quirk_flags
>>      have on your device?
>>
>>      thanks,
>>      
>>      Takashi
>>      
>> I added `usb_audio_info`, compiled and booted, but `dmesg | grep "quirk_flags"
>> ` returned no output.
> Then something wrong in your test :)
>
> Put another debug print at another place like the probe function, in
> order to verify whether the patched driver is really loaded, too.
> And, make sure that you're running the exactly patched kernel.
>
>
> Takashi


I used the `printk` function to retrieve the `quirk_flags` for the 
current function. Here is the output:

```

[   23.225719] snd-usb-audio: quirk_flags = 0x100800

```

-- 
Best Regards,
Mark Shi

