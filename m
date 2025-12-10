Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1151CAA79;
	Wed, 10 Dec 2025 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360771; cv=fail; b=jY/gAeZIGHJapxpRs8d6WPLEdy23KYGTeyNpisC0Cs3VeypEzGXfU8n8uPFWZl3apYBZLklNNZHPrxibY/yh/7Gpuz5KJ2t9Zo4CSCRNOFebnsircRNgaHzj1R0BbkmkuKjjFhFueN8N85Kq2gbkSXcI0Dyys40M1E2Moh2XAbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360771; c=relaxed/simple;
	bh=qQ3p5Tmx3O39JMrkeTelN6N/WfnO5ZT/QwXAdbRHy+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOLy7TxW6+V0hUGG/zva0da7ondsKma3C9U/MhAmJPkPzIipEaSepFTPmCtt5g4D+sklkRWwunQc461b5w0qDTmnUg3BRDeDlrWaQfAp/yTkzHivNbbdmpcVa1kFR8R7EGPJux/G9htmPXZzwIj8yYTKUeyizpZVZeZWwK+cqeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jsgded1t; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ehY03hsP; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jsgded1t";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ehY03hsP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3wHNU1225799;
	Wed, 10 Dec 2025 03:59:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pgdPgaAb2FD2ZX2PptV5ZgULS5u85IOjU6fj8TEcHDk=; b=
	Jsgded1tqwVAFL6VxriKU4aXm74aKTb8m+0/3NQmi6ExVmY71+5MPDCukdTMM0wv
	Ay+gRz406ptEeoy0AqFyPROrYPVC516OQhTq1tOLwgmlhFaVljOOos9AWy0DGSxP
	7TOnzXmBoVsi6B320nQXcIzc7LgEjNdkjsbkI9pekn7eonqRtx3vOk7FJuaNfK9O
	/n9Trui6NYxz+89by2iXBOuy+RR7SzFNX7IZnAaUCF/NUa8MYq0uOd2UqNRzp62K
	sbqY21YUoNkVQrwbET0tnkec3q+hyClMmYows5r728AjF6pS7xwMxY7xZRTgitzk
	xyyu8EYxFMw+Oqo8tC+u2g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020127.outbound.protection.outlook.com [52.101.61.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4avjs2ge8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 03:59:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePNSccqhUVcSrdfstAz8q3ozl2RXw0Rf8Iujt8ShpdvXUhZ+4pYmwAKCDfUccB5SOhs/KfhZLbT9r7ManLpP8BNvGGFvIJOYTun637sJKJQhy4UbrumZQUIkB7oARVtDXoAjiQjeU4TmTZOJFdxLV9VLvgytnie2Mxu/BtkXG8bmiod3EbBh7AqOrj6z/5E1ud/K7oqSFLRExNk+lD73FweClKjs4aG6Qj7XPOOkBKWZ1rRVJqDdhyGja3BNTNK1b84hzhv898Dc5+kHqS+X0WYH/UY6d/0CrrAeBf1F0l8rhsd23C9itR0ikcv49St0AvJeSJEnUwQU2QbkU9Ga0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgdPgaAb2FD2ZX2PptV5ZgULS5u85IOjU6fj8TEcHDk=;
 b=m3+Aud8nLm5AkRRQlxbywY0W1I9q9+BJkLOeaLcYVZmPr3ZJ2OmqCz/OslXcvLHzsO9eVDh341P8Fo/je3pnQ3GCq0kWcBz0WegBEI4rEhFO++vZqBY/0ei+4b4kpJf6u9QEIl7wAkcuE28oYrWIEHLVqI5o58ycz9KqPuFoagDqOZKkZ8A3gvF4gKLbKeYF+5/cK9qHQVVxwQXiC1xkhKhImhWgQNdqc4J6fS8t2YZeXiIqXStgGg92fUjWT3k4msfHSLWazY9ndDXP2ryTXxVfz+p6IHicAHxIpdvHBjSZQnTXyOWf1ECSfo/LXksRRc9CvCd+ygEQrUdP9oNbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgdPgaAb2FD2ZX2PptV5ZgULS5u85IOjU6fj8TEcHDk=;
 b=ehY03hsPAGNQiN9ceVjqEA9Hy5aYVxHafQt6UoDoMXbZMK3k9Q9ITQ00vEiUTT9fF1Z4xXu/5ZP/Ho0eKZmpR9pSwPbRXq3r0Fm5dELdwzmbD6WMcQ9DKBy5kXnEydaPfLi3ma7eFDfavjmHugLgIUmhGUBKeQun4fkOC1k1hHI=
Received: from MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::22)
 by IA0PR19MB7193.namprd19.prod.outlook.com (2603:10b6:208:430::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:58:58 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::eb) by MW4P220CA0017.outlook.office365.com
 (2603:10b6:303:115::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 09:58:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 09:58:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 041B2406540;
	Wed, 10 Dec 2025 09:58:56 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A7B8B820247;
	Wed, 10 Dec 2025 09:58:55 +0000 (UTC)
Message-ID: <d86e401a-205d-42a3-b90d-239d669c6ee1@opensource.cirrus.com>
Date: Wed, 10 Dec 2025 09:59:03 +0000
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
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5c80bead-716a-4528-b614-4b425184a484@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|IA0PR19MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9126beee-f98a-407f-4e68-08de37d2bc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R20wOUxiZ3BTUUNWZ3dxYWtxVVBTb2xrMzdWa21tZStsdkdObHB5ejQ3SmFK?=
 =?utf-8?B?d0xYazlwYTV5QTJRYW5OYmpoazRvem5vdUdzcmVsaldOd2RIMTFPemNwa01K?=
 =?utf-8?B?Yy9wa2ZWVzB1ak1BMXF1ZmdGY3ZnRXh2ekpONGpUWEdTTUZrSHEzVjgwYTlG?=
 =?utf-8?B?VEE2bXZKVUdUcTJJTHI4aVQzYVpVOXFIbnZWMXlEQ3FuTWVvaXhKaEpFdi9R?=
 =?utf-8?B?MkNxcHY3N0lxd3h5QU5iZVRXRE1Nd0xrckdxK1ZLdUpxM1VKR0xGcE1zTkZJ?=
 =?utf-8?B?aE1ycCswa1AzcTBabEQ2c2RpRUpTbVZ3WTF5c1pPNVRVMHh1YzYycGZMV3gr?=
 =?utf-8?B?bFEyZVZkbE1FQUhrSkdPV21PSld3YzdDNllxMXNXdFNVRlBTLzhLTTFPNjdJ?=
 =?utf-8?B?UHJyYXMrN0w1OXRlMUpxZWZOVEJ5by9DVzRZOGdrU29lRFZpOFhRNXNzYUF2?=
 =?utf-8?B?dDczRm5WS2s5S25kamJpY2lKenRjSHdtR1RQSm1vMUJndG1sa1VxeU91ZnlO?=
 =?utf-8?B?czNsZDViSlBzdGVUUmk1a1BSVktHV1Nsd3FuKzEzR1Q5cjZtcTVMaEgrK1FJ?=
 =?utf-8?B?MzZBVmtXL1B4WkxJS3ZPZy9KR3JKTDhHMkhrSmpwUlQwNkV5UVhVL2Zmd0Ra?=
 =?utf-8?B?b0h4YURXOC9VakR5bkJHVm9nWnlHS2FwdmI2eTZMYklKZC9uVTZYMEdoM1R0?=
 =?utf-8?B?VEhrZWFpeUpSK2kvSnRhUXpGY1JYSEMvbjExcnBxdDN6ZGJ4YUx1TU9JRy9C?=
 =?utf-8?B?c1FpRlhLSVFaNWtZdHRKODRNTFRTUjk2dHIzZUxhSEFHT3JNYis0cDRzNnFW?=
 =?utf-8?B?VmFWWTV3STEvMzlDa3dvWTZHdE5GVE94K0UzZDBMWjlIMWFVWFRuTEFqbmts?=
 =?utf-8?B?WDdKMjNydEh3YXFvOFhZdUFOVHhibElJaUZZVFZlNnNodEFoOGV2UFNOdS82?=
 =?utf-8?B?RmxoQWxTaGwzQjdVOFYvMkYwdlJXcEhicm83TFpJYnAzMXA5MFg5VDNHSG9s?=
 =?utf-8?B?U1FESzBBQWY1OVRsWmZHS0RWcC9VTmlSdFhrWUJHb3drcEtLUnpEY2dweUp4?=
 =?utf-8?B?N1IzWEhDYkhIU3BrUGMyTW04N3FHR3RoOXUzWGhZUisyT1k0VUpJS0Z0Qy9Z?=
 =?utf-8?B?VTh6Wm9iN1E3eDZRRTAxcHhISHlUOU5yNkM0cnBFNmYzSHZrbUxJT3hNam04?=
 =?utf-8?B?eHVmTERoVk8vTXA3K3NoaE5yNkRsUWVQblJZOFl2eGJISUdBR241aFQvR1V6?=
 =?utf-8?B?bDhtcDZPa3R1elFBdWJDcmowZUNicmVDRmZQMXEvMnNWclllUXg5NVFhVDNW?=
 =?utf-8?B?MlpOaXR5Tjl3L1NITkxrS2Jmb3RmeW92QmhQVG85QW5RbFFQR0FIZWFZR1VE?=
 =?utf-8?B?Ty9mUGRYNlhwN1Zuc2lEWUs4TVlyT25Hak1VNUdFeUNGelpkaDRNVXByU3dt?=
 =?utf-8?B?M1UrVGpSNUNtZ2RvY1RsV0hYNU1PVXd6YVpqZXRiV3NKK3VmNU9GVmtRVnJ2?=
 =?utf-8?B?bjVLVlZ0bmxXaXBnelhCdDhqVi9NTUpFbmkxOEU4Y3VtTVpQcUN3amRZTXlY?=
 =?utf-8?B?Vnd5WjlNd1dzTk5kODcvOThsWWV5QWNSMk9nMUxyK1ptSDRJcklvTjlnSk9N?=
 =?utf-8?B?NEJEZUpMYkJEUzVITSsyL1JZVzI2NlFhZXplUWJGUmVBRm5yRDROWmUyelc2?=
 =?utf-8?B?OVJ1NnR1dG5QMldySnhJd3RiYjdxakQvbDdLTFpmRCtUUWNUOFpRM0hTV0xQ?=
 =?utf-8?B?dTY2aU1reWNucFY1VzF1bmZNWEpCMXhVbWZaSzlkQXNjRFNGSWMwV2lrRkNR?=
 =?utf-8?B?bTR3Wko1MFNpOGVjbkFHL3ZaZ0dJOW5BNTJQOEVtejFKUDk2SXQvMmh4ZFlo?=
 =?utf-8?B?Qlp1d3BrTllaL3ZIUDJKeGR6RStmWnRKWVBMOXBHNnhoYmx0UjB4T0pubkh2?=
 =?utf-8?B?ZmZUTFpHNWRzSkZjMzJXMzlDbHQ4RDZaMVdBbmFpNkRNOEJ5OVFlV1JMZkxs?=
 =?utf-8?B?Q1N1Ky9VQXF0T3JNdFdIV2l2U1BwM3puT1ZYRjNIRXZIcWlab3BvenBMZnEr?=
 =?utf-8?B?ejcxMHdFK2d2WmNxTzFFVWdzdGJ3eTlPTGlvSXJPaXRtYk9xZU5xeGx4M2Nk?=
 =?utf-8?Q?wme8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:58:57.3313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9126beee-f98a-407f-4e68-08de37d2bc65
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7193
X-Authority-Analysis: v=2.4 cv=dZONHHXe c=1 sm=1 tr=0 ts=69394468 cx=c_pps
 a=zX+IWXFbiTryU9FQSZboQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QoUP7h7R2SX7oimVjcsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NCBTYWx0ZWRfX2wWuO2Y85Vnj
 M4Zpi61rYa1oS4anHuBAN75/kiahMkThHtt9q51UlGKDhdhrTXFpl7tT6VkmOjhsOPCRe9KyWzU
 5BLmbCNLeOLCCyUbs7eBGhUk16oEn+BKtvp7ab95FqCX3ODLHkG4IE0rgcd6cBogahBO2on0lXH
 KhQhWr50CTMN/VGwtsEobL8L6YGVZMibTIuOouLH9D3btozHKeBjklk7eeLOHocAcJFuAiG3m9Z
 sZcBe6x9RU+6nUCr2a6RmI2QRf6kAXx2P/2HJj/CVvhSVwe/ES+6CO3nwL443lfkqo7WUta1QVq
 Y2OysMgN2Z5tjiRFKEoHTwu8XBMMmeasYknFcZAI2wtwi07wP8FiRb1E5e4Am8SOw5IjX14aOKr
 aY+EfRf84PX/Q7gs1sQmbOzzC4jcaw==
X-Proofpoint-GUID: UYlyPHCsYlVyVxtGrscrwCF7RgXuLoRD
X-Proofpoint-ORIG-GUID: UYlyPHCsYlVyVxtGrscrwCF7RgXuLoRD
X-Proofpoint-Spam-Reason: safe

On 9/12/25 16:41, Pierre-Louis Bossart wrote:
> 
>>>> Changes in V2:
>>>> +    if (simple_ch_prep_sm)
>>>> +        return 0;
>>>> +
>>>> +    /*
>>>> +     * Check if already prepared. Avoid overhead of waiting for interrupt
>>>> +     * and port_ready completion if we don't need to.
>>>> +     */
> 
> 1.
> 
>>>> +    val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>>> +    if (val < 0) {
>>>> +        ret = val;
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    if (val & p_rt->ch_mask) {
>>>
>>> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
>>>
>> I'm not sure what you mean here. The if() immediately above your comment
>> uses ch_mask to check the already-prepared state.
> 
> I was referring to the 1. above, you read the prepare status without checking for ch_mask first.
>

What would be the purpose of checking ch_mask before the read?

>>>> +        /* Wait for completion on port ready */
>>>> +        port_ready = &s_rt->slave->port_ready[p_rt->num];
>>>> +        wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
>>>
>>> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
>>>
>> Do you mean save the system time when the DPN_PREPARE was written to
>> that peripheral and then check here whether the timeout period has
>> already elapsed?
> 
> I meant testing the return value of wait_for_completion_timeout(). If you already timed out at this point with a return value of zero, there's no point in checking the status any more, the system is in the weeds.
> 

Wait completion will _always_ timeout because this code is holding the
bus lock, which blocks the ALERT handler from running and signalling
the completion. The wait_for_completion_timeout() is effectively
msleep(msecs_to_jiffies(ch_prep_timeout));
So we have to read the register afterwards to see whether the peripheral
actually prepared.

I've left the useless wait_for_completion_timeout() in the code so this
commit is only changing what it says it is changing, and nothing else.

What to do about the deadlocked wait_for_completion_timeout() is a
separate problem.

>> If that's what you mean, I don't see much advantage in that. If the
>> hardware is working correctly, this will be detected by the read above
>> that checks if the peripheral has already prepared. If it has we skip
>> the wait_for_completion_timeout().
>>
>> If the peripheral is "in the weeds", so that its prepare time has
>> already passed and it still isn't ready, we're no longer in a state
>> where we care about minimizing audio startup time because the hardware
>> is now broken. So it's probably not worth complicating the code to
>> take a few milliseconds off that case.
> 
> I agree it's no longer about minimizing the start time but rather providing an error faster, without waiting for a second timeout on read.
>   
>>>> +        val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>>> +        if ((val < 0) || (val & p_rt->ch_mask)) {
>>>> +            ret = (val < 0) ? val : -ETIMEDOUT;
>>>> +            goto err;
>>>> +        }
>>>> +    }
>>> T
>>>
>>
> 

