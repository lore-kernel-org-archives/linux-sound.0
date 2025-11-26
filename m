Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3C3064BC;
	Wed, 26 Nov 2025 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150071; cv=fail; b=AwIZdDeucEknIcKGaDmmNEDPpJJIv0xcQgVlTMTXa1sZ/yTbGx82tvjrl2PcyAWcnN5Gp78VpBlNMumass8WlnnkyvMPm005pFQAZ+nsExxOYvBYa25DIYmVlIdhM91dMBBUtZHEsO3a5fMLUUvROdot0CEL/MZX/mYp4eIk4g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150071; c=relaxed/simple;
	bh=9nvZZWW/CKZm13YybGInk/r0h9LwiVa1aGkSQtE9DzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkLjqEdmKLgzU81eHZyYWqJdKKx9QRteEX0ies0/8wHwYOyGi4YoPIF4K9bSk9VNF/uIfkvN2X+KL3wpLAALKYoTUIITL8CtxFvAW1GDWyAC2FsGSBN9Y7ggDFwY7R4XYfZSdkfz3fry+vOYGo/OfWnyeuex7XBsKgg1SBGrk8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DGBxbY/1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0SG2mcz1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DGBxbY/1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0SG2mcz1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ4sRuo2394947;
	Wed, 26 Nov 2025 03:40:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JneGbRM8kq5/ifKEunOS+7ibhgoBq4e5gbkVtDoZkmY=; b=
	DGBxbY/1MdmgCvjy0hK9xenHEfY5Qx7lbz7AXGqhgwuG6LuO2ppsVfPkRogAF0qs
	teA78nAGqT3A6Mnvpn2L1Vi5+dMcbxGxIRFuxgA8XYVrpaz1xJWuV/iq2SDPmVV6
	C+S0mwIm4TDkB9w1JN37iGab9CnxKBWPj4751NQInmYywNFaI1vbGHIncSpzK/j/
	eYvidG577BFTxstS7g8+tlluHQYt2Zg861ooeyj96LwEIvZ/Mp/EcEdWsnTmcehl
	iLmph5So5cS8Dkhaz/J6rJM/CyV2lF+K3AUt2ZylQ4hxKBTTniYTU2Jige4xXT3p
	6YegDpoRZ7Gt9QGWSVIyUg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023131.outbound.protection.outlook.com [40.93.201.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwrn4y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 03:40:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEA4RV1DNcz0+VKty0zumjmLP8Z1FhdhVFFQH6mVSdxhMAyHs03rbNtOFBZJ+n2RvSqVcDy8YrZvDbSjmZAIExHnF+WeGZTwv8tOBhOWXVueAxjcaHBu1ONtlEcHtNjJEqudZ8/u8YUsqX1M4+4cs++bLS67eV+NRzH+yYUOtVh1qg2aIHvmbCQGj4V8MwvLHVovshk13MTDzHznCo14RtWNRqYpVmcFFapdlwXpbY5UYlxXqt2yTpIaxu05DUnU+PykdYQg5rNpr2ekwvuF79XR0dZdUs+k4Ba8rCTFGjM076QAgQTsjpRXeNqSY8U4j/3MjZqxnnm/cTz9LxcCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JneGbRM8kq5/ifKEunOS+7ibhgoBq4e5gbkVtDoZkmY=;
 b=TapnsX+/MvpY5Eycuv3XgOXSmyPIXuzRD3TXbLogtPRbt34L9qhPeC7N8T4RewAN4JEyDD8b/KGxOKY1+4LPNz6UaYFLq+HF/+vyZThlnSdnPoFwymtTQvspnNEdKLuZCHwtCEDPi+GdOVRgWJwNbDSKAeUIGYCqRn9N4c3UKPheFNx1S8F/AkUulyrYTKY05vImkz48PeQi3MZvF+sKGNMK3ZpzcXGFw/7jLMKKiG//4r7ZK6BbVwpTUh9FONB1u4xdgTT79RNh5/BoG/WU0SXgDePpGOcDQA1yhoQaEkj7DAApcyGHxUpu/QPXOC0O+laWluXpClbjw1kzDDzNcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JneGbRM8kq5/ifKEunOS+7ibhgoBq4e5gbkVtDoZkmY=;
 b=0SG2mcz10ULqj104E7XNHOG/VgBCs0ukgCtlGbD77eXZJoQZcG+a4FRCVcSbePO3EGIohrHF9kW076P0435IgLm3Uzp87BV4OIZ/jBv+lNkB+3wEZwgoXbDplul5acpiSJJDSogAFhgl/pFamTOiBO92XxGU12OkMpuKzaCyn3U=
Received: from SJ0PR03CA0183.namprd03.prod.outlook.com (2603:10b6:a03:2ef::8)
 by CO1PR19MB4983.namprd19.prod.outlook.com (2603:10b6:303:d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 09:40:53 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a) by SJ0PR03CA0183.outlook.office365.com
 (2603:10b6:a03:2ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Wed,
 26 Nov 2025 09:40:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.0
 via Frontend Transport; Wed, 26 Nov 2025 09:40:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C84C1406541;
	Wed, 26 Nov 2025 09:40:50 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8765E82024D;
	Wed, 26 Nov 2025 09:40:50 +0000 (UTC)
Message-ID: <ae1ca8a2-c57a-489b-88c9-fc2a40444ede@opensource.cirrus.com>
Date: Wed, 26 Nov 2025 09:40:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: cs_dsp: Store control length as 32-bit
To: david laight <david.laight@runbox.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20251124171536.78962-1-rf@opensource.cirrus.com>
 <20251125185530.22d9dbb9@pumpkin>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20251125185530.22d9dbb9@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CO1PR19MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 00249895-3931-4358-07cd-08de2ccfe3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnBJN3FES3h5dTRzSHVjK01kNmlsckk5TVdaYkN4L1ZqakV0Mk5iTmFvTlNV?=
 =?utf-8?B?NVBSQUllK2tydmV1TVZoVHU5eWNGSFBsS1FxVFBKS2F5dG5kMjJlWWNZN05j?=
 =?utf-8?B?YkFwRGdiaVZEdFJod0xFaENkRzg0ZlUwMS80SmNjc2NFb0syM0NmanpIaTdY?=
 =?utf-8?B?VXlMbXF1SG0wdEJ4a3N6NHBYWlpQdzNob1FXemU1akRrU2JKSXNhRU9UeEhI?=
 =?utf-8?B?SDZHYzZBNlNJOXRUMVRFWTBjTms0MldGRW1SSTJoVXp0VFJkVEdlODBpQWZG?=
 =?utf-8?B?Um1lbzU1bUt3UjJodVlwbElVN1N0UDBCNTNWaURPQmZXVmFIanJhQ1ZYTzN2?=
 =?utf-8?B?RE8wY0RaNnRZejVNWGowRUdOVURnMkQ5aUNWa1podDB1REQ1bnZ1Z01qMHA3?=
 =?utf-8?B?Y1NKV0R1ekJ1Y3JmREJ1dmJrRndTU1l1aXNSa2RPcjlRQWVkakVMUFdmbGww?=
 =?utf-8?B?N2t5YlVJVkc1ZXM2QlMzYjN4Y0xNWk9nNi9MU01KTGFjNzBrRkhFKy96MndU?=
 =?utf-8?B?QmltbEZ4QkF2d0VQRGpDdmxhY0FLSEhGeHF5dmN5VzF4SHZ0cHN1Yzk3NFo0?=
 =?utf-8?B?TkNkdnNnRkdWQlIrQnZpcVZMc0NpNzZ4TnF5WTdWZzVlT2IrRDFBUzM0c1I0?=
 =?utf-8?B?bEFBRVQ3cFFuZEpWYjlER1RJQThCZzdqZzF4bXdhKzVwOE9Jc0ZERUpqWDUw?=
 =?utf-8?B?UVlsRXA4UmxlVndWVTZiRHpxQ2NBY0ZCWGZEYld0N2EwN2JzM3E5akJKRzlL?=
 =?utf-8?B?VFlXY1FPUzNLa00yVVZvN1V6MjVtTWxXdkhaYXR6dFFiSTl0WDQ1ZFU3NEhi?=
 =?utf-8?B?MEtTck1xWENydDN1cHpKeWFFdW8zZ2MyRmcxL2tqNDJzVmVhRFZKd3BpOEhI?=
 =?utf-8?B?elZRRVhYcnpBZ0EycVVRa2M3VDZGYjZtcEdweGNBbE5YYWlqZ1VPQnluSUFy?=
 =?utf-8?B?dCtQQnloRzFSV1ZMY25JQkNHdHVaR0J4U1NyREl2ZURtTEJ5WlhrRmhJVWp1?=
 =?utf-8?B?RW92OXhFVHY3MWZYWWdlTnZ5a1ZpZkhSdmZqamhBam1jQ2FDQlkyU3pSN1RJ?=
 =?utf-8?B?RFdZdjdsVTJQWEprZUFRMTdNTTRKd2tITEJOejB0UThHV0FiVlo2NFA2Z2hw?=
 =?utf-8?B?VEIybVB2Wk9pZjQ5cllsd2IvWWhONktiUG5EMjdOQ3p4ZmdWTTEwaEVlK1JH?=
 =?utf-8?B?ekNhSmFrRDZlcjRPeDdqV2prcGpFY3JuL09tMUZRemtPZkw0dlEvU0tNOTd2?=
 =?utf-8?B?c2ZyMncrTU1jVlVGQkRGaXU3bWp5OGJmamVpMm5oRGdXWEJjZ1hWQWlkT0Yz?=
 =?utf-8?B?b1lMb1RRV1hxL0ZtaWg1S1RtcFhpZDd5MjNiUnRZT0JEelU1bEgxUlZUMWpt?=
 =?utf-8?B?ckE0Q1dJbkFmWEkwNTc1K2xZQ051ajFaaGsxTnAvdGxzMDQzQ2lNamYrdVNU?=
 =?utf-8?B?eWxUOEhtcmM3dlpoaDJGWVJWRDBVek1XWjh5SndWYjR3bEEvNFQ3eHMxQWxR?=
 =?utf-8?B?bFBic3VzWlNiUDZSbkEzYTJHMTRuTzRpRkF1OWZyZmJEMkNyanBiRU1MUTU4?=
 =?utf-8?B?OHBUcC9oRHQ4R2pXYTJsSVZuMWludjg1dEZhQjhhS1JtSXMzK2RENDJCUmJW?=
 =?utf-8?B?ZE1wRHUvRWduNWVscHBRSXA1QVpKUERXeFJwbDQvVEJwZkNEWmY1KzcyWDRH?=
 =?utf-8?B?VGtsamcyZVVqMjZ1U2RIK1QwRHBFejB4ZDRZWUtiRmdXN0x5bTQ2YTBRWXpE?=
 =?utf-8?B?UXV1U2IycnQ5TE9uVlBIRkFGSjNDbkdiWFdQV3YySFZ2Tmx6M1BPOGY2QjFz?=
 =?utf-8?B?Nmt1ZGdsV2JjYUdKNHFiTVNNNTB1SDdxMHNSQzB1MWFVOHNnKzVsU1N6R3k1?=
 =?utf-8?B?UFZETTNKMXYydUlyVVhTVDZBNGk1R1RkMWJFQUc2dXNWYWFGNTVFOXhtcUtK?=
 =?utf-8?B?ZTRJdDdzNDNhQVdJS3hNVU02YUF0OTVIN2JUalN5cWRKT09kcG15ZzlpODBW?=
 =?utf-8?B?bkY2S2QydGhZWCt1bnlvLzZtOGNydU1UTnNuN2MvdjlFSEQzU0RFaktsdmd6?=
 =?utf-8?B?QzR5MzZtRWN6M1hvQlN2YURJWVJSb3VYelR3TUoxMk5vcEVEZU1iV3N4TFd4?=
 =?utf-8?Q?ipfI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:40:52.2419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00249895-3931-4358-07cd-08de2ccfe3db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4983
X-Proofpoint-ORIG-GUID: xDTlWeuu-yCnyhKjoTv85KVtLMck0EK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX1lo7ivVBfjmB
 aP+ShrZYs6Ip3YWRY+8f/SC8IuQnyZpKMLYfDRxqS1xE53zCPo1lxK7kOVnmguBzEsiHc//eeZP
 xvmNFYt6l4jk5agERqoXQWy1q7hGBRBT3so8QLj6t4mTpEKYbaqvCyi9IolSe+tuBsFHgh4mR38
 AdEb/IN5W5S3uCIcy/nHPiyl5POlqhJeltVDe3WwbRjk+9UxnaHGme2sTexGcySOf6I3JzgvYsY
 Llhk4igd+dOEGXNfH/+OmzmH62HcWxovvtKbMccyDk93uill9L4VPWKOgVba8439yod3ugKiVHZ
 k+gRbcMLzcUMg/Jq8JsSaZiSmCS1oBSF56nx+6tt8OAEjPiFIG2NqjLpMwMXOxU/HxDr3j8sHVx
 A5gDUmCgTjOP7BGtqEBZ5Nz7HFw8Lg==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=6926cb2a cx=c_pps
 a=toaxmG8YyEc+6C1DZWrQ+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=u_8rf9krvQ09IOvrV-cA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xDTlWeuu-yCnyhKjoTv85KVtLMck0EK0
X-Proofpoint-Spam-Reason: safe

On 25/11/25 18:55, david laight wrote:
> On Mon, 24 Nov 2025 17:15:35 +0000
> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
> 
>> The architectures supported by this driver have a maximum of 32-bits
>> of address, so we don't need more than 32-bits to store the length of
>> control data. Change the length in struct cs_dsp_coeff_ctl to an
>> unsigned int instead of a size_t. Also make a corresponding trivial
>> change to wm_adsp.c to prevent a compiler warning.
>>
>> Tested on x86_64 builds this saves at least 4 bytes per control
>> (another 4 bytes might be saved if the compiler was inserting padding
>> to align the size_t).
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   drivers/firmware/cirrus/cs_dsp.c       | 2 +-
>>   include/linux/firmware/cirrus/cs_dsp.h | 2 +-
>>   sound/soc/codecs/wm_adsp.c             | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
>> index 9acdcd75928a..36a5aefa16e7 100644
>> --- a/drivers/firmware/cirrus/cs_dsp.c
>> +++ b/drivers/firmware/cirrus/cs_dsp.c
>> @@ -477,7 +477,7 @@ static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
>>   
>>   	list_for_each_entry(ctl, &dsp->ctl_list, list) {
>>   		cs_dsp_coeff_base_reg(ctl, &reg, 0);
>> -		seq_printf(s, "%22.*s: %#8zx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
>> +		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
>>   			   ctl->subname_len, ctl->subname, ctl->len,
>>   			   cs_dsp_mem_region_name(ctl->alg_region.type),
>>   			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
>> diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
>> index 69959032f8f5..0ec1cdc5585d 100644
>> --- a/include/linux/firmware/cirrus/cs_dsp.h
>> +++ b/include/linux/firmware/cirrus/cs_dsp.h
>> @@ -102,7 +102,7 @@ struct cs_dsp_coeff_ctl {
>>   	const char *subname;
>>   	unsigned int subname_len;
>>   	unsigned int offset;
>> -	size_t len;
>> +	unsigned int len;
>>   	unsigned int type;
>>   	unsigned int flags;
>>   	unsigned int set:1;
>> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
>> index 172dcdd7dbca..17cec79245d4 100644
>> --- a/sound/soc/codecs/wm_adsp.c
>> +++ b/sound/soc/codecs/wm_adsp.c
>> @@ -1561,7 +1561,7 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
>>   
>>   	for (i = 0; i < 5; ++i) {
>>   		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1,
>> -					     min(cs_ctl->len, sizeof(coeff_v1)));
>> +					     min((size_t)cs_ctl->len, sizeof(coeff_v1)));
> 
> You don't (shouldn't) need that cast.
> min() won't object because both arguments are unsigned types.

When this code was written one of gcc/clang/sparse didn't agree with
you.
I built for multiple architectures so maybe some architecture version
of the compiler complains.

> The compiler will then 'promote' cs_ctl->len for the compares, but might use
> the 'as if' rule and do 32bit maths anyway.
> 
> Given that the called function starts:
> int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
> 			   unsigned int off, void *buf, size_t len)
> {
> ...
> 	if (len + off * sizeof(u32) > ctl->len)
> 		return -EINVAL;
> 
> Maybe you should be changing that 'len' to u32 as well?
> 
Why? What's wrong with taking a size_t for length arguments?
