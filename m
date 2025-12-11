Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C31930170C
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 10:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448811; cv=fail; b=WgZu9dG1EYeyW7R14iGUpLxSy2fGwDJLhbR8RrTtXqUaLLB0F+TukrEK6LQzxijfXyP0DUNGNXgxWfHCoNK5FY4yryx33BbIBRkX8X0l7beXyM8p9WvYe1TZ8cVT3MkC67tEx+A9jw6usH5B1zePoX4sFW8SsV+Q3Fq5ivb/hRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448811; c=relaxed/simple;
	bh=867TyvBDEpmDL6355EkdS6JshKMv8QYStFQ6ZXl5Buw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3u4iexmp0MDTar7NN+uGuRrfp7KiAS4dhs1ROLrE79MDVkKicx0zM5jwPPtuAFpgxpbfTQqmgUQ7lGORKEJjVFpAzTpNhAV6yUWHMY5y8wrPScHArPo8jH6sTeEpPzpV/lRyOCGBhvNS46YwkbsXdekDVm4v6/f4nEfzm5/aG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fGMKIKur; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nPyJwEqj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fGMKIKur";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nPyJwEqj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB5qfEB1155572;
	Thu, 11 Dec 2025 04:26:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1HIqpIc1Nax5A5aky95KSMplC+/hAewt0qOydDL5sJ0=; b=
	fGMKIKurig9VCera3zg2FDlnOADUU5WTxthmJMdiE/LkdtqXIukjPV44vtttF0jx
	/1QRdTB/yDZaQ11Usud6iajAD+e1+dHKqGpu/d8yY3LuBCot3jqzTT2H6lr3EZsl
	+a1goo/qNRLE/tn61ZXM7C0utBzA3yg5wNfp8mVHsZUB0VeDvNb+bW1P4Mi4qMu/
	rKBVTPD2A+4GRPGesXe+GTzTUyfxZwhsY8/TRaQE4lIoec4d+KPh2QBi95zjfonx
	eDRrq9IeQ8IewRIQYiRCdk/p3ud8+mbh9gdvLzcZLYDI0ViXdgRGiBQKsuwdqXw0
	saco/VcDDhCPiWQ6jTlVDg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022122.outbound.protection.outlook.com [40.107.200.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskucs3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 04:26:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssi4y28itL1Xtu2hrcI5NLXJ2mgpTWIH37b5yZ8IZPVYhm6lGeWly79QK10xhfyOQ88HZlTUEAr7xWyjyaP3kpdAaFhLDrDMJxKTuknmnQeOlJ5NOu6+2lOYc0YnQ2pO5u6zJomNF58fpnEsrXTl/7PYQhzROC3zktWx5UaqdoWpB0br3cx0LzNVVMTZ+JDjXdvm5Ia7qbZ97n7HxWrNhcVeRQqa6UPazilNYSZAAgn7Wv3ZBtl5C3xw/RPgGUTPIJAvg9JYSBJYR3Yw3wz9GQclVEz8Xe2OyHXjLxqaSg9iAwhnay2xtxhSojkf/11WmvaW+QVezixElv36Bd0OHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HIqpIc1Nax5A5aky95KSMplC+/hAewt0qOydDL5sJ0=;
 b=F6+HB9vNXqJqcgDN4NRd7ZD0xTqDRRNCeV6kjtdZ+A74Xh0BG3/N5UZCwf3hnXwAJ14rXdfJYkJXxye9HJ9R0hDKr891afSwKAgqMU1lB4HwiCdCErHRJ6boopprcsZX4ATJd/K7/kNVehiGaBwCdqc1C2Z5bC0h2puC0jjBs+kkqaMkrThcmLUrI99BzSKXzzciJn0BADhZSOAvdLOq4j1dbfPXafTK+bnWAPOhGpgXMr1APfm2QSEmRwRifvZvC0f+6oQD1Y4F1nU06+tHPO4cCmji4XVZfANljfkdy4fsf5SIgAeXZqjV7t1HIpVsvG+HZ68Q01uYaOkbd6/y3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HIqpIc1Nax5A5aky95KSMplC+/hAewt0qOydDL5sJ0=;
 b=nPyJwEqjjKcbGIcOLFPs5fu4CQvOwDaK0JZihWq4nw8HI/eIlLWDHlB/X/vJbDF/Jg36/qSb+N0NGqxgLG71ZzyF36KXdvYLLCpOcD8cHMikpDfHGd+zbmR4hfTFD5tRN5LlD2PsSAhImOYu0BOQ2yhgK5eeaTpk5/l78ws2pqE=
Received: from BY3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:254::10)
 by PH7PR19MB7434.namprd19.prod.outlook.com (2603:10b6:510:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 10:26:11 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::e0) by BY3PR05CA0005.outlook.office365.com
 (2603:10b6:a03:254::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Thu,
 11 Dec 2025 10:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Thu, 11 Dec 2025 10:26:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 09126406540;
	Thu, 11 Dec 2025 10:26:09 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ECF34820247;
	Thu, 11 Dec 2025 10:26:08 +0000 (UTC)
Message-ID: <b884881f-7329-4d9c-9886-821468ea1be0@opensource.cirrus.com>
Date: Thu, 11 Dec 2025 10:26:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: SDCA: Add lock to serialise the Function
 initialisation
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-8-ckeepax@opensource.cirrus.com>
 <9e306719-a954-4ff4-b2a7-5fbf4268929f@linux.dev>
 <aTmRXjrJceokKJoi@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aTmRXjrJceokKJoi@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|PH7PR19MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 91382eae-c0ea-4763-7b4c-08de389fb441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2hIYkNydHNjVk1mZ1pveU9CckNkY0hjSFdEdHhJMDVUeEV2YnJFRVp0L1M5?=
 =?utf-8?B?dkQ3V0ltWlZFYTMvell0S0lOblFsRkVqQ3A0a0xZRUhQWUZRNGhJWXFaS0Vv?=
 =?utf-8?B?Qnh0UjM2RXZRUCtBSWNPbWRFS3dBaEl1bTlqd1hpWUx2RzhhZXRjWm1uVTJY?=
 =?utf-8?B?QXhaOUtISlZZUFV6QzFob2pYazQwSEh6M1BQNzhFVi9QMTdUd09wNHVUMkJE?=
 =?utf-8?B?WVlOdmQyZHF0MkhKWm4rREhjM2Q0Mnd3TG5ldTZwR2ZYZTBpaVNNVnU3Z1o5?=
 =?utf-8?B?VERUc3d2ZjRsTVREWm1VeDlPZzJLS01CMjJTMHNZV2hSemNoRVBLd2d4ZXd0?=
 =?utf-8?B?TU5UaXRzL2pBWmpGVHU4dHJGYmJpd05ERVZGMk9nMmFJeldZVjBJSHYzQklF?=
 =?utf-8?B?azgvR0pzS25PZzZMK2dXMzNtQVVZd1R1S0pqaGR6dzdNbkJtVTZ0WmNrTU5Q?=
 =?utf-8?B?bDRkQkcxOU81SkZSSVRVdlBGeWptOXJJTWVDUUo3ZjZUYlE5K3lGWXVUM0xu?=
 =?utf-8?B?N2tYUDVmV3FlYUVpbkxEK0FTUmgrNnA2anA4d3pzRXE1YWx6Mlp3M3FUcXJq?=
 =?utf-8?B?OWtFNkx2ckE4ckpIc3RDQkhHV0RDRUhOQkw5eS9QZ3J1bFVKYXFPcmF2Ulo5?=
 =?utf-8?B?blhkVGNHVjQrbjRIWFdkZnRhODZxakl3YktkdnZtc29Xb0N0d3A0Q3RySmFm?=
 =?utf-8?B?NERUN0JqeE9QZkJ0R3ZScGJuK3pRU0RaUkYwL2EvV3Mwelp3akFTNks2SCtP?=
 =?utf-8?B?SG5zY1o5SlQveDdxYWtvb3pYVXVyZm1GL0kyR2lvWTVFVmhaOHEzQkZaU3JL?=
 =?utf-8?B?ZHEyMUJDUnliNUxkSUhiZnJxRVRoUlh1NFRiQnF5QjBVdWkveVFGR2oySy92?=
 =?utf-8?B?ZU5veHJ0bFVJZ0FDSUxVajM3ZW5JRnZWV2piRVNwaGd1dEUrSkQ2Y1ZJY0xI?=
 =?utf-8?B?ZUoxbFZYczlzRzg2blVMcktLclBVNkdnamZSYUpiS1ljdmg0RlQrMGl4dTha?=
 =?utf-8?B?N3NwelNIMGt5c2FvdFFkWG9kQmlnSXhKcWdEeG9iSFlkSDJyMzdjODJhM1RX?=
 =?utf-8?B?VDZNa3NwQjJveEhneGpEcENpaWVPTGw3M0VYamtwSlhKYmphb0U1cUpibTZy?=
 =?utf-8?B?TGU1ZlBWN2NmSG9zMHZ3SjFwZE9odzBLTnFIUlMzQmE1bnV2MG82Z1lMVW1T?=
 =?utf-8?B?VThVWGpJaU9Ia0dVbUZTSllqaDRhQ3Nha1Z2dm9nZDNqc1c0TTFSTFVhMlg4?=
 =?utf-8?B?cmJjcVM5QzlOWGp6RENSV0loKyttdVZ0TDlYeFRaY1k1Rm5rWkpwOFdVTnU4?=
 =?utf-8?B?ZnlUVWo3VGVKSzYxQTFmZTIyUUo4QXYrS1A0dWNZeURPb2l3WUNmeWNFVDkv?=
 =?utf-8?B?R0xMV3owU0pLK3lORGluVkFvTG9LekVjcmxQR3RESDZZL3RxdktVZlR3K3pX?=
 =?utf-8?B?KzdXWUdZSnBTVGIvdVR0dytXN0RnZXBxaTJVTXE5NXdycXNoMktrZ09JMVh6?=
 =?utf-8?B?Q3J4elJtSGlxVzJXTWxlbFFlZmcyWEkwb1U2aHVYVUJGWDRJRTJqc2owT05k?=
 =?utf-8?B?WDlGTVczdGl2MWtjbmxOWTFWS1F6UDh2akp0bFAvTjlrQm5xU1V4dlB3QlRO?=
 =?utf-8?B?VzZFaFV2Z1o4NjdVOHY2dzlzeWg5ei9VaEpZR3ZpQzMvTXNuZGdyRW5YbFRn?=
 =?utf-8?B?STIveDdTMjFtZVk1U09zVmFtbEYwV3Y5YzVLOEFlbnBtemVXcGhLOFhiQjNH?=
 =?utf-8?B?Z0hCZmdqcFg5cXY2ZExYVHYzZ3R2Y3JrUDFZNGpLelFyaXJJZGNDSkI1UjQv?=
 =?utf-8?B?bU5iWEFBVEpZTEdaRlJTNzE4QU9hUlhhaDRyZUZ0ejdLSEN1OU0rWXV5ZVIw?=
 =?utf-8?B?Z3hPOWhxNmpPNkIrQnFNUzY0VGRZSGlHV1lVTDFVT3dNYm55ZGpBWUt0N0da?=
 =?utf-8?B?c2xjSWtaZlFYSnFmMk1OUjF2bHFpb0E1SUJqdGQrQlpxT1JnOGZNRXdrU3g0?=
 =?utf-8?B?Ym1lTm9YSUwzeWVCK3lWeE1KV3BMbzBFd29lbUNzNjVQM0JxWFVnRHA5Tm5t?=
 =?utf-8?B?T25OcTNVVE5iQm53cFhkY2VMTldlYjRVTmhRTmhEU3FSVWl5aEFCcytDbkhQ?=
 =?utf-8?Q?aYS4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:26:10.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91382eae-c0ea-4763-7b4c-08de389fb441
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7434
X-Proofpoint-ORIG-GUID: vmy8A5cPEOYwB90W3s_O_PWi82z3ywYR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA4MCBTYWx0ZWRfX0R/Ic11Ecpj4
 G462DOxG8rY0gcKDVQWoUGObuemtmGwRE3C8CtBFHxw1+Ypwz7ri/rSep/foAkkuMDoh4H7c9lm
 YKxUzFTAiQZS2VckDjE4orVfe6lVEtdNyMD2nQTOLRi+qgYvBn52qbm3pJZt93xDLe9oBcCAK8x
 muytPdSVFuAX16VAO40J/TG+gzaK52DDzMFXBLgNDFfILJjsgkdE4JTiNHME6zgAXMmzFzV1ZCo
 KqQsaR2rpF8ynJ0fVkQj94dw/D3pr5DaXV9eM7nT+oxLN/AO44LQZnkcoKP4BvXNi+BtlLGjeIx
 xH267Uo0isQphNY2hwYYVA0lQoYjh1QmtkoMg79nd9r4f/DV3JSnDov0/s1fEdBQbjscRNhlbRl
 f7VL9MPRlIeBhkiCJHLsqR+6Bv91Kw==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=693a9c48 cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sl81LHkGsHVg0jTBmeAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vmy8A5cPEOYwB90W3s_O_PWi82z3ywYR
X-Proofpoint-Spam-Reason: safe

On 10/12/2025 3:27 pm, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:20:41PM +0000, Pierre-Louis Bossart wrote:
>> On 11/25/25 15:21, Charles Keepax wrote:
>>> To avoid issues on some devices serialise the boot of each SDCA Function
>>> from the others.
>>
>> In theory all SDCA functions are independent, can you elaborate
>> on what the problems might be?
> 
> How do I put this... hardware and firmware teams are really good
> at always considering all the implications of the spec.
> 
>> I can certainly see that it's not efficient to try and
>> download multiple firmware blobs over the same limited command
>> or BPT/BRA channels, but I am not sure I see the dependencies
>> between functions?
> 
> Generally the dependencies tend to come in from the implementation
> not the specification. Whilst logically the functions are all
> entirely independent, that is not necessarily how the hardware
> will be implemented. I would guess it will be quite common for
> the functions to be implemented on a shared back end.
> 

IOW: SDCA assumes all functions are independent, but it is not
always feasible to implement real devices that way. And SDCA does
not tell you whether functions might have dependencies. So the only
safe option is to be pessimistic and assume there might be dependencies.

