Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8147ACDA;
	Tue, 11 Aug 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482803; cv=fail; b=eud8IoYaLNz1bR4/txGdvdWlDwe4ZPiYN6XAOjjg89RxNSCrs9mVJsrCNZ+M9TPN3c4whVYM7krkd5MNxddcgsguf3ZrsKe/bLGsOoYxSD7+OLjhzkN66Uo7vCWeZMGWmlC8h9YyEmWUl5ca3xg7+gXpoldZJX/Wxd+HaUwXLiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482803; c=relaxed/simple;
	bh=tIMiwMt0aZG5+Hx4gYIeqmohpvbJ02lbavoo94PJ/nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+5+erCBT0cQLPpihF4Jfe8fMRtGP47BqJPXo0p8ykvPVupl2cA7BW7V/VQ19F52amh8O6yuBN85OMApHIoTbqvlXzeUP2yxDVX5tFCq8uYuMlVSwoKidCGYJCm+3jXREyT7fm6T7ao1DhwL54NI2Gtj0LGtdD059zAwVMDsvHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=If+y9E5R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iKHdvcAO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="If+y9E5R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iKHdvcAO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BHY1le1969497;
	Tue, 11 Aug 2026 16:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9oY27FyY/m/jzOo9z0vzF5VqTMM6HpwUNlOZoGlXdA0=; b=
	If+y9E5RjL+Ov9Z6g13FSzPJGnDC9DN5M0hiUNt4klGvpPeyWW6f/J3rXz47j5pq
	sbz+ezv4ib7SAy8KhFnnbgEiPkCJeKjpSKf3eC5uydBwmZ2i6wl2SNpN1+vtUGxo
	iE5xmQKqpu9TwgfJ00XahRWJYHVnMAACPNnQNcSnRvKUQYiKbMhbbnaErU7LsKDT
	WVNYOlGjS8YfL0l5tUjvZ2SqoHyY+ci036kvbGmN+UZ1R551fMbXGTgG29cu5/1U
	4OJx/oj+keq1LYXpPhK3z17ekcObSRx1tbV+hKSX9FrBT1KntxL12pgl9jKmZPRK
	kLJ2z32H3mAeFm14NCD1DQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021142.outbound.protection.outlook.com [40.93.194.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0xp9a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 16:13:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVp1z8cdUCq2XcWUzNC50jdKtY3YOHcSz5WGLcxx/ZoxeOJutzwPzE+Tj/Rs0ro6ZKzZVDJ0nMa1sZoeUpQPS9sqWzKFniz8ygTtjhJiEWPpEB3KE11MqUGvypXmUPWQvLe8F5GRhHJ0rEajn9gJ9pWZZWX//WtPTvf1dbc2Adjldx3gjVTkey2IS+QXgxSklAWxk+lgloXO3sPJllD2/+QCvLRpdlheKp8xUIhOryDkTC6Ea8uQsLppEC0n0ocCnyKbhnXRekLrNKjLrRwK8kIyB11ml2xXgf41UVlOV9xPRYmEmCUTEBLhz2o64mRlpBoy3yekh03D8cmFDhVwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oY27FyY/m/jzOo9z0vzF5VqTMM6HpwUNlOZoGlXdA0=;
 b=kwlTggwmKE3DUpQIIqwiTw2MiPgeiV965nFEXB6yPG/lkfyXplGkkcFxo3gBW3IzC1mq4PZ7bZW80uCIm/fOm/z9RKPacwRJN9RZ7VH/n9CV40RrdZYH2tuIzmfbfi4wO0tVFXGbGdSy+FG2laBe4FURI59dDbAhhjhI4fgJocAsyQyUN2rM1yOt4qUrrDXbKajBIOF9zpStMLjw/2SToKs6Tc8/Dpl3JTZecCU4EMQHvVvrotMvyT8ykp31DCq7k9lKa8GoAT+Txd/Z25RiU6uSqFKaD3nlRE1/yxRjgqFflgkq7zQ1C3/V4u3ESb9qqq6SSUoxiAHWeFeC3BWEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oY27FyY/m/jzOo9z0vzF5VqTMM6HpwUNlOZoGlXdA0=;
 b=iKHdvcAOjUV6fPFIMt1+KphW2T5MIVKRb6sY1tQXvj6dx20YgB9zAzJt+ySl95eIqehyAOu+hbXZEcgB7pxSGwLS685X+w9o7ftkiYUywF8OK2J6yCnlWnckayinVgTmJtCC5d9Dg910ICtF/Rsnsc4E3X1XQi4MI3iDdUFPJj8=
Received: from CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::15)
 by CY2PR19MB642174.namprd19.prod.outlook.com (2603:10b6:930:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 21:12:59 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:fb:cafe::47) by CY3P220CA0001.outlook.office365.com
 (2603:10b6:930:fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 21:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 21:12:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C5700406544;
	Tue, 11 Aug 2026 21:12:55 +0000 (UTC)
Received: from [141.131.156.158] (unknown [141.131.156.158])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5CF582024C;
	Tue, 11 Aug 2026 21:12:53 +0000 (UTC)
Message-ID: <b7cff467-cd3e-4751-a77b-48020055bb97@opensource.cirrus.com>
Date: Tue, 11 Aug 2026 16:12:46 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: cs35l45: Adds support for SYNC bus
To: Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
 <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
 <72a2051f-32b6-40d7-a400-c090dcddf7b3@sirena.org.uk>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <72a2051f-32b6-40d7-a400-c090dcddf7b3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CY2PR19MB642174:EE_
X-MS-Office365-Filtering-Correlation-Id: d782db68-8192-44da-3f8c-08def7ed5157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|7416014|376014|36860700016|56012099006|11063799006|4143699003|18002099003|16102099003|22082099003|10067099003|4076005;
X-Microsoft-Antispam-Message-Info:
	zNIk5awxiX0f9Nu3lmvng9Mrt1diHViYtTTVye5uC9YYz0gF5P5hN2i7Xs/tPQObOtQgF+bs3SxDzl0Bi+ZH67s3cfqlooQGeWrmK00pIglVZ31/UhEtn5ShWZ7oK87+nx8AeJPTOueybqklgaHDZVswtcxBWF7tkj6IaKPJT4Y0maeIODV6C4gd2q+ZDq7ZgXv7ORR/1h4o9vXxVcnIP+8SCGze38/48at6Cl86KZ2M4QNO6K1B7ElQGjOwYhHXguePHv7TLXldidbSj9tcImwnJq2s5oaWn9PDaWRtzoOT+fr1WXJBofiuz/uTMmuVJzatKBWn6YabzHfpaV3axI5Er7IUr2E9P7BbmjGB4oxp6AmkF6y8tMfktsDFsTd/4M+CJK3spMChph/62MMVuJs5jUuODbg2VE8zzePpcTf3gLpJ3AOgxA/oY+dtWsKxpfrHpF+0T3AyVOqZOnNEPrx6EZziS6DuAY4mxhUq0ysczd+cgiXMcRDwvc85cvwqSyDRvTSov2KvWKYal4AqjJMuKOwpE4WU9O2Z2v5fGYv2S1DBsxrhJ5tQcJM8MAfuhNh7W2tPKruhDRbgdBrfoV9BS0aCh+ggBprVizrpLrlqaXqtn3Aikonbot7BSmcXXl/YUGi89l7I/QED0XCq+gTYT7jHLlVUqX2kSCaE400lQ5paBuF6BS6cWZxuQaqpjpwpEgNZ+0Vtlb3IrKTlZyETDqqQVAUncHYaQe1IubiLamSBhYDM+kqOvmPoq3za
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(7416014)(376014)(36860700016)(56012099006)(11063799006)(4143699003)(18002099003)(16102099003)(22082099003)(10067099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lQTAvqSdpgj5czlV5oARNG+q4+PGhKxdoY6pitD3WobMe9X533Y7V0+QR9OFtzIdI0Xqgex84xQmq234ep2t2hZKqLXYgVb4646ogfgn9DwcnpavaoE/w1DSdfb7BrM11g1RmxOVU0tjyqbyCzb/6lMFVg7ZdW538GBtQj3cHeL/wWk/91WT0yyaxqj/4HNPV0BpZ0HTgUjFLaAakAG0KVauaGjDi3VD2flVZjLcR3YOxLF56TaIE8hrOQ4NW5JoF6EzG3wZYxw29auPpezDoZ8o1sLnl83Y/hT70mXFr+JT2x6aIbY+Bt0hDRF4a34Iaz2FA8dkxPbFOjDCyRQBuaWF2pUHIPqArhtc772d9eyeZUDk0dZxO/2BH5Wf4jhO5pEKy/0RX/SgK+CmajRd8ZEDNIyOR+BiWHYSo2ZbRTeWPs36OZi8FubWnuf2cKHK
X-Exchange-RoutingPolicyChecked:
	EBUdccbBVOl7obPmOpvvZ+phtOXJO0bb6jIugStTN2peWlUMI1FQLMxeWyuCiTsfxhpkmQRfsZ3peO/cAHJBaRr1SGb3QRrBPyjnLO/JIonLTl3DnfkfECMOnSuC0Dl53m4WRmBFsqoQXFGAYNVdpVQmc1ZZ0gCz213b+si409LXch2A/Fetzf3G1FJ7L+uocAaUmuJrkuBgSRotbZSUrUK7O4KNIkg9AP9DNJBTHrBTeXefEGRRD0KNh9kvjV/BMiH9IzDa/6mfyjTs0BbadRCTbo7xsrPbdRfFn6H6uPeTgK0egQKPOXmq5RhvjvtcnEbyZgkF83T2T2YcRcARJA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 21:12:57.4270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d782db68-8192-44da-3f8c-08def7ed5157
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR19MB642174
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE3OSBTYWx0ZWRfXw4K5XJnrgJtU
 mz1HuPYw9XxpWOylGnfaFZer7QqIDoO3gBCdlmr4CX6IQ9yLRwjxpN+gXw1DvNKKXugBY7Jd99X
 OVT/69VcWOPQXhiTUMAhjDox+UQUq0U=
X-Proofpoint-ORIG-GUID: SFhtmxD1b5DK557QOIwE321h9KC1jQF2
X-Proofpoint-GUID: SFhtmxD1b5DK557QOIwE321h9KC1jQF2
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7b9066 cx=c_pps
 a=0LNrXYcIMabMz0p9jkIKmA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=9FoOOS4VerFVLKYV_rEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE3OSBTYWx0ZWRfX5w26Fud0mCms
 URziCRiCMLQMKh3RjWEQ/BWoYUUgLQ77mdzOJRMpG/jl9P4EtUxVgwOKIOj+79iNvT4P9W6x7Wt
 NbWCzsKpLuHzDSF52ICoblEWQg2rHbB0unCrow17sk5E8wEGDfEGAUkDnXrAt9o7T9eTcS6vVOZ
 mTmWmks6wLpCNeKLwgrfA2J9ivVeR4OrPH2PZyvJ8ZE9gxcVKK/21dZMzape6pA3FYABcj/OTPH
 kCM4hRy5ZR5p/xcwiCn0oSYQZ1gYOIqAw0dC1CIWMKnnMBM2b/JjZbD18DCTW4K7/Fxx0xSvq6Z
 zMSEpYV+Ma40B/dH4rpHmijMA/8l4g2q7nXQ46SSn0QP0DhV3W7bWer4wvhLnj37eWawSHKpooe
 FLHkKJaqMfnGn04nLVKnRgGE6PTWZuEh7I/R6xTPzGt2wGSQF2+qwo3ZmEbceSPPNAqY3o6R/RX
 c4i4MDJxWR2hMZKXKrw==
X-Proofpoint-Spam-Reason: safe



On 8/11/26 12:24 PM, Mark Brown wrote:
> On Tue, Aug 11, 2026 at 05:06:03PM +0000, Ricardo Rivera-Matos wrote:
>> Adds support for the multidevice synchronization (SYNC) bus.
>> The SYNC bus is an opaque one wire bus that is shared between
>> Cirrus devices. Initial support only includes software (SW)
>> data packets.
> 
> Given this description...
> 
>> +	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
>> +	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
>> +			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
>> +	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
>> +			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
>> +	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
>> +			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
>> +	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
>> +			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
> 
> ...it's not clear to me why this would be user controllable.

This can be use-case dependent. An example that comes to mind is keeping 
similar transducers linked during a posture switch.

That is to say, on a four speaker system in landscape orientation, two 
particular amps are acting as linked tweeters and two amps are acting as 
unlinked woofers. When rotated into portrait orientation the linking 
over the SYNC bus needs to be reconfigured to match the new pairings in 
the portrait use-case.

Ricardo
