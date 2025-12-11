Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45676DF49;
	Thu, 11 Dec 2025 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448409; cv=fail; b=j6S7Xp1YXbOkeXgY8yZ29kYzLMb43W+1+iRBptetyePPSXfAvTXvxreHmMVi5iyG8ckHCVPtgMhPI6tVk7TpJAmBTH6y3TqjNN5WA8P3TPyTsT679ckv2HUrGEfD/CJlUnmEvU10JK5AKuJUVFHLdAId5LmDP8aVdoTf69cE9jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448409; c=relaxed/simple;
	bh=ZzZd0y822xVe+1a2aTsWi7e5H8NCuLAPGfICFDCMov0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tpzv5zd7jnUHEynljgCnHhA5aPUi5KUnZNC79eco+KxQsImGL+oCW33idUxgerghshoJROYPbORwy0IHRaYzhGhZCzp2pdJVvl8PADr8SNsGI3moQCfL2PyYZJ/Dp2EaLmo9QFiRGtfCC59N2vYdDTjRfNdRvUvuITfz2YSXMak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C8TNo8/L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LLLcvpHl; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C8TNo8/L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LLLcvpHl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB7qVCh3892798;
	Thu, 11 Dec 2025 04:19:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1fIRGkoYdmwc0bXvIbRy5QwGIOmIYW/HFdzURwOaF58=; b=
	C8TNo8/LwQpfyHKBvGCNqQQp7xPh5eRI9BnNFHSr/s7FAjAdtNPfqQXB0DAlfZhc
	XrWQy0irBkO5gmpxM4kQ91fyT33H4p5sLfanBixObdDx2RQQEK4jXGyyGTZw9Kb6
	6GPVJzhuqWIl6a781Ig2Hto2m2Iz7laVIhH8Gfru4VDf5UcOU/g9SMbi5NHP9bR8
	8z1bGZgd/5ytTjqDP9s25K4bL3FQl50v/ZeDgGqJS0CEI9ZchIzL+OVKXtqF/XDM
	l4kYtq9/odtdsrAfC5u0X1kkabeBj8iT9+vUETvgzGsHjfooNmBSLVueO6hB+Oti
	02oNJfE3WzFQ3bJKalQv2Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020085.outbound.protection.outlook.com [52.101.46.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ayp6p093e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 04:19:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPaSdhNIuECVqQ0sUCBUdjJOvEqOb7+eiHwH2JcH4E2/omJckfj5vBFc0J29l0k1tFvL+3gOiUCDElEpZt/EzqOnUd3voWDFRhAmClW0028+zyhHXnp77WS3WsCOWmWGLRwA2szR/TuO/4vA811b+c/+2Zg1R9Bn/1IAHQxf0Xd2I5D6SkSNHRO5py+ur3ImunFtmrrL8WqM1T6RaPF5yf0E6cdidNzUQVzkDMIHCrVc2Gqgvi/5JVegvNeZXNiKTWRhrgpU+n6SSMQte0PEuOCHv46g7RBS6UZrwKQ6uaA7HLDUgwa45RS2FOKG0Fpvv2VcJBpK4XS1HgilLEC/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fIRGkoYdmwc0bXvIbRy5QwGIOmIYW/HFdzURwOaF58=;
 b=doTVNK9tRspTFOHgQE3M2f/sYrcLFs8LDwujE5lcCV04yJMT0xV/gJ0DZB0y53oA1VyO9iZt6eYjzdOR3iKUW8Y5+24YGG2VnKJ0i0/JsrizQ1IqEhgFEMp7R/4HN94Ojtv4sn4bRAPOJmS6PdVvd0kJoQH4u4+/8WhxswVMZPuHnPW6NgBxX3uRRvm9ARnV79daBLTRGCEmYx0XMKN5XDAOJGe3JUq6RodvV7ir61NwcAzoLkzWfAwYJk5JHy6LUgQLYGy5WJXcHLqyonBWIrZwv+6i76r+Qmnpv2ykZVDuZEp/WiL2NV3R45kZAuA1pcOnxNaya13uhD+SoT1G7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bradkelley.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fIRGkoYdmwc0bXvIbRy5QwGIOmIYW/HFdzURwOaF58=;
 b=LLLcvpHlHXWYNIH+ia3J3R3q3hFhGhpJqzKI5UFRB2C19e4HitcjVSkvaKAMxe7gh9qHJzamA1FJPoCOo39Cblmsjm8mAT6iZGcsDiwRJxbEK6Op78n41Oe+frU3JAPLtqCAE61hl/6liFdu3qN3Thd9CWSMOLrjgWeamiO2Is8=
Received: from SA1P222CA0185.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::11)
 by DM6PR19MB4075.namprd19.prod.outlook.com (2603:10b6:5:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.10; Thu, 11 Dec 2025 10:19:52 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::5c) by SA1P222CA0185.outlook.office365.com
 (2603:10b6:806:3c4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 10:19:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Thu, 11 Dec 2025 10:19:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1E8DE406540;
	Thu, 11 Dec 2025 10:19:50 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C87E820247;
	Thu, 11 Dec 2025 10:19:50 +0000 (UTC)
Message-ID: <9bcc59d6-027a-4b66-af81-2f69c84c3efd@opensource.cirrus.com>
Date: Thu, 11 Dec 2025 10:19:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Correct a typo which inverted the reset GPIO pin
 sequence.
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Brad Kelley <spambake@bradkelley.org>
Cc: david.rhodes@cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20251211051628.391435-1-spambake@bradkelley.org>
 <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aTqRXbdAaV++jdHZ@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM6PR19MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 11052e9f-9db9-4a13-81be-08de389ed257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzEzU2xmVi9uWXpGUlBBT0dHL2NXeXJla3Y0c2NDMExCWnBJTzNHTTF2K2lP?=
 =?utf-8?B?Tm4yam5Cc1dia25KSlMxcEJtWHlGcHN6alRpc05takU5T3ptS1lMVmV6UW9l?=
 =?utf-8?B?K1RCaGVORCtlb0ZsVGJneVNxSjRaZlNSMFM2emFBbUg5cXowbmlnWGV0L3V2?=
 =?utf-8?B?VDdpcko1bEh3RHFweTFDY3pvNlpiaDg5MFBzOGRTTExLd2pYVnY1QWVNYWxX?=
 =?utf-8?B?OUJtRUR4WWZhRDN3M3VYWk4zQXRreit3b0Jra0ExaTl6a2h2TEUrRld4Qjhz?=
 =?utf-8?B?dDhITXJ3eThzaG03dkNyYWxIT0p1ODdpaHpBS2phMEJLN2RmY3NTYTF1d2Rq?=
 =?utf-8?B?ZGVKMFh5d08vV3NPc3FWZ0pHVHFNVkhqTThuTk1wcGhyQW12UHhzeGozNTRY?=
 =?utf-8?B?VFFXRTZBT1ZyKzlhVTlpZys1TDZwUXh1UHJEbDE2bFM2cVo3R1NIVVJ0VGJO?=
 =?utf-8?B?em9Pam1zN2JwYXBCWkpWR0NsK1FISWJCZ1pwWVFQS1JyMHJEZjVwS2J1NndE?=
 =?utf-8?B?enQrenN3SzMwRDhBbEdxWkVvVkVxRzlNNGhXenoveGp5ZjJXL1B2RnBFNzUv?=
 =?utf-8?B?S1dCZVpqYmU5WUZRK3o1TDBMeGhkd3VYVWNYazBZRG5ES3BRK1VHNGNoZVht?=
 =?utf-8?B?WWdFOEsxOUloeWc4WFpjNGtqL2pWMVZaTFhsWnpXQjgxbXNrbFk4YTNsdU16?=
 =?utf-8?B?WHppN3VucDB2SDk4SW83bnpPNjVONno5QjJzbk5uSDJUakFwSTdOSS9MdkZn?=
 =?utf-8?B?TFIrNENXZy9uaHRtbnNIWm9GaFhLVUx4dlkwbW5iRHlOcGZzOUtNcmJBQlcv?=
 =?utf-8?B?ZHZhQUtNK1ZoUmRKNlhFV0llRG04Z0hvcXlrd0s1RlhxNE85bFBpaGwvb282?=
 =?utf-8?B?NExoTjFkQ20rbjdDQTRxK1g3ZTFSa0RnZzdYd3ZDVzNyczYvQXJDaDBreXJh?=
 =?utf-8?B?b25yRUtVSVRQWnJGaWJLQnZKZHZsU3FJYUU0NytsQ2t2WDg2SXdCRytaWTI5?=
 =?utf-8?B?NEtWNEovaVl0ZU9LSENhbDBoMVBFZkFjZ1krVXBwYXFVSk1EQ21VYlFZRDZk?=
 =?utf-8?B?Nk14OWtkZkxHZ01nT1l4eU9Cck1KbXliWjBHMXB4YTRxZXVRK3Q4bmY2WEQz?=
 =?utf-8?B?OVZxc0J5UDJvVkFmNnlva1g4bGluakxoQ0o2a3k1YzJMNFQzbG4wQUJSSTha?=
 =?utf-8?B?L1A3WDIvditjWEQ5Qkw2OHdRdXFNSTg0UmNxRFNXZ1REQXZ3TUlmb01hTEg3?=
 =?utf-8?B?N1ZMV2J6UjZhb2NiMWNCRzBkRy9TMFZUaHdHalJxWFM2d3hUc1Jlcit0TnVG?=
 =?utf-8?B?SHZNWEMyNnJibFM2RW1QdE5KdU9xR1Z5bllmWnBlSis0dUhkUGcyZnNlNHlt?=
 =?utf-8?B?MUhZd2ZTVmZwSTVIc0x0aHBicE4rVUt5WWl1Y2VrVmlIaDNHVHU3Z3Z2Z3N4?=
 =?utf-8?B?QjV6WkZhbk15MUFnWjQybmdzMXZjZk1QeUNyeFBGT2laUnlRbEFmNVFKM2I4?=
 =?utf-8?B?SkdudFNSNWV4a1NLaVgyTlZ4bWhqdWtSemRneWVjNkI4ZmpjRUpqcldkekk4?=
 =?utf-8?B?c0RZdEJrRjVrMlIxdU1TN1VJVWhzRG01MGlsZEErQjE2OUx3ODV1RjAvRXMv?=
 =?utf-8?B?aGlNdFZmbEJrbkY3a3NES25mR1NJN0ZYelVuOEV4d3oyNmdzeTZKUW05aUpj?=
 =?utf-8?B?a3E4T3JzMmhGTzVDTkNxL0VlNXIvUkFiY0NkZ0kzd0Q2czhBTEwyTTdqVFNM?=
 =?utf-8?B?dGNxajhldTkyV0xxQzhoaHN1SThCOCtBTnFSWElHY2ZZeGFFMUtNa3I2QzUw?=
 =?utf-8?B?OXViaFhPMW4xVzVxS1ZjUHdQcEhjV3FrbXNTR1k3NEJMc1BuQVpxQ1V3QzVq?=
 =?utf-8?B?ckhCOXcrYWYzRE9yQTZJOE9NSkpZSCtKVk5laThaT2s1TitRaWpxbE9vV3pW?=
 =?utf-8?B?OWcyZU9qcW1EMVJHRGp2MkN3U282eTBNV0J4K2hDMk1LQThacjNMaXI2dmFL?=
 =?utf-8?B?VEVHeFZlRXNVTUVTd3haaDMrZ1prMk5kZ25yRFBxVXQ0dlNkYnNsSnIveCtz?=
 =?utf-8?B?TG9nemdweXplMHhTQmQ1WFM2bmtWUlFrdW96dHQ4VW5kY0pWNFJrRHpzRHlu?=
 =?utf-8?Q?rjGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:19:51.5335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11052e9f-9db9-4a13-81be-08de389ed257
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4075
X-Proofpoint-ORIG-GUID: lz1rb98t003JsOi5PsOH2gnxG7ZwUsSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OSBTYWx0ZWRfXxDgpWLmnidis
 Qy2jZdi1sW7ljlAlsu8Q0x9AxzoEFky28aLZhetzl8ir5rSoeALwd6gQ6Jd+hyUneGH7IvObuSo
 puJ359WmK2Y53WG7EChF5YgSxr+DtDycW6hIeeR0W+KxXW3Gle4Bk7TRmdIkqcnpXmjopPqR5mk
 8q+rcYUHSuhJDW8vvBZCAl/lTIuKd7GIqCOYBJyp+QRZLpIqwstGqtlG2j4CiwBX+lKBtAo9JSv
 bMKiuAeAfUHDV7WlcqRkvaLQ1Ab8S4XUcAFqsmuncmWvm+ZwpM3iwat+CFP649bBn0tnaMvHjgo
 uYC2AbMlnFu6VuguRH26p05ZYXBXVHPgUb+3kL1rIuIdLamakCrjV5iPq4ww7azqdjM4wLEihl5
 c+eWKy4MtexckgzumZ0+UIdJe3ffCA==
X-Proofpoint-GUID: lz1rb98t003JsOi5PsOH2gnxG7ZwUsSw
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=693a9acb cx=c_pps
 a=NH0nRcagBPXjbvxaFUBjlA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fBn5eNUOAAAA:8 a=joqvGz6ZLMbKMU-SQZwA:9
 a=QEXdDO2ut3YA:10 a=pIcoXCkIC5y34Y1b8dC4:22
X-Proofpoint-Spam-Reason: safe

On 11/12/2025 9:39 am, Charles Keepax wrote:
> On Wed, Dec 10, 2025 at 09:16:28PM -0800, Brad Kelley wrote:
>> commit that had typo: 42d1178d223ba9498c1ed40a5fc243a43d35ec97 ASoC: cs4271: Convert to GPIO descriptors
>>
> 
> This commit adds a GPIO_ACTIVE_LOW flag onto the GPIO lookups
> which should cause the GPIO core to invert the sense of the
> gpiod_set_value calls. Is your use-case using one of the in
> kernel lookups or your own one? If it is your own one do you need
> to add a GPIO_ACTIVE_LOW to that?
> 
>> The original commit changed a 1 to a 0 and a 0 to a 1. This inverted the reset sequence
>> resulting in the IC powering down and not initializing.  Correcting that allows the board to initialized.
>>
>> Signed-off-by: Brad Kelley <spambake@bradkelley.org>
>> ---
>>   sound/soc/codecs/cs4271.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
>> index 77dfc83a3c01..348f15c36d10 100644
>> --- a/sound/soc/codecs/cs4271.c
>> +++ b/sound/soc/codecs/cs4271.c
>> @@ -486,9 +486,9 @@ static int cs4271_reset(struct snd_soc_component *component)
>>   {
>>   	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
>>   
>> -	gpiod_direction_output(cs4271->reset, 1);
>> +	gpiod_direction_output(cs4271->reset, 0);
> 
> This does look like a bug however, the GPIO should clearly still be
> an output. So keep this bit. Also could you change that commit in
> the commit message to a Fixes tag:
>
Actually this patch looks incorrect and will break things.
The 2nd argument to gpiod_direction_output() is the initial state of
the GPIO. The kerneldoc for the function says "The initial value of the
output must be specified as the logical value of the GPIO"

So the original code is correct: first we assert it (logical state 1)
then below it is deasserted (logical state 0).

The problem is that originally the code set the raw signal level
(0 to reset, 1 to not-reset) but now that it uses gpiod you must
add the ACTIVE_LOW flag to the gpio definition if its electrical
signal level is inverse of its logical level.

See the code in gpiod_direction_output_nonotify() in
drivers/gpio/gpiolib.c, which inverts the value if FLAG_ACTIVE_LOW
is set.

> Fixes: 42d1178d223b ("ASoC: cs4271: Convert to GPIO descriptors")
> 
>>   	mdelay(1);
>> -	gpiod_set_value(cs4271->reset, 0);
>> +	gpiod_set_value(cs4271->reset, 1);
>>   	mdelay(1);
>>   
>>   	return 0;
>> -- 
>> 2.43.0
>>
> 
> Thanks,
> Charles

