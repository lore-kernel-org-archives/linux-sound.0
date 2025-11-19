Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBF2C15AE
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564661; cv=fail; b=X3YCXExUo1JZ88R5+rOct9jAqcmcuL21RwTj5jGh2ioV1iMqzGgWa4ZqwrBgCpSTYFwqGqSkQ7AVjUuKJO7LKZCqdY5mNXnKu++1F4Urzt5EeOiVsxAd9yrmi1+vBkm4p6E37GgwB0pcio3cypDucRAAxJD3vU75ctmq0Dl/rMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564661; c=relaxed/simple;
	bh=QGM3flD1JfKWhcem56X30vFfJs+b/y9s2xdewv7SxDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aI82uHaQQ5HzdcP1JcPDcF0b6Lf4Y/Pk745TgOsY/VV2yJVuban7kCU8yIuAIDrbMlshf1aogppgjgj+xtAZ8leVuk7onvfUyvg3dJPqmsPTMoc30XReUJUMnnSL/QqrELcfOWv7S4IvriWggC7hG//HalpBVOJfCJa+mAteeF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ic712owZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WUfvNA9A; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ic712owZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WUfvNA9A"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5EvgG2286143;
	Wed, 19 Nov 2025 09:02:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=36xbNxeby2nm3pNAJ4Hh4ymkTml5OVunB999QW/gThQ=; b=
	ic712owZJJs6S8qI0cs1rsHhmwF0RI7tW8T5d3HtMV76GQK+A23qtVpL8HAXlELJ
	YUqs6gMctnSn9mdd8wsjIbNR8JQajuZFGWCc0qOBcizeZD7+y0pZ+sSFUbH9hzRV
	wrb71VHuLM8SRP/V+hrMDuWod7YL1z0AXER7Um8WxJCmSiU1gZz2+2Uoe5unRyhW
	4xXBbIRW1ZpEsxwTigz4el/52Juk5YNegUp/4HUjMfGa3NgFXSsVWHYQWSa2LZqy
	F1dI/ux04/X+4TVhCgMij6c2cfKwlQPRYPnpUAvqLjHJOOc3WtDzj7DgbfIT5fhe
	MTxYCPG8CM/WhBjCM/t1Aw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021133.outbound.protection.outlook.com [52.101.62.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1d3d4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 09:02:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJD1XCuCmMwurx7rnU2VyE4bahJX97palI8Imy37aIkx/2WbzX5Q24DAiDgfcuRQDEZ55XVYFaaQezA9dZQ78FxuRiaKs3WgYGJKazujO8p5epR7LAIQbK3x/xU+Xu9hrxIseszcdzIY85K2CeDO8ImRK+sIFSZj0T4HQsNxErL5Vv4LbjLG+SJ5ODf7BLuStKrQPxBgbTwL9Ow/bIPTQzyR3Kh2+nmrW6MYbWFGvlZWCwXvNlziYixq88YhVEmVWQPawT6mp/Q+MFwDRN/4HJNC2L/kB/nlgMNPJiThSCOOcGBUn5U/Ne/VJr9ll7IHCLg8J5yfRg2RB1aEJluiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36xbNxeby2nm3pNAJ4Hh4ymkTml5OVunB999QW/gThQ=;
 b=pp0fju+FhjKxoDt0b+rl9rSWS6gr71qXnTwWlynEmxnBigDYQSHEDTDgFg1FAZrJHcJBgGWENQLuz7b9EqaLpNu1BeWGNSB6coWOCsb0N/SZtOircFQlJlJNqooKsa+HK4Gdlu3J8Ul253+jmBl3ESz5wji6jXdtvTetR/0fOaqrzSfsf/BS51bg0iI8ghOp9jwhHvXKR3oWMrX1bSvIyV6DKkCCJnXWaFT3ttwcG8V7swg0NoB2LZi2KeikTEQuWhyJi8C6f676NHGAWdJLzXArwlo6Kg3EN/n6B449m0UZnxt4drAcUxlODHTraAEWg+4RHJ6jYCVxk7KqFkQ/Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36xbNxeby2nm3pNAJ4Hh4ymkTml5OVunB999QW/gThQ=;
 b=WUfvNA9A0x2WgEF/1nWzkGdkwUtugrXpkaLR2EZ/eiBqjUddo6UoHGOGdb17A9N0Ar+Aj8U69An6Ew0STiLe3lajP/yM9nEpC0ryCv2QWwvKg1Qs15sxFwjU7Z1dALzn7KBbPJ1GQup5sgpxEwz0PmBxJ5Yh13YAeBzlf4xKFPE=
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by DM6PR19MB4105.namprd19.prod.outlook.com (2603:10b6:5:244::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 15:02:43 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::24) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 15:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Wed, 19 Nov 2025 15:02:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DA9E3406547;
	Wed, 19 Nov 2025 15:02:39 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CEF8A820247;
	Wed, 19 Nov 2025 15:02:39 +0000 (UTC)
Message-ID: <72e34fff-66f7-4a91-9456-f43572c672d6@opensource.cirrus.com>
Date: Wed, 19 Nov 2025 15:02:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] Add SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM6PR19MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b52b2f-6033-4783-33ad-08de277cb064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzhtNVh1K2svTTNzTjNEa1NpK2FvQ1BmMTlxZFE3T01kcGpzWVBPOWFpOU0w?=
 =?utf-8?B?d0ZWdmN0MzlVOXc0ZWtKTzhRbXk0STBnVHBvMDFJUTJZSXZPKy83b3kwNXpQ?=
 =?utf-8?B?V2JTY2NYWmlzc2xXM1JtdEZMQ1N1Yk4zUW8xQUpDbUcyZHRhMEc2UjdEcyto?=
 =?utf-8?B?aFgweDhCNUw5RkNJNWs5VGNuRCsxMEU2bWJyQUVyWkgwUWtmU1VVRTRyRkVs?=
 =?utf-8?B?L1g0OXVwV3lPbWRvRkhhMVdpbTZCNlhzWUpuQ1lPY2w3MHoxL3JGa1RNNXZr?=
 =?utf-8?B?U0U3RG52a3huZXVPbk94NWxISVFOQzJRUm1pODNKRDFvR0x5bXFaaWd4NjFk?=
 =?utf-8?B?Snc3dGZVWURQVXBhL1lEQUl0QUdBcmsvNENja09nYzV4a3Q3YTJabGVrR25t?=
 =?utf-8?B?WHM1WUtlMTNJbW5RTU92OUt5TzZ0OWJ6RVVCZW9zTDRvd0VxWFNOY2VrUUNO?=
 =?utf-8?B?bUVmalUvc2hpZkdyQ08wVFFUV3F6b3VTZlNHMlF6eFV1V1lhNUJCU29ZMnNJ?=
 =?utf-8?B?TVFLUGs2T2JvUlIzRmdBTENENmM4SnB2d3JycXA3WlBqMnBpS3VGd0VKRmly?=
 =?utf-8?B?MU1MRWppOWlFQ2tzZlVtMG1NaDFnVjk5SnRaRml3L2I1TmxnR2tsTUx1Z0E4?=
 =?utf-8?B?UGxza3hNN1hXZ0FVOXhlYjlMU01XSVRNUzVnVGswY0RrQ1o4ZmRqdzRPbkY3?=
 =?utf-8?B?dWw0aVg0Q2FTalBUcWhlUDMySFkzazBZRmg3b3kzcmNCb2RsRXEwY01IQi81?=
 =?utf-8?B?SGlVNm5PY1YwdkNWeGxrZlZYeXp3cCtQeEgvUGZadGZTejZUTEJtbCtENFZT?=
 =?utf-8?B?cnN2ZnBvUnp4TGxUV1V4TVQyaXMrVTNvdVhtYTZ3UDNpWitYRDUzWkNyZGQ3?=
 =?utf-8?B?cjVNd0g4UVF2ZUpBZDhMSDhKMzdGYmt4RXpZQmZCRUlzdGJ1bFhpQ3ZnU1dI?=
 =?utf-8?B?MVBYR05rb2hPbmFCWXFZaFp5N3B3ZFV3THV0d1hpNnRoNzM2bnp2alpkNVFs?=
 =?utf-8?B?d1VvYVVQMGpEUktrT0FFcWlDL05CbUNINjREZE9FV2tiaTNIb1ZuMHdVaVFD?=
 =?utf-8?B?SzZVdUx5RG9RQ2ppOU5HaHpLcjREamdDaU1OUWZHL3NhTW13ZlhRRXVEZzBG?=
 =?utf-8?B?VGZIS0dZTkNZbHpjQTZCSU1TMGdlUnVpRzhGQ2VjVTJ3b2NGY2tvZTNidnkw?=
 =?utf-8?B?bk1ETk9HSk9IQkNpN2ptWXFyM1JxYktJdTZ1Tk9aZmdOTjd4T2VaL2ZTS3hh?=
 =?utf-8?B?Wnk0dk54RnZqMXZ3djJ6ZWVpMmEzaTU5aWI2eW8zTll6WW9wNWtyZWNuOVVO?=
 =?utf-8?B?YWhlYW9zdnowNEY3a2dlSEsvUXVDSmxsNzh4TDRMU0pjbE5DRkNOenoydDRW?=
 =?utf-8?B?cHU0L0hBMHZGd3NwaHFFaVlCVFIxWnRKRFpZWTdoR3Y3UC9EZ21mNVRWcTRJ?=
 =?utf-8?B?UW1SNDdHdDhIU1lNbFZrNWI4REQ3TVJQNGhEL0tpeXdtUmY3ak5ZL3FkZG42?=
 =?utf-8?B?bTJ3elFQUklHekhPMlhJZlFUaE9vc08rbmlwaTB4Qk9zTUx5azVIVEFHbFdt?=
 =?utf-8?B?U0s4RVBhblBHY281TlZmY2had1oxS3VYeVRqUmdyRUl5MGpMVllTVDNpelZF?=
 =?utf-8?B?bFovdGJ5QkVYaXFQZExrYzhvZG9wNk9ZMkF2T21oSDl2VGVkcy9YZUdiU1d5?=
 =?utf-8?B?b0tnMlB1bTQwaVFnTjZsWlY4SEJ3ZTR6S2ZSU2o4SHZKTDR0VllCdlJYMWZi?=
 =?utf-8?B?SXJWSWRnRGgwSVBZWnRoNGR2TEthUkRrc2FqMXRsSnA0M2c0eDBobkFlcVBW?=
 =?utf-8?B?cmRZU3hHdHpBY1gzYm1nWmF3VkFhYlk4ZGl0cnJYT09KQXFqalFGVXN3YzY2?=
 =?utf-8?B?Nis0VG1Raldtc2lRYm9vejdkRzI1WnFadnlMVUg3TFJMMXFXOFdPS0ZFKzhY?=
 =?utf-8?B?RkJLTzN6ZFBaMmZLaDJWb2tvbjUzQksxS1IrQ3pWVVBiZ1NDZ2R2cUphc1h0?=
 =?utf-8?B?eGQwQmx5OUI1QTFRa3RHaXVoYWE5NlVnZ2YrQkRYNWFXMzJvOW5YL1ZRNHc1?=
 =?utf-8?B?L3lzVm1nbHlLRVVVczRac2lPTE8xajRITFJVbHlRdDNOSnVtbk5hWjBXbmJG?=
 =?utf-8?Q?tZLs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 15:02:41.8569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b52b2f-6033-4783-33ad-08de277cb064
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4105
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691ddc15 cx=c_pps
 a=0TjXLQglyxsLlDBGQ9rQow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=FsxtZ_v3I9zWtPCfRlsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qGtXsKaklZo2aHWP5RCaiciG5wuZyQqy
X-Proofpoint-ORIG-GUID: qGtXsKaklZo2aHWP5RCaiciG5wuZyQqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyMCBTYWx0ZWRfX9Ssir3cefCXc
 eN4tAJMlDzHzQ4RrkQ01aEqc4mQZO9Gvxi3TamcyJ9YKKaICu1DgnEHfSOAgktnul+AsEUFcuUd
 sUtnRuXqkh3ziuNCuRNf6omvgQS2XQI5RFmWBn6v2u983+UIZLtUKe1Sf/QLCDzzdgl3SuGpVGE
 rYsbLfpSs0/x7MyBwtdRJoHNBSEsOsWllwwddgWSyXNwD+uTkqoWtwhFE8+PFY9No3uxSYgzkbK
 RJ9gOrM0OJU9RArxQ57TZy903wwyvIWBFuOb7pdLKZyGeXgjvh1TEKBylQoQ0SXxEqVWvwBa3RU
 YMmjm0mlF08Y/t1+oMhI4lW+G0ha6Gx8+ruEw3TGLuFSpHXivvwvZ8QDUzrs7IDGwUwiW+Xl2H0
 Q7lSxboxfDctts+WBesf7pcVsKWtig==
X-Proofpoint-Spam-Reason: safe

On 06/11/2025 11:44 am, Charles Keepax wrote:
> This series adds an initial SDCA class driver, this consists of a
> primary driver attached to the SoundWire device, and auxiliary drivers
> representing each of the functions of the SDCA device. These drivers all
> use the APIs added over the past series's to provide the class
> functionality, as such these final drivers themselves are quite thin.
> 
> Also a few fix ups at the start of the series that have gathered up
> whilst the last SDCA series was in review.
> 
> Thanks,
> Charles

Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>

