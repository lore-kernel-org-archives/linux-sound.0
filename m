Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412025;
	b=zX1oS1/0Z1EPYg1xmHDoMO2mOxr7tujQd6jvfGAe+tliJoB39rmn+D7cqKmdpINeSI3+
	 EA0f4Fdz0Q1io51P00uLma90Ks3oFZOAxmA6/RUJVfZ/SGKUKAHwdrBukSXSjOdqSpSEP
	 vpXx/ZamOQ5/h1vWcSA01qxKCUn8UBjzcvoS8h/lcsDDwzN1QiWmUMJSL3CRxsHYMwt2W
	 j4M7/DhUG0MOfwEnjhEvh1S1sDYT3w/06G8QV3lmRClGlNDvBrvrk8AlVDleRyXkcwrR9
	 cmGQZZAN6+NI1Z20fTLWLQiRpvbSSPxfmrHBpQF0TDjn35PpEcWICUP3c+25zfHCG/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412025;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5HgMTbVgR9wDj+uQ4td7pjY3+5eTTzgwFLFdGj8En2g=;
	b=ngvXv8gRvXsKRV1BgnKnpXPNRBkb3QHKAvW1wELfb4XKwH01klsinZ1xudlgP7dQiBSo
	 CbjKQbriFcjRmyiuovCHGoXYj/jU9z427b7NVefTWzoh/w51CwV759Zs4F+K5Tydtsb85
	 uCZaZHkuGZAS77DbFsAHfTW1DuYTvCqr3QAQH4KogFQUc75RE1o0LjfsWMwcgbXbpYd/v
	 +QfWc468NeuMWgOzmJXRQzUQ0zFYdYgea7niD4NHjolv8jg19iD52QagEDE/LwoXQ0O3a
	 muM+aV9YGdlpyV/nFkbssw5dlxyp6RtUxiRWPvdwhkQWYxZrHWB26h/ltVkqWRBieJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=KzAhhIFg;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=CPOkzndr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDA606A334
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDDA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=KzAhhIFg;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=CPOkzndr
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1VtN535075;
	Wed, 11 Nov 2026 10:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=5HgMTbVgR9wDj+uQ4td7pjY3+5eTTzgwFLFdGj8En2g=; b=KzAhhIF
	gepybTnfvnZZm0IvWHQxLEVX+ZNd7tkMrvcZfR5my8+C++YvwNzeI8V9VIBQYC46
	JzT+443cZJzashLGJOyK2/EyRDz7IPXlgwc9P9UiOnPLZvqr9nXZ4p+veMkglB5E
	K/XxDn1CYtFZHsgTauczf4ghRDolWjgv7h9TTLy5zUnjNrypQgfoHy/BSVbILgc6
	Ve6qO3RfoekMHn9n8tXfVVkrw+6eXCzB369uVTK+W1fN7bXJ4k6M0vOCYJtX5bCF
	bbHujnxJXqWGwF8Ruww12m1z8T1PgaxXLam8FwqEGOh0bSAg60DZIMlsGVp+O2+D
	GK2myAQEi/OWmGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5HgMT
	bVgR9wDj+uQ4td7pjY3+5eTTzgwFLFdGj8En2g=; b=CPOkzndrXuqedAfLM9Tij
	0SmZCI1NkKBDGbTbyV3c6cJ2dggU5UbEWPR8sFNLDFephYY1qzVcy9Bm3ONsM/Fl
	9EEgv/kvH5StlfOJuAv7O3aLok9fVRObQHuZXbqI0nh1z3wi1XeTTCWtYWf/E7/B
	OgNTJgPvxsNb+TQPawrQLpFWHQByROQOlQKGKSZXTEEYQV7PORPytDgr42ZDkmFs
	EFnP+c0lJhSvb7X6z1m7SyWRo6lv9WrNkM18BsCDHJ8dM9pnwUau3KZ9Uu7xkkhJ
	AWvwF/cT9c2KiL7p1DOA8lF9fUUZLqEIBGT7wE4aeemMjJgWkLbq9CKofn0kCdNT
	A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvhw3b38q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:46:57 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syuQc487aGEGDaInxFBzN0KBCujTWrLU42lR6nL3cYz8e3bKC3WjHH6Xg+Tq31LyI19yuEfPMLCgah+LYU79rytQxB6rJfeS4MHJHWLs0x4oCemnI1LoRakTRGnbPcI2ny4B3eofb0xVAsZRWjLtAtAj+87vW9GAr0DCqWd28tDrG/1lO6WBGOTgtld+dJ2e/fJlaqXAuXJY8wSfhUaslLOliReXZ0f9CRaOZBxcuucbzaYkB1iDJCXxPSGNDp770R987KOFOqvaGvs+vopdWayF+5CyAXuyn7WRfgoa8yxOCtfHHpHzJIsrvd973IxpmUZWmHP/b6tw7I+ebSaXSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HgMTbVgR9wDj+uQ4td7pjY3+5eTTzgwFLFdGj8En2g=;
 b=V9Em12pFm/0XdSeTBLY+gUgrPE3nkqHEa5njoqqeFMrAnNIpTMzjTBPROduOjC2zhQcp1GFSwrwztmkpv/tO7j/UUqejtxwvuf11ZRvxCD1XBzLIOU8UallSrqbW4y/BWieE9c6nV2MHqwock55A2XhJpOUZ9GBIowktmhBLluyl6+aBlO4+2w/Pj8JCiUCnIY1iS74xo3oai5pTE32ShYut4ixVTjZhAuUZ9kS8EXjVH1FNWrkiZUi4QCpnJoGzxgSrk4oQjv2o8Nv46EVUrE8P7DextyUGIKORQnWrKbwlR+NLNTTg7jon/6I0bx5frp1E5jJyypWwsAXa7oA85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:46:56 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:46:56 +0000
Date: Wed, 11 Nov 2026 16:46:52 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/20] ASoC: soc-component: add
 snd_soc_component_regcache_mark_dirty()
Message-ID: <avSN5qDeNWUBoVO2@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87pkwdmf6w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkwdmf6w.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0004.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::17)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a3956b-16e6-4988-2373-08df400b03a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|56012099006|11063799006|261021121427099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	kBiSPw6Ao3KKA6IVcXMRn5CzliUOjOdnaUpFo+SGTWC8h4zu+bI+QtSO4TNCYb3jCPitsuAxdGFrZarlV/YufwR0pfgAh1jDMcj0EMWv1aWiRoW9fih/J1kOTZNp5Mo52M1B3SDIkGTHZmOMzE4AheeuGulDEKfmnuppXcSRW/vmPeJDaVg7LdTNOFWTSAwrUCsk6RELH7hIPkzHt9xJbJnWuuY3MR5NNMFcpSdf4j1U/YqDzyPbOnsKgQHE8AXmy4eQSQ1OOuIJ2Ud88VI7t8G8aBiLJpL+b/9pSFwENE4Pe3etYZWmUid6T/XRF9DT7xNLuHWEc5d+6liPBXOv8i+8hVqfLDT3htRXuVcFXIJLGLGEeARUy9afT81Or72HlDBaEYTV8llxc5Adjc7LRmAQcTrhrZEE3cDcrbOXWsBVTxjT8evOGCoZ8V7JrK4uClut6OtM3md7eUcF/mjfzjZsghdbu2r+/PjjqB9pvC0/72ppQ5Pgw+Mlh5f2ppRtx+qU5cFxHHVzsACEp8E4t+EzmKYHm09g13vB7fmJEC1+9aOQAE7PxwUaKs98yb1VmmDDZG5IaqaTN4hArVVFoTcQ0yyZ4XBZ5Jn9dyA3rClv7OBi1Np8UYO2Tyc7ElHwaZWL0bYKp0X8X6quZYkylU9/TY1NRwEvr2GrkmHuKDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0pETkRMRTNVdnJpVm9wQ0FMQUhGblBKMWFHMjNmelFnbzU3R2Q3bnNOUW56?=
 =?utf-8?B?SVVOM0xIUFNFcGtxTjlWZzE5dFR5WTdFL0tVL2ZPbVBQVGl6VmJsd3pUS0tJ?=
 =?utf-8?B?RHJUaE5jRGs4QzB3UWJsN2dLQWNzKy9lVmdWVnN5Y1NOeGdBWHlSSmNMRmtu?=
 =?utf-8?B?LzE1VkRnckNhZ05TOUdtV0sxWmJ1VEJnVGU2Y1p1V2JSQnUvc1dFdHpBT2tr?=
 =?utf-8?B?ak14LzMxcGlVQ3hQS0hqaGdxaUhVREE5MkZsVjVPWFdrcGNNSUF3VnNlcjB0?=
 =?utf-8?B?SUwrd1VDY1hPaFR4bVNBWDZJNWRzMnNXeXE3bE1QU1JuZlpucHk2bUgrUHdk?=
 =?utf-8?B?QzZzZzA3MjY0azFiSjR6a0p3LzA5cnhLSzJqSjExdGE2bXZqbnFJcXloRUwy?=
 =?utf-8?B?ckRYeGZTcHJ3S2pPdmF6LzVpWTJjMVVNN1RzYWFSdnZqYVlHb25TZHpSOXl0?=
 =?utf-8?B?TG1tNjFtWDQ3TG0vVmZrWnJxYlFSVjU1Nmlzd0VYa3BFbzN0NlFKVWhaellB?=
 =?utf-8?B?U3grOWlnaU44TjAzNlMxOHFKcVQxekdqL1ZuY0hrQU1yWE1sbXUvNWM5cjVQ?=
 =?utf-8?B?eWc0Y2tiZVhQVzh2M3QyN0sxQ0h2UVcxNEZ0bXlSL3FEZkFwOWZMWEZsc2ll?=
 =?utf-8?B?eUJ3Q1Yrd0RhZ2x4MytSVkRBRWxpT1hPUjZENXBZWUVEY1Z2NU41NkVrRS8x?=
 =?utf-8?B?OVFQZVY1U0toZ0lRTlE2cCtwa3RXNnR1TnQ4aGJaUXFLNlBlNVE3TmhtdGoy?=
 =?utf-8?B?aTE1Z29XU0htTUU1Y1kzSEYzNjFRTG9uUDBNZURiL2R0cjIrdUd2Z1pHaUdO?=
 =?utf-8?B?TVZCQTBLK1JZdjZEM1M3QzFjREtSbDdTN1MwSFhsaWJhcXBvdit6N2VvZElQ?=
 =?utf-8?B?NnJyeFJ0Y0V2bFZ3NHE0UHRxT2xQZ2M3WFF0Z2E4dC9xZi9oVnVmLzBWM3dh?=
 =?utf-8?B?TC9FNWEzSlk0dUxYWWFMbVdWenMranJPY1pCZXV2ODlhK2g3SWNtR2JZeFJY?=
 =?utf-8?B?RTYvdEFJZURNUlhxRGRyUit4em05QXlhL3MxdkVMTmVETGo1aVRtNWdWaGJv?=
 =?utf-8?B?UWRTdnM3eTkwcDRhZlNuRk1EOHRuS3paQkR5cCtMeTBsdGRSN2JtcmEwaWpN?=
 =?utf-8?B?eE5mNmdDYzBibHZMYTQrWU9pRDcxSnh0SXhERS9MeUEySDdUOVpHM0U1YVRp?=
 =?utf-8?B?R0Rtdk4zWXAvZGhQeTMvYXYvMXNGczQ0eW5oejZUOHAwMVFjSFROVFAvMURx?=
 =?utf-8?B?aFJoNnJ1N3hIa0tOc3YyNUZSRDBnRkJRS0ovMGpZRlZyUmdEZ0FiUW1vZis0?=
 =?utf-8?B?UFpmMFJCM2N3V3NSS3hzdEUvcG9ZR3c1NFcraG1PR3JTWmx5VVZRVm5RQmw5?=
 =?utf-8?B?U1BRMUdjaEJ0ekhObTgySFBjNTRJL0E3ckQzSkVIbVF3akhLdnE0M3Q5OXJ0?=
 =?utf-8?B?SVMyRzU3MGdadGIrV2lEN2RSY2J1bU40N1hpUkNnOC95Rkg0RkRPaWJLdUI0?=
 =?utf-8?B?TTFEZ3hma01FblFpeU9LQ3NRRS9uaUJyV0ZxV1haVFlMbzJNZ2N2czJGNzIx?=
 =?utf-8?B?UW43ZHdaTDRmZDdleUR1SFNOalhUTVNDN0JNbkx3LzhzZjJadFkvS01tYWt1?=
 =?utf-8?B?N2pYRGZIaWQ3RXZ3RVRiUmVORC9Dc1dwR29FZHNQa0ZxNGErTjFsaXY3MzJu?=
 =?utf-8?B?RHhqNDM3OW8veFo0eU5qam04c2p0S0JYNnAwaktUSHhubjRKckpUdnlEVTJy?=
 =?utf-8?B?alNDVWRsb090WFhNdXRtbW9uRUNTR1RIMVUvMGtCVVpiUjdZWlBPb3RTMmV4?=
 =?utf-8?B?VldGRmJmN004L28xUStPalFObno3L3hMS3hSUzFMMW1LU2RCaTY5NTEraDZN?=
 =?utf-8?B?dUpDUERqUU9HSEthc0RoQUVXKzFwd2owa0JOSW03NVhSalJvdHFTdmdPU0NK?=
 =?utf-8?B?RmwzNDdFOTBSb3AvZ3JxajYwWmVDSHBWRHZFOVRHY2had3pTbG1HaVN4eldw?=
 =?utf-8?B?QTdRa2RsYU5Kbm1OeGFxYlI0bGFhWUM2N1pUREIrTXA3bUI0TWhvZS9FUzBu?=
 =?utf-8?B?Wndub2FWUWZQNlZpUXlqYVBlRldEMCtCYjc0ZzVuWGJaR1h4MEdiWGVxRGdR?=
 =?utf-8?B?bVIvU3l0M1NkeUszSlhzMWV1cXI0OHcxcEJNOHBVSStIeW9ONjl1T1JnRFVR?=
 =?utf-8?B?ZlRFWjNoVnhZNkZ1WUF2WlJlM2dYRGV1V3pjM3NaU3FBMUpUT25FMnM1SGNs?=
 =?utf-8?B?MUxTY0hsVkN0Vk1IN0NCSGVvSkZnTUJ3c1VhTnMvK1JzZUR5Uzc1S0NvVzNH?=
 =?utf-8?B?Z0E0aWNFejZnTjVoa0VPQ2x2RjJFc2Q1aEljdGhrMitpLzA0d1ZRQT09?=
X-Exchange-RoutingPolicyChecked:
	IVnnXX3iixGI6N+bk9hm6KMM1/o5rwOvesKgaeWW1YEwsWWvEyUVjTNr67D9cIj15ijo22Fs6EE20U7SNbhmFpClS2G7NBnrsNisgtmEBDt2I2EEKswd9Jt8Vx3DDd5vMTFH56p5wBkrgexmaMoykRkil6TM247SrB1Oo61LPlDqMC161u/mnEhdGj6L1iL1HMQpeGlhB2O1u8fWRd4ZBoFRk8xE68aiOJIKdUs2f4Wx4jmcrPSv3cXBLLuXdtplHkX9RRj8p6jSzlRWozm+Kbgl7yoKSc0mL5xJaix+Od/Sn9EKOvxZo0VOnac5hsqh5Rquj280UVB1xg8tqIh2ag==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a3956b-16e6-4988-2373-08df400b03a6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:46:56.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBRczVrU4ZxCH5yAHQju5S05L9sqiYm+l2nhcVAXEDRvO8GjEeJ2ynM9uy9s7GDWoAUdF24HRqCJo/kk6qhJsdgxApziQKyO5cg3QfFyS68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Authority-Analysis: v=2.4 cv=VJhIDNPX c=1 sm=1 tr=0 ts=6af48df1 cx=c_pps
 a=eQn4vQZDn50HuGbH8T6KOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=fXIPHVYMbAI_vFgRu4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: vF7pL0jtAAf7dPVSfJdOAi3SE8-9zAju
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXxiimyvd5np1U
 E3U4uCA3PpA9C/1FAismYrkg/fkiM3qR73X/TgK97wby13IdfP9HR/KTXJUKc9pT8KG19TRj08N
 1AWRq3A7m/Q8oteu0OKzFShwlYHJUYhf0jI1ep1JffTG8Un/rqUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX08fpzP153kFP
 y2LDRkniuMSXcZaCv1OLMnReAbI5GSvD5Py2iawxlEDe2Ck1zD+hv4k7QyW5b6tsD5qqO+Nq5IG
 vdhA/KuolipGjIOlZ55oSgUSP/st0rJolzFgFdASz//HOmt3uJDixPvkGACPqmN+IuwvmN06gC7
 4K5WaryVs/dFVLnNLXVPkQS18B06zil9gfqpqMsq3wXgW7BmFOa7UyZu2yU82qtjPHaO4ZuuS5W
 Iid7Lr2duzR43u4EJ75IX27V0Nmy8mIWvx1Y/R4YsfEQRj8sD3bMbq+YXJLrSC15RVBr+vSVPz1
 1YYcdryrWbSrTtjuQMtCb24Od0VlenU+XwcJ4nxVbkxY7UsV2dp+AJjC6lZeeheXrdj/UjG+TT+
 vS8wCOdOqY4J3kdgBnn8F2KlDU28lJ93fdfWUxDHgJmKUXcUUwAIdm7Bw4U4bnZwVV66u3Txes0
 Le/LihLrbXdIwbUnRbg==
X-Proofpoint-ORIG-GUID: vF7pL0jtAAf7dPVSfJdOAi3SE8-9zAju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:40AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Adds snd_soc_component_regcache_mark_dirty().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
