Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411826;
	b=qvCeh/EweZ6oT2oca4UmnfJdwhyd+O6m39pzPm9UFfLlCGpgYyPVeaoCLiYVW64Www0A
	 Dz4h2vaBZ4AnVfhI8LxTk7ZadNQAE+6QqyeU/fbBnBlmshzLQtrW6EwcElPEFBEteHr6I
	 ZxV45/RkHxKGcUHSZBzP+LFUjVAFev7s/c2J0sXDs1HOzC7/gfDFk9ydXGkhhw5mDC1wN
	 z+JJd8s4ZWGE3vl9LX1mq/Sf1L14Kup7j+gM/xCpZLHAFx9fR2j7F4VCd60AVussvntdR
	 NvuGDSq9VWWGKb4HSn3ARfbzEcy2ncwwnPHPf5KZJ9NudcPQXq+PH+bXqbp0+hthH5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411826;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4NXLkiPnqt/jLxdQIBJGufwrXcupbRsy/6j31qlmOWo=;
	b=0nRnmhAwrmwoIj4yBQ2RADQWE/S0jtc7HBsNAHNHNv+39aSzaggDnuCVD7LN5tl3BzNX
	 pJ2GxMURtOfX7d62sTMcjonMWO2C3dZK6Ifo5vvhw3kPoqEIMjJtSvnqgTrXLkTST9t62
	 EVNaoAWIoNSqf6rtuJ0Y/4+ZUSocZeGjSY27y7Wr/SMr40jjNtdMoHfrQ/CIWX5d40lnA
	 T9JxBupRliX2DObcJEtUtz15yWDNLSo11mQsJ6QzRxY9ZGic+LXm76l9DnZlEZeVKYbeh
	 ztmBRL+Yt5RgXnCZrz6XoxPM6IUo11Frj57PH49dDZsCYTbrg7ICWwMrEc5Yp2rAALA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=CDKxLyBl;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=umA0xUO+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E2606A33A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273E2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=CDKxLyBl;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=umA0xUO+
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF3Dbp2002428;
	Wed, 11 Nov 2026 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=4NXLkiPnqt/jLxdQIBJGufwrXcupbRsy/6j31qlmOWo=; b=CDKxLyB
	l5csTMR99Yx+ccvWNx23IO7Bd46NGi1psFtjIh82w+dzGZy2sB1CE6wdcackWazk
	v7r+RkNjKxqsBT7QMY2+C3Y58dKxIrxfwqq9/Vd/8BHHg8z7T9jDR1rloA9woOPv
	Tokia7Gz+ebnWM3x4dwnVNTDZOswarSvBGLBwONCeizNs8nPVQnELyZW0Oe7SrlO
	XKq3UyA4KbjPkOUSomJ/l0Jw1H2Q68S9fd6WP421oITiCVPEw2OhgaIFyIirrFKt
	wbXTCfpgnBSgs5MnRzsuXKSVsF8xvC4YZ5ScBmNcOh/dTOnptDC5p4z2F+Q3E4BC
	Yka3bvkmBggfmog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4NXLk
	iPnqt/jLxdQIBJGufwrXcupbRsy/6j31qlmOWo=; b=umA0xUO+D12WiQGV56mxb
	pkmJyHmyRIdQxdl2afOXqM2O7kxzm377ms+vSz7BKOk6qBww132kHwiIozrfJo5M
	vHRccbPpjQjhWOUZNyTnxtYjtT7J8fmGoyPAQIohWCH0rBwc15eljhuIvu8Kym42
	DJoPCNhltGuHyg0yeeoBTijjRXSt4v9xNFkw+l5/lnDGsyDVCJ3wfmD9nJ0PVOo+
	cX31rZyHLJrqQd/DrkcahY/+v95kU2Ms4lyKFJNeTz8RJFFY7YuSteIFySFs0+wV
	iJdyZcdXNlqS02lbOyYN8zfF2MWF7tZNYbT2eIET4aVZ8I2I1twk2jBheA8i1h/9
	g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hv1nr1ndh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:43:40 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxmCAV/vaW//czhRw8DsJ+IvEBqahRgWx3DNBukKX/3AA7dO5G84WYdr/YhCVjSWOOKfuypX1GTZ4tROf9dD01pmYIIOJfBHEKJbeVGd3PKdMxbYuf2y70mvb3pq9ReSy276o91qxeGzjq6S+BzWDnpIgU9gAUba7gN0lfUM8mCAUrSaoXIG/JTDTTybE4x8tAxh3Ib0DZqJzC/oBFiZDffDgc160o+Ld6odLzHy5lq8PaSXUSpTIDuoKyZ2sJrRuIy6UAPVo/GWb9gCcfSCGvyn71Q213UJWl/4pMZTB8vpMyM5pJeGEFfYcQ4K2Mid63vfMxOa+JLKBdgciFDb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NXLkiPnqt/jLxdQIBJGufwrXcupbRsy/6j31qlmOWo=;
 b=sMqJQh+lV8yxrK2z7E98ARgRuGY8a5pq4rNK/N6UlZHBnkINRzh6KDokDAQDCrRGz6iyZ7asdhB++PUJIwr5SdKEHBtQhUQXNrZC4hy2TipcQGZGCqmaK3H+OvHTO139uGd1XKuhHlv9xDbS+IGlzOtcsuV9kizoLaIGrT37BA3FsO61J0L/z71DtKkNUfWgfTN0XD/l1JPokWQp62X2+qg0VO1BQuRas1jTm8o9ZzRMDNjf9W/Ut+Jdjtb6kjC6SZ/TSaJwnoK+HcTuHERi1FnOEF4iccZ9xKUxLcixUe7h7jQ0C2XsaT3zfv4mHFkiw68QPalSssiF2c0dUdOozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by PH7PR03MB7003.namprd03.prod.outlook.com (2603:10b6:510:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:43:36 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:43:35 +0000
Date: Wed, 11 Nov 2026 16:43:32 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/20] ASoC: soc-generic-dmaengine-pcm: move
 devm_snd_dmaengine_pcm_register()
Message-ID: <avSNFLjqTqzLuCgs@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <877bilntt6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877bilntt6.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPCP307CA0003.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::12)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|PH7PR03MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 98aa0943-73ec-4c71-8258-08df400a8bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|11063799006|56012099006|261102123227099003|261009223027099003|261026121527099003|261021121427099003|261021123027099003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZmFeJqOBsoRGf31It77J+dw7BkIjNsV0h9ZV5qpPWCjhyyQ0MJH5lP/cPVcLC9VE37oph7A8EhfvmuMtkcEnko2k5vnSc3GrcKOfmNiQd4ObPj5KtfhbehugnD79ouZJSY6vHaRZoJSEFfdO/d4YrRUh1+iC+FdXj5b0gC08+XFlz9Fgitgz+eV98fdZMH2YYfJ2IdLMXwaF1Ej16mb4qeGyf5QBrmO467x4BGATrWPuKFypbwMVy8SzMRnwF91dfpXzahFy1DHA/SI5M4zmUHVBbTz11XPCX/v8Hy2C7URUmUUHAprJ0bqE/+whuEfB+DWu4sicm+9nLP+PQVAB6ErBO9SljnIIUQvWfn7AiP1SQ9uPeV90jRZSC1uTSYUevS0eJ6ByevcFU2HDVqL1+bE9oQUrk7GFd5JLEIS33ZxWhAo8qOdDLvSlhDi28Z+ZvbMs9w7/sc0aX+gr91G3vnH0UJ70mG30NiPncZXIbAvmo1fcmqJcuhQ2kmPviplk9o0vmQlkuTkpPYUbW25ebiUGwYjdZG9foV8L2hAdYPDSEFe4+CmKI5ZZ/65xDLKAOea0g/X24E/TItSey8pxVVBdDS0r50e0vquQmXF79WYAgBSQC1tpzmQDaA6PsvD5HfBL66A7aZFTu+px+pdOrrLnySBlzaY49EeyV4XcjP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(261026121527099003)(261021121427099003)(261021123027099003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlJBQ2E4S1FzRHl3NDlXZWVwVCtmR3RGVmZFTVdqb21aR2I5NkVtcmhsRHpa?=
 =?utf-8?B?MnZjbS9SdVFaZzRCS2lXeS9lTXV2Z2w4MlpzaUFHaE1mRU5ONHg2QkZjK1By?=
 =?utf-8?B?UWh4TUI5QWtiaGFlenQ4WjZvL3lJejEvVXJuOUllckV2VVZLanRwWFl5OWFq?=
 =?utf-8?B?WXppWkFYTlVmbDBBazNoU1plemRBOXZPTG1UR0hpZWNKNlZidzJKeW5KQXEr?=
 =?utf-8?B?bkpQTDE3djRKV01pbFVHNkV6RTd2MTJGdVV2NTZFOE9NZFZ0WFRlOHhUTDlt?=
 =?utf-8?B?REV4T0d3aWd6SUZPMUpDaTlVQTdCV1VGa2FwYnd0cllJSnRTRnpTRWlvV09N?=
 =?utf-8?B?M0ZWSVBtd1p0WGNWRHpRRG05Z2w4QTlVUkxiK2VwSkZDcWdSTExYRGFhMUx4?=
 =?utf-8?B?am9SbGhnWWdxRy8rUDhtYStpZ2pqK1BEQmg4MUlwdW5BNG1iQXUrY1M0Zllu?=
 =?utf-8?B?V2pmcENPTTAzZm5mTFJvL1RwakZCWnVkMUEwQVlYcWRpaktaVG5CZTJnZHlv?=
 =?utf-8?B?ZnU4UUhpMXJhVGFIZ2lEQThNZmNmbHRVTzZURy9pWHQ1aU9iRVAwQzd5c29S?=
 =?utf-8?B?L2FPM2tTRlprRzd1MXNOa1d3WVUzVTlCZ1dVaDBqMVFrTldscDRDVmo1Nitu?=
 =?utf-8?B?clFLZGRMWkZUbHFERDBJNzg1YXJkOXdob3ZNM0dZNk0wbDc3eFpDZVNRT0I4?=
 =?utf-8?B?OUxEK1M4a2s1ZUs1eHZPQlBSQnE0Vy9yWVduanIvTFY0dUxkRmpBQXBZZTlh?=
 =?utf-8?B?WWRqZUJuWGY1Wm1NeUd1c2ZpZE44eHZLS1JmWWREL0xzYjFHY1RWTG4wOEtu?=
 =?utf-8?B?OGVkaWtRVjZGK3B3clpzQUV1K1F5eG1vNDlQdWRObEFpbkxBRU5VN0daTGRm?=
 =?utf-8?B?RVdYNWtoQWM3dS8rdnhLaGVPSEhvcDlmMHcwc0xzSjFTNDJNT1FpajhSYUVY?=
 =?utf-8?B?MlpwWXNFSkM5blBEOFUrbHR3K2Q0OGdlTjNuSzZsOWRMMzI4dnBhMDRxay9l?=
 =?utf-8?B?MXFONnRjKzVVdmtvRVlRaXB5WHU5ZGtIRWpvcS9IWGxwWXFId08vWEtxRlhv?=
 =?utf-8?B?bUU3QVhhMXpWVXQ0cG5UQ1grYWgzbFd1Uy9NYS9WcGJXbkRNV2Q3dUZUamNq?=
 =?utf-8?B?VHpFblN3eFVHQWgxUW1wZ1NSbW5MUG0yYlMwbldvc2FIczQraU5kZ2tXckw5?=
 =?utf-8?B?RkZ0aTVPQ2FVN2R3VHI0TWhPUkRCMndLMGE4QWFmSDBBZkVqZ2JOc1FSYXg3?=
 =?utf-8?B?MzJIT3B1WXV3bVM3RWl4eFRIbytXYWJsT2lCcERtUTNYNWkxOVRHNUJTd1hr?=
 =?utf-8?B?ZWVlWHZjS0EwZVVhV2JpZW9mSjBvN2F5MGZFKzlPY2h4eS8wWmhod1ZiL1Iw?=
 =?utf-8?B?M2dLamxUcnpzaU81SkJJYjBPSGRSVlRnOHdZS2w4RWg0bE1pbEpjSVJSazRF?=
 =?utf-8?B?cnRSeVdvQU1QaUlIZDl3ckQva2RueGJGeENrR3ZLMVZEVzg0eVc2amp3YldE?=
 =?utf-8?B?SUM1WktnTDNsZGtvNXhna25keHpCQUNKd2x0SUtDdFFCUE1rcXArUkRCK3JV?=
 =?utf-8?B?U0lyaUFGL29jL05KU1pYMzJFZTV2Z0JPL1l2U2dNSHEzMURGSU1mbEFpYkRZ?=
 =?utf-8?B?bVZvQ3FXcmlISlhDWW13MGRaRWZVcXJqby91VTFyQzRHMmo5ZXlUUlNlVHRk?=
 =?utf-8?B?WnVwVnFSeGVzK3FPTUp6ZWJxdFdoUGxoNmtRck92SU1jWDh0RDMzaVVoMkN3?=
 =?utf-8?B?UVRaNUdObEp4bHVDVE9iNVcvWGdXOE5Vd0tYTE9lb0ZiTXdOdXhwK1JkNXpY?=
 =?utf-8?B?bDJIR0gwZFk4ejlaVExtK2ExRFlyTHNORHV3NUVzVmNxTkRYYzZBWFZPU3E1?=
 =?utf-8?B?aEw2Sm1yZVVTdmZaTkdnYUdhVXZwZHJ5M0RGR0NaN1dwVHVZVnNUVkpocHFo?=
 =?utf-8?B?VkFXeUduZ05XL3FleTFyR1BXWFdnYUNhWWQ5Snc5d2lCUjB0YkdkMVlnSVFp?=
 =?utf-8?B?MEdwODZsTHd1RXd3QS9EQUFaRTdKYTV1SkMzdGRTTVRVZ09GUSsyUFNQRzB5?=
 =?utf-8?B?amErYSszaGNTcjNhTW5oc0hFYlUxRWczVy9XUmdNNXJnNWdpbE8wV0tyMDli?=
 =?utf-8?B?TVQ5RnR1VzlLZ3IraGRHTmRrUkFMVEFmVGhuWEFwdUFRd0hzZDhRU3ByR0lw?=
 =?utf-8?B?OURGMEdYUEN3YUgwYklTbjJtUmNrU3ZLTTIxNks4eWpzcG9CdzJUbXVucFRl?=
 =?utf-8?B?ZXVoY3VaYTNiWjlzT2Z5R1VQR0pTSU9PMGVOL2pGZW1adXYrR0szR3F5VE43?=
 =?utf-8?B?UU9RMytxQWN1c0VOMGk2V05uMlZmb200czkwUElrTmk5VnhOb3lTdz09?=
X-Exchange-RoutingPolicyChecked:
	JcjsyBN/eMh28oK8CkGYyqNiven8Eg74gEOEr+nl6PPUz95g9x7SmSeaS7eI5HpUTnIvM278qblmHWx4VSK9WaTcai4imrCZRa/SgZxHyeieFI3GOl9K56Hj8kN0gDQikkDK6JXBCEWFWb71WrXonHzFtuVHxwmBtv9vNv6nagaTl/O17siWovO1HJENQ63iaJ5n9IfnUwad9DxVrmSxZRdtqvL4jnjDeuyDwysfnBKPuuT072kHJj5yodU+lm3dmB38YsNicr2bmta5AKBU8qhvJfiwgZ3ZPYpJIzkyytWVWGrKJC5ZVfkduJ14yBb8W9ZAT3/hoTYo1u8zbx/xBg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aa0943-73ec-4c71-8258-08df400a8bfa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:43:35.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RtYpGk9KUTWVnR0HBTjCjnONTPqNQ0ZDmaEtpPDa6ev9WRv1xNdSX6Rpot2oV5nt3rjNn0w4B7RftvK7kmPCr5xKoV0e4/shmuInax1ATo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7003
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX/41SJBWWzuVR
 43kiUC9ECGP7myD7yQ1X0eyxAcE8ztc5iqx6kGu0rigU5wyERXbrkQbhVycmw7VdiRbTv4gnfTh
 YgFT+8R5cFR1un8s8RFbamFAUZI7Ex3ljfmpnBK5fgafcjyA6tBuhfIMFsK9JpQ7JXxulc1bhgc
 OJvBg7iqNjjOKRwQmJZOuKLEDgQZaXqfqMd/a+jDvOggoNZpWEX4EYkDD/fYTwV7rtDRCDIgz9l
 9g8n26WFPUgAfvsywdMkZH8U1fSgE1hOKu02hZYZ7ai0XIaFgmcdAVpt/mjAybsKwJWFiL2tDJ1
 l/whUpllEShiQ0HzOoEHvzr2y32P4wYmW6nJ6SBhY4XIREHDiu/JzqEKYLwipbCKPgtT1ZBEIZ7
 TEDMudx1jf4i4Lt7ZMl0X+g+w+ey+mJGpk59erJ/dH+haej+Fx5sUPg0vMlW1BeNe+5w2sxhIdw
 TVsNZ31v6GlM7loWzIQ==
X-Authority-Analysis: v=2.4 cv=es5KXYpX c=1 sm=1 tr=0 ts=6af48d2c cx=c_pps
 a=dVriaH61pmWkicxGRshTTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=aWwgMQw8B-Y_HodPJCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: gXmy6SttqReQQ70qWmSXUTkmdRQ3eGsC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXwYFOxjK/vcbO
 RTC6Vp+sgiq+IzWV8e+W4FXsRCuEEXNvyhVwmujBLuW/fEm1+aTO9emJE7Rc4BEO+PoQ496lb7l
 /QduZn8Utu8A7OBmQKvz+VLY2ICBiAhMB7Ug/fHbyMStIAFXeWGz
X-Proofpoint-GUID: gXmy6SttqReQQ70qWmSXUTkmdRQ3eGsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:23:34AM +0000, Kuninori Morimoto wrote:
> We don't need to have dmaengine related function in soc-devres.c.
> Let's move it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-devres.c                | 40 ---------------------------
>  sound/soc/soc-generic-dmaengine-pcm.c | 36 ++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 40 deletions(-)
