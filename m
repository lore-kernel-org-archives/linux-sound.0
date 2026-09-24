Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F73B38A4
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242491; cv=fail; b=CR27JxKoM+lvBkhaN2eKKWHj7TuYJevN7UjkRwfbXN+kTEvn5BsCpwRUcByI9b8dS+NX7H7H5AJ7AEyLiMTi8D229y4ctIYoHgKrHyPo1ggv+F3zasrDeUePU5qP1k9nSmBRe+Lzi/XOM+Dn9kGhYgS/bR0sw4QXGTdIMZD0bX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242491; c=relaxed/simple;
	bh=jhpfmknuAP1vk2fb816ah35WJy9xZco6mpuS/yAnLJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=plf9Np+fH7ajiHa3kAp3MiYKp0khzTRBI54oSnCCXlj6YIabl8c+XxvRXl/SSWN6tpsCdpHr6X5N30hkyP3rFozspcFYodtouZoGVqJnSC5Yh+s0n/YyitBSBsshpPhDDQhirOikcVrakASvIYtkXbJ5nw9cjE3UA60F1Z6g4j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NY988Mby; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NY988Mby"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O93brS472171;
	Thu, 24 Sep 2026 05:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=E31S1
	HV9q8kgoGVEkJqQIRvh3wCgw4/DvGCJrXjK/O4=; b=NY988Mbyc7Q4mZ9w/fH4K
	zCGaoK63URULyxNXqJtW8bCKiK1yZuojOVtvSXbWvDtlwjqJ1dpuXgNwU56kkj8v
	6O/OePtoUYkEJp0d4mNbXJ+I5Ok1h97wDH4pF7CvP0AxQmm1WUWqzmMfSKPLmDRB
	VIyk4LCAsa/VesMuKfiIkulsL622qHbTvijCAbpuVWZN5eVsQ+elz3F6wQRcHXKH
	sgQowJeZqoUCLb/xUTg93M/CbaFqzL3r0sZ520Zd5mRgfHiAtcMXYZdGv40aDckD
	E9M41pk8FR3pknkf0E4whsy3mh9P8cnQJ/V056kbZQy5dwIM6WU52Qb2UnX0UO2g
	g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gv0392q3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:34:41 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMY5y5wvKTHjTEmNv6dsohyuQftFZPGUnqvmD4l2AGoEl8mCbix2anF5oTp1SzpfSZmzs2bKkUUFAJU9ataVxY0msq6D09qznar/PtO9aOgPNlZTqZgVson4b0H3Z4q7PyeDiPMIM0kbgHW8iEWt2q+WFtebVWcYws2u1G33IXAOjvZI56bMpPeS1OHlPAK/mgcxwoWovyqzd3KejnXlgMSALJvBJ+GfwpDMLkWtk9RcqVhzGOYrJpMrKeagK3a4RHK1mAlCiSJwgNLGGRltvRi8sI9Iibg5jX+Sw54e9NXTYqGTzRb7CBwCtbdXrMHTHSMh+JSQFJXnApELt3ChFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E31S1HV9q8kgoGVEkJqQIRvh3wCgw4/DvGCJrXjK/O4=;
 b=zTFCytVti0BikkJbLzw/0wzwV8XL4jqI2RSLtM8udA+nnk9ybmDs0s/WOg22/VUQafDWrZBCHloqmcoSiWBZ+LnsafiQuvCGz3o3euJtAr6Tr43+Ryl9f+IszHDgDwEz8lQrJhP/yDVHspx8qn8o1ls0hPvorJU24Zq5xwef7mpwRlKS9yN293Bx0MfvsDYb7TN8ow5Ur6Rd5lBi+cMuETHpB3299PaD/7yej6WiGi7J1h3R6hWomXZ1HAzXpedaQzNBFHlCnGwBcZNi0bm5rmX+bR2RmGcgu35kSKYMIey7rlzXVC922wrf+dMAdeFoeuj7uAViKBIJO6BrtiMs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS6PR03MB089049.namprd03.prod.outlook.com (2603:10b6:8:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:34:39 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:34:39 +0000
Date: Thu, 24 Sep 2026 11:34:36 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/9] ASoC: soc-dai: use snd_soc_dai_stream_active()
Message-ID: <arTupH5ObaXkW3iN@analog.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
 <87o6dvjpz9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6dvjpz9.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::16) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS6PR03MB089049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9493ec-fd2d-4f9b-dc5e-08df1a1f0e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	najvTKRAMvSutog+Qfc4ysNmATIzYECsqZLNgzxYbF9sbTXLu/1ct1WOJUrXDAVXCsoQrBGtAmuOcyb2nztjJM4vm9rStNvbqBRbc9DbHssYoAjL/MW78KFFIh2xPlAsem9HkpWFcpujzLv8rnRMVYpg57lhzCoHddb9HcWCAc/iaHQLDmcU7+9EFqIIGjPskLgKfCX11YlABUFN9VAwUnrLNoTCQ0v/PrNPQkTWveD9rASJLoZlptvOHgAZixgObtVV2np5iZC+fD70U2LrWC2GjnjB3A0ZNrnuhDledTJqerPeNDSU/oYCHIWgQ1iQxEv7wp61WmZ+HkLtG05BSprGNRz6kL04CDrq9ONPoDl8jtYepwt1fHBkCeIKpssMSgUTEPTD3Sj6XBX75cQF0XSXzStpHURxsHC2pOVD9I4ydDScClMxg78yvjCEwmI7xkOXuWErildyL6fLtGhDXbk2y4oym1XBvfvdbY/GiXFBKFzjGpLZd+1TlA2+znCeZcS3XYRLqF7jFsk35HvFjhgNWoss2F5rfJIVR2cVxi94RdArfeg4WI1nOl8vimQJg2kmY90phgCtcQ3W+67Wp5gPhfx2mzsUt1fn0+8IAgQF/8S+GBaqpS+OsrIMJ4klBuo5WLAxBnjQnKe31IuqhYgek6EAs8cLsFTCfCQCIAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWU5RHJNeU1tREFrL294Zld0MjNTR0V5UnZIRWEzYi9LU29KelhoclhNR084?=
 =?utf-8?B?UWgrSU1Od1d6UlBjYnRBRkZsMEp1dUNjU1cwT3FRT2RUcHoxaE4wTTZXSWZn?=
 =?utf-8?B?amRHMFVSaVY5Tm0wWHdkQ3UxQm9vOHdCWkpabEVwUGNKL3NrV1dNWHRMaldw?=
 =?utf-8?B?d3ZSaTRmNkNWMzR3VUxXdXBaTjV2VyszeGtYM21WR1djQkF1Ykk2eThWS0NR?=
 =?utf-8?B?cWVxQk9iQ3drdCszenVjOXlBd2F3aUhQWUxRV0tTUG9ISk5wSEE1YXpyb1hN?=
 =?utf-8?B?MkhrZ0MvRjhtOEdxbXEvL3pWMXZ2Vm0zMHFMMUtqYU0yTTFFRTl0cnptci9t?=
 =?utf-8?B?dEdzRHBTNHg4ZmdFN21mMFlaUW9ZTzI5TEUxeGZ1VmkzWlhmdXBJQ0ZXMkFi?=
 =?utf-8?B?d283djNXdHFabjBlWFV5TUNTVkxZUjVUaFExNmVOZGl6blBkelN0L3R2VHY3?=
 =?utf-8?B?N2pvd1g3ZG8wbEU0UmZPTDJMMnpSUjl4cmpoTldjLzBsVm14MStOQTM5K0w1?=
 =?utf-8?B?TlltdnNRWStpRndPMnJrak9FRkc1MlRCZy9WN08rWURpRzFDbzlSOXVYTFJx?=
 =?utf-8?B?RUVlNGF4dWZXZkc5WGtYRzlNeWNERVZ4TEM3MGpPMkhCZDJxRFBEdXNtL1BD?=
 =?utf-8?B?QThnc0c2RVljVXg5S2lzek81VkJCbVhkRE5qUHdTRTJKWm1CRStmUDJ2bzY3?=
 =?utf-8?B?UkQxM0gzbjh3S1lURHRVYnZRQVpDNW1GV1ZOVHk1UCt5eXR3ZVV5M3NWTk1y?=
 =?utf-8?B?NGRjdHE2SVloSFRpaUxoaXYyQnlnWDFSOFFxQm5uSzJ2RjNtVHZwc29admRy?=
 =?utf-8?B?by82OWgyMGxHb2FVaTUvR3MzV2VRcVl3dkYrMTRxb2YyUnhiZEpNbFN3WmpO?=
 =?utf-8?B?c21ldW5iMWtPSDVZRWxscmNNcVo4TXIxTTJKMTd4OVBoWUx2UVVkTDVTM1pS?=
 =?utf-8?B?RDdrYmcxQzhSQ1VqTGMybzZROTlqbHhFemtCUWxibHpmRWtoYU1MRCtidHJR?=
 =?utf-8?B?djZQdUttblgvQ3dHeElPYWQrNFNhUithTU9xbDBtL2xETFZnc1hxOFQrem02?=
 =?utf-8?B?R1ZDb2dXWE8raU1LY1k2bzZRa0wybEh2VkEyZ3MvcXVTMGQwQnlsSU8rczRZ?=
 =?utf-8?B?R1k4dmwwd01aa1QzNDcrRXJMc1ZXSms0My9pSEwyODRzUWxjNXBXT1FJSzN6?=
 =?utf-8?B?Q1pyUmxYcW1nZTNVQjVGQnp0VGh4SGt2aS9XeTdBbUtETktFRmdTOFllYldV?=
 =?utf-8?B?MmFtbW5VTlBKUFhOejdSdUJFaS9heWMxU3Q2djYrNE42UjNpVmMxLzl3cWRS?=
 =?utf-8?B?NmpqWHptZmN5cEpiZXJoYXNJekgwVnE4VWd6eWVHZTB0aWVDOG9TUG1VRHZZ?=
 =?utf-8?B?SFhza3JGSENYb1F2eVlmd3JjdTNUck5IZVhzaFJMQzRRZkZTVmFGeUFoTytN?=
 =?utf-8?B?ZUg4NlJLR1NGYTFwZU5pQ1N4MDVzTERVK3l2M1RyWVNnR25zcUZCRU1LTXZo?=
 =?utf-8?B?U3NYQ2lsaTM5UlUyRnZlUXZBYjRLQjAvVCtFWlJDeFNMN3pqODEwR2htcFhJ?=
 =?utf-8?B?YTBKSjdQbTFLdnVQZktLYTQ1MGFoNi91d25sZThHak84aTE3K083VDlPLzEw?=
 =?utf-8?B?RUpDRmFTQlZYelBOeG0rYU1GMElEQTQrZ1dPQnFTQ3FFUHZjNVN2M21vMlBH?=
 =?utf-8?B?QkpvVlB2aUkrdkppSnVmSU1FSmlmMGtxU25lVnVyaHJHOU9qT1JsMko4NCtJ?=
 =?utf-8?B?R3hFbWpmYkFkai9YdDIxRXN1dHBvb1oyQXZsWmR5dG9zUVF2Q0RzUlhnUjVu?=
 =?utf-8?B?eEhxTWh4bk11c2M4ZTM1ZWFhWnRjZTdTbTk1cTB1WHdLTnh3cTd2eGZpZkZG?=
 =?utf-8?B?dGtVZHpIU2o2L1M1dWFXSjF1NGNsNGR4Sm9taVNURlphaEdBZHdVSWY1dWFp?=
 =?utf-8?B?ZkJGK3hpZVIwWjA2RWpFTThvZWF1VVYraHNUcFpBNzV4UWgweUVmOEt6VU04?=
 =?utf-8?B?Qng5T0MxSEJOT2U3YVNwb3pPQVVjVUVNSlZZdmwzdE84cEJvVGRrajlTQ2d3?=
 =?utf-8?B?QTFFMktyWnNKRDlGalg2Q0g5YitlK050K1grWlJLV1lmNldEbVBaWHhkMVd5?=
 =?utf-8?B?eXVYakRuWmh3VEVvRDNod3A4aXBLYXZTeW53bW5UK01TN093NCtobWNVdU5G?=
 =?utf-8?B?K3BUOCtteVNJZ3ppckRxWHFWS21yWDFEU0crcHp5S2k2alZKa2hyUDFQZ3Nv?=
 =?utf-8?B?VE1xNHNMN01ReHNrUmo1dDZ0NUJ0WUtqZkNzcUduVlJTZ2wyRWtSaEVXMStp?=
 =?utf-8?B?bnkrMXlPRW5tNzlkU3FmTDYyUWpzQm1hNU9lOW1sbDUvUUd3NW1zQT09?=
X-Exchange-RoutingPolicyChecked:
	dnikAoPlEnGW7wm4dBKdzlN7ujR03jKFnvUsorSNGFyqmCaUR3ONfOSBdsZtmX/1W/cEG4sweUs10uSD0uBe0IdocNyEQsv5MBfpT29/CLbPzKmBppKjgrsRHfCf/nek91MCJ8GakkcoyhpiBwFr+6MkGYlzYxr1KH3LUXWv4uC8M19F9k8WjAIGmg2cE+yclx36/ap58eDdDij1H+3OtB1yCuWqtSZWTSnq7xXlCVRVl6ux1XuZj/f0ae3BAxt1MQqcYtqh9ceIu33Y9EftkkvFA4CWeJ/bd5/GzTfnr9Z5orOJT9/+/cDTQEOP153awu8efCs6UU5WkEgqoGM6qQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9493ec-fd2d-4f9b-dc5e-08df1a1f0e44
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:34:39.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mwk6pjfdHtLIYzGXiTOMndTSuuQzIuDMmTCE85Jg0XwuylOY502eNEZxEKQP8v2cek0Y2swXlxDGQQeG9LWVrfGWtqOsmIxoWLIKd0h8CJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB089049
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX+Cj8hX+pH3x3
 RAwU7OBM+ZVDO+EeJNdqeToJmAlnAXk7esdb/GpPEPBWNBro3B0r4Ny6yOZdLzuIixKRKZHQMBo
 PlBrCrSnrSgQnKnm2PpD6j9n/vCOdBL7pc5j58zOnOze/zzXGsuC
X-Proofpoint-GUID: Gsnb5oeFkTiSj8P3UOACXRVQTR83kZvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX2NzrKxJJwog8
 7uTQbGb7CJMSOmjzSI9ZRsKy+wOr/3BZ39NyLwULCPI4rZoZ8EG4OmDkYJRHQkynRo9mTkl4jH6
 bccM7v9g9hwEToxC2QAtP/Ws+uVfueBWD5+uf1ps1WFZaZnTeHgqG1hWhg7yjd4nOMb/u5qBJBs
 D7NxoszVrPRaXuoNiyVIgMhuXQzMG5/1RHXWqsl5GI+m3dvMv9MxpQp+Rxweoca/6+pxN2/r2b5
 u42gY/5jVPwnidroQDrXGdi9GIs+NfdkCVTNn6qgB8bn/GFMdsWvhpIwIzNBgkLSH3FZY814Y8b
 x+CWh++qncF8e1agw5tz3WvsIl6VZCXyMt0li9ojUazKqVnrgoE20osmB+57Z+qqn1HP80NKXh5
 zj+38R2EOMya6Svd5Oqw7SLZ3910Eavc5SX2NgWy/QkRgsGFJ6k/INYsozELyOfmBFJCeYKAQLF
 YKwkJfWZIV9FEmrnq4Q==
X-Proofpoint-ORIG-GUID: Gsnb5oeFkTiSj8P3UOACXRVQTR83kZvX
X-Authority-Analysis: v=2.4 cv=Wv6+otfv c=1 sm=1 tr=0 ts=6ab4eeb1 cx=c_pps
 a=fNyNANDL+C7JeK/y+7sGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=jpRLbJrD88sa02JN6HMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Ha9PRq4w45QA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240039

On Fri, Sep 18, 2026 at 01:41:15AM +0000, Kuninori Morimoto wrote:
> We already have snd_soc_dai_stream_active(). Let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
