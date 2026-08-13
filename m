Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FBB23909F;
	Thu, 13 Aug 2026 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630399; cv=fail; b=B3YTnpqADQ9RgSjuuyLKNeMLhhlq9bVUmHN96i3Q0c0HvZuaH/16grk80wZNb9yRlKhFzlq0JF/cXbJdl/Rl3Yho7Ydg45GWJlPMAMvoHySjwwYoXBYLGVEfw54trQkO/fcS0bYpBxKjzxnKAQPlRQbVo8slWvdUcLIcosDASCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630399; c=relaxed/simple;
	bh=WtHfT4KaOC599URAQbF5AXgPN7/bWYrHArcwTQsydas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIualsWDVPMro8ye/Cqt1OjDi+BC0Ismfbo8Sd66Pkt9LfhoqXZZqHq/TEv612wnCj67VvC78tOMTfWirVvUQ45qJaGODGmkqFH97E0Gn2tzBiXRKr/ulO42/5jusc7kYvIBx1roo5eUE6RZVMzrEXbscXqZRY6P+9/9yQJ/E3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AS1EopQ5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gNVypyDD; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AS1EopQ5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gNVypyDD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DDIeTS3015279;
	Thu, 13 Aug 2026 09:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=g3kQPfW396A40gYtjeeP2sYwl/9Z4VP2ps9YwtMhcUw=; b=
	AS1EopQ5JWk5ZFSeNODELV1ScX6GBz+7cDKXxRkovA6/OFFn8qSDQ2j273ExaRm4
	fhSP6kMp72imVtsabPiy4ikXfu4obGVpHZ51g43bMpVTH+N3Z+4zIWOSswj+XvCx
	CVZR6roGI+iEQK85n8cclwISMeqbX4dJWap2p/rC7Il3fCiGX9QrcD9nTC0QDCbX
	l2KsvmwgmWTYkkFneXcEiOGwUVY4gQTqF0e0yuMU+9tDy2hoY3PfOJHyqqRz5HZr
	ohHOREEs7RZNsq2byHWhl/FpPPprBI76vdGGjtvhN03pAyJpUgItdtSOT6Mq7DZ5
	du5uYdTtKe8dWQhBO7SC/A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjtj8f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 09:13:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE6k7Jy6a0EZbPxVt+GCIdKP2krfFv8I/ImcC1QE3YXhHYFkdF97DK4ZVjNGOW+SWytYOHkLUq6d3F31BxX5EF+TKKFg1LEcMYrGCPqi9wyTAk031CY3cqM3vMWQPJOXponNghGexpeMKtKV8tg8YZ8Px9bYR+SNQw9VLaWHM70qnFAITL7AgzoWKs03FilMJ8oKlN7G9BaE6R+dmErCbJjS28/JGPWX23zOBij0ZsxKRMMTDiFESNIWCvfhweRuz09/QgJ+9BUga2iTsZlf440VO5mnarOkEp0h1cLA92YnRQNlVPVK0NBcVrDmBtbMppA4s86uldLISteyl/5BOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3kQPfW396A40gYtjeeP2sYwl/9Z4VP2ps9YwtMhcUw=;
 b=ALd9nZv5lk1tX3z7T41Tk/C0/wgHQsp7qL+ljm1oBlS24MUBYWythOe7wsrFfS7ylWfSskazcx2QD0tFK9OVgt9nYpUT/947dGOsgx/wMkc8Bq3YPgOnXAHvreYsGc2az2BjkZXpt79qdMF2bQUChXasaa6f5kF7tt8oo4/zGDnw7ePH39AZZSHoO1H0137O0KTb9o0kLqCxVUi9+KwXk7NS+4PrQukxUUQFweuubM7VO/ow7S06neLI+/0TyJ/uFS5uW+wgN3Qgsufgdi8djB8r7R88ebyh1qVunFqMjOYMBenXw2EFPU7bauJ/lAVyaJDJ3GswZ2lvC2OcDlBIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3kQPfW396A40gYtjeeP2sYwl/9Z4VP2ps9YwtMhcUw=;
 b=gNVypyDDr4KQc96nc+F9a9VthcnEp1Ij4tYfb9f8YVBf3G8tgeOvjb18ijUBWMXWzZrTHadEOV0ZWeB13pntpww46tIreTfPColR5YaDLwC731GZxxVEvtqioKk6P7rpfup7pmki17FYN0DJnqdYzpAjWHNGYPCRlwbjQKz+c60=
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by DM4PR19MB6463.namprd19.prod.outlook.com (2603:10b6:8:b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 14:12:40 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::40) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.4 via Frontend Transport; Thu, 13
 Aug 2026 14:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 14:12:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDCE3406555;
	Thu, 13 Aug 2026 14:12:37 +0000 (UTC)
Received: from [141.131.156.150] (unknown [141.131.156.150])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EEB06820247;
	Thu, 13 Aug 2026 14:12:35 +0000 (UTC)
Message-ID: <7925cb49-8b69-4006-9a0b-ef8538db319f@opensource.cirrus.com>
Date: Thu, 13 Aug 2026 09:12:34 -0500
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
 <ccd9a584-0f3e-4585-a563-e2c720e20b92@sirena.org.uk>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <ccd9a584-0f3e-4585-a563-e2c720e20b92@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DM4PR19MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d54349-1264-4103-cac8-08def944ef27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|7416014|376014|23010399003|56012099006|10067099003|11063799006|4143699003|22082099003|16102099003|18002099003|4076005;
X-Microsoft-Antispam-Message-Info:
	sgdZ785S+45rMQEeISpepbtUKFvQPLKX9n+IRcNgwxsrYk1gqdbG7MLC5Wrze9sTMKhfa6QlX+H5sj59z5rKsbcB13GpJX3CLu+AHxTluMfGghSILQiuAHeYk43Pfh2+QRwexL7DFdsjyRTV1QSOn/pPpzc3etLQMmXcsbotl3CSh271mG9jKVavS0cgT7KTnqswoaalHypBt3IXAAvbH9vHJ+eIoNfIzCEYuCmx6s/8LAP4qD/ian2TweVNZqBV8u4/0ZXf1zWCYGsxQ1cufs/m5R11cgbPq3KLbCYsAa0VqqxAXFR81PjjMDy8lpb3s7zE6ifJ7zQmkTygdaiSct1ZEV1yAZnkFweKyl8Nft+BTx/6G2HGOHecTdc005/OVts4ZfRvelq051NyAqEyLzL1AH7pDMir0WDrPJLYwh2K956VlPWig3C9fGpw/p2onZNejCZV1vfKVfdfRithqKmZhrFvTDRDzKjHRU0bwkGTt3OO3DD5ji8rVxeuILqay8ian/bazVUY84qQsQUgxMTceGcPANs8yqhY0gYWytbG4dDRMPNzk7L3Oz//v7/nfri2/l1K3lPfw4TSXtLvIAlZfe1bxlOyrGjQ/CC9mFKvDEZu3OIl6lv5+034Asg/djOhVfUOQmI2dbGaguUEWeOnq4aeJgMwyEtDlMdLttqiehfjKBlmrvREm+JNxbO5Pocl7Zinith6koB/W74lb4DpHiZiLFDdnQ0xPBfLYFsyxHB/4n042wQcyV4fjg7o
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(7416014)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(16102099003)(18002099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jam2sRTctMX2vcaZfPOhHg2K7m+ilzqMVxVKFyIM/warDPQf/Fk0cqF7txf4AV52ug44ul8hkmhcEiqGuyTTPbu/IwotOolvifJTpk3iBwZjuQ4GjNI0Ems6ZB1yb/mlypCH+vQFDNx954c2WJGx+JJ7T89nPax+cXY8Ruw2L3eHPRjUj3pCHsunudtx9+98ACbog8BTz7khS6jjXbPidFk2gc4eQJo4NAzpkXj0TOwI/0kKVy8OK27AGCjzhRWLYGL9qrabVfSKBOAhNFeHCNlL7xSVAEwx2Zb49ZmdBzrYHY8iQ6Ca7vlYs8POt8RZwZPienLWy6K3on/tD6kpb3Ss+qr5GFxBMnG2sAlh+gQSaPuzeEM6fOSD7oBWlwr71zuGyYmKdLIeto/zYDpESfe4K1VRJQuB5u3KZkCVJ2uiv29OK2zUGDq52hjXBqIp
X-Exchange-RoutingPolicyChecked:
	rFnjLgDaV2cEt/YFS5Vblh7IwrGq2Vgkx47C1nTOZYP+wV+EgUS6xc1F49NkLa49PEWFokghUvyw6uOuqkTBmOeO3FH2ChMXqN04hcnno6B7wBPRfG97laTiYXkmPQpHTFAZ/gH+XuLgPZHi4HUyIJwygdXip6glYGrPA9pX9VCW/E33NAcZejztq4Jk1rgfkKy2mbjl0hikOSJ5ABOTgA+ey4168/t5IZ5BTNiu7sMgAbSwu4zplMUDzTYMiZ+d3KH26jbPxb/V1lee5JEV2tSWKUF45A+iccKffbni1olPwB7Qjb4x99f4sQ+bMDaroZh+2Wo8Q+FHgWI2Myiwlw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 14:12:39.5430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d54349-1264-4103-cac8-08def944ef27
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6463
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfX+oiyXhKSlAxc
 FcmK1IMGZWYCIIZJ76fah3xlqA5fW0ENdtKSi885t2fwLzFt4m6BAYjInuVefFcKVzjqBi990An
 GBL18EFnFlbVCt/ARWMv4M653DOpxsaNY/EpkWVMO6WUaoCe19CLh2PfK03dJhJ7wtbPt0AGc8u
 Dy8zW7gAdBPLda0UY5P0lafFAMpwEvrPhqTZ72b9bSceCLZBQKsrX0A48fW47NUKUgIsWTKffRx
 xBLIACgM6LTvFq6rtLEpYhgUgztesTKmMYMxiJGz4xtJEYh1oFRC0ifP9DDpDb7aVi9neux2qvL
 Lkciw8NDWJfRBXe74p4W4z527QwJYRtTmO33/ofFRroloWkTkIdPcB8fk7BqxPwDQwm4xo9XgS1
 h0jyzCPp69fHdggYggHbooWf9NDSZ+EI4Rok2bk/Ai21W8h6pIi2ppAX7lm3a8Swlr+p4R+hwIB
 Z1myuZ692VGHC0jBmUw==
X-Proofpoint-GUID: 2hjN-4PHV-kaPgBA-01XYuG58CCmekBm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfX3przaPy2Ol1S
 oYnH7AZlCKNXOiap0V/tZi8j0OoMHdSNMnGjx81Tf0fLK/j968pzKYGNIsWzVZGT4+CtgOy9VvW
 nrEqvW0gpPWojza5uB/m959Ene8ohFg=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7dd0ed cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=C_kH0-bCbgVB2GTiXmMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2hjN-4PHV-kaPgBA-01XYuG58CCmekBm
X-Proofpoint-Spam-Reason: safe



On 8/12/26 1:03 PM, Mark Brown wrote:
> On Tue, Aug 11, 2026 at 05:06:03PM +0000, Ricardo Rivera-Matos wrote:
>> Adds support for the multidevice synchronization (SYNC) bus.
>> The SYNC bus is an opaque one wire bus that is shared between
>> Cirrus devices. Initial support only includes software (SW)
>> data packets.
> 
>> +	ret = of_property_read_u32(child, "sync-lsw-txid", &val);
>> +	if (!ret)
>> +		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
>> +				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
>> +
>> +	ret = of_property_read_u32(child, "sync-sw-txid", &val);
>> +	if (!ret)
>> +		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
>> +				   CS35L45_SYNC_SW_TXID_MASK, val);
> 
> These are namespace cirrus, in the binding.

ACK. The binding is correct, the driver and my test dtb are stale. This 
will get fixed in v2.

