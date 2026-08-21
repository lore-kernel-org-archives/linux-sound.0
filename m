Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308E38B7D7;
	Fri, 21 Aug 2026 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787336793; cv=fail; b=bidzEVcyFwaSY7bOy6z3YiUJN9gnNsS3KLXMp8ibiUGBlN+Hx4IXbCFNCFE4m9lh+OJ39lpGwYLVNMgjChsasPpE6ptSavESJ04LKo/r9360zZJTImq/0+ufg17mnkLLHOTA4ZPr+BUhPJrH1wFGBfboeIT4gAECsndBSmYrzbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787336793; c=relaxed/simple;
	bh=Uh74crKI6emngi2U24+HlzbmHlAusYAs8+0L1Priq2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qL+JditkK/033tok5w5828P3+evzGtn4s7YXhSNLXbpDvKHg4E5n8tFljZ1Dpr/XsGaVsCmmGVAI9pGj7tL6b2qcDbJI7ISrheFVHdJy4TF0fTyUHf+IHFdyNSE3bWqqctZPrUfnD1iRETgS/hA64TtJPSIDDuj/x/eqNrjgAlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OFCYmAdQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=t2FhM1Ao; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OFCYmAdQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="t2FhM1Ao"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCuJlJ4001337;
	Fri, 21 Aug 2026 13:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=E1rh4lf+KKGAU+j3J3dkC+HthYxwbkTA3nfqdwcrNIw=; b=
	OFCYmAdQUhpRZG5RE+oK8N3GgYx9AzVZwT/aPTvPTsF9213CmxLr5CUSGnPQ5gWN
	pEr/7PYqcvl5e26KBLpIzyfkkbveZxGyu+6LgvPp+eeVVLUwyn7yP67FcAWSUM1X
	X04Im7liyULF7hm/FTNWoJWja4/c58H3m5Ov3fDSqcqrMeHG1KLohA/T43FypXOV
	owMBQ6Z1f93heZQqo+zqACkn74iZM7RJ0zddtKIU6Qy8z4Az4MYUxvDztCuEdgew
	JLbnplhNOIRIS4e+kBnnk8b4owj1nWFmIsYDHRDlnvrW+z5S5JEdDaDFUOqdAhkl
	xA4i6gWsd2O1pYg8AjLfEA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022120.outbound.protection.outlook.com [52.101.48.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g4ydawcpg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 13:26:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSmjgu+6u8FN/xUpRGkXwa3iIqoB7SAsKyfo4xdY2sp0EF40r0UZrH/hqSu1Q/CjvQbQrAx6aU86FjsyuLtK8K7dmd7iy+6lKUgFeiXA/6E1qtNYkGc68X2Nh07kju0s4e/y7pTV0+DEnGUVrbtB69Lv85/TxQKykLrTQw8hkBugRQdv9E1LG/WC/e9EQxWD7cw4YTYrXneejNGuV5rFhdt1XaFVTd903U0c53XP78Idbwj6GnIElN/gkEhFuDijKQzdXNDy21z1l40ohGWfPjjTkVp1R/yg/o4nso85geEqsHNB96+lMjj3tu8f76Hb3g+TpbqBc27K0hW1G+ViWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1rh4lf+KKGAU+j3J3dkC+HthYxwbkTA3nfqdwcrNIw=;
 b=IYLrvWIbdfB78DQYunDyYNpeT5RJFQmlniNU89BtctCv6fAaM0yfbBByII7NpvAQNCRncxH4pWkBXVOfi57cLQuj/OP+N22QyyKfK2dC16paqetRj+UrFKn25pKyX/SH4xhhLM3A3iJoPSU6p6bo6Fyzf8Ag4UPOVuOjZq1HifQPNun5qL8qond2MaJJTW5fwHGVKG6H//EUpyPheyC9cI41BcZZQm5UNHSHtIDs5o0VFoEe6uhkGAtJYAtbQBiDbfdH5Zkxab2TRxCCm8vy10Blu3VOz1SvaBZR6tiXvRbGApyfkiHAQ6PYh6FgTPqUVixmo2SJMmDN87vx0vIAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1rh4lf+KKGAU+j3J3dkC+HthYxwbkTA3nfqdwcrNIw=;
 b=t2FhM1Aoyt6i1R0VpflBheiPtG4A5yOoHV1xMj3vSP9jYLHYQ1fSMzYjjegjCnsH5Kl0cren6fQDqBu0y82SwcAK6TH8WcKJ0diHR+c5G9AAQuqcMmGj0aMSlnzujd31WOA+vTZ1RX8HWoNd8bBnpNozgwBnott+BQucvXFUQoE=
Received: from SJ0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:33b::14)
 by IA0PR19MB7727.namprd19.prod.outlook.com (2603:10b6:208:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:26:21 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::55) by SJ0PR05CA0009.outlook.office365.com
 (2603:10b6:a03:33b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Fri, 21
 Aug 2026 18:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 18:26:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21897406541;
	Fri, 21 Aug 2026 18:26:19 +0000 (UTC)
Received: from [141.131.136.144] (unknown [141.131.136.144])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6968082254B;
	Fri, 21 Aug 2026 18:26:17 +0000 (UTC)
Message-ID: <e21671ee-860f-448a-b669-7a9820fff8a5@opensource.cirrus.com>
Date: Fri, 21 Aug 2026 13:26:15 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Introduces MDSYNC support for CS35L45
To: Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
 <20260821160946.95258-3-rriveram@opensource.cirrus.com>
 <536cf599-5c62-4248-8962-45ee4be48d80@sirena.org.uk>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <536cf599-5c62-4248-8962-45ee4be48d80@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|IA0PR19MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 5047033d-dd9f-43c3-cb35-08deffb1b2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|36860700016|376014|56012099006|10067099003|22082099003|18002099003|16102099003|4143699003|11063799006|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	p2KzSQUMVTn6rEPhhulj3wweeGFsAczk2HnAxn3S/PkxHV/JM0qltN7SQhOmOizmPPYwjZLqcBIeakkHD3Qmf9Fv8s8hABuPz7Rvuo4Zup7AyFMMonhy9VzMqcMXirKn0jFb6Sf8Vw/bkOL1zQsMVl9vF0X92eZIfKR39ymc8wOkBYiqagfsIBsG0oW6Cb1tEfU4d2q1GDIjU/ZP3mwxVEZOGun4t4ARk3KzLnFPdidyL6440j9BDW6dCURgTsL2S2yM3fJe4HA8YzD76VsHU4EsnedSPzZ3SaqGvfZPljbtQpoI637o6ynij9oRbocq6D8vBpmJ/lKDC8KareNPjXZmS+xu/qFF1dVtWhPabUinHA0Hm/GOpArNtU+ePqgS+1VNLqSoK7l4Sh9C+e+8eGMBPVFrlh7F9TT3+g3dDDqUTs6CU96RzywtNIVMoVolNI8G5Wrmu5Q+68nFHDLfm8pg4v8M5AbuY2+Q2s3HLxd+xv95YksgsMzpy58gcOKp8UGYWgFrsf8qIr9k16R8YtDGNo00wKjon69IVkZDLF8ZuYaxMToqK62CC/0CXUp2OT/kfa0d4gtbVqO8YI9O09eazJ0LrI8qTV0pRNmgfSfen7WtZDcRZT2fX2v29z3M2TsvWXmNfQJSDcyxMW+s4LqLASVxSp55p1QsnMYKGlClSj4+Wtyvbq7WTBTMw+bkm3W1BCvAd9+v1uPvQY6kCVlI7qxZ3bEWW40u8khkIrWLxQ2xzbOMa6Pq6i9oiSsF
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003)(4143699003)(11063799006)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ckGBKGUQsY/FIXnWCXsnknG0Vu5XEzjIk0GVo8Vq9ANnWGHpg+wi8+YQh9YpGYP8i3uz8pWYxFjUw0CEDH3cbTttgwHJ94tluyVIuEYRtYqm3g7jfrwpEgP8Sdn1G+E+Aqvn8bfRuTcgGedlI4NPG20RQRLgTbFmsB6rrMYzdHgGTzNMVIOodex+Rt90dIDNcspQZMRJxQPgz24GlENOe3CNu+hRy6RWzxG7iphwJt9ZQcuiEPaKSMonAlZJvj9NSiCc9KuYEUs4j1EtMInE8xCpBsjSrILdY8zna0zFkfmJM16f4baKRLUI55F/F+FsC3acMXpnbUw4AVYsvMy0V3m2CWSiHnX0NzUV+WaZBkpjJIk44djf8+8hwGZbDDv5EUSVMit1frteHw/+Slilhfa43ZxI96JJTV00K0iRPXESnps1zkE6gILleibdSXSA
X-Exchange-RoutingPolicyChecked:
	rP1e1ARPALvtYENMv8erdPMT4PsC3GVUd2LTuRgLs47dNzDziPWW+pmbxwhViQI3g13vE1ngpWAus05EzkDl+HSWe6d+CrKx51TIC71OuMi/dQELSMAZLul7yMvkOqCltUoxcPwmgoUyb3j/Q5Pon5WTyKmQqqpE8jKk/1zVtvsCY+vUPUwD6/I7pau0grsBh+ITWplCZZwAG/MfmRV+LY9msaa8V6gkscUdV5o8WzcidA5cnbekTTw9jCKOPuTZVSZCOC5SoRbn35WbJJjr/AD8X5+UjDCmjq1dkEg2uqjzMryxqdsWPQ6Y0T7zVJLLhLJ1rW1UlnSAj2lOaNtxMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:26:20.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5047033d-dd9f-43c3-cb35-08deffb1b2cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7727
X-Proofpoint-GUID: iZwSIxz5iZF8WJGGwmTHt74s0tRCP_Bi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE0NSBTYWx0ZWRfX/gq8nwV6x8F8
 zYjyQuDzgd2jRSWT3VSGhLGV8zjkLkhDYVxZmUgbhyHcKNhVZTG6Q9JvtIgxBoGKYZK4vtgjIRv
 VDuQbRRiDsTdCFlrn9TKvc69HlaHXFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE0NSBTYWx0ZWRfX64/Cjvjf5r5g
 XfW6jXpmLAVHt2pioH8BHs5h5QKmTC/HiMc6VAt7sIi/fRI1X8uohbCYiyyp4z7y1eU8FRmGn/A
 1TrFe2fGFCtw/lahk1s7q8DI5nRaB72+9obzkE0HeuRN2qNIz9Dhr9gBGAWNGByGnNORJzJ4AmL
 kAyLZ0bS9tutp3H0ZAYJ9GMGod5ik4LgZFT+zK1W3dmwXSu56hGlOUqC0KsDfTLINFW6dYyzgIe
 LcQinuDZiqPy00UZFOoUd/6x+USydk+QmMLbIXz4WzYIF+gNmRAbQv5z8cH9CUccG4eB7jW0mDC
 Xh5fajj0zkQQ83efI7iw5hadoRbLSLd1p840OsTnWZBpAwd+aWSxRHYMGJfgVexOA6WFrTEJku6
 WE/GujZVPH8j7MhmIJxTpz3YzKx14sSDF7IolQTVDzTQuyDU6P0zPk9xl0IwZ+zEKuinXm/t+/Q
 dHL4+q3ty6OaStfQ3sw==
X-Proofpoint-ORIG-GUID: iZwSIxz5iZF8WJGGwmTHt74s0tRCP_Bi
X-Authority-Analysis: v=2.4 cv=Hb4kiCE8 c=1 sm=1 tr=0 ts=6a889852 cx=c_pps
 a=MceEdFpa07MrPAxPau0EtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=JhBqaApGcDuobU7E2k0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe



On 8/21/26 11:23 AM, Mark Brown wrote:
> On Fri, Aug 21, 2026 at 04:09:44PM +0000, Ricardo Rivera-Matos wrote:
>> The CS35L45 has SYNC pin that can be used as a multi
>> device synchronization (MDSYNC) bus. This pin can send
>> various message types between Cirrus devices.
> 
> Something is broken with how you're posting your patches which
> consistently causes your cover letter to appear as the last message in
> the series rather than the first.  Not sure what's up with that, haven't
> seen other people with similar issues.
> 
> You might want to look at b4 to send the patches, especially it's web
> submission endpoint which avoids having to configure mail:
> 
>     https://b4.docs.kernel.org/en/latest/contributor/overview.html
> 

Thanks for the tip. I'll give it a shot on v4.

