Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159C2D8DD9;
	Tue, 23 Dec 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486872; cv=fail; b=V0ToEjpvGcxOmeH4LIKSSebrBKtTZsrI3eEOcr9r08KGA3pSIH2ocdH8jDY+3PhUSzE1b0KoMO+0gDIc4tadvhA6ELmRbgR/TWCu4Zq8HJmOWdEk+0sXrjl0yDt+5qNOnRprApcHRIAC7qrPXHG0201Sl/HHkB3Gf9gwYfd1Xt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486872; c=relaxed/simple;
	bh=++xI4gnmtOYokeMD2GIzNnwHoyAG3tUY2rM2nI7BJQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLB8WxA1ShJVe3HIG5l/4ZpHOSuqW9VQ8u9ev5Iaq4KvcaSUQk96oejHaC6hql24JJUXofhPqa9rLlvTYHgKIL+SDfTr9amUnkYZExpetXL2l9L9paB54Kzb48jNxuHfi/UiAwxsWi+oVQDbZivE7vcfdrVd880U+6k7tlleCBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TPLaEkvI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BbuWJ6nM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TPLaEkvI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BbuWJ6nM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8QB92709081;
	Tue, 23 Dec 2025 04:47:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ExGnOSZ5hXedDhWpeUPLYDtOXmwJKkSGHbdGyeZg3+o=; b=
	TPLaEkvIPMUdPb9evyIHV6IgKjqKIh0SDnnJyLeS4s9Xzi9JVf0PljfkJYxjX+oi
	zjzGTZ33zKE8EZQomp6DRq5vBxuySG5i9Ic3vU/IVRzKkOeaR17SvFnhhbXrUia9
	4SLy90LuulErh+Oy5Qu/1MhtoovaWxx7QpWkBCIDN/8Cld0GrA5Zg+2VKhXa0+l4
	DY3CBjz+2kM7brtv1JZIp9KIJu2p2FcWSqkfIXSjrksJysVRgT7MNUuUt5xPIAPU
	5J0Ec36V/pI2m5BHcA0w4vi8cYZxTI7jvhnU1cdls+HL6aefx7ksP7LSkgIUuXgW
	taagClNUz9Ky14LKBxAReQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021112.outbound.protection.outlook.com [52.101.52.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b5s3hu9yt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 04:47:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8bdRJl1vKVG0ACh4FweSUAETbYo4iO/5cc1deWhnCXfsjA2QnqLjuwU8VxW8wLVgY+1lIO2qlQiAhtZNkHlINwJS7Wz1g/5RgH5Eq3qjqI6qIxdk4+/ymvCKM9agAZArzTyhYMtfjx8K9TolqoU62zxZNDrPkxjSH8ofTo77VY7aOFLj39PVcz+j7fQEwFcViZgLyPba5WFrkJJN+Hi3qVicpo5q2GLSJnlRyt7uk9fUxUjUzikSykpL8fezjmg1GJFxo53aexAT7iNqFQWESf+oCauPH6tWzuwqSQEUiaXqhXxp3mkEi7qsUkhogB02ESudO0iRcOIIhNlhpwhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExGnOSZ5hXedDhWpeUPLYDtOXmwJKkSGHbdGyeZg3+o=;
 b=AKpbRWTy3Ir1nMQO1DH1VrgQyHvDeRiXxjMjTjkzRm5uzGomoegQ667WYnc3/7KgmAQi2ULiBT9Cj6D5uE8BqNK4MuzUlo103A7dIa4LvlGHKzbIHqQxnnBt0UuurJT7PxH/Qs/ZEE+zHVMcwdZ9oQh0mzVVIWVj/HH7PNM+HJ+7upv7T4CG7NwkCVZ/gylgyY2bwlnAhvccf+ul+ZlA/Q+4jRdTb/8OpRT437PyyQNS5Ss+F09ohIJy6WxP3trdO3YGzmMc9a6iDOD85VTBqtF07cBVbITc0EIGZLQEegCrhdK+NpuNOkLaFMA80OZ8l2b3cJqIrsNf1KpWElShRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExGnOSZ5hXedDhWpeUPLYDtOXmwJKkSGHbdGyeZg3+o=;
 b=BbuWJ6nMlLyCGCISpEVHOmn4tC8DEgzQRxIgFypra8npLoM76nSSAnJAX4o+uRm9LdUZmyIvS1Bff9MdXr8o3Cdn4oifkHgpAW9tmnr1/ADAXZGVDkn7KU7K/G06niuf/GpxzONSobAqDQvcJYoXUdNtbK401E2BfCMPpso/omY=
Received: from BYAPR02CA0035.namprd02.prod.outlook.com (2603:10b6:a02:ee::48)
 by DS0PR19MB7958.namprd19.prod.outlook.com (2603:10b6:8:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 10:47:34 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::31) by BYAPR02CA0035.outlook.office365.com
 (2603:10b6:a02:ee::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 10:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Tue, 23 Dec 2025 10:47:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6948C406540;
	Tue, 23 Dec 2025 10:47:32 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5278D820249;
	Tue, 23 Dec 2025 10:47:31 +0000 (UTC)
Message-ID: <028ae5fc-5ce1-4fbb-a09c-88700f2d77b1@opensource.cirrus.com>
Date: Tue, 23 Dec 2025 10:47:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soundwire: stream: Prepare ports in parallel to reduce
 stream start latency
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251125165609.483763-1-rf@opensource.cirrus.com>
 <4d811207-1c01-4302-85b1-9d4079ea1a4b@linux.dev>
 <795fd33c-7a0f-4600-87be-1690cb0c0ea3@opensource.cirrus.com>
 <5c80bead-716a-4528-b614-4b425184a484@linux.dev>
 <d86e401a-205d-42a3-b90d-239d669c6ee1@opensource.cirrus.com>
 <1e2035bc-5168-4ec8-83cb-eeff41bdaed6@linux.dev>
 <a1b2b617-448d-4457-891e-d2cc00858f50@opensource.cirrus.com>
 <319caf4d-a96d-4c25-b912-e00c76ad8038@linux.dev>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <319caf4d-a96d-4c25-b912-e00c76ad8038@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DS0PR19MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e84075-a094-4f45-691e-08de4210ae28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVFHb2tqVEcrdlJyNTQ5cUJwUWRvMVJSYlRjZlFCdnI2cnlUaVhtamxxb0Vs?=
 =?utf-8?B?YVNtelpjRFZZVFZzMXZtR094dGF2QW5JaStBMVJjQjdIZzllSW5mNmFJKzFh?=
 =?utf-8?B?UzJkUmZPT1JhM0FnMjA5M2Q3RWJkSFlMTHBCWlFURkNrcWw3dmV1a3MwYTYy?=
 =?utf-8?B?ck40em9Zd3JXcDYyb2NOdFZCVnYvU3dEU1gzWEpndVZxaS8xZk1CUG13ZktC?=
 =?utf-8?B?YlM1M0p1RWJQNE9ZQXRhTmpzT1lxQXFqWE5kc2ZGMzcrL2h0TTk5QlVwOGpE?=
 =?utf-8?B?dDh2ZWx5NVB2MFFjUXBhM0xHRGpXeFZIODNoZUpDUE83WnNhWlc0WFRMVGd3?=
 =?utf-8?B?R1hoMmZjVVE0TFg4VTl3OXo3S2tvaytyazRNVlZtWThyUDZuMFgxWS8wRGtw?=
 =?utf-8?B?SEpwZmNSYkt5NEFZekEzSHY3Skp1dE84RnMzT2JtRE5rQ3dvbVRWMGhZY3Qv?=
 =?utf-8?B?VCtwN2pUd2pNcG4ycFdaeVkyNmlLVXV1Z1lqSFJBSVN6RzdFNkIyNnMrUmZ5?=
 =?utf-8?B?MktEMW9zMFhRbjJvRzh5TlE2K1UwbTNGM1JJakt1Z0dLK3krc2xFM0ppMEN2?=
 =?utf-8?B?aHU0TXFGK3IzdDRNVDREcWUyNVNqOHZVdWhtQ3NUZ0tVQjdHT0ZiQTJLbkNo?=
 =?utf-8?B?bGJpYzhtNVluUUtRUi9TMWkxVG9VbXFFVUpQOVpKR3RjN29yTEN1YnF5OG5a?=
 =?utf-8?B?SWJTdTRCdno3Uys1TTFVczBGYnpDbytWZWhiYUo5N2E1MG50dFRhS2lTZm5D?=
 =?utf-8?B?K0xzMDVTVjZ5NG9Nd1lRQnNNNjhIV29wMDQ4QlFDbXlZRXNYM0d3cGNJSXlE?=
 =?utf-8?B?RE91V3V5d2FOWnMwMkJ5cEtaUmVmVW9kaEtjTjU5S3BIWXYvL1JERTVXMXUz?=
 =?utf-8?B?WVBqMWluNkFDWGcwRDhMVjdFUThxN0VDQm9EUFg5Vy9BNmxHRXRiTXVNMVhx?=
 =?utf-8?B?VHFNRXIzSG01Y1VTZkhoUWM5RjEwZFh2OGJoZzBhWUYyWEczOXVIRFdFMGlD?=
 =?utf-8?B?eDYxMG5HYlVDeEd0Y1JIMnNiajBQT3IvMnZjNTR0M1NlMG4zczJ0eCtUajFJ?=
 =?utf-8?B?V1dWcGtNRjUwRDhqKzNkczVxOVp3Qy92cGw0bDdhN056QStQNTJkM2tzWWRh?=
 =?utf-8?B?Yi82UHlPWFpra05CN1MxUDhRZEVOVjFTQ1orZ00zcEJhOHErRGRYVSttbTVE?=
 =?utf-8?B?QTZmL3VBSzVqZ01jcmNuWXprWEZkbHVSV2J2dzdMSWp6SG5DQVlZRktxbXI4?=
 =?utf-8?B?R3pubkJ4R1JMdi9jYkFaeTJGZDJvUjNkcTZ4d2dpSnI3UGVXbkdra25ZZVdN?=
 =?utf-8?B?V2VON2xsTStqOFBWck9QVkpvOUQ0VkJjTWlFMGRBaDhWTFQwVTBQVU9lSkM5?=
 =?utf-8?B?MzlUdXZLVlF3aDJXWUVLemtvbFBTRzJWUzY3cjdGSkc0RDZiL0dzM3h0MmVM?=
 =?utf-8?B?bC9TVzBuVy8ybnNQWmZQZkJuUVZ3elh6WUE4WjB0cDBRVEZYMFFRdmVwWENy?=
 =?utf-8?B?YmJoa2d4dThWN3g5QW1iek51MlZjZGFoYmVNVDVaVXNyOUYrWjFST1J6b09w?=
 =?utf-8?B?OWN6UDAyZklJMHJKOGozMUxLU2k4dk1YVnliU1NQbk5UNjhVcE53cDhRNVdv?=
 =?utf-8?B?V1FZdGRPaHZGZUVwdUxjbStDSXBndWM0NytsV2hsYWt2L0xGR1N0QUt4cTNP?=
 =?utf-8?B?S2RKekdvWnRPR3hjSjcvSFNsRnA2Yit0d09PdS9XSFgwb3l2QzM4c3Y5STNP?=
 =?utf-8?B?VmlGTVhiKzN6LzlEMUVISkZPMmt3amJRWWFOS2VRMi9uSFJhcG5QY0dxRFN6?=
 =?utf-8?B?cm9SR0N3bEZBWm95OCtFSXpyc3RXeUprTE43WVRBVzRpbEZIWGtjc2xyLzBh?=
 =?utf-8?B?cmkwd2JGY1orUkZ0RCticjlNK2ErZ0RNMnBDMk4yMTl0bXN0bGdFdjRna3lM?=
 =?utf-8?B?RHZ5UlZjdmYwa0RieFBZbVpuemE4UUc5dmxRWmRhM2VKc3lWdmRaVGN0WDdn?=
 =?utf-8?B?R0xMNGx4UTU3WnZJQ1VhUitSTytsUmpFV0c4am1maFo5SERHM01PNSt1dzRR?=
 =?utf-8?B?MHdZTlk3QmRsYTVCZW44RVRhaWtEcU9LSHl6V3MwTC9UWVRBS1BuQ3N1dHZ0?=
 =?utf-8?Q?vSg8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 10:47:33.8724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e84075-a094-4f45-691e-08de4210ae28
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7958
X-Proofpoint-ORIG-GUID: OmhdUnPs-PgChI8yLqoX6YkEAfJdoWZi
X-Proofpoint-GUID: OmhdUnPs-PgChI8yLqoX6YkEAfJdoWZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfXyCBk9mFcMUNu
 rd1dhf4SHnN0oR3ZsBBJcRGpNktRD9arTqjhW8JC8u68SUTeWN6KG+fuoWQ9J3JNOG5zfABEtWu
 zBpvhXA7LHo3S/es06xoiIZHlKWrfEmk8lnun5/1MxQYBjOr6vTIL1MbhW12cT99n1G0ueLWKjj
 qrUa1zNOJ9zzfsGtADRHhHaWqzLLGI5jyqzUTvg+28SRFsH1CdpRNHxlWlI8H4ORh8ioDYwO9II
 hAsJ2EQSRjTSt0aM7Hg1HznUu4r+exTl/Q+M9ohKjSLXbBB2ETfjH6COtqT5x1adJU1I60i6jlW
 loeu1Y41aZ1IUUpGRCIC8H4SOvmBO0y7dIorxyaSVUnLPDkdIWntsFABhCReoeNjTodjQYvXbpJ
 JuZ+p1F8V0JVyww6erGMd9hAmEsXkaeiO0ZpF/JM6rGn2YOvy7brT1pe0DIKpjyTnKH9L9jyWge
 h8uRzcCr377ucI7Sg3Q==
X-Authority-Analysis: v=2.4 cv=XeuEDY55 c=1 sm=1 tr=0 ts=694a734a cx=c_pps
 a=mSR/hpqHDdeL9wXJcf1Q7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=rjQVpgkvKd7ZSD1cD7IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 23/12/25 10:29, Pierre-Louis Bossart wrote:
<SNIP>

>>> I can see how preparing all ports in parallel would reduce the total time compared to a serial approach, even with a timeout, but if we end-up always timing out even in the case where there is a single device it'd be quite odd.
>>
>> Yes, but that's a separate problem that needs fixing. The current code
>> in the kernel does the timeout for every amp. So if you have 4 amps with
>> a timeout of 10ms it takes >40ms to do the port prepare.
> 
> so is this fair to say that by not testing the return value of wait_for_completion_timeout(), we never detected the 'always-timeout' behavior since the initial contribution circa 2018, even with a single device per link?
> 
> Wow, that'd be a big 7-year old conceptual miss...

It's just  a design flaw in the code. It wasn't found because it was
tested against Realtek codecs, which use the simplified CP_SM so the
code can skip the Prepare stage.

The original code checked for timeout and then always failed, because it
always timed out. So none of the Cirrus amps and codecs worked. I sent
the "temporary" workaround of reading the status register after the
wait_for_completion() and ignoring the timeout if the device is now
reporting prepared, until I could fix it properly. I've only just got
around to looking at this again.

>>> In other words does this patch reduce the start latency only in the case of multiple devices, but adds a 'tax' for all other cases?
>>
>> This only affects peripherals that use the full CP_SM (not simplified).
>>
>> If you have only 1 peripheral there is either no change or a possibility
>> of skipping the wait. Before this change it would always wait the full
>> timeout before noticing that it is ready.
>>
>> After this change, you might be able to skip the wait. If it prepared
>> immediately, so that it is already reporting prepared when the first
>> read tests for that, it will skip the wait.
>> (BTW I see that happening with CS35L56. It prepares so fast that it
>> is already done, without waiting for any of the timeouts.)
>>
>> If it isn't ready that early, you get the timeout as before.
>>
>> It isn't adding any penalty to single devices, unless you count the
>> trivial time it takes to do the register read, which is negligible
>> compared to getting deadlocked in the wait_for_completion_timeout().
> 
> ok, now I get the point that the use of sdw_acquire_bus_lock() in sdw_prepare_stream() prevents the use of device-initiated interrupts.
> 
> One possible change is a departure from the use of the PORT_READY alert. This was meant to be a worst-case scenario for cases where the prepare time is in hundreds of ms - IIRC we thought devices would need to adjust their internal clock to that of the bus, which might change during a prepare operation. But as you mentioned it in practice devices are prepared much faster. So we could have a typical loop with multiple read/sleep instead. See for example cdns_clear_bit() as an example of what I have in mind, classic kernel code really.
> 
> That might speed-up the prepare time even for the single device case - and then that may be enough to avoid the deferred check on PORT_READY and make the code simpler for multiple devices as well.
>

I've got an experimental patch to replace the
wait_for_completion_timeout() with a polling loop. It's a brute-force
approach but reduces the overhead without the scary rewrite of the bus
locking.

> At any rate you're onto something, thanks for submitting this and bearing with my questions.

I need to send a new version of this patch anyway because it will
need rebasing onto 
https://lore.kernel.org/linux-sound/20251219173830.407-1-niranjan.hy@ti.com/T/#u
That one is fixing a problem so makes sense to take it first.

I'll improve the commenting in V2 to explain better what the code
is doing.
