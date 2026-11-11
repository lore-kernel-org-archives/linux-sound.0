Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794392416;
	b=x0FMBeBhQitsC58nR5TEydXKi+Kiop3ZUNHhZOT4dyIzlqOpkrzqCS1UMQsZNJ8sVGgr
	 0w3CC5J9a9/RmnXF/EXjtxBIv6po/IOqtPXRsIK8m1NKy/mnA0TE5WgiSx1Y5o4GQUKiT
	 vbkexKNZc3sCdpPy3akpCO4b1nU7nREs8UZ5veeoxKvSCjIsIpxRLG5mCY7YY4muNNWkv
	 S4rUzxu9fzzBRbBzn8/FLVP7CtX9C4Pw8gB29ad8U4dfh93gQjCYUXkdnYACV7iQm85Xd
	 zxaFMl/Mo7gCMfklAMiOZQhGdP1m4m9msAjiR+2gXhlePr1qJZMn0d+XJa7s5Nu2gmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=hvn2YwbM9VXDoxIXK7e0zZsg+bY669AGDtoX2IfBfl8=;
	b=YgXbXyw/4lXSG3szT2AaiQ7PUjkQvxBAHWuy20FfGpi7LSOtgx55BunZ9idTuaaOKifh
	 QfEEiA6FLBvux5oddC9QXjkd7YS5L8ZeY8xklFEOguE7B+9ZJOyGiXICyKfS/1U4av39E
	 6y5lwwC4sRaA7vql5QKu6XoBpT2JZB72VpAOa3zvS1cy/O+sNZvCfrX2s96tIZFKCXn4n
	 9QcERQg04mKxsN5mudbjMZH44N7sEYnbT1wKPsDG0bMH8d1Yx2KdF8dUzRNIIcnHqRyn6
	 MuHzeM2an6sNXXFhECWkMTR6SrAx/BCdl2/2n9VDOLzZR+t6j5x9ePzyxlPfQhDRCKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Yk5wJFNT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CmXLBeuD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA3606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Yk5wJFNT;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CmXLBeuD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB9nlI53447446;
	Wed, 11 Nov 2026 04:20:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hvn2YwbM9VXDoxIXK7e0zZsg+bY669AGDtoX2IfBfl8=; b=
	Yk5wJFNTdGsgpxzrZIAazDUnZx9YjrATAYZzeWabgSW7XBSNqzfEr2la8I9kTnXl
	mOQ88vzpZPOmNtw4KLUyL8AyDVOg5Vka8yngJqUhLiSHAYy9PVGCOoY41pE1DKdx
	1NHz1Zeyi3pR/XFHrBTMzaVa2Gap862N5tiPWmqhbNI6v+bUFahIr12hARZaUkAN
	rvBFZD1bXIG2Q+sDccxtM/P8Ja7NLL3Eg0A9/ueo4KjqqqfhcFVRbNLpbQesNXy/
	6pZtjjwqRcTkRUdy84pvmQQv5zpYouT9Q5e4YXrvpiHJG+arzv21W6A7OVV3Dyfh
	kqpRyZapUVYsQ/oMWvkirg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023106.outbound.protection.outlook.com [40.107.201.106])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7urs9fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:20:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyepvwQg77U8vJvz5XULT71GfI1zd8zKEepslPHPOVPdQh2j9sxC0TfAizlv0e8ZOHv/xw0R1uggSIsZyGfpmuEQuLAY1iWDjt9lOheQ3qlJg9spFG67rWDTAMYPBVnTmMHcEsIGh89L4+z4i2xLuO567OkkADT0ygmYi+wtu/CLc7BV4f+qgX61HN/3dMF0xS7r/RNXuSU1dJKDSdXEPT/RhoQ46oq8gXvkGyt2hmg8r6wv9Trg7AdFwmFRdlYPH3NMkcSNHgr/ApppW/zZuj/DQUzKim3u8RtbOo+sfKAucYUr6Z/o2naHxmlLzcoz8AquMc0Ibd8UCPKI1TlfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvn2YwbM9VXDoxIXK7e0zZsg+bY669AGDtoX2IfBfl8=;
 b=PFlq6pkzObSQ1yNNewltQwoe/FTJgJAyzl8zY4CYRcp4Q2knLXaMMLggcDf9akX+drmzdPQLI1LoAkDz142/Qr23/kAd1olXhLsq6y7zGTFK6Xwh5607+MEqY99sgneAuEWWnI/LsGQdNlzoNb3tHjHqzI2ank9800lOQ+nP1EDyI6RkYm2Sw4MPR6ccKLgg/e69funl1nWa5RzeYGgiIyJEcUJ3KM1arIIhoDLXQGssW4JZxfus/dXXJxD2qzyC4YUiJ5iDixcolWQ3HuNthAZ02rq/red+4Et9XXc7zy6OyXyqvPufDyLNwZdPhSJkxzgdBb/E4bJm5Ypy68Liyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvn2YwbM9VXDoxIXK7e0zZsg+bY669AGDtoX2IfBfl8=;
 b=CmXLBeuDRreS1Z6FNAs+T13uIO6V/fkQiwFdQnriFGdInJw+gPnSYid/1+T6zZMfS5szK9jkJG71izpNISyBQKyV6YMVxpfsX+bOTInwoHnoTSKKXHSxw77ffk5fYj2EUl1ThGpidDPTiei1Y2LUuJiV0FD8f2rTnk4vQlrqkX0=
Received: from PH7PR10CA0008.namprd10.prod.outlook.com (2603:10b6:510:23d::14)
 by DSAPR19MB868335.namprd19.prod.outlook.com (2603:10b6:8:51a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 10:20:06 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::7c) by PH7PR10CA0008.outlook.office365.com
 (2603:10b6:510:23d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:20:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 10:20:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 71CDA406541;
	Wed, 11 Nov 2026 10:20:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 59CE6820273;
	Wed, 11 Nov 2026 10:20:04 +0000 (UTC)
Date: Wed, 11 Nov 2026 10:20:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: NULL ptr dereference in cs42l43/cs35l56 on Lenovo Yoga 7 Slim
 laptop
Message-ID: <avRBU4NbuLEyygl3@opensource.cirrus.com>
References: <m31p8sx403.fsf@t19.piap.pl>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m31p8sx403.fsf@t19.piap.pl>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DSAPR19MB868335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d947915-5f50-4e00-bd4a-08df3fdd5b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	9r7WUX6l+65UEhTePcHMv//L7rsZ7wdnNBxfu4vvxshlfqTj2cMQCaBkmHMojBDl+SdtEovGKZEY8OODFUKV8QqFKJgM2XVoL/L57IWys3oEbPaSs/qDQPwL/c1k8VZ3WqxGTPlHwdrSqVtkH7QqSa8fpX+BJ2tNXGXZd9R8d/hbaEq5UOtiuTfXOIFx5TVw56USVljGcvA1WdmzpeBcnkJnmyiVakcCUE+CnIInv1/Iz3Y9NDGqHp63Yhront8mnkxoRp3MLAMJU6paHHpiuhVs4aKpTdoGZfEWfdPg5PxmyrEjx+4RNMqyOeNwfrayMqpG42MuZtqYTPyMLy0zez81WTBmO6QKOZaxa/kUbfZAwOL2EE6Ff/AfhS4nqlCIlE6VVPzQLlPjEO2FohIwGCRLFEPYDZsfSfepwtTwa1aCVc/5CctEGYTLbAWPl/Lwpp60g9U1rAPg/gxzDpLzTuqnPZGmk74ku48TJ004Lxt9q5+uLBZU815N9dZM/+SnUwasiP0P03UsdpHSEEAPKb/G5wXsLvl9Ez3ZHia/pT59KZqEM1CywN0ddRQnDKZR5FxBYtMdp4VhIrKvfMfxdUNdGVZKczwX327VohN1Pqt1ykg4N7s55Vp+UEZHd/UwYYqyt+usObFUS4Cz/k7P1Gu5bJFfwH93XElZhehaW8BJun1BnuqraUSpbke0PaAKyI1Rv2ptPOQGOKAWV+Rrfg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6IbmtTdMe/7Qaycg5EaxHwRqKhdpLk6GU1s65b2gv7Gu2H012U2ijUf21qMyf9I/B9hxrN7sy3RFRfMy18JiMI/MUW7+D/W+UtiNPLIMw+nmwsKZ2LoHkmB4Li7VK8U72TtZe7Y2QPwJ4hg4d6rxsAAO5CZCQ8NKp4leUdDkRMfqj+boFpxNU1I34wHwoofh6RnMfc2t/TJQx8gPhuPKTE6dWgDmCJXaEB/aqCcuK9DZazjv7y3c7orPMfP9EXyxf104iuRxPWey1UPXjklp6E7z52NrZpsU+PGBc3G5afXLL1N02nq6CHj2hUPEQKn6ahdnvVbD+B+GLCCeo6DLREdnQ3wCBco5sS2kLAI6Wti0yi67cOB928Yh3wEFMFtSiCrwkAhPfxvjKNTJr/pGPtVMeOtNt3VYSkdgNsC+Y5tZDDkQz3LN851fFOMJAgjU
X-Exchange-RoutingPolicyChecked:
	dDlk+o2tloU0BAZoZhaJIxYG5SAm3YsnvqDasU/k5zaolk0E67pT13NfZipdim4LYF9jh8gIGDq2Auwt54vY1yz3khX7F5vJwTT58o+ApKL54nlKViqhpkTTbZQGyU7zo9WQ4ajskIquMuAzLFpX8feXCca/fyPBEAP2fOHA5tykqibVyZh+JB1Lvfw91z8GQxId6sXzIWFRWTreP536R/7LzExIzioLWKtvpWoUl1u9+0MDbcjhEusDYEdgqXgYn/xp4VCG1MFjKuG+IgT1GUY9QyyvcpSobL0zsNb0rROHmrXMBCoFPp2N/3A0kpfhDC3Gnqsc5luHbAJJUH66pQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:20:05.6122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d947915-5f50-4e00-bd4a-08df3fdd5b1c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR19MB868335
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX/+fQ5xsuSFLr
 Y3VISWIz/Lz2g4OCBoIhLN/K6PggbJ/QyyQfGERubThP9kNqYMkkuyd0inIzl5/L/ImCv1JR26j
 90a026pNVdT5NPqGnPV6L+duGwjXeZW+K5uDw8Llf/T/9wgIHo8fbZ1RJJCKVshBICwxT2LUF18
 NQYTb1gD+A9NlzuOTreLhEanGieFe0bu1hsvCE60kfiZLF4/WP6I7/9VcLzBq8j/D1paMc+pLvc
 FPrv4erSwuFIVY8KZYq3Ns3Xgweq+bDgSPgiagHSlBEt9atx5l6ST9BxSnANh4dRbqBikVYCLKm
 lLfBDuCKrpPrr/f8FRRESzKPNGSs0VrNTe+s+5yKUs9ERpPnotVqJE5Sk5cnt3ldOayTANjLENy
 5/B5+Zvr7khvj6SQj1/n2GSC9O1U1GZglzgFdyFncIo2MhIeKE76R/JsNaqFnDuZ17DH9q/L86D
 4RnacbUyfdttHkLJEbg==
X-Proofpoint-ORIG-GUID: JZEtT985Eh3P-5BaDH6agbejXF4yfR9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX/jmRnhQFfcde
 c3ySfY6++LmeedSu14ekU9etYPRKsECbE1i+p3vBxOUfuindV6ygQMs+ofLEYKHSpT/gSTWT3n3
 foe6vfLqW6FjqQCAABisy5bjXGtlNec=
X-Proofpoint-GUID: JZEtT985Eh3P-5BaDH6agbejXF4yfR9Y
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4415b cx=c_pps
 a=wV8XywpTpdN/D77wxJdELw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Yg5Vrrcxu075lAPh7CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 10, 2026 at 01:30:52PM +0100, Krzysztof Hałasa wrote:
> I'm trying to use some audio on a certain new laptop:
> DMI: LENOVO 83R0/LNVNB161216, BIOS UCCN16WW 08/07/2026. Aka Yoga 7 Slim
> 14ILL11 or something like that. Also LENOVO_MT_83R0_BU_idea_FM_Yoga
> Slim 7 14ILL11.
> Linux version 7.4.0-rc2+
> Ubuntu 26.04.01 LTS.
> Kernel config is copied from Ubuntu 26.04.01 LTS test kernel.
> Lots of ACPI errors in dmesg.
> 
> Tried 7.3.something first, no NULL ptr dereferences, but it tried to
> talk with some ghost rt711-sdca chip, and the sound didn't work either.
> 7.2.x, there were some topology problems or something, apparently that
> was fixed in the tree.
> 

Not one I have seen before, could you re-try 7.3 but with this
patch added:

commit e0cb731652a1bebf962086f17d1b7c9d060cb7d6
soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7

That should fix the ghost rt711 problem and would be good to see
if this is a regression. Pretty sure it is but probably makes
sense to confirm first.

Thanks,
Charles
