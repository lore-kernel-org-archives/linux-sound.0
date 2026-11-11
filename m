Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412049;
	b=oDvZXgwOlj/4G/6W0bwTurAVu6jU6PfGUbjeanFtUfrljmhK6Dz/8Fa6ZoTMbLaOHjbk
	 omZnRFz66FhnJ2S1GToHATm6r2WOV8kpVdS3PnzWbvHyTW7X4j/XUNeOY1WK/j1f6UlRn
	 zrV36zonhp/C3zWcHwr8wSNtuiSjxQk4VWQKSZn4bYEKF2E7DgOTITKNb5rvFzEmHnmN/
	 IdVH6W3Fp0nGw2g6wqbIpeV5fASrfh+mnQ0G0G5qTkx200omuY8K8nPGSe0knCOqnqs57
	 5qnYf9y6B/C9n7S6oZNFdjo7yvQiMkVY1q3nHAinftFndMicrRZCGH3EkkERXk5wAxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412049;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RhcUsDDD3TTwHdbnrx4opSL+h2oocjVgbnHQGMdgd14=;
	b=g17tXKvoDMKCnpF3Rnrp/MWzargMd2Ckt2Px7U2gvTN2OAFsK0ipFp22kWC9xZjSi66c
	 dDhn1hCgFE52tsHztj/7SKMtP6OqqrBnco9oiZFv4eE7FTl2fHV51UmLeLS8TPqfE7tWM
	 mC0K5DLcCGrn8atk3POahaSRTCgMa/kDSWk15kTUBa8FrkxwIwNIx81wZISjCOJT4CB6F
	 Kk5mJkWzg31B5vzLN1z2rGKA7lvDmtSJEHfDQrWCjBjddwNPYHWVSWzVbgDxV7YHl/e4F
	 gz0yVRrWuJLhbrGXLqKqG1rhRHhZp6iiwWEcAHDCHiwjOgRYR51ZrDvJHcl60N9K2bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YWJLuXmD;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=IPH8otVg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74FA606A32A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B74FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=YWJLuXmD;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=IPH8otVg
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1jfT409524;
	Wed, 11 Nov 2026 10:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=RhcUsDDD3TTwHdbnrx4opSL+h2oocjVgbnHQGMdgd14=; b=YWJLuXm
	DYNzhTlek9JBeobZaEC0Nfff80BdYVyj+xCyjilll1WGu/NqmUODNi9dwOpnZmWV
	GC4ySX+/E7tt+baq3CKmo8BAfUzxOW6GrSGYUZkAXtbhBVkH49Tgwq9YnKD8pgh/
	khZggco6lNRGosu0IurU94zpnfZjPSx5QtR2rXATwV6NODysrglx0xzJ8RNxinUn
	ot1RD16r+6SzrGR1cwR+hs1bQGa12RMVVRfUBp9up5Tm1y9uqRxNIifwob0eO0l3
	ft3WMnMk/uWhIMJu0t5cvdxW98Cvv7jfLhaGH2CGo1D5oSWeweaUbGivsZ/r7daS
	S39FjvufAPTrt3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RhcUs
	DDD3TTwHdbnrx4opSL+h2oocjVgbnHQGMdgd14=; b=IPH8otVgeCcHltmFoKQae
	XMLWXsKTjf+g/N5gnrQAeRzdBNxHySTnxl/J+AxRY9RmpPo8GIbACAjhMowB43pF
	XqX1NUXvCNBx/9RwvGBb4cvjwvdGYTfrOJSqYHtuVIdMIYnpUdXtfut9yWNpAcYB
	AJByn71ndNh9AUkGR4msSu9oBhZf7dkk+j/+c9d9r4s8gGoVKt9KdbZ+Wh+dOL09
	rWsoMniKyD9Cdsb1Xwpo0oEUH+w/SR46008VW/gPR+xAhnKneYvQjQLdilAfQhJf
	+y3N/e4gTKYY3J66qCDhXIK7BkdOrNn1cO3xxvNQ8KC8JESaBtW6UhDnhLUJ/sTY
	A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917e4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:47:22 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF65ncbQAEAkp4/tORbHpMJeOqkaOKhO0MHcPHT5Y3T4WR0o6bZEhqjuEYrD6NSk+OMJw/5qgChsuaraNg927xwOdDapHxTZaGXymWWf8jkDO2ToXZGuS+TWda1nbnToukgDEN0BKcYPbT6r5LuaD5YIPM7ev1azX2VaY0HENSJBNlPnRrQKe0+ELM8NBjRS3iKscNXBMvMHFwhA60TTnP9jI1NAqEK1XmswCuNWvQ61BTro+54UBduN2eetDnCvLILIaeYektzZf9KgDKH+QzPG5Sft3U3kvq5DluoPlLzkYuOMLe5KssBVVcfdKekCwzNgSHxbu7JWaTzND9kGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhcUsDDD3TTwHdbnrx4opSL+h2oocjVgbnHQGMdgd14=;
 b=UleMGUExu0H9JLLF9k99z+TnH0+ugcLKDbqCm8z+GmotbWfBU0k+SmpY3SdCrtq9vBCXsXW0iu8aCbRtmghUPuJauBCCSdG/6RIkXAFfL9YFv4dIk6HkmdsfnkRrsMKNGK9NsTUhaNl2xdYtTzhKWzysa2WSIMnAfHYsXb7QyNI8XzoANi+0LAIyiqnOd1WmdphxHME9HWlUWFiXRHbveMAaF5zSClszSWirirMMrRN/e/eKl1q9gCu6b+svOogNtljB7BjBxCNl3ItkZEKtfwFLwHFCyj4Zc6rQpYE8hRsdB2CJ1B6ZY+tnAAiYxsqdXYCOTQoArVYcwJA0dItwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:46:01 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:46:01 +0000
Date: Wed, 11 Nov 2026 16:45:58 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 09/20] ASoC: soc-component: add
 snd_soc_component_to_driver()
Message-ID: <avSNrxv0rqdMIm_O@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87v765mf7g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v765mf7g.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPAP307CA0003.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::7)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MWHPR03MB998632:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d75aa7-5045-45d6-0704-08df400ae31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lD3OWg7W150oRyRhiuyW7hXySeBEWeDBNztgYAYUvWF39fa1XumigtmylN0V8XFYoT8xQ1tKYkPeBmKKpLkGC7RCv7al0NL471JJt9AcADpl/0pLHitFLFyXfCiocOMGFoz7AXqARP3EkMuNEd6UcPW9K0+lSz2+0m6vkHttFUHYDfuck5aqv0Artnx/sOtxwPSf9i15k5Cp3/Z57EdKEaNMQGFqkIXFeLPL5F+V0OvU7wLUm5hZ3A1iwX7nbU7iixb8WIMJWuYWw5MKxTHgsuglRiU98kFuzfxj5eZeXcp9yPP+wE8ZDOis9FxIp4h23D4qyeXix0w2dhmQPb59DGSJ3VUp9YJuTj6N63UO5U/J3wvYVG8ncuGD4Zi6HjnxbqAXyfBPr5kvQfZynIoGaZD3MVqu3NMp2GFQUd7NidSESdUgdZz3WSqp0qP56Lp/qIfAmMv0a6SCfyFfIUp1LG7yojGY1vMiG/Tae5sQl2srlB8YVTIBx6gAAF2f9IwKwIc9oqBjIgdqKwb9EbGUy+ZMw6DbVGXIZQBowzFjdM4KDT0oX7BpczKFD3/6Axe90K3p7ZDuhUW/I3Yzr6pgcTn9IhFPsf1gZRb3Sp5eL4IzPPz0y6I7i8nW++nk4XFzKe75LPgw54EzcQZkgFmFV1BVC2ZV1prrD9TZlHgVd3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkR2TWordGEyUXZjaElyYnZMa1BjK3FxdVNqcDd0VUM2T09qbVhhTEpNUklJ?=
 =?utf-8?B?cXBnRkNaa3BNTGpOTGZBNWIrejJDc2xFR3BSRmtuRWtvbUl4TWxzaXY2MTEy?=
 =?utf-8?B?MUlEdVdFcVVKK0tSRllVYzBQMDB0aStlelVUbXBrSlZtdllFT0M4WXVCcDBX?=
 =?utf-8?B?b21oZHArL29lTllJcU9SSHg4V0FjRDlyUWh1amEzVTRqODN0Y2JHbGlDbUhV?=
 =?utf-8?B?enlkTG4wOTcyMmJWOGQzaGU3YzJlUVFkM3pyNktCNzMrNjFHYjlTK01OKzgw?=
 =?utf-8?B?OS9oSVVHcHU1cS96ZGU4eWNSOVdGRGVnaDJSWmN2RUZVbXBJWnV6b2dXMStq?=
 =?utf-8?B?alR1cnF1UDJTc1Q3Q1dsaUZVU1BML0ZSaDN6L081R3FvRGJuaFJWTm5obUNt?=
 =?utf-8?B?Y29pZEs2Rnd3ck9NMVp4NEZwUVh0WmRNeTVqOWt2UkoydFQxWmRYUDQxaWF4?=
 =?utf-8?B?QmU1K3l0d1F5VERYMjduMWkvL2xqSm1vb0p5dkRIUmRBZDR4TG1XbkpkaStL?=
 =?utf-8?B?blhsbExwY2ZZRkRrNGMvZitrY2trdGZNejJsSUxZS2JnRWNrS0hNUW9QVlBa?=
 =?utf-8?B?L3hxYmkzUnU5emRFQ1poR0FqTVowWHFTRFhldHNZaGZsZ0E2RTA1czBWS0pq?=
 =?utf-8?B?T054S2ZMQjltM3FCUk1TcFJ3VGIxNlNzOVR1MzhIMjJjeHRzRHFVRXRpZm9Y?=
 =?utf-8?B?Mk56ejAxUkxSaUM3dnpaWU5PaXJCdCtXbDJtQ3krOUg1R0xTSStNTEEvNi9F?=
 =?utf-8?B?VkZRZ1RpNVNla1VOL3JxbWNPOE02U1NwcFhWVEVBVVA1VWVoSm5xcnhXQzJu?=
 =?utf-8?B?TnNtRUgrOWd6dzFCYWVEQUhhQWVwRGxoYTRiQTA2djk1b2dZYjVRbVdyemRz?=
 =?utf-8?B?M1pPUis5d3dMK0Z0ajA2ZGo4TTJrRE9BVTh1bW1pc2RXeW9rc1FRT2NCaGhY?=
 =?utf-8?B?Q1JJbGVEbFgvcThGQS92b01qTkx3dHA3cm9ndFQwWGRieXU5S3FTQ0pkMHYw?=
 =?utf-8?B?TWFFMnptQUhTMG0zWFZabDIzVUR5MkE1dVB4Q2o0RUpuRlhnbzVWMWFRNE5Q?=
 =?utf-8?B?dUdMRU9iWGxTZDIrVWl1Z2xQaVJpbllhNEt6UTkyc0VKR0M5VEgrZnAxRjlM?=
 =?utf-8?B?SE5MZ1FSYnR3YU9DVkk3TnlSeUVhellpQ1dmRS8zUENDU2Y4K3ljeU9aeUhT?=
 =?utf-8?B?bHlYMTRZQ1RIbi9tRXFGeXYwV2tWZUhDc3NSYmRrMnB5SFdxc0lqQ1RIcXRj?=
 =?utf-8?B?Q1ozZUFTeldRdmhXTDVFakhMQWtwd0tDc3ZFbkpRdmwzQ2NwclI1NC9PZjZM?=
 =?utf-8?B?YVlXNlE2a1VOY0h2YnlDcVBhblloTGlwaHpoSVVEbllSVmxZZWkwY2VVV051?=
 =?utf-8?B?RWpJeEFycUN2NUNuSVZlanBoUWRTWUx3cm03aWUyUWdpTGRYeS9PR3dnalBY?=
 =?utf-8?B?ZXR5WGwraEVGSGl4MGVkNVdJcC8zWWU3UmhmUWNwVit5dlN2ZVFuRmZVWHlW?=
 =?utf-8?B?dTc5eGdlTWR5NWwvVm9sMGhSdjhzYThvSVJ6NU5qVTI4ZjRDTS9IWUplS1lX?=
 =?utf-8?B?L0FCNG1sb0RxU2o1YllKcFgwdVZWQTdKUWIyaVRxbWRlanVOZDhtZVh1TGVE?=
 =?utf-8?B?NFQwWXBWMlFYbGNDcEhOTGs2QVJ3RGZlMmsyYWRZVXFMZFY3b2NyNk8wNElC?=
 =?utf-8?B?aEkxWnYxWUV3anBtN1RvS3g5WlVaYTlMK3NTY045QmgyNGtibk9VdE94ZzV4?=
 =?utf-8?B?bDBHZ0IvZ0xsbTVhaE1PZ2NZZUJTTnNHckkxYXdsbWNGQkU3YkFPaXlOT2tR?=
 =?utf-8?B?cUZYckZEZDhlRG90dld0ck5KbkpKeVVhV2JrMmZMQW8zS2tDQXgvcHA2bnNE?=
 =?utf-8?B?SDQ2OUpmVU45YkJDcnZvQTZIS3JjZzVJcTNNTUNRZ3R2OFFYOE8xbFJXQlJK?=
 =?utf-8?B?OWZXYkw5ME1qMFVQSEp2MC9UTEtGa2xTbGh4TjA4dThlOU1ueFpUeEZCemRz?=
 =?utf-8?B?dEJKT3FtUlQyNVJ0S1BnNVBPakZPdVk2WVh1dGtTM3ZtcDlaRmRUSmZFbkJK?=
 =?utf-8?B?dWR0VkdZVVF5U0VqU25ramJ4MnMra3ZtZGNzZ0J1YXlVeFFONXlET0hQamd2?=
 =?utf-8?B?NFYvTFBQUmE2cGlVS3l2SFFKVEZMbjdPVHEzYXJSalRnN3lycVFiYmdPSVVt?=
 =?utf-8?B?QnpQSVJ1VU83MElIUFJvWkZyWkdZaDBGVUVqZXVKUTZkRWpVMFJlMEZYdXhC?=
 =?utf-8?B?QWhEWU81NlNkbUpiUXpBbktMTDVoSWtTTFBlWlVKb0M0ZzVISnlBaUpXZkNP?=
 =?utf-8?B?cEJUL2YvSkkydUhZL004Vlp2aTFmcGlqSjVMK2tzTU1CMVpuY2padz09?=
X-Exchange-RoutingPolicyChecked:
	a1ht2d21B5W9UqAEXxVL+VW12ryXXGsbake6tsZofP6pmvxmt03CrQcjoFmgCl5wVrHSPBloZ67laLmzr74V7R1wocc3tOI4izf0TzdizNzrCS0mI9U2GEez5QhxUrReoG5kbON/42OfsPnvEsFgcPFsGFCYYKX1xd21m40Z2bbQ0kpvsiQwtH6GwSqXA7OIOJLjEfKcHdS8Tgn4aZLetfS/HfdNygsCNx7SarglIt1xv2hZfglmh8+jWqdR/PMwWWKT7N0qbADasCF3AJNthCTF+sL9DsTcPnz1gJNj5TCi/vh/g5wjmu6f5c0/0GbCxgVoVyPWA4welFcry/grDw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d75aa7-5045-45d6-0704-08df400ae31c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:46:01.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn/o9D/AwB1txXuWb42CCESf4fwD9aRlhe/8A98BaQgnRQalnaVYYDHtmZw5qYZElT6bEhdz87CcR++nNZXiU99KHWza+q2yQqPKrKIqNC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: WfpEDgHlWEZhyJNBRhUNGJ02uEJ-Ciwu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXxx/u4BMvHrY7
 wD1Phyw+UZ5evpzLu8Q9UBudVcHrl/YBxzCJkhk7WOKc5Rqgu37f3X9rTiNX1QR+atDp/NSp4+X
 uR3fxPFkZOzFuFHSXgFBz2xqfoPFKWmcMp/LzRN++hYO7KuJ3N3w
X-Proofpoint-ORIG-GUID: WfpEDgHlWEZhyJNBRhUNGJ02uEJ-Ciwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX3dbdXzDkQwGf
 AshaKLCLbxzwCjIZwtecKNlsKr5p57rPc20QM310rXmEEETsAjDnXLz2655hcLCJrbNoLU4zSYj
 c/rWs2tuz8GaUt6NMOgU+spri1NmDN9gs3kkJ4FNqSftSifJ9I8lWo4MzEhQar9wEvUlTGOSti0
 Dab9lSkMC/OeS2kEm7driWTVVUCdrlq5Xbw4siC3IkJ91jD1BwxcZvk7oxTpE8kkEPjgWh/fkrC
 wQjC175pIMdCHM7dogemKak7fXZoC6kdKvj1o8DKGejAWUpH302ajAxyEGsgYCN0ezKF0iCTrDL
 nbNOzkSlEL9xldusUeciD7CbnCgVbfp6YW1ZJe6Z0eLpa5tRF2PUxxypovQV+Bl2rylN723APWy
 MGwn7DnhwEH5rk3tMsMmD7Qwwf213mrT5ZCC+wD0EmQzGgTcmkTWJtfWDSkpOriov/nk48787RW
 R/wnXdMwi4NznEYNqng==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e0a cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=ImTSXgg_oGDupI3gKZ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:24:20AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> Add snd_soc_component_to_driver() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h | 2 ++
>  sound/soc/soc-component.c     | 7 +++++++
>  2 files changed, 9 insertions(+)
