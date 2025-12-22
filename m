Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE041C62;
	Mon, 22 Dec 2025 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404892; cv=fail; b=fFLjwBQsDPLwGueDen+IJXnwb0sklZm1qBFT1WEVi9zhJKj3JJRlu4IT556IS0JYGjE+Xe7UI8vg9CXqq1FI2jNBHPvMrRRLlEELsunTtdUfQQcJAf0cGWCjXR3XAJMvLWFa6ohmgoFA5B5Zv9EffeVHAq18k6uJNMKiUGEfMLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404892; c=relaxed/simple;
	bh=OU0acGXbSKuZxm2g+awBNAQd7A2krLcHMpkthMfdsXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSzM+PeZsAFF3u/fjXQFQWk+H2vCbbwNj2PIJNoI3jZNlUiw4C6zik0gjcSAdwCroEc4T4MHB2WwnngOLseRvsvqBjSIZYygzZocPzvh0c7dixg+LuLiAKpiHUd1BCpjKasfyz8TA8rY1yGsFG0NmFfFJCcWdXXljxmrbgKzLyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oW0ocVqB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ug2GF3lv; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oW0ocVqB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ug2GF3lv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMBcSTP2874442;
	Mon, 22 Dec 2025 06:01:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gM3uLY/qnnUk8LszJH3ndkqLk589tgyU/whcY4vVQe8=; b=
	oW0ocVqBdwWcPTdb652ouKLFXlVdZgLqgMFwtG/ksXQA81/TedveLuHFXKUYaRX8
	QS5o7+FH35Jd+NJKIS/GEULwZnZ3qwJw0cHomh683iCQHkuwP56muDZGKJi88x9K
	zXHoZzT+N5fvZyj3Ou4qjoq5dduSEs09d2G90TEPBIvVY8e162ncsm/5nOSJy3sE
	I4jwTPUuWOlFkUM8csZIEk66UGDAsF/31HWrBuD6IoJnGjLjTqHn3t/g9ESnjlve
	99VW8inrVZ5lK+eTCh7l/1YuCcEbNaAHjMqizASRT9pDIWCLWEVfmj05AnpvJnpO
	UhykwrVAy3zRJcXXbo6B6A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023110.outbound.protection.outlook.com [40.107.201.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b5s3ht074-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 06:01:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xArPgkpiPcP0yQ8XC1txsxJzEJKSwPcqG5n+Om3eRsET+iIxsyrcZOjsPZm7uOzn0o3hWE1bVO+JC8nlTaKRNLGH5ewAoiFFQ3YBJA/ZMNMiwsYP/6geijbycuhg4iCLOpiSGrGQ0u1ltr0K6rvUJZ8898FYjMC3hik5XE7dCIL6Afe3i4Z6n2v2PRvvLhlXt35gcmbmkimhRAHuqSUsNyt4P7yHvUE996GY6g441cuH5AckNpaa9yaicBMp2RWvVDIEqCThrVOrvJAF9+r31G2AFb9q96DziSggA0RBpVzYSGKpcsYeu1P7koa+ow+fA334r220ZC5zaG0QDyWsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM3uLY/qnnUk8LszJH3ndkqLk589tgyU/whcY4vVQe8=;
 b=DLx2attXxCjxGdHFzxMly/VNr8RFTbpHwMlQo0Sh7shtT3tydbL8/pVu7tVamSh6turenC5JtfqtrMyhsqzLeCPWcu6cMxyAYsJ1eX9xbvXT2caxDupDcGdpwR6P7uih5Xw93cqtt/aYmOk8wsDFwImUD1Bf6cIAelQoQCTcHMFyEFGUowLcMR711DnnBthfn+R23wFsDTS73riNos/7dEVppDPP/qSLd/EKgkrx+76Z6jadq/DIL4EnlbTCRgD0MhCn98LRR7IL/IaoIJ7Ls09R0pZrbyaYJaZxfIFd8HomjtO7sXPAZqNzKfP8EYfodoUARiPC5pfy2kqUDi0X3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM3uLY/qnnUk8LszJH3ndkqLk589tgyU/whcY4vVQe8=;
 b=Ug2GF3lvhKqassHex32qApIDNDC2CPHetaFYeSeM9v0XbbOqAmQMPbE99fZfmaA7BFqVBcC+Sm7EV2aKU+OfXTegdn6D0+OfsdEQ/dL/+ICSF29S2sbBAoKkrL8mQTXlYOOVv95me1XtxlCYqH0fjychauaiyZQ7/cz51LKPKpI=
Received: from SA1PR02CA0016.namprd02.prod.outlook.com (2603:10b6:806:2cf::22)
 by MN6PR19MB8742.namprd19.prod.outlook.com (2603:10b6:208:500::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 12:01:03 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::79) by SA1PR02CA0016.outlook.office365.com
 (2603:10b6:806:2cf::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Mon,
 22 Dec 2025 12:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Mon, 22 Dec 2025 12:01:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9641E406540;
	Mon, 22 Dec 2025 12:01:00 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 40FD9820249;
	Mon, 22 Dec 2025 12:01:00 +0000 (UTC)
Message-ID: <a1b2b617-448d-4457-891e-d2cc00858f50@opensource.cirrus.com>
Date: Mon, 22 Dec 2025 12:01:16 +0000
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
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <1e2035bc-5168-4ec8-83cb-eeff41bdaed6@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|MN6PR19MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 557b9fa0-ac4e-4dff-8dbf-08de4151c711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzRWQVBBeVZvWTJlemw5YjNoZENGNDB4eEhRV3diS3h5ZDJtNDNPTmpzWnZy?=
 =?utf-8?B?RHVvSGl0bjc5YTJPU0R0STVTV1Zwdm8zNjM2MkVNbEFrU0g3c3c4MkkzQ1Jy?=
 =?utf-8?B?cHlxN0RhcHlYUml0NlZvcWUxcjZqeldEek1KUmVYNWx3Y2htNjBLbEd3WmRI?=
 =?utf-8?B?cHhaZ1N1OXVNVmo5WnN2UnVSYmxaZ0FiWStuVVBKeWhIemdPSWpYVEJBbmtx?=
 =?utf-8?B?bytSYWk0ekRCTXlSOVptTEpPUlorbXBkdW9FdUhkMGtFbEhBYURlN0JOZjF4?=
 =?utf-8?B?QzllZ3JDcmhRRS9lRjBzZTBLcFo0bGVPVFFPYWhzTkk2V3Rvd3lRWHJCNzRn?=
 =?utf-8?B?cFNpWkVMMStIM29TcFhJM2U2WVhHVmlsb1EyWFlwdDRLL2ViakJsanN5ZGRL?=
 =?utf-8?B?VlRMcElPMVhKQmY0dDdyaHBvaTkxNFY2TlV1NmlhcnI1OEVqM2VyWW1KQ1ht?=
 =?utf-8?B?MmMxNHFMZHpIOVI1T3pBR0lqOUFZMDE1QWJpZStmQ3hvSnkvWGJRVVljdUd5?=
 =?utf-8?B?MXlCTjJ4SE92V0E1UWtaajNxc2xhTUxGVHhSM3pNVnVBbTY5MDRzTWFWb1pz?=
 =?utf-8?B?c1BtS1VVQTN5djdua1owZDVmOVZJTkFqR3pTOEpVbWRrS3NqNUM3SDNDUU0v?=
 =?utf-8?B?SkU2UEZhNEZlRWJoQll5ODFMMGw3anBVUE9UOHBBTytyZlBaLyt5VDBCMjZk?=
 =?utf-8?B?azRvQSt0V1cvMFp1akRYaGRMTm43YjZscUlhbXJRYURWRGRrVHNkVWp4VDVD?=
 =?utf-8?B?VjZlTDc1ejVXZDRPaHQydWVOZHhiMHNkeFJGTE1RVjdEYkZGL3JsNTBUaUNi?=
 =?utf-8?B?TXVsUjZNcHovZTIzRWwrdklDUzNtOXVQK0RoL29UdmI4ZkVSbFhOWTl6VlJY?=
 =?utf-8?B?L1NIQTFzTHlZcWlhV0pKZVhuZ0t0Wk0vWFRSVHNScGIxYk4xWXFVT2ZUOHhh?=
 =?utf-8?B?WEFqczBaQjE2dDhlNS9CNHovSHRPR2dvTWVIRzBCenA4YXdsajBva2lXN3hN?=
 =?utf-8?B?cFR5OE5MUElLWUxIWCtjWUhZVDJPSmIyWXpyK0p3QlY4UzBkaTlFdnJlV2hu?=
 =?utf-8?B?UU8xeTFrZlpaOHZ5Y0tlWkphWTFuVEQxa2RBODAwdExUWDN2RVBzOXNydDFW?=
 =?utf-8?B?c3I4RU1Db2FiUWlvNS9GZUVOK1d2bzEvWWtLdnlWbHpBME5aS0JLWUNya0lJ?=
 =?utf-8?B?ZVhLalZpQXJ6YUxRbG5CZ0xkUGJXZnJtUnBuSFhDOWc5c3pBUzFvRHVWQ0Vs?=
 =?utf-8?B?RnVuQ3hud0Q4UHphbWZ3L0Mzejh1UDI0SU05Y01kYlplWDBlcnV1T3JVbmti?=
 =?utf-8?B?L016aytpZm5Xb2srTFZsWFlUeFNScS9iRlRFK2ZGdUo1eXlkNVFSSDF6SjRh?=
 =?utf-8?B?dHRoQ2RtTFJJOGNrdmZrT3lEeTZnbGNLZVhlMkRvTlJUNG5FTmJyejM2bFQ1?=
 =?utf-8?B?dGYyTkpSQmhUZ252N29ONXcrRkw1SGxRL3QzenFUMzBkQ0RoaFRIbzJreHRo?=
 =?utf-8?B?S2UzRzJIclg3N1BpZ055VFV4YUVWRGRRWk1RZnNVdkM4M2dZcDE1VTZ0R05O?=
 =?utf-8?B?YTd1eWFnckkzUlVnVVA0TEEyY0ErWHVZYVlLbjY0UkhYSk5LSU9Xai8xWW9Q?=
 =?utf-8?B?dThhUHpkeDEwWlBleFcyeTUwSnlqUDY1WlpIN0NXeHJYOGxER3BmeHpONEM3?=
 =?utf-8?B?YmFFVDV5K0pjYTNkMmhRNHNadFp2OUh1OS9qNURXTFJhUDJSMVo0ZEdTdWFK?=
 =?utf-8?B?QjBhY0RDcURJazI1MEgyeXR1eVRIK0tYU25vYnF5aXlPU1h4QTlFTWFEek8x?=
 =?utf-8?B?RU50Z3B6bWNqcWM2SFFVbjFyWFhveW9hcldZdkJxWHVFeUhtRHJEZ1BqT3NM?=
 =?utf-8?B?anI3eUZteFFnWElzL2tBOXh6Y1cra0k5a1hrWG5tdkFNQVRGNDRPQjAwL29V?=
 =?utf-8?B?aTNoVHZuOEJmbkhTSFNnRURIK3hoR2JMLzdqb0pPUzczOWVieHBiV0QzVE52?=
 =?utf-8?B?S293ZVdWRGtZYyt5MUlHVDZwZ1N2UHIvQk5PT2Vrbkowc1FHUjhKYmlIc0o2?=
 =?utf-8?B?QXhDRDc1RHh5Rzk1ejRVWVNEc0hpRG1ab05NOG9yd3duOER0a0hZZ2x1TXFh?=
 =?utf-8?Q?Wcbk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 12:01:01.8472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 557b9fa0-ac4e-4dff-8dbf-08de4151c711
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB8742
X-Proofpoint-ORIG-GUID: WlywqrTdokqFGYL97kiGLoWcnOhky0pf
X-Proofpoint-GUID: WlywqrTdokqFGYL97kiGLoWcnOhky0pf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwOSBTYWx0ZWRfX+xxRolmQ+qiY
 6r5I3Z8JlKRFEYNJs4MBAvMrCOEV2guPDTVZDoV/lJT5UwJgtqMxHpc+arzu68Cxpw1QXR38lyv
 m2rF+1ILkookOpxE9iN2sX2kKgXaNv33jSIABnMOwrMm4SJpFBSP+WCiE/r8puLDuKTcVsXJLWh
 SoEdcMEczEDAKRuT6oYcbi4BwLmghnJwcdC0OnaFmpkn+k8C4N6TgXplWDWYtgt1rJ4gTZ0EJ7q
 Ft7goPANX5HGrTXVuuBoBB88yEAwFWvfGjzoeiC7COdRhY3mdn2f1h4o701fwmJyZpMXpzOIovF
 Us08T88teV3HdF78lQibST3/MXe1bel6TpsaJ6CrRrN0Ydlf74pznLk7WGziuuUz1+YRsbvK8kY
 z1HRSwQRTgdxfOMPrVReiq1KvEhg+fvpUejZQ5KnmWFXnxr+VdU2l/y1QYjoSbs2iuQBzOyztU1
 Kl0eJTYCSFDrp8GHysg==
X-Authority-Analysis: v=2.4 cv=XeuEDY55 c=1 sm=1 tr=0 ts=69493302 cx=c_pps
 a=ALzLegKRD8J3iQ32fiysVg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cMqT8MIqi9DMzTI2YrEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 20/12/25 11:15, Pierre-Louis Bossart wrote:
> On 12/10/25 10:59, Richard Fitzgerald wrote:
>> On 9/12/25 16:41, Pierre-Louis Bossart wrote:
>>>
>>>>>> Changes in V2:
>>>>>> +    if (simple_ch_prep_sm)
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Check if already prepared. Avoid overhead of waiting for interrupt
>>>>>> +     * and port_ready completion if we don't need to.
>>>>>> +     */
>>>
>>> 1.
>>>
>>>>>> +    val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
>>>>>> +    if (val < 0) {
>>>>>> +        ret = val;
>>>>>> +        goto err;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (val & p_rt->ch_mask) {
>>>>>
>>>>> Can you explain why we don't use the ch_mask in the already-prepared case? I am missing something.
>>>>>
>>>> I'm not sure what you mean here. The if() immediately above your comment
>>>> uses ch_mask to check the already-prepared state.
>>>
>>> I was referring to the 1. above, you read the prepare status without checking for ch_mask first.
>>>
>>
>> What would be the purpose of checking ch_mask before the read?
> 
> I don't know - why do we need to read it in the second case and not the first is all I am asking.
>

What the code is doing is:

1. Read the current prepare status
2. Check if any channels we prepared are still reporting NOT_PREPARED
3. If there are any NOT_PREPARED channels we need to do the wait, else
    we can skip it

>>>>>> +        /* Wait for completion on port ready */
>>>>>> +        port_ready = &s_rt->slave->port_ready[p_rt->num];
>>>>>> +        wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
>>>>>
>>>>> I understand the code is the same as before but would there be any merit in checking the timeout before starting a read? If the device is already in the weeds, doing another read adds even more time before reporting an error.
>>>>>
>>>> Do you mean save the system time when the DPN_PREPARE was written to
>>>> that peripheral and then check here whether the timeout period has
>>>> already elapsed?
>>>
>>> I meant testing the return value of wait_for_completion_timeout(). If you already timed out at this point with a return value of zero, there's no point in checking the status any more, the system is in the weeds.
>>>
>>
>> Wait completion will _always_ timeout because this code is holding the
>> bus lock, which blocks the ALERT handler from running and signalling
>> the completion. The wait_for_completion_timeout() is effectively
>> msleep(msecs_to_jiffies(ch_prep_timeout));
>> So we have to read the register afterwards to see whether the peripheral
>> actually prepared.
>>
>> I've left the useless wait_for_completion_timeout() in the code so this
>> commit is only changing what it says it is changing, and nothing else.
>>
>> What to do about the deadlocked wait_for_completion_timeout() is a
>> separate problem.
> 
> Humm, what happens if you have a single peripheral, does this result in an increase of the prepare time all the way to the timeout value?
> I can see how preparing all ports in parallel would reduce the total time compared to a serial approach, even with a timeout, but if we end-up always timing out even in the case where there is a single device it'd be quite odd.

Yes, but that's a separate problem that needs fixing. The current code
in the kernel does the timeout for every amp. So if you have 4 amps with
a timeout of 10ms it takes >40ms to do the port prepare.

> In other words does this patch reduce the start latency only in the case of multiple devices, but adds a 'tax' for all other cases?

This only affects peripherals that use the full CP_SM (not simplified).

If you have only 1 peripheral there is either no change or a possibility
of skipping the wait. Before this change it would always wait the full
timeout before noticing that it is ready.

After this change, you might be able to skip the wait. If it prepared
immediately, so that it is already reporting prepared when the first
read tests for that, it will skip the wait.
(BTW I see that happening with CS35L56. It prepares so fast that it
is already done, without waiting for any of the timeouts.)

If it isn't ready that early, you get the timeout as before.

It isn't adding any penalty to single devices, unless you count the
trivial time it takes to do the register read, which is negligible
compared to getting deadlocked in the wait_for_completion_timeout().
