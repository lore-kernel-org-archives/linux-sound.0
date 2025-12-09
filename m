Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454322DC33D;
	Tue,  9 Dec 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287397; cv=fail; b=CBj4jsJ0c7R447GG58D4glT6C4BucjP4Px3VyN3BQjrB+QJGDbk/3QztImmUdyrd36izyT3ivGVewcuOKmHMEfVsFvGj/TTEismAFcqKdT1ZzI1JAJlpDMkGZZe94yeRmTaxKZqOvqvznENpRlAPe7bTHh/JnM2nj2UGd4zREOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287397; c=relaxed/simple;
	bh=s/9BPrcP/DI7HtgiWGUOgX7iTnAJPLLFtTUeVnm5hlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNIkP2YuCQTkg/q7B0H0Yjo2dU3ejnRx0wvSnpBLQJ/khibi1jAn7uPVdggm6Dt5lXTETR2mfCMBgCEDr323i+4rwl4iQpDX5snEmkv7vD+9h1d+bULuzFjwbdoEOcC3mq7vLWd3usgezAS3cB6M/PVRuJkpvd+z63evJTJsm+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aXGEaiY9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RvhGlTJv; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aXGEaiY9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RvhGlTJv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9CDfBX918597;
	Tue, 9 Dec 2025 07:36:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=72agqxyEwWsSrzcMC6OIjjkQs1Mrlmp6x3QrJELLev8=; b=
	aXGEaiY9Wc/dPGC7Xaxt+0fJwiRkCpNkTXmupsI7kGgcUxNUoTNRWxQwuAksiuOu
	ntrRyJdpHKlm1rotSl7KvY21PgeDxYJE1O+fUfeRogGfBBMKgDOlc7Ejt6uHKoDn
	jz1tU/+e3mCHbDKQW1CtPg50EeReaHpSqIW7zRe2RTRDSthnOA0eQvOdUTaf2oyR
	mfkv4Gx3WwYlU9EJOp2hvwmuOFlMJcrBDA42HgMBprjF0NqWEIQEvwVpEfynROEO
	+UL+m/j/UL4thPVpO0a9RJENPMN6KOvp3pEfQ/SvUJ0CZJNBZ8WLMH42reSJWcNU
	mbk3xrXDNR3iuY0n6yv0Sw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020142.outbound.protection.outlook.com [52.101.201.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskkgur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 07:36:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPNE7tNZU8yDovE2UkTGVmiy7Mx1HcJfeeN0ctEbhOmm4lR6Zjc1CPy0IUf28dlg8fZbkfLDVCr0vYsEtBCgMKfRLUdrYANeGBTCFFl0jkuaI7fO1b+udvwRpGQ//2zXxL6Nf7wgNrktnH2GSbIrOAFSr54E3EEfFVXhdHquJgdYCHcHje5AHwNUvFROQACViKHVsSuOW7bDTMXr0PE3YuhYWpcrnsqLWtxH3UmYp2xOrzIqtB5j46D7BNYn0R1WGL66OLhGKS+IjXQFbiTwRRvV4r9jQx5QttLuTWLbOOZqhps+iNzWlbSAbUVfDj+7EECuH1pDyJWtwFn9P/a9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72agqxyEwWsSrzcMC6OIjjkQs1Mrlmp6x3QrJELLev8=;
 b=X9+FlSHPAa8YlVG6CoJkrIxlqzN2Yjh5QFZqTYgaahLsLd6wkwsUvGKU4/Qoga2kz41GgvjGdJTzqGJ/g90UfO9tKLsdmrO/c7d90QgCpaMvnXoG4xunN1wv5F+pKPEqgxWvq8uVuwGzHNdBoR3TWxtJoGAc5XWSZRZb9Moo3T/n8357dZNWkebUBeF483CCx7UliTkB7vrRJwQwmIWS0VPKBE1gp3wzyc5ZTLO9UeYPyeZmpZtEAokolnRFxocZGBLN/WEApZ6Vh9di+SqZhuSEEAQWhBnsKTfIU09RL7+mLdlP/6N3RQR1nVtTAOBSeWiWSSTTqXpdilEKh0UH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72agqxyEwWsSrzcMC6OIjjkQs1Mrlmp6x3QrJELLev8=;
 b=RvhGlTJvDZDWmY3Pkd65Ro140Gz4HQMR1qQqWhhW+DzgZzHHrdwGRBl0za6y/HMxygKEUVL4uoiJcAbcA5mnukt/J/8UBq9p94TOPT7wo3ugNns3Cae4P8226WVehN57cNE/q7dI1VqiPMCQQthAwfz1xuEC89WrT3nugyiNkuQ=
Received: from BN9PR03CA0400.namprd03.prod.outlook.com (2603:10b6:408:111::15)
 by IA0PPF39A3ECE76.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c9c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 13:36:19 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::71) by BN9PR03CA0400.outlook.office365.com
 (2603:10b6:408:111::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 13:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 13:36:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C0EB406540;
	Tue,  9 Dec 2025 13:36:17 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7A63382024D;
	Tue,  9 Dec 2025 13:36:17 +0000 (UTC)
Message-ID: <795fd33c-7a0f-4600-87be-1690cb0c0ea3@opensource.cirrus.com>
Date: Tue, 9 Dec 2025 13:36:17 +0000
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
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4d811207-1c01-4302-85b1-9d4079ea1a4b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA0PPF39A3ECE76:EE_
X-MS-Office365-Filtering-Correlation-Id: be8dac28-9111-4c1e-3fd4-08de3727ef02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXhVdUg1RWdVTjBNanJRSFNrMnJjVVE1VGpZNzhKbElPR2VsZU00S0taQkp4?=
 =?utf-8?B?S0QydzBnRE1kb3ljbG9Qd3hsSm9RWEs5cCtLcXhoeE9WeEQwVGNnT3ZHajVu?=
 =?utf-8?B?MkZ6M1hyQ1RoNWNLZWljUXY0NGZIUndwNkFtdExFdGhWS1diamJoYVFNMHp6?=
 =?utf-8?B?RHVqeWRRTHBaOHJEeWV4RDBLVG9UQnpLeksxdTNsM2RxNS9oUnp0QkFUbUNs?=
 =?utf-8?B?QXQ1elZkUzFTT2RQNlJEbWJvRVQxczl1YUNqRCs3THlINDcwOEg4NTArcEtX?=
 =?utf-8?B?dHJjU3EyWC9JV01MR3Noc3JFSEhWZnpPMjl4cGNzSURQQloxeFI1bWw1bG1C?=
 =?utf-8?B?MGdYdUhZMmxHRDZiQm5JcUFnRVJUQmF3eThZNFp2aFhiVFBXeVdlcUJDcWVi?=
 =?utf-8?B?WHZFcmNNYW9TelFmOU9FcU9nVTlWc05XTm96WXVYS2VSVVdTVncrVnZoSGJj?=
 =?utf-8?B?aXZleUhGSkUxUVJqaDRmRWc4V0VibXpuUjBJNENlMVJBYis5cG05RVN4cEJL?=
 =?utf-8?B?TXRPZjdGeGJpVkVObiszeXdlMzMwYk1KZ3NrdDhWa0g0RWZMKzh1QngzYThm?=
 =?utf-8?B?QmlQbjZ0ZEtLdjdFbjZGWVltdXY2V1M3OFExeVVIYk1lWWtlTzhJWmh6L0xu?=
 =?utf-8?B?dU9qSVhUNUF3VEZvVlRFQUFqNjE3T2FPNER3cTc1VExFYy9lb0dvd2tvMGN2?=
 =?utf-8?B?ZjFDK3VkdjJpSVlUeXpwem5GY29scjVvRTRydHg4KzdjTkxrRWtXNzJ1TVlQ?=
 =?utf-8?B?QnJhOVU4Vko1UFpCNWtMUDhrY2dqVWc5OCtRSUR4M0NSYUdsUkcvMHVkK3Ay?=
 =?utf-8?B?OVVsZFFSd1kvTnBPUDNOUHd6Zy9xczY2bUE0bWtvYWJ2V0xRUmt6NGtIVVRR?=
 =?utf-8?B?d1FYeXNLcEE4b1hyKzFBWFZjZW02dWZQU1VxUW4yb0lEa3VER2NGckxIZk4w?=
 =?utf-8?B?UXI2dkkzcDU1dXB5RndWa201cXdiQXZtN3Q5ZERSamcrU3NvYkowcFBqaEQ1?=
 =?utf-8?B?cEYyRURENnZjQWM0RVQ5RmVWTnd2ektJZzhIZG5qd1kwOTFzUEVFR0Y0aHpX?=
 =?utf-8?B?WVNZZkZaMCtuYTNpZmZZMmYyMkRoMDZwMnJCdWVhbUx2Vk0wU0ljdlJVRCs2?=
 =?utf-8?B?WGJHSy9Bc0tRRjVNdHdHRGdrd0hUbVowdWZWVjl2RWlkbDk0RFg0Q3g0N0lE?=
 =?utf-8?B?VnEzVUhCTDAyOWhPYWdiV0pBenlIZW5nSURNYVAxUnZCeDQwLzJXM1lmMU9R?=
 =?utf-8?B?MFJFRk1QZHg5dUEwL0VjMk1sY0l0Uks4NHd4L2Y2dldSZjJCY1hwNHNGZ0RT?=
 =?utf-8?B?RWZnQWdiV05Tb1I4VzhZMHFKYWNyZ2dlc3h1Q2VOWVo5SGxaYlordithZE16?=
 =?utf-8?B?a1BKUjFkVGVFWEhLdFBUa2wxZ1VKTXh0bWlXc01QUU1va2IxSzlYTkhQQjh5?=
 =?utf-8?B?cExMamF0aHk2UExMelNqQjBHbVRaRjNnT3dtV1BlUFFkckZ2SkswdTRlelFM?=
 =?utf-8?B?OXBMQlhCM3VKTWxudFJYYzB3R1owWWJHekZSNytKcFVOM2MrRng0R2R2TUxl?=
 =?utf-8?B?U29qcEVsUUo1MmlNcWNQS05GVUZ1am84UjkzNTFtVWpyaExQS1BFL1pRclNK?=
 =?utf-8?B?U2VQdlRYYkZyWXF0TlM0cTlSL0ZQR283TWdUdE8vaXYrTDVTNzBabC94dU5J?=
 =?utf-8?B?WDJkUUFtaTlvV0dQQjlYM2FseTNWaEs0U1pXb1ZPalgzZVhUNjBtUy9IQ2Nz?=
 =?utf-8?B?NVBycFA5LzZaQktzQXBkdExTQitvTEJWdkJOc3RRNU9OLzV3TzJMY3I2dEtN?=
 =?utf-8?B?Zjg1R3FmMzJMVHd2QXgzbUJLYStIQTlpTnRlUmY4TXZhV2pDUk1UUmFqS2U5?=
 =?utf-8?B?QjZ3RWFZWFV5NkczVU44NnBNRENKWGdra3BicDQweDF5NDFGVTA1T0lVamxw?=
 =?utf-8?B?MGVEbXd0WWlkVVJQRGszbFZPaEJoU1B6bTQ5clBOTms4MzkyZExIU3cvdE9p?=
 =?utf-8?B?WHdaKzV3a0tDTVRHZkkwK0lRMk9ndFlrS3pEVktuM1lqcGlpdHozeFpYWVVD?=
 =?utf-8?B?amdlMnZUQ0lDNXV2TElJay8wN0pVQW9CL1ppUlNITE9uVGVxWGxMdjZsT2Q5?=
 =?utf-8?Q?LXto=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:36:18.4220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8dac28-9111-4c1e-3fd4-08de3727ef02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF39A3ECE76
X-Proofpoint-ORIG-GUID: 4Sm4jQ8pZg5UB0j-e05RfkToHoGEDDgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEwMCBTYWx0ZWRfXzeVOaeDUWElx
 YTw6srzZvlCSFe4Jbc5wzMJfBlX88zdVA1UBXgiboRxhPETxwXFNPYieDMfqSED/vooX5lwf8cu
 yEHbMPy53ICStEHaDw6tt3tzGXxn4fapw9BaqT0CWk7W8dBSgsuJEgcHG7ZLEXUEpCRq2tLOOUS
 oZXM4pda7fleGPslVfdGOFT1StY+E855P4fvROWnNweHnzyyJdBCFHBeh/fFX8I3HwFuFAnMoVQ
 m/jmQALvMyzI82e/1DvXCpbMxxLUyM2nBZL7ZZabaqKjaMJwOVnMOz7xO+EqVJYFPiUO31JDV8I
 QjVW5/YiHkDGbdqGPc51llcot7lwDi40kxt7YpkduUxkaoIldbg/ZzWOymoyHcuBZIDv5QeGrgl
 MjJotwQxC7xUU+IoGGaDJwFt3PKtfg==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=693825d6 cx=c_pps
 a=WWvtTTXudCa9tqu193PqFA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=3h-8apMyswuEuyEYFtgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4Sm4jQ8pZg5UB0j-e05RfkToHoGEDDgJ
X-Proofpoint-Spam-Reason: safe

On 09/12/2025 1:04 pm, Pierre-Louis Bossart wrote:
> On 11/25/25 16:56, Richard Fitzgerald wrote:
>> Issue DP prepare to all ports that use full CP_SM. Then wait for the
>> prepare to complete. This allow all the DP to prepare in parallel to
>> reduce the latency of starting an audio stream.
>>
>> On a system with six CS35L56 amps, this reduces the startup latency,
>> from runtime_resume to all amps ready to play, from ~160 ms to ~60 ms.
>>
>> (Test hardware: UpXtreme i14, BIOS v1.2, Core Ultra 7 155H, 3x CS35L56
>> on link 0, 3x CS35L56 on link 1).
>>
>> An initial read of DPn_PREPARESTATUS is done before dropping into the wait,
>> so that a quick exit can be made if the port is already prepared. Currently
>> this is essential because the wait deadlocks - the stream setup takes
>> bus_lock, which blocks the interrupt handler - so the wait for completion
>> will always timeout.
>>
>> However, an experiment of removing the bus_lock from stream setup, so that
>> the interrupt will work, shows that wait for completion takes ~700..800 us
>> but the quick-exit read takes 50..200 us. So the quick exit is still
>> valuable even if the stream.c code was rewritten to allow the completion
>> interrupt to work. Rewriting the code so it doesn't take bus_lock is risky.
>> The deadlock only lasts until the wait times out so it's not a serious
>> problem now that the DP prepare happens in parallel.
> 
> The only limitation I see with the stream mechanism is that we cannot start two or more streams at the same time, even if the hardware supports it. On paper it'd be interesting to e.g. start capture and playback with the same trigger (bank switch). Like you said I am not sure anyone is ready for now to test all the corner cases to remove this bus lock.
> 
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>> Changes in V3:
>> - Removed duplicate deferencing of s_rt->slave->prop.dp0_prop.
>>    V2 saved it into dp0_prop, so use that.
>>
>> Changes in V2:
>> +	if (simple_ch_prep_sm)
>> +		return 0;
>> +
>> +	/*
>> +	 * Check if already prepared. Avoid overhead of waiting for interrupt
>> +	 * and port_ready completion if we don't need to.
>> +	 */
>> +	val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>> +	if (val < 0) {
>> +		ret = val;
>> +		goto err;
>> +	}
>> +
>> +	if (val & p_rt->ch_mask) {
> 
> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
> 
I'm not sure what you mean here. The if() immediately above your comment
uses ch_mask to check the already-prepared state.

>> +		/* Wait for completion on port ready */
>> +		port_ready = &s_rt->slave->port_ready[p_rt->num];
>> +		wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
> 
> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
> 
Do you mean save the system time when the DPN_PREPARE was written to
that peripheral and then check here whether the timeout period has
already elapsed?

If that's what you mean, I don't see much advantage in that. If the
hardware is working correctly, this will be detected by the read above
that checks if the peripheral has already prepared. If it has we skip
the wait_for_completion_timeout().

If the peripheral is "in the weeds", so that its prepare time has
already passed and it still isn't ready, we're no longer in a state
where we care about minimizing audio startup time because the hardware
is now broken. So it's probably not worth complicating the code to
take a few milliseconds off that case.

>> +		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>> +		if ((val < 0) || (val & p_rt->ch_mask)) {
>> +			ret = (val < 0) ? val : -ETIMEDOUT;
>> +			goto err;
>> +		}
>> +	}
> T
> 

