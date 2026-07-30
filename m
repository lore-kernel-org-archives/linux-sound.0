Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010018.outbound.protection.outlook.com [52.103.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A733438F;
	Thu, 30 Jul 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426019; cv=fail; b=to4hF2RlwWxmtgKlLhkv+a0mPFLQj1GE4zvg1witGUkmUZmsfmXTCJs7UEw9ASL549QG1cdClD/xGd9yDbS+rBf6asCvK5n8cPWuqKE076/gW9hcopNNC4VKVZwE8jYXiiDzWpAk8tEsbxCKM4kkAvlR7/1GGK9tfuc02Qw3TDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426019; c=relaxed/simple;
	bh=OKGvmSsQ2VsGZt6lcOSRmzyJ0Qo3aG1c4Rs3fw/b0JM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T25Dox2WGJIM5CAQUbrqDDzr7HHnrQrSkM2kAv7FGZplcKkH5z8awa4arg9mIVXnjvbAJE/L9XWc06zeca88Bu7oU1O3vyMftC4bjPqIxSfIFheBM16b5q5A4T0AiJJPjc4J2HsGiki6D0ZXY34w+oe4bzfGBPY5DnHBIIdsDyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=j0/EzgfE; arc=fail smtp.client-ip=52.103.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="j0/EzgfE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl/LSEbRYEgoAjt22KO+N6bahsrq2Yp7JCiB8jvuuLqt/WoCL53hufIMllO/t+0ELxqPy2vvuoQTeCdxqKKNnbhLsoL7/cnzYkPtKD/PToB4SUDpwPZHECz9ajexnMkX9i3+eIOI6eJ0c8B0YCkkxqQZsozqId0OyYPIoS7xKbcx0/3jsrT+4vZRja9oD7qIfH/OZnNYB/0+ZKYyxgLKUxsc3Vv+WetUs9iPEB7er5Sg1uMQ3PsDVLxBbotAE0TmBeD6Xuz3CaGfHgantsAcsU8y8XmOjQj4OPlUllU1zY312Hxfkx8koC8aqGOvam4e0rfCM3Xhv5mYNZhw8979Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SK7i9XKpdS9yvWjRs1CdRl1lT2fHPEYI7HfE4wZe2jg=;
 b=AQLLcpBtGRBaO5Gz/kYGmbuOWveZkTTqcVLo965iMn3kyzz00x1B50QveJaRDsnw7+dksIzz+HjVhPxx810XjzTd4OgId0sl+04sFiqUQyjz7vd4AKNnbb5Di8O6OyeKVlIJmELFttV3QG+Uz1Wh4/dLZqPvmzN7YClDTQSI9huC5W3NUW18dBXA/SPkdcKjo2+7zrF622LJ+AXKd6jL1PkFvcJpRJrvtBaEOYYrEUPqQM8ZNB2pW/HLbiClDhZbmUKMclLdYK9re8FYupoyQiWUgkGsReSgJkzhmWgQm9LYU93il+Usb2yPUxNUjxHA0oiTBlc+xsiVGnym4v+01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SK7i9XKpdS9yvWjRs1CdRl1lT2fHPEYI7HfE4wZe2jg=;
 b=j0/EzgfE046A6Rd2yStI9vwprWiw9ISbEP1tPzodi18Sn81h82hoM47VUQ3iko0b/vco+8KgESUc/cVOGM+PHxzPxz7DbiZuMD/z26H0ECMBWxaISMrumS8+eEo5SlWQhZZfVKL91TSD2Y/rO/hdt4DDITfkfBvtey131llfBG68rDElvHWH5JhzfwQZeV8zh4fIriRBfh1VeqwVqs9i0bjvM4CpE/Yzt7QoMbyFCmitzqrSgvXczXSoLEbQZZkR64+/SzMWVMvHN1HSIl5j5pSFIDKQKZgHVdG7GGP7S0r/YgByPfrZJThxLJmUSPBftJKzt6gL+nWDozrgxEEPpw==
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com (2603:1096:604:153::9)
 by TY6PR01MB17960.jpnprd01.prod.outlook.com (2603:1096:405:3a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 15:40:15 +0000
Received: from OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f]) by OS3PR01MB8827.jpnprd01.prod.outlook.com
 ([fe80::4bc9:630:cec7:d11f%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 15:40:14 +0000
Message-ID:
 <OS3PR01MB8827209050FF390ABE33A4E2DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
Date: Thu, 30 Jul 2026 23:40:11 +0800
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
 <OS3PR01MB882785126324D216CD667577DEC92@OS3PR01MB8827.jpnprd01.prod.outlook.com>
 <877bmc39j5.wl-tiwai@suse.de>
Content-Language: en-US
From: Mark Shi <liaronce@hotmail.com>
In-Reply-To: <877bmc39j5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To OS3PR01MB8827.jpnprd01.prod.outlook.com
 (2603:1096:604:153::9)
X-Microsoft-Original-Message-ID:
 <7eca3252-fe01-4b33-aa8d-258bd59241ef@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8827:EE_|TY6PR01MB17960:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2ec727-a215-4e38-7669-08deee50d973
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|37011999003|6090799003|15080799012|23021999003|19110799012|41001999006|24021099003|8060799015|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEJoSGRiVDhmc0NSSk85Ymt6dmlEcUtTZzlrVnYvQTNlbjRxakpYdk5OVGVm?=
 =?utf-8?B?QmFZR0NDQkRFODF4dlorZW1hbnM4RFdNZzVUQ082UjBFWUN2dFdWeFVzdnkw?=
 =?utf-8?B?Mnh4Z0k0ay9FRncvMDlrRUlMZlEwNTFxMU1ocDBZU2FtWlpBVVlISHNNblhT?=
 =?utf-8?B?UHpZQi85allzdHBkdCtjRnZMeUxOUmk5UTdrV0luUmZPcG1pcWd3ZkR2Q2NG?=
 =?utf-8?B?QWhDTmQ2eFJRd0h4dEgvWmVxaVVvMUpXcjZPRnpVa1hiVy9YallEcXRUNVNR?=
 =?utf-8?B?Z3E2NXo0WXRYeXpJWTNOd0V6VXVWdkNCazlyTUp4Nnh5ekx5UEpiTkFvS3R5?=
 =?utf-8?B?V2dIYjg3cXJpeU44MTIrS25LWTBVcnJNeUtXRnNiaVh3TUQ5ZWJjN1BXVCth?=
 =?utf-8?B?aWhCMmhHZ2lwcHd5MGtPTlhoZ0NYVmZMYTNyRG1GWEROVVFFWTRQTi9BZHo4?=
 =?utf-8?B?RjBZb1VTUFVHZUkrbGprUm5QYnpUcndqTGJaVFdsZnNCRUlWU2FUYWluWjUy?=
 =?utf-8?B?SXJvbzlYbHhiWldKN1RyYUFrdzdiM0NxeGo1WmY5ampSNlBDcUN0djRkUFN4?=
 =?utf-8?B?SjE4MTFOZUdUamtkSTRRWlByQWREMXd4UUtTWnZ4UUVnbkZUNHZ4VEhDREJU?=
 =?utf-8?B?SDYxbnhrM3NBbTV1TjZZeTRGWDZYalRkY3ZhZFZybHRQU1dNZTRYZXNuZlJi?=
 =?utf-8?B?OHNSOGlsc0tDRW4vRW9rcUN1WmQ3NHpOMWYyTTZLdHRoYmVhU0toS1Y5VkZu?=
 =?utf-8?B?K0ljamZncWNMQ1NVc0hGQ295ZkZDWHZGNm9mcGlCWUh6NnlSUXh1WnJGWGdV?=
 =?utf-8?B?QTYyZ1pwbmQ2cVh1NjU1NUxPZklEbGVnV0Q5SVBzdXZZMlpySEw2NFZqaFI1?=
 =?utf-8?B?bzRNUkpTWFIxNlVERGU2K3M5eFZveWcxejZyeWd0ZTJXM1ZuTjI0S2JGSW0z?=
 =?utf-8?B?dUhYUmhiSE0yMGhEL25OZUlFRlJCMEZld1N6SVNpbTI4SHZmeFVQdk16Smdl?=
 =?utf-8?B?YkdXRGpzT2liT0FDOWpwTFRHckNSeTVoVFNKYS8rd3A4VEJHN3cwWkRyRDhD?=
 =?utf-8?B?cmVJVG9SME1NUzlpUlJvQ3l0VFFJczNpMnloUzJmS09ZNjVkdWFBUXhXMUVJ?=
 =?utf-8?B?MnJHenhVTzRMeVU0RWVxQW5GaW0wNFhNZ2k4OEIvdk01V3c3cW55RGNIM0k1?=
 =?utf-8?B?M1R2T3NQclNPV1JGOEMyeWJJZUVuYStrcExLYzJhK0s0M0MwcDhkM1dqaSs1?=
 =?utf-8?B?Ui9ZaGFvSlFJQ3FKbFdNWHJMS1FGR3cxd1Jpa1JYVVlpVTU2ZUpOcUhzS0x4?=
 =?utf-8?B?ZGtaWTUyRkxuODBZd0xyK2VveUUvV29TNEp1eU1UVXJRaStFVnpINldmak5M?=
 =?utf-8?Q?Gh/r4JiYBq5LrAvLdGjGM+JfHBCthu6Y=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YldiTUJDUTlLVmdaSmZ3OTBHN2xDblBFeUl6eFdaQmVkOFpuSkJ0bHE2RUYy?=
 =?utf-8?B?cW5DZVZuT2RSK2N4TmNFQ09uajRSbHR1K01IbGVZakxoazZ1QnE4b1F4Yloy?=
 =?utf-8?B?YkdqcWQ2NWduRXNpMDk0bEZ6bmZnRVJLbnlFNXhndURMdkpoSjhnc0E3L0Ro?=
 =?utf-8?B?TmNQRjh1YlRrUjJnVUZYYk9nbWRZMkxmVmY3T09YcVFxU1dQNFNlTDB6VDV2?=
 =?utf-8?B?VE1qbXp4OEVHc0lkRnl0WDI0NXVmcCsrdTdUQjRvTDFJZmtIZUxSekVQaXJm?=
 =?utf-8?B?NVZVTEtrd0tSdVFVdThuMUhUSFZuTWhnVzhXdVZ2bDdtRzVOakg4L202alBl?=
 =?utf-8?B?TlpmWUhidDhsZXNuVnMvd2ZHU1VMRFVkN2drZTJnOSs2NUJFNmpBQWFWUCtG?=
 =?utf-8?B?WEM0TGtrZjhQL2ttSEhKRTNxbGVpaGtQazlXVW5FNjdnK2oyMFpVNjFTR21J?=
 =?utf-8?B?NGEyWHlGdUZjaUdLcFlYa3RkdEU0YWF2Ulc5eG40NTNhQ2sxU3FrVmtXNWJm?=
 =?utf-8?B?elBkcm9TT0ZpdE45TWU0MUlINHhWM1k5WVZHWUFvcG1yS0t1cmJXRHY0bC9H?=
 =?utf-8?B?MHgySzZ3aHN4Z0hIYUMwVE9na3JhNjRLYUpsZk5MZzlaNXlkNzBtbG5kcFpE?=
 =?utf-8?B?c0xGdEZnQm8yM1hBVDV1Mi81V3ZHSGJ0amM1ZGYwKzRCdXdNeXE0MmpLb3U3?=
 =?utf-8?B?Rll3VjFZWWI0NDBxQjZTMzBEeXZQdkNySTlHOUg0Y0hOZXhhMFk5bndjWFB0?=
 =?utf-8?B?akkvcloxZjNXdTlwcEZoVE9CRkJyMS84U2ZLR3V6MTRwZDRLcklBRHFpNkFI?=
 =?utf-8?B?MThScjArNStDOXR3Y21Nam9XYTN3cHd2QW00YUN5djRRMXRZanhUd29YR2wy?=
 =?utf-8?B?UThBYjJCWDdMb0JVeFhqdGNnU0lyUlhqa3V1Q2Jiem0rRmpVS2NIVTJnVk93?=
 =?utf-8?B?YThzbFNiOUl2ajRnT3phcTJaSm5MaStLKzdHS1R6a1BVZGt2OVVtcjdQckxp?=
 =?utf-8?B?TnZRMWZZR3JKaXlsVnZSK2xJcG1Qc0c5Q2sremFJQjVQVFlzaWd1ZkNha1JO?=
 =?utf-8?B?cmQ1ZzBydit3cE04Tmd6OU5ZNDkwZUtBa3dzUERmZldKREVmbXdPV09pM2l1?=
 =?utf-8?B?VzFUNU80cVBmNWVkNDl6WnpGYXlYNHdvMzN1VGFDcFl2N2tadnluY21waXp6?=
 =?utf-8?B?ZGE1V0RObC83eHNFVThKUjZOSi81dFFLZzF2MURkSGVYYUNPcHpxMUtjV21H?=
 =?utf-8?B?T2VqN2NNQmFOS21OZk5PdHZmb0hiZ0hWN1piQTE0V21VT3p3WTZmQnl5dy9E?=
 =?utf-8?B?VlFVaDljQkRaUDMwUWEwV0FiUTFrMGtXa3BtcG1xOU5KbFJnNUgxdXRiSmRS?=
 =?utf-8?B?TUsveDZNVWxWeHhWWTN0MVFna2FGVU1UTEFsbnJPZVNjWXFCeVNUc3pzMmlJ?=
 =?utf-8?B?SjBQNXEvZ3FIbGNMV1NIY3liT29UYmw0azBjUGZGSzd4eGhPZ2VCWEFvZ3Rt?=
 =?utf-8?B?dXRWN0JpNTI1YXJ1Ymh5RkJMd2J1UkxXSGd6YUREUTBwTnpZZnQxTkkxT0Vz?=
 =?utf-8?B?RVBFY2RCeCtNa015VXNId3BaSWVwQTkzV1JYWFdYR25NdURzZ0hiK3BVNkhV?=
 =?utf-8?B?V05McnNjdU9WY0Z3ZHg3dFk1dWQxOStWN1VvMnFjMDZxR0REZ2tkdUMyeU02?=
 =?utf-8?B?MDI4L0tZZ0xiMXVFdy85bSszeWorUTlRdllScWhWekpEcktCaENIaVpWQXRP?=
 =?utf-8?B?cUZRTTNnOXh4bXZpbzJWaXhnZkdJVExXOXZMMU1QemZDOE5KRWw3cE0vMXZS?=
 =?utf-8?B?dDNFQjNMUUlJN2xzVk9xNGRwSkgreGppY1F1U2pCSE9zMXNIb3VlSXhoRHBS?=
 =?utf-8?Q?U1s2WtMt8r7Am?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2ec727-a215-4e38-7669-08deee50d973
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8827.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:40:14.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17960

Hi Takashi,

在 2026/7/30 21:13, Takashi Iwai 写道:
> On Thu, 30 Jul 2026 14:33:44 +0200,
> Mark Shi wrote:
>> Hi Takashi,
>>
>>> On Wed, 29 Jul 2026 16:28:23 +0200,
>>> Mark Shi wrote:
>>>> Hi Takashi,
>>>>
>>>>       On Tue, 28 Jul 2026 17:46:05 +0200,
>>>>       Mark Shi wrote:
>>>>                Hi Takashi,
>>>>                    在 2026/7/28 23:02, Takashi Iwai 写道:
>>>>                        On Tue, 28 Jul 2026 16:27:35 +0200,
>>>>               Mark Shi wrote:
>>>>                                Hi Gordon,
>>>>                                    在 2026/5/26 15:29, Gordon Chen
>>>> 写道:
>>>>                                        The Behringer Flow 8
>>>> (1397:050c) is an 8-channel USB mixer that
>>>>                       declares OUT EP 0x01 with implicit feedback from capture EP 0x81 via
>>>>                       its UAC2 endpoint companion descriptor. After 5-35 minutes of
>>>>                       continuous playback, the device occasionally returns a capture URB in
>>>>                       which every iso_frame_desc has a non-zero status (-EXDEV bursts,
>>>>                       visible as rate-limited "frame N active: -18" lines in dmesg from
>>>>                       pcm.c).
>>>>                                            In that case
>>>> snd_usb_handle_sync_urb() at endpoint.c counts bytes==0
>>>>                       and falls into the early "skip empty packets" return originally added
>>>>                       for M-Audio Fast Track Ultra. As a result the playback EP loses its
>>>>                       sole IFB-driven feeder and the OUT ring starves permanently: hw_ptr
>>>>                       stops advancing while substream state remains RUNNING. Only USB
>>>>                       re-enumeration recovers.
>>>>                                            Three independent ftrace
>>>> captures (taken at the moment of stall via a
>>>>                       userspace watchdog) consistently show:
>>>>                                                - 60-70 capture URB
>>>> completions in the 70ms window before the marker
>>>>                           - 0 retire_playback_urb / queue_pending_output_urbs /
>>>>                             snd_usb_endpoint_implicit_feedback_sink calls
>>>>                           - every usb_submit_urb in the window comes from
>>>>                             snd_complete_urb+0x64e (capture self-resubmit), none from the
>>>>                             queue_pending_output_urbs path
>>>>                                            Add a new opt-in quirk
>>>> QUIRK_FLAG_IFB_SILENCE_ON_EMPTY: when set, the
>>>>                       early return is skipped and we fall through to enqueue a packet_info
>>>>                       whose packet_size[i] are all 0 (the existing loop already maps
>>>>                       status!=0 packets to size 0). prepare_outbound_urb then emits a
>>>>                       silence packet, the OUT ring keeps moving, and the device rides
>>>>                       through the glitch.
>>>>                                            The default behaviour
>>>> (early return) is preserved for all existing
>>>>                       devices including M-Audio Fast Track Ultra. Only Flow 8 opts in here.
>>>>                                            Cc:
>>>> stable@vger.kernel.org
>>>>                       Signed-off-by: Gordon Chen <chengordon326@gmail.com>
>>>>
>>>>                   Device: Mechrevo WUJIE14Pro A-7BC4U
>>>>                   CPU: AMD Ryzen 7 7840HS (Codename "Phoenix")
>>>>                   Firmware Version: T140_PHX_V20
>>>>                   Firmware Release Date: 2024.1.8
>>>>                   Kernel version: 7.1.4
>>>>                                    In Linux kernel 7.1.4, I found
>>>> that my laptop couldn't wake up from S3
>>>>                   suspend; I had to hold down the power button to force a shutdown and
>>>>                   then restart it.
>>>>                                    Using `git bisect`, I discovered
>>>> that if I revert this patch, the
>>>>                   laptop resumes from S3 normally.
>>>>                                Do you have this USB-audio device
>>>> (Behringer Flow 8 with USB ID
>>>>               1397:050c)?  The commit must be harmless unless you have this device.
>>>>               That is, if you don't have this device, it's likely a false-positive
>>>>               bisection result.
>>>>
>>>>               thanks,
>>>>                            Takashi
>>>>                        I don't have that device, but I partially
>>>> reverted the code in that
>>>>           section, and it went back to normal.
>>>>                Hmm, that's odd.
>>>>            Could you put a debug print what value does
>>>> ep->chip->quirk_flags
>>>>       have on your device?
>>>>
>>>>       thanks,
>>>>            Takashi
>>>>       I added `usb_audio_info`, compiled and booted, but `dmesg |
>>>> grep "quirk_flags"
>>>> ` returned no output.
>>> Then something wrong in your test :)
>>>
>>> Put another debug print at another place like the probe function, in
>>> order to verify whether the patched driver is really loaded, too.
>>> And, make sure that you're running the exactly patched kernel.
>>>
>>>
>>> Takashi
>>
>> I used the `printk` function to retrieve the `quirk_flags` for the
>> current function. Here is the output:
>>
>> ```
>>
>> [   23.225719] snd-usb-audio: quirk_flags = 0x100800
>>
> And what about ep->chip->quirk_flags at the place in question?  Does
> it show the very same value?
>
> The value 0x100800 means that your device has the quirk bit 11
> (QUIRK_TYPE_IFACE_DELAY) and bit 20 (QUIRK_TYPE_FORCE_IFACE_RESET),
> and they have nothing to do with the commit you're testing.
>
>
> thanks,
> Takashi

I modified the output and added two log points for this purpose, and output:

```

[   23.355939] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800
[   23.437401] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800
[   67.813139] snd-usb-audio:snd_usb_endpoint_start() quirk_flags = 0x100800

```

Regardless of whether I added a log point, 
`snd_usb_endpoint_implicit_feedback_sink()` did not produce any output.

However, without the partial code rollback, during the 7.1.3–7.1.4 
period, I could only restore normal operation by disabling PCIe power 
management using the "pcie_port_pm=off" kernel parameter (from 
"amd_s2idle.py" script's report).

Unfortunately for me, the platform returned to normal in version 7.1.5 
(even though I hadn't applied any patches) (T_T). This makes it 
impossible for me to determine which side is at fault.

---
  sound/usb/endpoint.c | 4 ++++
  1 file changed, 4 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 24cd7692bd01..cc79f4e9cf10 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1559,6 +1559,8 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint 
*ep)
      int err;
      unsigned int i;

+    printk(KERN_EMERG "snd-usb-audio:snd_usb_endpoint_start() 
quirk_flags = 0x%x\n", ep->chip->quirk_flags);
+
      if (atomic_read(&ep->chip->shutdown))
          return -EBADFD;

@@ -1789,7 +1791,9 @@ static void snd_usb_handle_sync_urb(struct 
snd_usb_endpoint *ep,
           * packet_info with size 0 packets, so playback emits silence
           * and the OUT ring keeps moving.
           */
+        printk(KERN_EMERG 
"snd-usb-audio:snd_usb_endpoint_implicit_feedback_sink() quirk_flags = 
0x%x\n", ep->chip->quirk_flags);
          if (bytes == 0 && !(ep->chip->quirk_flags & 
QUIRK_FLAG_IFB_SILENCE_ON_EMPTY))
+        // if (bytes == 0)
              return;

          spin_lock_irqsave(&ep->lock, flags);
-- 
2.55.0

-- 
Best Regards,
Mark Shi

