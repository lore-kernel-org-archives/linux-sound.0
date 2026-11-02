Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793616477;
	b=r6bNcisO95POt9XaJlrdCWAhO7OGVRktp1G8OHMmz45CV16R5L2kZ2Mk9bdsz+uOsChL
	 gMfmOQDsmMNsGYAnaJ7D5wAYuwJv6Div1f99CqQBocL0oES7tTYmK0lZ55JcPnepqUd72
	 6eEdcOjVeXmFhWdUhUzFZdbWBWcfZgR3P2temFdx/UtItXp7yI0FN580jCrh8UL+ygwrw
	 gPTZpeDztrJuJY+YUSkpdHcGesF7w8BJLhLtbMGFRXKd92Sx4eNEMDbfmSc3zg6++q7Tq
	 E9UUNxtN0CfWj8Z9NMbHcWrxlcVWrDAldd86ha7HzI2NEO5Gj0HoMyH4ZITnjDU7CPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=t1XBeVwblnLfe4umu6pg/u0JixseDJFaOXazNyfF748=;
	b=al1AD8f+L/e/vYx1G62EWZWnPq5b4j0OT7K6D3hOPEyZ2k7lU+2cgpxL2WZjSuTIW+GJ
	 xPiKqpF7Dr5I1Lns/5RkRtWYebY/7yGSipYyncdwdqfmTTC0IcuNB6oiHtJ1aRB1voHk8
	 zW7iCQT5JHvhL2RoIkj/uITeX+7McymvGgQACX7jeoKOjPEWdYa6XpCI/v9b5A2saEOSe
	 zpzm/8kZbN+jrzaM8xyMJUiaz38erF1PZoRny5kGqrSvwzY9+AwjsWg1GC4z08Z/kg/JE
	 KWDtaNWGX9i8+UlkEiJZfO4dPWO83U2w41hanFtvOCrZ4qLLDKUzgL1A/hlOqjKKLGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="j/O0fMlm";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bwKNfjBT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3E60A2605
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 10:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC3E60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=j/O0fMlm;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bwKNfjBT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2AN5QK2666461;
	Mon, 2 Nov 2026 04:47:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=t1XBeVwblnLfe4umu6
	pg/u0JixseDJFaOXazNyfF748=; b=j/O0fMlmX7Jh7d3tucdUiFEPzH76siHsOs
	oWJmbsceqlPhc+N/L4vcl96q5FYs3RVH0O+rW2ejocI8l46BhcM+hyPyWFcMa2wo
	v8sW90X7QW+Lgc/oIlS8KlS6/K+8AWzAL2k/zq882laYlZ/w20jAbKRvUaeUZBfI
	9M50LMtgiurzyXMl1spA01GtEKp5pnvMKOvOSNlM9F6d3oN/1zsRywBiZmCFUYxq
	wi0apG7KFb1gEFw94u83Z7IDBOXE6dkiOzCOTrHYe5k6J6l5qunAJiqSwoGFAtZc
	nMXp4fLpmvrHW/X0mc+LpnfeoU8vh8CogtJQIcvdy+xc57u8UHiw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021119.outbound.protection.outlook.com [52.101.57.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrf9pqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 04:47:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCtEKYi+6f+shLaBvjc5Tt6SHWRnx1JnagYfj4ovOVVXUptuWTPjJbk8syZF0r1X5cokkbudfoHFfDh/s0+0BZbbwr4A57hYnGSuIslXY91FlgUmMG+yIEGA+r+uvHAp03iPIE+dF5fr+80Kg+l0g02XxeIGunibxR3mxAVfoxip0FZpiw5EzQqW8SHAtkehwSK3/IKV6us/BUnORIGV5yEPvM23oFr1ZOHNE9TMKPuARLbOM/HTj6x+k/SIJHye+tPcdvCt9FtImE5UypwE79Uc1yvehqXyeQarhBGBlczE1FUMsAZKmuGnIxwIvyvObKFo+4/XptiOxvVsHCK5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1XBeVwblnLfe4umu6pg/u0JixseDJFaOXazNyfF748=;
 b=UfWcnv/AAXZvpmU5Jiv6e/ajYFJLRBXmxGjLg/qUUD4mJM6JnesI1T7kuODe5tYM8PEGFhYyZW6y0Va3Axb8Qf0deYDSWx1nlD0u7PZatfgD1YeMUo2JSj+NXcoimd5gn95lthOm4nhDLRwhdg+YUgODj87O3zF72EEsTlgLuU5Ytf/YbFCngUPFKl8eok9V1tX+lAdlUVI2wcYjrGEnuNU1fb2ErrdZHTHWiUbOkaTPdxTgdzULjLA/UtyhyEYuwFjtJhpv4uyi6EUfl7OiUNilf6K6rYM77hP2UAqweMRPjZbRL9yNbuu3Q1EHyDH31NdcPblJG2B0fDuOSzM8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=protonmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1XBeVwblnLfe4umu6pg/u0JixseDJFaOXazNyfF748=;
 b=bwKNfjBTz6BQfPZ9osZYvECplJf3nxpBKh4x/JaAKsB7B5y7m0YVc+zjJFA8Z7HyqdM6fivFQ2h6Hk5ZTOi0F0IbEXMtFQqTREnkTxhQDWGZiFoXf1ORRetEpJs0DwpNxVpqvFUiAfryvqSUFgH5bIX8pzc9sQM9qSoxLeWdmz4=
Received: from CH0PR04CA0045.namprd04.prod.outlook.com (2603:10b6:610:77::20)
 by PH3PPFB16E4B5EB.namprd19.prod.outlook.com (2603:10b6:518:1::c46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:47:36 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::9d) by CH0PR04CA0045.outlook.office365.com
 (2603:10b6:610:77::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 10:47:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 10:47:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F3601406544;
	Mon,  2 Nov 2026 10:47:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E024582026C;
	Mon,  2 Nov 2026 10:47:34 +0000 (UTC)
Date: Mon, 2 Nov 2026 10:47:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ned Blake <ned.blake@protonmail.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Lenovo Yoga Pro 7 15ASH11 (83W5): constant hiss from speakers
 during playback, headphones clean
Message-ID: <auhqRXI16ubRPCo8@opensource.cirrus.com>
References: <j42YdZOPMn1UBkfj2HTDC9cUW9vO0S1GjRdS8xTrWu35DTCOKAoa6gR7N0ZZF_JX_6_HOjF1Pj0PFqrmMsSlSYTEVNa6IW88dq8caB07pRw=@protonmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j42YdZOPMn1UBkfj2HTDC9cUW9vO0S1GjRdS8xTrWu35DTCOKAoa6gR7N0ZZF_JX_6_HOjF1Pj0PFqrmMsSlSYTEVNa6IW88dq8caB07pRw=@protonmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|PH3PPFB16E4B5EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efef827-16c9-4f3b-4020-08df38ceb4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|82310400026|36860700016|11063799006|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|10067099003|16102099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	cyHwYBzjeD5j4VDpbmje4pRJ5LsuupGZmnTSWhF2ADFgzELsRo7BcJjaPzbzWjc/kDYf1vJH5pPaEWGmahj0cn5R753dDQ4kIz1qXhg/yxQ+yQbZ9GZx6Gu3nh26lXcR8eeEb252TMBoHNi5Yz8Y01uzEaE7fkUQ7F/s5eX02FEa7cHX+pjfrJxFmJNkDefxQHsRIHkjch5H3mk7SgRLUNgZcKAX8wofWMH2v7zMW06TIUWwqDAaPcgzWJe10bZ5UrFADA5vyd2HI+fVMTaWv21FRHgiWAUg/KYCAUbMb+22IgtB1BaLxxKoZ6Ffuc+2IQzW54v641WdeH7pvyYVZoQeFxKRyJcd5qOM6IKB8Z1FMTRhpgi3xHvlafqzM2XJ8xY2EFdfINFd4qYcTb2PeIUVZ2C1DwvZ5NUm2N8qNGAgdsIGIF+V8dIx5lthCmLYHCmFJ2xK2RObTlluvuxw3B9ScCxT9+5SC407kdAcG2U1d/FvtAL17zb2Man3w3KQmz7Bu8G6CpwW0x70CqMIWiTUcaV1ovZdZUFrK72vtKaZ8g7+JNN+ZHbKuOyVlODy2ZE0S0PgRQegV8xsKioLOHdJMdYbbQL8P7ifeedJHnQSEbN9sJ8QrAzourFhs7fJrufrafw8oZmUS7a141N1IA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(10067099003)(16102099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uSahObIih3Ob0oFn2eUpvIshHB84MG3KU4RWeXY4eRnr8uvwwJEmKmYAUSzdeGYQ+7SnxizZn13puBhVso23h91o573ZAkgDSQ0JRGbftyhg+FSlKRAuRt677I9WM+2P16Ngvy1GWvXhOY49yiZgdg6QF0ad26UxGleQiZqbquPPPgP/sWYSVSM8qLNccmTSHFdGU0gFyCqoxTB5oP9Q0bu+LqP1d1dcAKz0tCS9P9dNzatsFy9UyqxzLMJNXIRCfc1IKET5RtmuwU7Lq/20hRURQRgMk6PdzIykeXdXPV3QLsBKxDp1WvbmGvXkCC+b/0v0iQUkzHaPKXbdbi7BzZzskXz+wffkv5j05vS7MdUnsjWbalqjweSwjFTQgZ5v/QL/Ivl3AZM2RdOA4R2g8OIz3+0uMaPqgX8f6BkVoV107lkPoSnjKeGTY40vx2xY
X-Exchange-RoutingPolicyChecked:
	UGUW7z05CNrT4IpeMVRftyjqP0huTIdKkw2pa4d1PeuLl4IxI7nMxu8snS6j7L3r7CSzNqEodpaU3jMx9reCYyYwn90yTYMpQiRJOsel0w8cYF+BpugUbzsyUvs/TEAdyHvLVZJiT0sC7o8OpVyuI9twPKyj24tjmhRzbYdnlovNc4hzKOIJp2YI47pMWPA2KkoKtuYqXanTUalNj+KRAGr3G91HvJLuCxzoT3iCC4bO39ZftuuxP3xll+bULC3XItkR/4RO7aMcOtCm/aWi2jrxHXzhq5kZxo+/S1r2/7ueEi841dJrWQ8Gca1FEAePkHuQH5heKZQYks05kh4lWg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:47:35.8019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efef827-16c9-4f3b-4020-08df38ceb4f3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB16E4B5EB
X-Proofpoint-GUID: aqgzlC4h9yRRj_2XvemjdbK1nFNndPR8
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae86a51 cx=c_pps
 a=iRxRSAF+HohKiaZghI2QEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=7CfkJBqIlPHRergTP0wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: aqgzlC4h9yRRj_2XvemjdbK1nFNndPR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzNQrHEFxMXLe
 +KuSsg9mS3Uxe52ToC8DaaKHIm9t7W4ZctlxLR5Qdls4ywmP2ZQwYWjK8FbOMUQuvvetFK6x68H
 C4giRJ8zh9ebCUm7rKNbzFq+rguhiwj2a22E0Vhhyyx/GdPixrwzzQTuLP1mJQtkb6WaWYp0G+n
 xA+U5RixdNbSODqfaBhusAI0noTjSfn+jSwRabjqGGZSYG2qTDm4PyNSSmSefz8iyCWz3YnLfrP
 DkjKtULhXijMGb+HRg9EL5ApYtPRdrIou68W5E0Wej20Bts7lZ1qz7yjCW3BuCZoWzn+LVWZrgu
 KCGlj+U1XWCVTRMi0wVCR0VRHT68nLnEa4g3D9iAv7QyIbXDbWtBmyW6BKFgkjm2N18c70NL2hM
 A+nBsCRmzzJIljNvU2ruFC97tT91kXzBtvLRc/ZljpbevWf6HpkA/Y/23tHvNPmEJ5fCH0u9Now
 4i1g32nkN8J5ftY18rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXyPXO/uRmlVEc
 z0+DSHGyuoYjvUOZuini8VUABj95hEgaCvYnhxwHczxpESxhz26BJIBFYMPDlkj2wgwT892M8wo
 bZlc+m8XCBCK6dEhrrg1Qcmj7IW4y1o=
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 30, 2026 at 11:44:02PM +0000, Ned Blake wrote:
> Hardware
> - Lenovo Yoga Pro 7 15ASH11, DMI product 83W5
> - Codec: Realtek ALC287 (codec SSID 17aa:3960), PCI SSID 17aa:38fc
> - Two Cirrus CS35L56 amps (cs35l56-hda, firmware ...spkid1.wmfw)
> - Kernel: 7.2.11-ogc4.1.fc44.x86_64 (Bazzite, Fedora 44 based), PipeWire 1.6.10
> 
> Problem
> Constant hiss from the internal speakers while audio is playing.
> - It stops when playback is paused.
> - Its level does not change with the volume slider (tested at very low
>   volume, e.g. 5%).
> - Headphones on the 3.5 mm jack are clean; the speakers still hiss.
> - Persists across reboots.
> 
> Observations
> - dmesg: "ALC287: picked fixup for PCI SSID 17aa:38fc", both CS35L56 amps
>   bind and load firmware normally. No audio errors.
> - Muting either the "Speaker" or the "Bass Speaker" switch silences all
>   speaker output, so they cannot be used to isolate the noise.
> - Auto-Mute Mode is Disabled: speakers keep playing with headphones plugged in.
> - Pin routing (/proc/asound/card1/codec#0):
>   0x14 (Speaker) -> DAC 0x02
>   0x17 (Bass Speaker) -> DAC 0x03 (same DAC as headphone pin 0x21)
> 
> Not tested: other kernel versions, changing AMP1/AMP2 gain.
> 
> Happy to test patches and provide more output (alsa-info, full codec dump).

Could you create a bugzilla on: https://bugzilla.kernel.org/

Attach an alsa-info and make sure to add patches@opensource.cirrus.com
to the ticket.

Could you check adjusting the "... Speaker Playback Volume" controls
manually, would be curious to see if that helps? My gut feeling
says this is the I2S setup being slightly off and some quirks
are needed on the Realtek side. But that doesn't quite gel with
the volume not affecting things.

Thanks,
Charles
