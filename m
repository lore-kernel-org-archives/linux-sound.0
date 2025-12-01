Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935DA13DDAA;
	Mon,  1 Dec 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583057; cv=fail; b=IAl2KocUQcwpCj0YiaaQ9PRrIUGAQRJYH/hJJwQYn7KotOMxzfBiJjmBJI8nhbNgeRwfC3iB8epu2MSc3DWGNEtNGAuU1wetFJeXLm1WDhaTX0QAcTnr5V4kk8vSQz9Mq5RXuLQEgG6tZsSVJCDD+2WRHn0sem5wXEoYB5vgZkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583057; c=relaxed/simple;
	bh=32UKpphWlDFHCPYIfRsIVa04cDX4yr97UWqbF8S7IkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIpfREii9jXK69Ji7h7ec9EbAHyffaA1oGuAYnylr/+c6Z/hJH8gHcvMaa6BXGjZ6kqoFXRR71GMa546GFg8G+AFijBuKbqqE3hLB+C40HJUS4HX5FfEsMune62OC6xRzhGV4PQlTdZ9zabCSIiX1ZjIu74JPKAWrjPnJ6Mp6lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eTGLpyAU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZXfppKRs; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eTGLpyAU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZXfppKRs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B14vYDk743252;
	Mon, 1 Dec 2025 03:57:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RQwOqZ7QxmzORCJ4L50XKSNLF96vVRsUyYo/ckgxI54=; b=
	eTGLpyAUtqwr670hg1mJVIF6afHJhRzgg5ouRV70QsofKKqLAiCxZqUlsqveyP44
	eLDeEC35nr+E6qUyfVax51AMNeawvOh9w1YT/H2wckZc2y4hT+X0zbSewjJY3SmA
	ycxPKRNU5zBDq4FNRRE3IgqRJW8hvJdojtSQV+qthc2/Wmkweg+GSFrvm3qh6T+b
	HQRqNgMHAd8hRFhPivvRTIzKXQvb1TsoefFFqDc+EklcKGRFGAXw9Bgmom/giY/P
	ToU+TmeUvQJ6sIEetyGHT8vV/YJ1PyoMNNp8frqgvVAR8/eFL3L3tATYXgxE64m9
	9CUlWCksSRfid4qLGlZYGw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021109.outbound.protection.outlook.com [40.107.208.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aqy441nhk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 03:57:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poL6TsTKG4j6Ocswmpi4eDqA6EvmsDdPojquKl0VpYzjs8CYcD/v4vgcow3wMm1PHmOc6kjo2CpU8bLLpaPNliN2veB4vMgKsO8ekJH4XdKrI8sc8R18elYof0JqcHL/+g0zuyBXj1ea623KfE5770ibrsOGf/N/otwKLDhWCC21Kzo5jS+t8thgGldUYeRKVMgiTUzJ4l/gaRxHA1eJLMQKFfR+Bjn7515M/XM3kcjjJA9d7i4KuYpXpHbK+QtGgcJqBsGRGLmZ/lf4EeqnLWuU58Gf7lS5Hu53dsmH7Q8Cqrc12wyFvMQwb+pYPAQiSmDKfKpm4P8Km3KPYqobUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQwOqZ7QxmzORCJ4L50XKSNLF96vVRsUyYo/ckgxI54=;
 b=n6diNP8sYbkvWPyH3D05/RoW2Tc8A+PACASJc73N7afT9wI5WUw50X8f5rlwWYJ8cRJ7r9pdd6jneq5SN0gEnxxeX4qsDxyU1Vc0R4w3SVZwRzMvnXdXK93LFsE1yG9LnQULGh5Yg9m/n+Nq1TEDL92MQ5/jjvpKG+u9lFaDsVtkNVYwOVP+baQeXJu2ooVxh2FhGTuwEyTCk9DcckO/AfOPTw3BuYvwWQNRRx6Xw61NVKEm0cGklgPRSY2AOsTS6zZkGGnh3IJUBMEY9XKqSNyifysmXOMTYYs+OT+1Goit+PpwKTJ2Jki8LNgQYfM0XKCXf8Oj/htSJfk6Emm2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQwOqZ7QxmzORCJ4L50XKSNLF96vVRsUyYo/ckgxI54=;
 b=ZXfppKRsqfIZv3hC7i2cW9wFMIv6eooIfWlX0nKqE7OQmLbOv0lMsDqu+6pVPntIw1tDqFtA6Jhzpr4BMnhkVZo0nYDGhuH0PdX6PQGTNwzsWDzNubf32uB9mjP0Q9oTur1cmPNRB0h9erbyGqf9N0K/1ibt365Qy6SWo+TdUTU=
Received: from SA9PR10CA0002.namprd10.prod.outlook.com (2603:10b6:806:a7::7)
 by LV0PR19MB9663.namprd19.prod.outlook.com (2603:10b6:408:31f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:57:18 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::56) by SA9PR10CA0002.outlook.office365.com
 (2603:10b6:806:a7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 09:57:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 09:57:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6C665406541;
	Mon,  1 Dec 2025 09:57:16 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 596EA82254A;
	Mon,  1 Dec 2025 09:57:16 +0000 (UTC)
Message-ID: <8f6f1dc9-8b14-442c-8999-934ac312a1bd@opensource.cirrus.com>
Date: Mon, 1 Dec 2025 09:57:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs-amp-lib: Use __free(kfree) instead of manual
 freeing
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251127155817.1374079-1-rf@opensource.cirrus.com>
 <8f889b72-479c-46fb-a8cf-c9abfc491463@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <8f889b72-479c-46fb-a8cf-c9abfc491463@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|LV0PR19MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4add7566-7fec-49b8-bc45-08de30c00376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVlWbFZ2aDdjd0xqOXVYRVc5T1lKb09SQ3owM2l5eSsvV3M4bFg5QlBkcmNu?=
 =?utf-8?B?TWZJMTlkR29CSjBDTFlUOUkybS9hZnNkd2dBUHBBQ3ZCTVJZNW56QnhwY2Nm?=
 =?utf-8?B?U3pPV29jeVdaRXUzdFYvaWJ3K01zWW1zTlVRaHRiUy8yUE9Jd280blZrUktC?=
 =?utf-8?B?RnpySjhzYmZjYjAwc0c0R1loVkNlVzF2QWZxUlNZQ3lQMnpoZVdBTmJ3aktK?=
 =?utf-8?B?SEZLUWNGcmU2dWp1U1pHYzV4Z3VMa0hyNzBBZGZ4YS8xWWlCQUdtVzJSM0Ra?=
 =?utf-8?B?RzI0YVJTNFRCdmFxMmZydXhhUWNwMjV2bWpRY21NNTFkcDE0UGdVUzBYYVRp?=
 =?utf-8?B?RDdCZlduWmdCMUs1T0psVXVtTnVuUDl2NHowc2hZYWRyWEl3MkhWbFZlYmwr?=
 =?utf-8?B?Ym9DUW1VOGRGeThOdVl3eFM1cklPSkw0cFRIRTllV0xCWm50VnlrWkhIWS9F?=
 =?utf-8?B?R1d5Q1JwU25ISEpadVNCZC94bXZkYktpSEZjSHRLVFREblhGcEJiVnh1OUNx?=
 =?utf-8?B?cVNqZUtFWGZSQmlrNjYzaW5BTEZNOEhqUGV6TTFQVFFmdGtXOHJrY2hwREo4?=
 =?utf-8?B?a3RSRWZUVUMyU3ZQREhGTDRqVS9YSkQ4SkJxeEp6UHMrZVRBMEpOcGIvMC9J?=
 =?utf-8?B?bzNKTjBaVkFzVENwNmxXeEdNOHFZdVc1djhFblE1TytZSmtPWXRCUEN4Qzlo?=
 =?utf-8?B?eGh4V2RSVEJqNTQ4R3pUQ1JEYmtNOW1yaHdxcVRlQVdOUmMveDBWZHQyOWlP?=
 =?utf-8?B?MnNIR2tVRnpxSFVRQmFxK1RwbFhCb0RkTUhNYmUySFJLYTFnQzd0blpyeWNT?=
 =?utf-8?B?WEptU0EwTm9GdzV3ZCtqdUVURUlsNTh1VHgxdFhEMGIrbkRpbWdWN0NZa09U?=
 =?utf-8?B?dlVleVM0QzZUNUEyb283S1RVa1o1MUQwVW0yZ1Y5a3dxUGQ1Y3lYMUF6OWF1?=
 =?utf-8?B?RW1oVmVHRzRBUmFFT3pvaWxuaTFVVjExa0RGN21FbU5wVUdhRlVsRTFWS2Va?=
 =?utf-8?B?NWpiVjVjL1BkWEdTa1ZuY1p2MGNuN1hweVhxSUdzVW9LQTBvclRXcmYrczFx?=
 =?utf-8?B?WHoxNC9STytlSVFNWEErQ1ZqUndPckhmK0t1SjhKV25UMnJrekNlQndqVlcv?=
 =?utf-8?B?QmpXcThUMVE3NCtjcXhVanJmZkdrbVdtSUgyVFZlY2pxbnJEMkpzTC8wSHFh?=
 =?utf-8?B?SWNGZjZnWWNzYllTa0FxeWg4dnlWYkRiZE5ZdGozdEN3Y3cwMEQ3eGRGc01B?=
 =?utf-8?B?aHZIMnJmMzc3NW1kbC8wcUdLV3YvSUlvblBVUE5FZUJaai83ckdpODI4dU43?=
 =?utf-8?B?QThnaEQwd1JUbFJNSWphMU92YWc3VVk2Rzl4NGFGVUZjdnhMc2tmYzEvMkxt?=
 =?utf-8?B?ZUM2TTlHZEFJYmJlakY2SUJha3pCcHBpcVhOZXFIS3o4RytuZ2VVVHhTTjVo?=
 =?utf-8?B?ck1JMmR1S0RqcWdBSS81SWtUR0VMc1V2eTdqWkxCOFpQY3A4MmdLUHhsL0R1?=
 =?utf-8?B?dkJ6T1RTZjFJYWhBbHlEcHU1OU9UN3JoS1JLa1JmOERuRytRQlh6dWFsTXVU?=
 =?utf-8?B?K0pMWnBOamxBVmtpREVvRmpnWmlMWDdmM0hlenhORkN0c21IVG5RUkUvNC9K?=
 =?utf-8?B?R1FYNlBDOGtMQlZEcTBoKzJjQXFtd282RDlVeDROeElZdWprUGFMNEZ4SFpj?=
 =?utf-8?B?TmZtaTVseDlqdzQ5Uk1GSTZaSmlRelJvN3FFSi8zM0QzbnA4cHdYbmFDN3dr?=
 =?utf-8?B?THQ4M0dQUFV0d1M3MUIwRUxYOXFHLzRQczd5MGU2elRqckZhck1TcWx5QlZD?=
 =?utf-8?B?eXlMOXV1bURpT0hzREZjWUpEQXhuNW5tWkhZcjhnSkxFV3RSdzVicTgyRm9K?=
 =?utf-8?B?clF3cVB6Q2hEMXhQQXZBMmEwKy9ETnpDM3BnaXMyd3NSUWViSURZTzVEOU1L?=
 =?utf-8?B?NTE3b0NaMW0vRHFZK09RNnIxN0tEcEhsTVV0QTNlNFF1U0I3U0JZT3R2ZDM3?=
 =?utf-8?B?ZHF4VmhLdkw3aU9taXZtRVhycTBVYTlvNVNKb21zalQ4bHM1SjN4M3lBVy9C?=
 =?utf-8?B?d0VQYkl5QVlLeC9YZXRwbndkZjl1MlN1UTZnYWNLWEFscnVQQkxDNXRIbDF2?=
 =?utf-8?Q?ZHyw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:57:18.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add7566-7fec-49b8-bc45-08de30c00376
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9663
X-Proofpoint-GUID: MUVafnr-cmpqRgXQ_BoClQdr0FnQovGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4MCBTYWx0ZWRfX2oFAngAZd+Mc
 a8vMuQrXCONdPRbSnXNweuThjjiL0WxXRQU7EBMUY3GMbukZ0ZJ7N8+Oo3CmTd3jtjKuDbC8/UF
 Q2M9+YZukTnFGdznX8durkLQDJ6pJS62UdICX4NQFQTkJ5vPP+pkSa0WFBN/griVQiMWE7OnEA+
 TxQQQBLOyoRbSLEa/OJfjJtM+0oG8YLo1BrmePUb2EmCTu0HmIenAldYAi+Q3Gl1ayXSlvbiE1T
 yjLwK79W5KLewPtO1Ky00lJNJrKAFDNLOglFJ3axUHDHWDmITtRZ1pCU+AnMf/WvRGWeeL4d+TF
 nm+Nt2roqlTPykEHawwJQgp+08S5z23y2RKUHDctQrHyc+lssu5JwaKUhJHpv8qXpsWQcRpBiuX
 0Jn6m5vkk9hj40rXZ3OEGFoAZRvSvw==
X-Authority-Analysis: v=2.4 cv=FK4WBuos c=1 sm=1 tr=0 ts=692d6681 cx=c_pps
 a=0hJHWFAiWqvHUFm5j3G3Dg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=hShGonwfbgrzDhQSdJUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MUVafnr-cmpqRgXQ_BoClQdr0FnQovGn
X-Proofpoint-Spam-Reason: safe

On 29/11/2025 2:28 pm, Krzysztof Kozlowski wrote:
> On 27/11/2025 16:58, Richard Fitzgerald wrote:
>> Use the __free(kfree) cleanup to replace instances of manually
>> calling kfree(). Also make some code path simplifications that this
>> allows.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   sound/soc/codecs/cs-amp-lib.c | 29 ++++++++++++-----------------
>>   1 file changed, 12 insertions(+), 17 deletions(-)
>>
>> diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
>> index d8f8b0259cd1..8c9fd9980a7d 100644
>> --- a/sound/soc/codecs/cs-amp-lib.c
>> +++ b/sound/soc/codecs/cs-amp-lib.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include <asm/byteorder.h>
>>   #include <kunit/static_stub.h>
>> +#include <linux/cleanup.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/dev_printk.h>
>>   #include <linux/efi.h>
>> @@ -309,9 +310,8 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
>>   							     efi_guid_t **guid,
>>   							     u32 *attr)
>>   {
>> -	struct cirrus_amp_efi_data *efi_data;
>> +	struct cirrus_amp_efi_data *efi_data __free(kfree) = NULL;
> 
> This is an undesired syntax explicitly documented as one to avoid. You
> need here proper assignment, not NULL. Please don't use cleanup.h if you
> do not intend to follow it because it does not make the code simpler.
> 

LOL
The new system to improve cleanup introduces new cleanup bugs. :)

> 
> Best regards,
> Krzysztof

