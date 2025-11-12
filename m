Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293E2EA732
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940804; cv=fail; b=TKqiO/eKdT6ljm8S2+ltNYiOT0SzQP5uT13bvllwyqwQs5WNIwq0KRH9mZL2lKhMMHxm1ENyuc51LFvja14nT1lJ29aExTIrDy2yShRBJgdGGc1bee7C79bCLlNegHLafBi7ywH6O1Ugemgdh8mLvUgKmxwj9GcG0SEGEKKb3p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940804; c=relaxed/simple;
	bh=wm6gCDU7ZGwJgrUN6q0BR3F3DXLKToDw9p2BdWm4xbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg0sE3+/uCmoAaRNoMXc7ZJLXeUvb7WykLeGnwrBsS4DBN4qI/m0zfgsNpdx3Ir7Mt1ky4OvVVuHicCQf1i0+RYIUEFLotRw/DKP9GzaEfK9tFBdqxQleIaVHheeFg+c+XfWgRCi4KqWKZtvvdOqe7nRzn4mA37dB8H4CLFtKgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nYJSbllg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=elIBR2hZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nYJSbllg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="elIBR2hZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4aR7m2232830;
	Wed, 12 Nov 2025 03:46:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6qpyARcIMTf8YaTICienjvZftPWDGhl8tw8iuXxJj+E=; b=
	nYJSbllguXbLNz9AVOZc2aUWU7yN2AcgiX3NEB1KVMQn4bYTXmBcnlKupU1eu61J
	5jxa3o0FXvMHJVOUrQxeLOpQKD+OE+p6vvc6t2uxVPGFOzEB3J6uXOeyvgdRUXx+
	Oddwx5cr5XM/H/0AxDwV77X5+Bbnh31tZs1vv+O0XvF5H74g/SNEdCwmRzlih0fB
	LmA1+mY/9i+R10NEaCrNCb0wVwNyo5mxi9oIWyTQnUY4qr90i39gLsj53logwzmW
	Ptt3HosvrncLS1vWApM5jN4dlQvko5DX0mxcQaYj/B8dtnCxT/RIfyuXld3Yk/9t
	wPytdp32caV39BAAZVTPMQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022099.outbound.protection.outlook.com [52.101.43.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ac67m1f33-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 03:46:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtHRirXw3vou9tD9O9nCEILaZXfHVAtFugqgMriIzKRwBtwWNP5cRbqNeXgp+7Bgp+x36MVr5T1Zt2JTOOtT9p9CzooRwkg7FGmhEErzXX1k1+XE2eG0EnOPfA0SLwkQ0ksb+obPwNKAu79rb8bek3nbiE/wMItiyiG0IGwbBwVi3v42YacpaCHxgZs3FCq7hFqfx3zEsZIvEAqu8gPGLZ3yrI+xnjUL84nQcVxHg+LeZOawEtTsJyBOpXfi1M+E6rj6td3yJZ252fBsL+a6b5hIRaIIlDJKWiLsL7i1/o7VrBUPlmo8zLe0dVmkibaNjxIBJMJWqlmLkHQtBZXISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qpyARcIMTf8YaTICienjvZftPWDGhl8tw8iuXxJj+E=;
 b=d5BXCL6Af3/7ieZ2KRBovCk7I44AseAWU1ME4fADVVquoRGQq6SFJGeOYEC/XQ37uLSe2utZBstjOnAR3h76rOtYbtQy/CBcwPLdVWK5tRXAXJ1Iqmhr2iG8nw7dWMewGE84m0pLEICOUCvLCYHpD4ugYVQM71x64+GsjuqLW+qGJXFdQ3hEQ++MRYkfnk0TxrCLQmEJkDqS/u6uzUroycVjgXIknTBR7/KkwaCMpHwLl+1p0VRwKXZ6Gr812IP7+CNu2SghUmgP9C73o01MM0Rf9QQwze3sblWhn3/56LVdTPdhzA14KRNda7eaGGhse870jZT8fVIVR9FVITY7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qpyARcIMTf8YaTICienjvZftPWDGhl8tw8iuXxJj+E=;
 b=elIBR2hZ0Unz0/YUrqv+IBy0Iu59DiMVFVtGmXwPJ7GRQneNLiz3HAvUQRUpQofOlplfLJa4M8V4+v9Hz/yJ73T7j5rU01f8vQCkZaGbK6vfG5v7AVo+2g4b9K/6Cpwh33FfkiNxTT+3Ti9Aov/8bEfJBaG8BgKhwBBBjmgXZcw=
Received: from MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::21)
 by SA0PR19MB4395.namprd19.prod.outlook.com (2603:10b6:806:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 09:46:13 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::b9) by MW4P220CA0016.outlook.office365.com
 (2603:10b6:303:115::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 09:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 09:46:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C90AE406547;
	Wed, 12 Nov 2025 09:46:09 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BA911820247;
	Wed, 12 Nov 2025 09:46:09 +0000 (UTC)
Message-ID: <ca3a8e54-ee47-4532-ad38-245fb1abbb89@opensource.cirrus.com>
Date: Wed, 12 Nov 2025 09:46:09 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SDCA: Add companion amp Function
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251111140617.2997454-1-ckeepax@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20251111140617.2997454-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SA0PR19MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4ddbd1-7e04-4e58-d9e1-08de21d05083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnNrNXpLYjdLbVhWSTdLUnFuT2NOeHBhTVhlRURvdjZXWldRa1g3NXN3cGpJ?=
 =?utf-8?B?dUplY3phMFFQR05GRFVOd1pSYWg0YmdkNmk0UTNGMExacGVsd0hQWUlVdzNV?=
 =?utf-8?B?WERVT0hkUTlxUE5hbEJvRlRuRnNMUGtyQ0dtQytEdk0yVU5mLzRpOUpIdjFY?=
 =?utf-8?B?bjFhbjVwM25jVWh5NXNseWRZOXQrakV0cWhEa0tRWENtejFoZzh5WHBDaUFh?=
 =?utf-8?B?Q3p2SGx6dFpWUGJNa2JkQ0lJZ0NxcmZWa3J3amVRa0UvN3dFWURJM1k5bmFu?=
 =?utf-8?B?MDF4QmJiMUpEWWFhNzBJU3Bsa0ovNG1KUStsb2ZiejlIR0ljQ3NkQXRoUXBC?=
 =?utf-8?B?VzlTcDF2VUpXM2YzZ2ZDM3RWQlpjZkwzQ1hVUmVBaW9ZV3BrTHI2S3lQQUtL?=
 =?utf-8?B?MW1IODAvOHhvL1FFWTVjempyYW5DV2J4V2xqdzlONW4xWVJ1Yi9Db3dKSEl5?=
 =?utf-8?B?Qm5XU043aTNORi9GR3BLSk05aGtmcFdBVHVpcldZWmdCdGlwSERhbHgrRnZI?=
 =?utf-8?B?WXozVjJKWkFkcS9iY2kzQzQyZzRyOXZFVW5Ca3VzZmVnRUpDVmx6eko5VXZY?=
 =?utf-8?B?N0tNYnpZeEFXNVZ2KzRydmpTL1ArRTNHNUd2bTM1OVVXMjlDMTFrS2xCcm04?=
 =?utf-8?B?L0ZvWVhYZVlNMi9HK0E3RTVZeVBDZGhtQlB2MmpnZ25WTVBKSFpJYS80K0Ix?=
 =?utf-8?B?T3EzYnB2WGRNQWMrV2VBWmlQQTBSNDZRR3NIODltUndKaHg1VVFmVW9DYmNw?=
 =?utf-8?B?bkI4WjQySDczcktmUG1uRW9BV0hEZzI2SmFZVW9jOW9WNzQwQ2lNWkpZVEsz?=
 =?utf-8?B?d0hxUGhtOVM4NEtBbUFNWEFCSVRDWWVSUDlFOEJOUm8xU3hiRGFPSG5wcUkz?=
 =?utf-8?B?M0hzQ081dFJobDN5dnFhMTZ2TjRHWnQ4U2IvOFMzRVVpOGRPY0RzbXdROHp1?=
 =?utf-8?B?NlFQcmRPbzJadFRZK1BKbWRrdlVLNFZ3Y0wwcGoxL0htaVdKVEFBOVVNS05o?=
 =?utf-8?B?eFdDUGplWHdZM3ZDMENGaTNZenZmTGMrUlpsTC9hRHZEU25IT2hxWCtwaFBv?=
 =?utf-8?B?WG9GM0xlS3ZPV3VUYVVtd0F5TFRGL2NWOHdTbmF3UE5mYWR3TWtra1E3OHFR?=
 =?utf-8?B?azFlcklMYUs0bHd4dVZ4WnIyV2hDSzFxQXg2SEdiU2dNeEZkUGdzVmRXTDFZ?=
 =?utf-8?B?SkdybzliOVh5TDZzZ0xEeExVSXpJZzBkeWt1UURzTXgvZU1Kai81M1Yxa09l?=
 =?utf-8?B?cjBkWUxzSkdiZVQyMzMxR2tpZFJ0ZWtwWmcySXhHWkQrV25ZdVJ1bWpyWUpj?=
 =?utf-8?B?REw2dHkxc09HbkNYa2k2bWdrMytOUitLaU5kL1lMYkM2ZWVCRGNzNlE3N2ZU?=
 =?utf-8?B?T2NEZWZrbGFXdXVRc09mOVUwVlVZY0oyM1pWdlp1S3Y0YmJRcTRmZkJVN2J1?=
 =?utf-8?B?UFFMRVA3REZXMGVYMzZsbUQvWGYzdmt0aHRINFFIMFpiSnd4VzYrdUE1KzQw?=
 =?utf-8?B?Sk95Q2t5bzVHRDA2dlI4SXoxRHU3dWlXSnNuSjZJcjc2K0M2WEo4anVUQmUv?=
 =?utf-8?B?SnVoOGZCNCt6aGRRdlRRcWFORmovaVBZL2Z1anBobXJOMmNxUGMwQ1VVNU92?=
 =?utf-8?B?T214MGZ3b25SeXpwV1BoUnd0anlzV0RDRmwzM29Gc2RhNFlqRTZ3TjJoTTNm?=
 =?utf-8?B?SHVYM0hJT1ZjTHAxTFhCYTViSWJzUlNHVzFoZzFyYi9Wc2hjWXRPVlNqTjl3?=
 =?utf-8?B?UWJuWkRCcGxpNWQ5SlE1VkNlQ3padFM2aTdSL1JhdlhwSXY5SHV1TXQ2NGox?=
 =?utf-8?B?OXFJUWV6cXNrOExDcjdKb2ZaU2RtTHNHLzN2bnZMZkhhK0FVYzBtKzNBcWlE?=
 =?utf-8?B?VWNMWnorV09xSkJzeWN0amtFaEhYODFnWUNtbXpqMDVlYkZRNy9HVTRRekxr?=
 =?utf-8?B?TjhBQ1NUdWRZaFlzYTJ2R1FhTEYycGc5UHJlZEJ2ektDYVFQTnNZb1k1Nm1V?=
 =?utf-8?B?aEU1OVl3V3FUOVpaM2RmNW9rcDVQaEd0SndRZUVBdWY5dUw1azVWWENoYXVZ?=
 =?utf-8?B?OUtHZEM1MW01R3o2T0dhQWpTOWZXRjlFT1NWUElyOThHSnB5T1J6cWhkSkdi?=
 =?utf-8?Q?BzVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 09:46:11.7577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4ddbd1-7e04-4e58-d9e1-08de21d05083
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4395
X-Proofpoint-ORIG-GUID: qixphd49ygWoCMpbw0pEHBzOET5Htsuc
X-Proofpoint-GUID: qixphd49ygWoCMpbw0pEHBzOET5Htsuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3NyBTYWx0ZWRfX4Ixhp3vIqQDj
 arSNA171i8v+tK/SkckCRu87Do39VOohETXmGm6Qt2IYpqcQo4o7X99xNvPfAf7gMRCGiqH7ErV
 ZrQZY3pQIxhSuVqMM7sKGdGjyJg2OSMT50pZH2QhoXOVzxnTcjak2a9QIsJA9OTtedI/exFY6wa
 E6XVXvsBM757f84p3xoujhObNZgRLrlQSRagpXerAJ14rBld6rZkSac+JQtfSiqH86ZKwQddDZg
 AGt/lKv8kUPcGYvyNQg1WcR0lMUfNF5DTOEptKDJFfmcYLDJoVOvnQKk8ZpU5yGQiHJzlSpnZrZ
 liEaqi52Ug98JygxdzwC4oGVeSnqLC/jL0gpyWDffWFFxpSBg+AfXBOblZqlpOiMcQdEBAVfujJ
 E1PxCY2iDeUsc8qD+jvx+AFvjpqdXw==
X-Authority-Analysis: v=2.4 cv=NdrrFmD4 c=1 sm=1 tr=0 ts=69145768 cx=c_pps
 a=MyZQQtGQDv4zT9mHdzB88A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=CdTLVXkAuTKx0twUmj8A:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On 11/11/2025 2:06 pm, Charles Keepax wrote:
> Add companion amp into the list of allowed SDCA Functions. More work
> will be required to fully support companion amp, but this will let parts
> including companion amp functions boot and it is a good first step to
> proper support.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   include/sound/sdca_function.h   | 3 +++
>   sound/soc/sdca/sdca_functions.c | 2 ++
>   2 files changed, 5 insertions(+)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>

