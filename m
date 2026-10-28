Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180486;
	b=zEIYjN9Wo0pRK3bn4iezvfbqulkzBzUpu8oiMCGHih6IPHWA+/g3wkoHUb+W+t+fLlAB
	 Jv28Upmfu62n4UwPrFA8rp8LIbCkISN56JB9lxrbq1rrJq+XaLibZYYXorhNT4L8T+ghu
	 WzvKUsWLU7KMuoJfhxtCokRdTQy0HPR6YtSxrdyFdRf7nMxbiAbgnYqObfXpAGHRxEgAH
	 wjUsXoUwRjYtafGHh1TTfNCT3bbLydSuS+7b8/uTvqqcmFzcK7j3GWXMtElICt8rNgn8m
	 ZEOXuIFl2Kikk+Mw++/kfusp7HzKvQWJ9bgInlV7NBw/7IrqghIEP9Ax7qpz9VkJjhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180486;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZW+BkV5GsvdoT6wTllPx9rm+jsvTLC7HdkrPi5jhslo=;
	b=huanDrtRtrPWWwkd5YXq7nBkyrXtSdix9CFOCAC0puGbWRRg+oxtWxuhFfE/uTcWt66a
	 v3+yRUcFhXzR8E9Nn4LT0zNo/+onO/myMRnP8Ie1qCc70UEsuYukIn258yupo5stEMGdK
	 1c5I6LW7cqQXhPp/UPxG3oEpj9wFJ0qSVHXY6xpMlgcfe72rDJ0IWAiwU+rdxvT+3SG4f
	 WLDM/u1CWkWLY7m0ryWOTbrYOoqxVVaBCJArXlzwY2oLwnUWHODOi+cIHuVpwaVvX9daC
	 U46lflqvPU36vun4tOaV1OXzsGzmbczccyS+6fYyXQZaQaWvMk2e+GiaEOMIcS1IHRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=m5rz51mt;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=gtQtUJoM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF6606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EF6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=m5rz51mt;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=gtQtUJoM
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8GuGR2204059;
	Wed, 28 Oct 2026 05:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=ZW+BkV5GsvdoT6wTllPx9rm+jsvTL
	C7HdkrPi5jhslo=; b=m5rz51mtVl2Blkz8k4uiiZ3fXKnC+Y7w1HtdeSO8hLOXf
	4G3w6kv6bAuShwwc9D1F+hc9yjsHqUYMXTvUDsZCSyzeYbEY4ENG3OY3ZX/aWIDN
	4089py6zZ191HlreOhXKEhN/xuhaFQDGl+u0WfAHPZLnoYWhmHxAJPiqt+wb/mAd
	kHSJJBbV4fOX4FSnMPwTbpKHJyRvwn0Iyn6L0lJnGkyjzYnunzYGRYWDvz8FxLeF
	qyTyGAxxIddRqU/sQn23Z+56CXOkeEm1T6eucleAm+0F3cZRozaO6Wicg3Z9MrBf
	ylt83/mbCrI3HAhPETfgPM93jk5jOPrAESbp8C79w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=ZW+BkV5GsvdoT6wTllPx9rm+jsvTL
	C7HdkrPi5jhslo=; b=gtQtUJoMbIJQ3rqxn/vU/pwxzp0Rwfs+NjsmQUZz9t858
	wzVv6NCxiU4E/PPE6nrqwQVD7xZqtYuz6ZPosusbpeokP5pAW/TLBTmdvJH76GZj
	36n/xDcscnamF4l3lBGcRRnYjrDgDdjZyAhd8hoCEFzaor1GideXuCqWhxIavz5N
	b3BLOZQHsQUimzDP26paX9bKhWg35LdaGpcFLdihTz1TN8vHATqVNJqp/kmG/1na
	uJ9TT/xE4uzuiy0byDigwtclwhU9rEhhII/czG4QwLcAtYJzh0MC/LV+f0cJq8Gi
	dW5410doEiPO13K2YKEC5/PnM7hBTzl7+J8eoMNTA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hjwwydame-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 05:41:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTH4SyqBsDm7fc/CDPnowjqDqiNNSCyu4BSqn34jWUOEL3U7MCRR54MBJ598dK77181P+MyP1GuJ44I+lyeFyzSLhNToqOOV5xFQ1Dt7T5+/mpog73NXxIufygl6GlahDzvit3xoedud7bNiYv/r5Ddgx3StVSMUyBqprDVZ0r/qXJgpLoFYwGu9Y57bbCFOmjFm6qT2SiQMEV1JrumsOo72fnXBZtH2isusyEmfQlr7KlFbQcM7T93rQDGTzNBwyLUr0bc+svUijhdKogaahvNMaZKKim2dmbr2oBFpIB4Makp7iJuNKZLUbKO38GR5BYkBUxq7Mv9Tr1GypCDLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW+BkV5GsvdoT6wTllPx9rm+jsvTLC7HdkrPi5jhslo=;
 b=kZJEVcacAYLcFVML5bk+LmEHhaFefs6lcy7Csor9MMgNxAkA3wey1xLhqww3eV60sJA94MFy47Fj2VDy3oqvLix215xZihg+Oq35wMzM2NBoXjqXZLpvF1qt3eVkBFqj5m0/Nsl2TreAkSFtjXOrNKkNqLpZdRsSXeQiwo9bvYdWo4kcu1SEOYP6OzZ88q3WqXOQ8SwWT+SQKuHE7P2T5qBruEm3VW7BWQM3VupNmCRwgPXPd/XovJ0repQofpepqcpY/kqk1HIwgcyfUa2UltBL6N4RqVNWOhj2F9Z5lpFV4tCwllqUV45LvmCJWQA46D3Qc8sq+yyeihCl9sanGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 09:41:20 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 09:41:20 +0000
Date: Wed, 28 Oct 2026 10:41:17 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 12/15] ASoC: soc-card: move snd_soc_card_bind_call()
Message-ID: <auHClTwz7trKo2ps@analog.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
 <87tsm6sezt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tsm6sezt.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MM0P280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::32) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS0PR03MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6f6055-0128-4f24-4cc7-08df34d79ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|10067099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	ZSrYrGi6CDwM4X9XUriwFRBLLzCYOqLfhBshLcjrk5H6TU59KEcnTitEkDxJSJcjmt+aTA9MBePEx/hPGVJa82uCBgbl4uzpwD91p3eNlcbh/nK3GOGW1Xq0aUfGP312DMAgYTEmfe5BFS6znxDXL1CAT8qk/t9cuvXaLMYPHsFptLJdj74D8Pr7+IYgO+7WWSGKGbDCQ973UKqX+fLBlZNavCLm9JUnakEoitWJfkRfwcmdg4PevvYG66HaNkjWEcfym5rjFKTPdpJfnbl14f7uQtaY0sKXG8f+P9aysI0+rvZX9mn1otHMZsGtsxVtypyZ8kYTiiQa6ssFDsVy6rTiKOdCdZkT6LY5Op1DGFe1DKSwbAZsvdHORHKDKPOHuTKodK+fEvvmu/4UmXPEXMlixD3SoQ1iM5NXh9asuIZhjGnmKzJoO0q0pBqnWY9r3TdGQls0e6QSAdoeMLPQVaAqzpode6vrZjnvjU6pV7y5hNHY1VGc+eE5ghryRqrO6i7LQ+F+VQsWDLgYLxhKYcToj+kMmnbQLGiejFNS3xC4pk/HaXACceqJyh9vNkB9kGbg78EH4Y4+il2a0DS5OOWpzDUfc+mOkxVXk4ifS7sJdYSXno6gzXkLKomCFNUPS/1wNxdSSto1KcnnsmeRrV+KkxkCE4CzvBqsn8OVjPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnlkOVJEd0Y4aXozcGJ4ZGpsRE0zMVI5QkhwNUpqcVQzczVUVkdocG9zWm1s?=
 =?utf-8?B?bml4Unc3UUoramM2VjBNZFRuUnk5Um13ZGhoc2dmN2N2TnYyR2hyMUc3R0dL?=
 =?utf-8?B?UXpIYlB2ektCYmoyYlFUalB0WnZ1bUFZRFNVNVR2TTVKcEgyWDh0Ky9qK29F?=
 =?utf-8?B?SUFxMGMwM21jeHdZOUkzZExKS21neHVwYXhCSVdlUGJlRW83UnJ1MjJUeGd2?=
 =?utf-8?B?Wms2dVRrOTN3U0xpc1BkREluY1JBKzBnUE9LOTRua2dhSWNvOXNSdEZQb3lG?=
 =?utf-8?B?NU9DWmxHM3JiazBrcnZzQkUzYnpNR3pUTFdyOWVDMEtNZjVWQVlJZDVSVzZ4?=
 =?utf-8?B?VlV4UFNEbWwrRnJGeGJNRlpOTE9TOGlGTTU0K2RNOVpKTkNyQ2szazYzbG9u?=
 =?utf-8?B?SFprb1EvOHZiV0puS3VVRGpRMThZUFlqcUJUTURVTU1pVDFtbGxvUUducWJv?=
 =?utf-8?B?OFdMNXJOalhEWmFlS3BqN0d5NGUzbnpRVVZNdjRnYWdoZmxwL1dRa2w3NzQ3?=
 =?utf-8?B?Q0pFRUhPQlIra3ArSTJKZ3V3UUN5YytaVXp4cVI5WVhPbmxkNUw3Wmc4UWhz?=
 =?utf-8?B?QVF4VjQ4NENxS1J1VVBRYmFMN2tmR2JYRXYzZWppSmhjb1QvVmkxand4RzMw?=
 =?utf-8?B?Ulh6SlJYV1lwSGRvNEgxRmdUQUFWZG4rcCsyV0VQbStrL0pxYy9mR1gxQzli?=
 =?utf-8?B?aDZnb2VjeVIyc2E1WmptTVRYZzlSQnMyU1JJUy9RQXpQZXdYSXY4b05HN2Z0?=
 =?utf-8?B?YW5lUkJJNjlER2Y2UEQ0ampiRnNNc3dqUEV6T1ZDb21tNFZ2bzJEVjJmQ3RC?=
 =?utf-8?B?NVNGeFBXVUVqUFY1cGhkQXN4SHJpT3NBeFNIWGtrZmNRMzFSSUkrTDN2KzRz?=
 =?utf-8?B?UVlPcTVXdjFDWFlwa2tCSkFNWUtabG9QZmlyZjRBVExpL1FRMEdBUGcvMHB0?=
 =?utf-8?B?RU92RWtWUDU2ZVNHbjh1bU1USTVGZ2tzVnkvbE9XK0RWUStLcE9CMkVVaFNv?=
 =?utf-8?B?NnR1YVBmbVVlTUJBR3VBVVc1T0RzVi9BdmlTMkRIT2NhTXlMV0tuczdIU2lm?=
 =?utf-8?B?anhxOE05eE9sOFRxSjZZVTJpYzBzWDBqbnoxbWlVT2p6V3pGeEo4TG1ibXhs?=
 =?utf-8?B?WkMweUpTbHhVYWRXZFBCL1NLdk1ReEpTcGVrcUJ5eDUxOEN2MnVNN0pVaHQ3?=
 =?utf-8?B?Ry9oWDZiTzZwY3M2ZHFIaXRIRFBlK3oxMy9TWHFma0MrbmVDMDVFMlZXTkhT?=
 =?utf-8?B?ZGY3MEJmSER2eVVVcGhHOTJhaHcxN0t5MnVxcTk2bDRITUs1cjV0VnJlS3VC?=
 =?utf-8?B?VExBVXlGV2VCMDBpMDMxQnRMUTdydmh6NmxEditlYUVlcm5nMlhXbUxRUGhn?=
 =?utf-8?B?U3VPYUNGNHJLaU81Wk9XS3A3dnk4ZmxUTldVVGtXaVBORHhxNFlxMS8xQkh3?=
 =?utf-8?B?d293bVJFc1pnelhRYUp6N0hoRzRYK1RkSVd2MU5CbG1EM2xJVjlZU0Rodkp6?=
 =?utf-8?B?Lzk5V3BqQVFKNlZoWW54dnJwYmpDak9qSW1acUFYNTQ5NnRTaXZEWHI4TW9U?=
 =?utf-8?B?M1UzZWJRckpkRlVQUi9UUWQzR1BVWDZ2UFQ5QU0yRjY1T2oxd09MVnJzc0tL?=
 =?utf-8?B?N21oRWZrVm9FdGs5R2RhRDhFTDZMZ05URURuSkhYdVcyVWpucSs1OG1BTFpX?=
 =?utf-8?B?blhGcHRBZGwycUd2djN5M0I5TXVPOEM0MDdUTG04ZjlBL25Gb1Rxb1JpaEJG?=
 =?utf-8?B?dGNSMnZkajhIbER0NERvN0tVWExzNk9tbDJCa2VzRE85NURTQ3FKSnM0a2ND?=
 =?utf-8?B?S1lQYTE2bmRvOWgvWlplS1A4V1BneWlwbFdWU1V1RXV2NVVJZWd3VC9udWp1?=
 =?utf-8?B?aWtKOTN3b0czcFd4Qitab3piSDIzWFhqUGI0OTYzVzFhaTdIc3B3V3dXMUxp?=
 =?utf-8?B?d3BUM0s0TWJKbzgwRkVJQUZ4dktXTzZTZkRkZmw1eVJudytYRGVDbVVHNllS?=
 =?utf-8?B?QWVSaTVCK2hDZ2xkMlBSc3NqRnhIUjQ5MlFkWVRRY1duaGo3akpZRVBYUTZN?=
 =?utf-8?B?WmYySkdhU0JnUVdKanJEMDZlbWdzb0xoK2JwbW93T3VCcWpWSlU3ai9oSW9v?=
 =?utf-8?B?RFh3aDFUemNTcUNVREdPVHZzVVVJZlRwclpUa29LUFV4bm1kdkc1Z1poZW1r?=
 =?utf-8?B?V0t6OXRGUlVRdUJGNUNDeHVSVXU2T3YvQzd6bUdKNFArbHBpZHQzMGpHYk9S?=
 =?utf-8?B?RlFyay84dnk1YyttNFFVa2g4dGRybkJPVnJINUM3dXQwM0w5ak4zUHUwM1kz?=
 =?utf-8?B?SUkyaHIrN0lvTmd2ejJHV0JwSndsU011Vm9yQUNoT21RNTFjUlVoZz09?=
X-Exchange-RoutingPolicyChecked:
	2id4rtT6Xuhi1mJupT6TmKCl0Q6faxoDxPXjmSAlZDqOBGLKTxMSeXgnqkiA/An5L8fvOU9jRPQMG177vM9beDNATScafbv46sSMNGFxTQa/J8WYgIIFRS1QRnC4fU5YUQmab/R1qd50yfkI9ELG7cxV4RpoD3dLqxndPgCm+D1O6EWubK+4wjWc9uNdQDN22J6SR1wgqsu42v/vLC8hOLSmFQX2NrqI9UPNLJypk7F2XEBbJJwJsbkvCQbnFzNssXVQbCuEXjWmiSDGbQSCgsnWoQlW8+sMFJQj8YjUySUqFXT/bogtxIEoxIqBc1g52OMakF85EtvOJGPibX+vLQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6f6055-0128-4f24-4cc7-08df34d79ee9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 09:41:20.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjOObae5Dz1sTUagKH3eluc6G4aP/gjqD/wUSYoDQF+fDRrjsB0ezAJUT+ety668ibxs9R2zlAESqaJqVa7yGtUUJtl0iTB1KXkAj1PPU2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX3UpWq5MLQZhg
 6XM5O7nQIjkMEEYKGw5mCAHocTpYmr++qrUkuiyB4Zw5dO4qvisSMldZbkTvo4rG61324T1yvgU
 9eb3LWw30xCixTX7l+0XMXKLXI129i7ihkGzunKa72wGlNrH2xBxCGqD9z6XN8FIuuLCbvTeFGW
 AgkKJFRidvq0fzw/PUjjMk82NqmjwZoT9AKa/6ziWnUGaSy8rt3wQGKXRU83z35PQqYAnnk8lLp
 mR9PMf+35Bchf8eMB53UWedrkK+sMwX9pjruBBzxkl3vHf1YmfV/j5tAKDF0NR+zZdTaIwJVlng
 GxM+T3luDgy2Qi4C/Bp5BaqLs7UD8mrlpslI2C57E22VsTr3BOtCOI6KA8KUSRMN4zGKJ+TKDoJ
 MPRchNWcLwX4pjI6nvi5mNwToSICiBOmefrtVOj97JQxvnD524FEM71YqfENTT3gJEXfF/POQIf
 Eytx9oezC02KBR8dg8g==
X-Authority-Analysis: v=2.4 cv=TfEDJhQh c=1 sm=1 tr=0 ts=6ae1c341 cx=c_pps
 a=TIoD7Y9874wd1wHQAFcRHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=yC-0_ovQAAAA:8 a=4mJl0wCCS5c_Ef02JaAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXz+UB0xxW1cTt
 Fnu2QG6LZRYi2qlMg6jeuliKVbog2QsNHHGDVfaHX3ZCJ5OAtdEMlPDNf2P3q0Gzk8Rwek3+H5Q
 +/U2h4Bl5MWPaus58YpasYvn5M2w/t09nh/LJ7TB0x3aeawD8d6x
X-Proofpoint-ORIG-GUID: IKatTT79GmD6Ss-sYMKmoH79Q5l3p-OQ
X-Proofpoint-GUID: IKatTT79GmD6Ss-sYMKmoH79Q5l3p-OQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

On Wed, Oct 28, 2026 at 03:03:50AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_card will be capsuled soon, its member will not be
> able to access from non soc-card.c.
> 
> It has too many local function dependencies.
> This patch uses temporary funciton define at soc-internal.h. It will be
> removed all funciton were moved.
> 
> It renames function name
> -	call_soc_bind_card()
> -	snd_soc_bind_card()
> -	snd_soc_unbind_card()
> +	snd_soc_card_bind_call()
> +	snd_soc_card_bind()
> +	snd_soc_card_unbind()
> 
> Below function is used on above functions. Add them at soc-internal.h
> +	snd_soc_flush_all_delayed_work()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-card.c     | 411 +++++++++++++++++++++++++++++++++++++-
>  sound/soc/soc-core.c     | 419 +--------------------------------------
>  sound/soc/soc-internal.h |   8 +
>  3 files changed, 422 insertions(+), 416 deletions(-)
> 
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index c64c9d425bcf9..72b40f842bd43 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -9,12 +9,16 @@
>  #include <linux/debugfs.h>
>  #include <linux/dmi.h>
>  #include <linux/lockdep.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/rwsem.h>
> +#include <sound/initval.h>
>  #include <sound/soc.h>
>  #include <sound/soc-link.h>
>  #include <sound/jack.h>
>  #include "soc-internal.h"
>  
> +LIST_HEAD(unbind_card_list);
> +
>  #define soc_card_ret(dai, ret) _soc_card_ret(dai, __func__, ret)
>  static inline int _soc_card_ret(struct snd_soc_card *card,
>  				const char *func, int ret)
> @@ -465,6 +469,157 @@ int snd_soc_card_set_dmi_name(struct snd_soc_card *card)
>  }
>  #endif /* CONFIG_DMI */
>  
> +static void soc_card_check_tplg_fes(struct snd_soc_card *card)

Don't you want the snd_ prefix here too, since you're renaming anyway?

> +{
> +	struct snd_soc_component *component;
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	for_each_component(component) {

[...]

> +
> +#define soc_card_setup_name(card, name, name1, name2)			\
> +	__soc_card_setup_name(card, name, sizeof(name), name1, name2)
> +static void __soc_card_setup_name(struct snd_soc_card *card,
> +				  char *name, int len,
> +				  const char *name1, const char *name2)

snd_ prefix here too?

> +{
> +	const char *src = name1 ? name1 : name2;
> +	int i;
> +
> +	snprintf(name, len, "%s", src);
> +
> +	if (name != card->snd_card->driver)
> +		return;
> +

[...]

Kind regards,
Alvin
