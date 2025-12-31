Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274F1C84A2;
	Wed, 31 Dec 2025 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201947; cv=fail; b=DBa5GzBTYQAa1HdZ9YJ5Gh35IPvGubALc0Aua7K75TWqX09tMt6mYLA2oy13wAMblS7Z/HJTXxSJdn6hFCz/sUxWb8sITELMEIhKvGrICan4p+I3o5Zeyf9os2E4VgLidyj50D02nam5Iubh/ZxhGQeGfQnSXqJ8JZCu1rZ0Di0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201947; c=relaxed/simple;
	bh=gXbSqsCfZ+xE4iefEaEd8/ICZAOqyuBGWRcWUhG8avc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CsLNiH1YkgPafQElOSaVrkzGtUy1pDft4LjkCUWo8bj/iBMMoywwMmU1QaN5Oaikhn1FUtTbDkc04+TNUfKruGTQkSqicRsvvn5oWiWRXycsUKcZVi+CtxbfnWtrnPJ8QAvf4swC8yM3SAkhoW+m69aNM2IqBQeptj/JbHPMvLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lvnv+aCL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xgpU35P4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lvnv+aCL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xgpU35P4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGglik115042;
	Wed, 31 Dec 2025 11:25:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DQUjbmrkpT0M64QxY4BxkYuW69y2ucn5nmLVjX/PMNg=; b=
	Lvnv+aCLHEQnFM/wCvAGt6gt6mP0v1m94t/ms9jB6Q8V8M8GrvaVdI3zaEqOPY+7
	IrSzmB0iCiFj2RNwqV4yAJtC6w3d7I659ZDs6GJQGGHLUxFHK1fjjHDwz19LJFBY
	MBN8sj93Uz8c/+7TqNr2n23bszJDgwnIBwW6APKZjR83hR4C1eK8RW25j8S4oEhs
	A7Iyd9pY02AuRvsA7kJ00lP8f0Prc+aSBrwSwKZofa8BpX87laAdtjzv5tnmuNvi
	KFTdZuWK2GNHPubaNjobKbT9uhJiXoXJwJg0Ycyi4KJIEBi1OMf5UjIgkeNltr2N
	tOS6D0UBpWDrEYlk11rWAQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022114.outbound.protection.outlook.com [40.107.209.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmvcrh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:25:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9lZTq13d3NEB14lrBQxlr5nGkKeu1Y4AX1m1fs2OVT28EGNtEnUZNWhgW+2ir2elREG7V4k2sk7B9+o/9pLzd0i2B1h68x1eyh22cdrxW6AcYaUZ+89LqBjRA1/khqS62BH8IyTQ8NsdM2T4dVJbO/VS+6qgEb5S7Zwj01BO6GmFJzGHOiYTnWd5OtIFjjw17+K8JdIhWeZBrUItV3cC63wh3089iAaTXGnGDEtqfXl1CsYHd+2ie/EfNriG7IpBJyVS/X1IbtCRfsG8TyB4osTNipkgPlpm0QbHlNlGhwVnhihGWVgDJLYKvVEU30gBojXSe2gHRCN41dpjcnB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQUjbmrkpT0M64QxY4BxkYuW69y2ucn5nmLVjX/PMNg=;
 b=XBLY7jKxeiPWrvQ1HU3tDyodnu9hIetjOOEwe30biZkrMKUC+TwTykHVRL/XyNEHc+S9vDUYskbXKwSS9z/3eXHmClZihYQNgFM0sRZaadU8Z/Ei1NfOnMSxK3cIZ7qJEHiLiHjcE7AV//zSr0ED3ILdJMhCHu/m2TcEmUEu7NhrVXEI8nG1NGO4YJo6ro2RL3qM4QcpvmLVTNhyCsmHeSHeNrwi/KgsNXM8XXUYiYe5704FwoEKqLlvH/KF6ZwMXJeymn6h+yJSHDgv0eGWWMRzyoDTN6VykBSLzOJjMopiLhQIlemRAkGvt8coyunl9aOl89P2YeK8i1pToiJIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQUjbmrkpT0M64QxY4BxkYuW69y2ucn5nmLVjX/PMNg=;
 b=xgpU35P4hXJFrg/SPzCRkLrYgiDyUNsk+tKospMtmXo0WszXVLLEOWwRKXcLgeQ/Hg4XFaJbYUAS92N4+t1G5x3kHcz0UrDvFFLpATKkna/H27jUETNoEYINzMmNDUlNnzxdD0JmoCPeWXt2qZbbDvPqre5MYmbKwR/RbBvlQUg=
Received: from SJ0PR13CA0128.namprd13.prod.outlook.com (2603:10b6:a03:2c6::13)
 by BY3PR19MB5204.namprd19.prod.outlook.com (2603:10b6:a03:368::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:25:38 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::1c) by SJ0PR13CA0128.outlook.office365.com
 (2603:10b6:a03:2c6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:25:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 701D9406541;
	Wed, 31 Dec 2025 17:25:35 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 21A28820249;
	Wed, 31 Dec 2025 17:25:35 +0000 (UTC)
Message-ID: <6cb123b2-9077-4790-a76e-cf1b3de95a42@opensource.cirrus.com>
Date: Wed, 31 Dec 2025 17:25:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] firmware: cirrus: test_bin: Add tests for offsets >
 0xffff
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251231104956.449696-1-rf@opensource.cirrus.com>
 <20251231104956.449696-9-rf@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20251231104956.449696-9-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|BY3PR19MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6776752c-878d-4deb-3c1c-08de48919d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUlINDFZRkt5aGI1bHVPb1VQWVVLckRCMWl2VzFJT0FMV1JEelY5MWhtYnBF?=
 =?utf-8?B?Wi9xWFV3TVcvekpuK0g4L09XaERCL3h6YSs4WGdBaDdEMlptLzhxOXA4d1pM?=
 =?utf-8?B?OVNjRm8zbCtDbWJ5T2RkcklWeDFYWFNrY09GL1ZMVDNJVm9FRW9iOUtsQWdz?=
 =?utf-8?B?U1RyWjRsTWtQUnRMWnM2dkF5VUlLM1ZpdHNnSC8xbDBMdlVJZXJSZzV5NHNG?=
 =?utf-8?B?QnNTUjZxbGQ4R01MZC90Rk96ejY0OW4vTTEvL21IU2JHUGZvZEl2WVg5aWp6?=
 =?utf-8?B?YzZRNy9UellMZ0ErN0JmMnRLcEdZWkVYODBma0VTeTlVWDQ4cmNpTUV3ZG1Z?=
 =?utf-8?B?VWNGZCtTdVVrU2dzeTlMVTFIeE9BOXNSM3F2WSt2NWd5aVVYaGs2a2hQWWZw?=
 =?utf-8?B?WUIyaWVjM3pzNkROMStnZ0JQa2kwaHNBd0ljcUN3MWhkUjFXeityZ0RJSWx0?=
 =?utf-8?B?MVJOa2JKL2lJRFkxRG54SVRBWlVIUVp1NEVmN3ZOTUVKVmp3bm9UczJ4aWsz?=
 =?utf-8?B?UUlMU3hHeWRKWGFBL3BjMFFiUFZQR2ZDY3JxcTJTRGd3R1d1ckJuMGh6N1du?=
 =?utf-8?B?MW5jYkluYTZiazdjNThsSGxmYVk3dzUva0RjTGJuT1hydXl4OFVYMUE3Vlpo?=
 =?utf-8?B?M3Vpbjc4bTYyV3hoTjZyMWQ2VWtnVmRvRXU3cE9vVURLWXFtYlk2Q29GRXNG?=
 =?utf-8?B?S1d5UmtCNmNUUmlvRVozQWRoNnRyWE1uMEh2K0pJVHh4alEveVNlNStnOEIv?=
 =?utf-8?B?VldERk5YWW5LdUNQRW8wU0FLRXRMY3V0cFJmZ2tjR1lGTEQ2VlM3VHM0N2ZM?=
 =?utf-8?B?VGpoY05Sd0QwOFhQYTdSQlN5ZEh2UjBrRVpmOWMwUFBwcDJMYTdqWllJUldt?=
 =?utf-8?B?VEx0Rk9LdjNMTnloZ2syR0diT2dzRVRDTVkrY0ZXSXA5Zm0vanhHVXVsSzFX?=
 =?utf-8?B?MG9HenQrVWF4ZU5SM3diQWx1NnZtb0FXMklYRW9uSjZOUU9DcHpLRmpGcUdS?=
 =?utf-8?B?SzE4Z2J4YThYZXJ1RnY3czBJN01vYnRWa3c2MklQWFArZW1TUTVVSkNjay9W?=
 =?utf-8?B?Z3JjNWc3UmFJeFRZR0ZBb2ZKMmpUQlFCUGNYT0h0TzNGc2EvMllFRU9ldVpQ?=
 =?utf-8?B?bmFSM0NGeW5TUU42RWhPcVUxRTl1bjNvQlVMc3BsM1U4VlNkc1R5bWJhMDhE?=
 =?utf-8?B?N0R0akRtWDd1eFlUcE1oZSt2ckdPaDlxWlJUU0lkRDhqWG1BaUZqNFNTL0RU?=
 =?utf-8?B?ZDVKVHdrMWNGK3JTY3c3WnQ0bUZ1Z05IWmxPdW15WFpibEZrSytNMFJJTFh0?=
 =?utf-8?B?WktvdWtyNGRGZzJzTEsxR0o3VHVNeS8rMDJ1UkZIclRtWlhHQWZGMnYxWDkw?=
 =?utf-8?B?VXBRRzNXWWNLaGxzSFdpUmxIWmN2NkZOd2NUcDR5aWNXSVNIQ1ByUWtiUzd5?=
 =?utf-8?B?Yy9EZkFqeFBKenhNZk9ONEVyZjBpZCtUcDkxVHFsb2J2ZFBIZVl2ZEo5NDdB?=
 =?utf-8?B?NURabzV1aEFpRGFhMUk1c1AxTGNBazdKOFhoS2pWRUxTbDE2eHJudUNFbldr?=
 =?utf-8?B?K284d3UxdWd1L3hIOTlFVGtEbWVzZVhia3REaFl6cDVHV2ppMHdpaDhWKytO?=
 =?utf-8?B?TmFaRGFEalFmNW5XTnFDa2k2dy9OVkRRdktpMGlmdktaWEN3MEJycGEwZ3Ro?=
 =?utf-8?B?d3FNdjVQekgvWHNDc3FSY284NXc2Vmw1ZkZOd0hadDhRNzJJRXF4aUYvRk1L?=
 =?utf-8?B?R2YyeUZWVzkvMzEwQzUyVGJyc1lNeklSTXUzSE1LZU5EdjlJS1Q5TFUwdnhy?=
 =?utf-8?B?OEhzc3R5QmtFKzREUU5BVmdtWWQ3T3lVMWRKczNDcFNKT3lKVmU5V042dWFP?=
 =?utf-8?B?eDdXYTQzUFViYkMzenhjTkZlRVQ2U2pNS05BZzdsNHFVYVgyNXlESjdtdnZC?=
 =?utf-8?B?MkxpZlNFWkdTckwxRUpGeG5zd1FTSHdSdXJZTUtyWEpZU2hiRG9IYXNyWVlQ?=
 =?utf-8?B?MzJBYXpZMXhxU29tdzJDaTIwNGJVMVlBd1dueEJ1QjV6YW1wc1FvLzAwMnVJ?=
 =?utf-8?B?SzBrcy9SYk9wMEZRUUszM0VuK3JkRVNnNUNsVWdxZjZUNjZOeXFqSkVKellm?=
 =?utf-8?Q?EHbI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:25:37.2088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6776752c-878d-4deb-3c1c-08de48919d0a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5204
X-Proofpoint-GUID: upYDpy5tQ9RJvIqG71FMrJrZifSqmYW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX79tiz7ACZIVo
 A7etNbGLZun1sHa34ABUHlTf9+0SgJlYqmR+5Bb/TN8zdkTUpXEaZN5lXAOjVxmN27psfbxhgt+
 Ae7cKjNG5i1/1AGI0PhhJT1v8OneBmtrlohlxGkETF2OStQkHmEpWHbxBn4wGZurc+6Qzjzn/vC
 mVHrj1ePNjs02yDboPQo7EKVuvWOyJ6ELWr+7xl2Revnm4ACS0Xj2W8YS2hiL5fKNy0DrJQY9kH
 js9UhOCThh1OeEBWNSMWwf9eE6pnOCI72R9iFPQ8Syh93CdtgTpwJgdirWYOoHq++pmUX72Ykux
 tlnnYJV+vqgdDA8MvNWu6JAW1L0slFqHGUbm/DRjn2IKJ5gmeJjN4Vq3Tmmhf2HK3Qp18RU9FOW
 olyHFIJ5QzSrEsYPAeUXo78uMvZ0V6bcVkDsDqofAsvjawREZl+aBqJzw7kViYnN9QaHlaJRvEo
 NYrT8BEt1XJAe61aj1Q==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=69555c95 cx=c_pps
 a=4EVvFC7fyiOjnGrcsbJlsg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=MUtE0_O39l1H6NzEYVQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: upYDpy5tQ9RJvIqG71FMrJrZifSqmYW4
X-Proofpoint-Spam-Reason: safe

On 31/12/25 10:49, Richard Fitzgerald wrote:
> Add test cases for using the new long-offset block types to patch
> memory that is >0xffff from the algorithm base.
> 
> This is just adding entries to the parameter data that have larger
> offset values.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

The commit title prefix on this patch doesn't match the rest
of the series.

I'll send a V2 to fix that.

