Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC47433AD;
	Fri, 19 Jun 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885110; cv=fail; b=TtpWr/rq/4WkIgn0Y/pOm5p7AzHGAdSht9nCeBMx5FgY31SlAlTzJ6am+KuM0rFucK5S4Q8Eynnl156PuRhdqDT1ZQx9LTuqJ4bW2uUtCtcUbhxt6Wrwe8nZIhm1KAtJo0A/zZWWWcTgA0kGVnmHMJiVK7xZCtsIsyiKcLVk64w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885110; c=relaxed/simple;
	bh=mvloUH+ejuEh2XyQd76tOMh/PwED/5kuNImt6ywUP3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3skCshTQiMF+YVODr1H7OEpEBHK0DmqIJHxBPAxjYrW1WBnR2R2Fy5n3NK7Ybo87yZTsUhh/wsMtVnOC2h8YL6CYfHAoBVNXb//ZDYI6wMsQ6n/VBJpa7Yu0LCR/QMsJUsBlYMy0FqJJKqwYcUS7znmJX+PO3IJv7tJxt4zJUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ItiJEs8O; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JHlIKKUD; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ItiJEs8O";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JHlIKKUD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JFiIN7939865;
	Fri, 19 Jun 2026 11:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EfgBcJ6tCwsgUD4/sDFV4MWCIBlaEWPm0vsKAIfCc2g=; b=
	ItiJEs8Ofi/ohhmHD8uwbKxUssw5hKhYo2uwCvAB8T5yjaGsvuBaWMCZ4m5fuORH
	vViHod35Kkk6FvzFnGhd+B04IHnytQsFVsrSGNI7fy+R6QmYZwgKybVa/03CxJhW
	cN4BytOpItzThVh6qtnAp5+3snzVl7uSO7ao2sb9NKOlIo4cjp4bamzWlwgsk6/f
	o9nN7GgCivLlygE2g//vpHDit9XSmCf73pbKa0N6VAsDlQ03jDKBiaPza2SFM3cY
	iu4ZkpIg15BeSeFrEQKoZ79Eod1Df2NDrF1s0sdDEtWJycDtoJijn8UjppxnCiRF
	zX0o8RzM4lyAwe8XJhALOw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023101.outbound.protection.outlook.com [40.93.196.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4euee3cdww-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 11:04:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWc64dDPvjtc+qY8FpNlAZayQX/xFVvJka3k8FakK0xIpGIrOGred7yNpDt/d/Hf9Csps+X5pWnIJxTlLck4OGu9g90rJBkltm+I6RbXb5NiYm7Fcs7iwWVbKa00nR4sMCnBmamBusj6V7OItEPgCgFwa3IoGq+LGnx0sFRZrBo9p53juTJiXzLzJ1BjNz68qKtXgCR+irESiSP4UIv17xpkzGwDlv7n7T4epFHqiRnS4w630kvKRR3I3rB+v0QV1rX9WPDvCqohTvbSDpk5LrrwE/t7iTL45BVjy2CbT34U1GdlazATq+KOnnIFbHI+0mznp5hgk2qCvnRrcUoZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgBcJ6tCwsgUD4/sDFV4MWCIBlaEWPm0vsKAIfCc2g=;
 b=fXpdGp2E0PAA82ANCRhe/nM+MrQiKbEmABdlCTeqXppjwaSRm2kIJHvD9eYQrnwG2g1qkCVBA3Wl4wiOYZJiHWlaescx7ZdDtkQE5vEYcfEHhJwB0xfQIUCUFy4f/BO6VW3bkTvivmfInHQnM8roLI7x8881+OgYlRrDKReDVtUunJLXXx3AiDw5zbTTb99QeTUrZm9e+Ti/UWi5Nl5dwbV5omPtl34RcTETVai8TK7HJCpdyojEMbdLY9zfDNAg+sk9WhsyngF/bM5o5iS4oCeRtZ/DFNrnMkGCVGKJ7NV0AttHWHuI8x9orYj2VNOYU+xOCvoCkn+NY1CvjK8b2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgBcJ6tCwsgUD4/sDFV4MWCIBlaEWPm0vsKAIfCc2g=;
 b=JHlIKKUDTnCSozdICCnE31teRoiOewMG3pHAkFC71qHqU/EnJaFl97ryzas/hs1mDGEhhFqvNeSva5m4Iaaue/vLGr4Kln2WHWJCShCAveSI5Vw6/xmpfnS6eNIAXk1Hrx7kexWHVVEue7qTPrfA2FG2z752RRanzJFHChMnQKA=
Received: from MN2PR01CA0039.prod.exchangelabs.com (2603:10b6:208:23f::8) by
 DM4PR19MB6100.namprd19.prod.outlook.com (2603:10b6:8:6f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 16:04:54 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::88) by MN2PR01CA0039.outlook.office365.com
 (2603:10b6:208:23f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Fri,
 19 Jun 2026 16:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 16:04:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B2F3D406544;
	Fri, 19 Jun 2026 16:04:51 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6EE2282025A;
	Fri, 19 Jun 2026 16:04:51 +0000 (UTC)
Message-ID: <91aede2a-d0b9-43ee-84db-ebc16881425f@opensource.cirrus.com>
Date: Fri, 19 Jun 2026 17:04:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, broonie@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
 <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
 <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
 <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
 <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
 <7d97a6b2-9ff8-44bb-977f-c87deb5a3e88@opensource.cirrus.com>
 <ajVmJ2N/sDKxVZx+@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ajVmJ2N/sDKxVZx+@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM4PR19MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e37710-b6b9-4ca0-3792-08dece1c7fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|56012099006|18002099003|11063799006|16102099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	2AG5nWt/IVcpHbtxZ2GV52AQioJ8SMbP76lwVH0Q36uLruex8LkUNHbvkAlbJFXVK8RacMwtKT6zsQ8/Fy/ASvLEYCzJKpqY95fD7uncQegTuyXhHvMccwB4PQyMG+ajj+rmzUh49cf68AC+QCKz5v6IurZBBRP7SURz1H3grldnc6CxhyVM/H6jCoaQWvfmYW23KC9CeNOsFVNkC/HHgh1DTFRJPZZ8EXcI/pq3moNEMXHT16rBTipCIJ1Yqic74htqVXenOiqHeiTTBnwjqZJjBWBprIl8flv553qjrEdd+6t6/WA8AIH8tfNuqx3/6NGK8/Dkj5b4q9hI5LuwBHDWYw9Fw8q2wz+s4ApZbWdYfgEBM9XutkNwIa0Gz+uOylHsm8rY2oM6E5IQq+FWjCTKdw0KBPGscWnZeLB5MzQOb7o66Fxal8FEuN8svU4A3VT1Az2L1SRQEUmstTbkc6AGTTqyMoV+ovAVHPwMXUrmqQbHv7TVe4nAJYcZ6fa8jOfAugRzRyMsuOyn2SVQCvAjLVpQLdlB8i69oHEVVCfzrbhdS53tpYUdxx1rI/pSNG/3tFzyXfAqa7PJ1Mp5EHQaFKfYEJHUBt0vVqF4g9h0S03Xfl/OXF0EUqTg/sYo18U8u1gW0jtI2uSn7uxtiPVC2ypD9zM/HZPLqcLSQ4NKyax+cDTp/ELlh14XHZHtn5UJudUz4iKGsPlmn9SWlA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(56012099006)(18002099003)(11063799006)(16102099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h1s4zT81F4sG6/Ft/T/d9ZWAemUXWqSINhXP3vrbZd9m4OoppNGHL0VC+6ZM3UjsvUwX12LwiIJpGX+qFo2613FBUdz/HQ8AroRWKH1M1kK80l+qd38PjWZohSwky8WAKOiaG8IU4NTn8R4nD0Sh1lryhI5oECJ6coOEe2Qj42YdwnUr1i4l6W+ftXTRUiC3G7jnRC9/5tqWyKMeb0sG3jAhkq2wyM1VVn/4K93vnsGfanpzU4Vzie1/q+2w6u4vEUJgJ6JoqEL6Rnx3gCYzzvuNLS97/jmlK/r9cyF9Xjt0GqsH71T0uZW5YOiMURNNpjqSII2gtNxRaITjurdgRj77pP2DR4rry/Lwg5bGRcbQJwt5U/B65auuYPFBoi2bJ5kM+9yEVs4UqvXaNMx6n5hGctxdtPC8V1xC5xly4v7bKiqHvdk4/CQKTDAk83WA
X-Exchange-RoutingPolicyChecked:
	ofvvxXVCxtRJukWX8b93OoY8Stk8O0UcQtRoGTBwJg+qcrVULbXrm6zBLK3mo9zz1Cg7QloKMMGSmaZvsSwLyzA5uboGSkI90f64TEq/6l7g7LbGEv8Ex/E6ogbzVwF5JPat4mK5L/bdwQng7J7PVIYW6ZGQwwHRMa4+oHSIjgbqiLZqat2gFEvwleOQlLJTtQMdhaG1DuYrZl04+GJluuOjrlsrttll75Oea3FhEMsJIJO7oUE5Fbb2ez9oUIR0yA0JU889W4uAshNcjwoY/Hx7mH2XSJ89Et/7N2X0b4AERNaweOQgBkPOetcWwJGTgaeADFukreDE0CGo88YIow==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 16:04:52.9499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e37710-b6b9-4ca0-3792-08dece1c7fca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6100
X-Proofpoint-ORIG-GUID: 2CbOjyrWFQP_ZUL-1oiSVWbp-mur-kHE
X-Authority-Analysis: v=2.4 cv=UuxT8ewB c=1 sm=1 tr=0 ts=6a3568a9 cx=c_pps
 a=8P4KAFraM2L8FVmDPFuExA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=zEBR6_nmNxBaT3EiIiUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MiBTYWx0ZWRfXz8Br8EB9gkZD
 FRTDExnpoBcm+I8vTouVJSH7ic0mxwx7mgLR22Npm9LB1/Q5qVQ1oEgegJhscmta2ZTvW12WxoE
 sA++shnKSxkYOK0SjUWq8mTjPptO4Po=
X-Proofpoint-GUID: 2CbOjyrWFQP_ZUL-1oiSVWbp-mur-kHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MiBTYWx0ZWRfX5SPH79UHdpyq
 Tn45PmpKdtaMn4j/2Xfd9JadLZJIyiT18K1cgCpZxRSa0Q7OgFZWV2ZderhE4Eu7EVsiV+mMmRs
 gGRMUjIafhX8xWGdeOyQqessXtS0Fg6R6xSJG7Z9vJdJEXFufy/3wxpJ2z+y6wuJO/9dnvSTzRJ
 CoyUciDZLtBvnQv+iKz9GbudttsPhZoT82gzrNBsgrMNMKz/gNm+OLlU6iOiaBbbd3A4nEZq2cR
 2/DG3Xl9JUygxbuosV6xW3QERWg/xhM9+/qyhK+1M4ZyBGXZAm9omQRAiuxTXu/L6KioA5zBoN4
 HRVT6ueeXNuYiXsaOYXS1V9aJosj1j+FVHKFeRmREz/BYguTBLLLZ5SjSl+FD5ehqJvkHPF/syF
 3OiaphRj5Flp5uAUpsC6L62joseeSJlZ18i3dLpJ/ipD1TYPOIjbdYQaamOcETr9IhNGdUts74W
 xKUso/17MBIPCZWH+SQ==
X-Proofpoint-Spam-Reason: safe

On 19/6/26 16:54, Charles Keepax wrote:
> On Fri, Jun 19, 2026 at 02:33:36PM +0100, Richard Fitzgerald wrote:
>> On 18/6/26 14:22, Marek Szyprowski wrote:
>>> On 18.06.2026 15:12, Richard Fitzgerald wrote:
>>>> On 18/6/26 13:58, Marek Szyprowski wrote:
>>>>> On 18.06.2026 13:22, Richard Fitzgerald wrote:
>>>>>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>>>>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>> Is the machine driver the parent of the codec driver?
>>>
>>> Yes, so this change fixes the issue:
>>
>> Right. I thought I'd tested that. But I haven't got any hardware that
>> uses that "for real", so obviously I messed up my testing there.
>>
>> It makes this whole device_link stuff less useful if you can't use it to
>> reorder a parent-child suspend order for when the parent-child
>> relationship isn't relevant to the order they should suspend.
> 
> Yeah it is pretty confusing situation if the machine driver
> is the parent of the codec. What is the correct order for
> things to suspend in that case? I feel like probably the parent
> child relation takes precedent, but generally not making codecs
> children of the machine driver seems prudent.
> 
>> If we skip entries that we can't re-order, is that simply adding
>> confusing complications and _mostly_ ASoC forces the correct order, but
>> in some cases it cannot and then it is up to those affected drivers to
>> figure it out themselves? Can we always guarantee that those drivers
>> will know which they are, or can it all break subtly because a driver
>> doesn't know that in some systems it becomes related to some other
>> driver?
> 
> I dunno still feels like this change is an improvement to me. The
> core DAPM powers down the path, it needs the codecs available to
> do that. You fix some subtle issues just not all of them.
> 
>> Mark - should we revert this because of too many corner cases in the
>> device_link code and go back to every codec driver with a system_suspend
>> installing its own device_link to ensure correct suspend order compared
>> to the machine driver?
> 
> If you go back to this you still have a situation where ASoC
> mostly does the right order it just took you more code to get
> there. Also I think you would need to install the link from the
> machine driver, since the codec driver could be used in
> situations where it is or isn't a child of the machine driver, as
> you noted earlier.
> 
> Personally I would vote for just skipping the case where the
> machine driver is a parent of the card.
> 
> Thanks,
> Charles

We're still in the merge window, so it's not something anyone should be
using on critical hardware or daily driver PCs. We can think about it
for a few days.

We could also deal with the case that card->dev ==
component->dev->parent, then give some time for more people to test and
see if anything else breaks.
