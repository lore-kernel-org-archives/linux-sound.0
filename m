Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025835;
	b=Fiv9fDBgOnzrIyW5XCcN4R9V4VUhEuWX/sSSSf/rxaN9ehg3LyTZBMMN3EpRZ0Skkuz+
	 DTpcUHdLq8rL/CT+OFIPjx9Fp6s/Fww2w1cLpaHp8XtyCuVgYRVHX0Rin6H/FixkQ346F
	 2AQNatOEUvHl3fc5XZDzGzrP+j1W7T4mvuuZAZKR08yq38xB7N65Qf9pC+udvovZBmR6M
	 GLmyuG+C2no20zYPgIXqd5mltJBBwG+nfdCRkLWl+NZzxmsx7v5K+TrI07MMp6fOUX+OY
	 mBz9fG0qJ0zdxmq4Vsu+kOM0GN/7S9n3YO5Gn9SZDcaWwg7AEi9PhhifY+1zbYwTJdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025835;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=jkNk5nQ6Vrp9FaZSFXT/eoAQDoVpL6TRthwJXY9I1Xo=;
	b=xEsRpV8hEGVm2dJZ2v6wUqIN8gTO0gIXttEnyx2rp3ptQl0U0/6QquCzbz7j3NkAfrRe
	 dyBCn8C3wx/2y9aZ15/izcqkvagf234wBTTGVQ0khgs+AzocPtD5SSoMuGPHTaGGIwLPG
	 w3m4Q/F/EztQxfarpIo7KR/ZTF182038PXxbXFmL8MmM+lJOTqN0mWZkcxhxaoCa1Uh8y
	 H0CduhfxTje9+j4+ROi6sB0BLPg3CZb6tjzfPYh9/9LdlCRffRTeIb66xoqq1laIjcSrW
	 1wkOQkdXnAXcv0s7Zx+y1SP11NSIzxnDGDpaqbiwrHqng4lISmIKRFRH/02gk7L4LkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=o3RHZzM+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cRdjF1mB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D39606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 14:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=o3RHZzM+;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cRdjF1mB
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCvX3F2470169;
	Mon, 26 Oct 2026 09:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jkNk5nQ6Vrp9FaZSFX
	T/eoAQDoVpL6TRthwJXY9I1Xo=; b=o3RHZzM+W8pWOnCGXxJAxgJmVcEtxRGg7q
	q2PlpGI+GKqNrX6TGH/zEAssvCfokKSsUqmbF5YdLX6e52b+O3tF36Z2OSwxyc1B
	5xW30nfg7cPAZw0ePXMCHbFVQGEXUjVJi1VEJ4UuvesDyUGEiofGRVfLzqpTKq1X
	5tqOlfTJiwP8GfnQ7bIffJp6qhO6jZMEobX8ejRwsowcLVEj5Ws0B+nf/XvVJrfm
	obwoqA0fL+MnmEOF4IihYrJXCYZ4/iT2rhPA6IYFTuU1F5IPuaosZnhBo7xjCf/U
	OV+v2aWcjiEx8VlpzQi8Sg0+FsMubvV276H1F6+b82nSIC4PpaXw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020078.outbound.protection.outlook.com [52.101.193.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hgs3jaay0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 09:43:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p57BgjrNW+MCJ67DJVcV3PvUCkwgW4czcj5z8s3C4kQHDnUsdlws/+f+YbcVKa4g9Z4bigX8ioPYq+vdJi39LjWrm/wE4Bu8UlugyuCsgghEjfPPPMiat6ZqbQoxVmp2AVgfJ3wlgCNdInDoSUH5TDCZnxKWcWRS4fr4TlZKGq6h5KbXDyJJiJ//lu6+Jr5Sv4vDjyUh04CYStPQx/cmQJQYuc/OcrXSal1XI/7bscfoMe/doWWLoeX+nXzSYhMHgjfzJRxRin2v7wP1Scw9OTvMYr4c6MAdFbM0gNZots/ZHuM3GzJt0VXeSenL2caYBsZCbQYuOvmrXi0YIz6E0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkNk5nQ6Vrp9FaZSFXT/eoAQDoVpL6TRthwJXY9I1Xo=;
 b=MZYTkYiDDbGKxoWpi4autDJ0w10vh/2DjEDCugbZP7yGGEKDyTfbRFaApCienW2QGA0C7b2WBFCUG9OAwG9FnZ3q0WNgDrHEm4C+vuv9l0tnxItEGxKLtQGCVsaP2BdB6Hva9xPheaN5wkcc+BTySSOEJ6ji/8mMEZ9lVkuEuRWDtbGvNtMxEv7dVNxlUbA104MjJ06kZrq+QMH4k2EkSxAOMqcxyRguakIE+QoUwW1XMnU4QNCsEXUlILizy1KRSK0v68W9VDIAnwNwFJqIVN3gIHkBNCvfkC2pyY5uiXITbRQZiciil9XZ3QsTZ1l1x/vFiAgX6QjaC8mHGly6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkNk5nQ6Vrp9FaZSFXT/eoAQDoVpL6TRthwJXY9I1Xo=;
 b=cRdjF1mBzr081g+pSRpmBA/3lFC4h7B7fHRkZ4ohaqedOcDIRWTq3MQQqZdqIesmass7DD3jxiuY8a8/GJRNOpQRQhbuaTOxFqy5hpFWG7wlxlVviTMwXEBnHgl5zp729c1YJfJoVTtB6ST0ZNPKfAkmJ4ilm88DINXpjqKIhIE=
Received: from PH7P220CA0178.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::17)
 by DS2PR19MB9126.namprd19.prod.outlook.com (2603:10b6:8:2b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 14:43:47 +0000
Received: from CY6PEPF00000048.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::8c) by PH7P220CA0178.outlook.office365.com
 (2603:10b6:510:33b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 14:43:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY6PEPF00000048.mail.protection.outlook.com (10.167.247.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 14:43:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 50A1C406540;
	Mon, 26 Oct 2026 14:43:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 389BA822556;
	Mon, 26 Oct 2026 14:43:44 +0000 (UTC)
Date: Mon, 26 Oct 2026 14:43:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH RFC v2] ASoC: cs43130: Take the frame layout from
 set_tdm_slot()
Message-ID: <at9nH2PSFlLpuqNu@opensource.cirrus.com>
References: <20261023163206.81891-1-olivier@mgcrea.io>
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
In-Reply-To: <20261023163206.81891-1-olivier@mgcrea.io>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000048:EE_|DS2PR19MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ffcb75-38da-4e72-5323-08df336f8a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|61400799027|261009223027099003|261022105027099003|261021135927099003|261021121427099003|10067099003|56012099006|261026140227099002|18002099003|22082099003|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	JN/w1Wi1trqZs4CLcCLG2P5Yo71v4o1u9CI77IsvT5Tnbhwmwlf9NFkJJfDU3OgBWCxNzGOPffgl8Gtie97rAHiMMg0mPjNtSHSqKRiPOKIznZDKVNJtd2UGfxBUyH1Z9MO0J0YsEbWV3F4pq+tcuvRC7vrvrGVikvNpIqEAyuetMjW3s+oJOKZtIk9BrYaWjEjnYjQrhOAZ3gaEbzg9XxcXp7elJ+U4P5XyRKh9+fYBj+L3aq1e6qisMoxlNyxMt0m7fxJTXJ8Nr7ko7Op+K3iQn6fETf3svhI5p0xCUpnbJ+4URlP0vGfwPTevnRunoNRQl6HyUjdQku/Hjp8oApO+cFBa2m18S/4MyxGRF2tf9PHhuCYh6JuQuDWwlcdnn59bbzqF37rb6igXIJGpkgOCGVqJyNzuGcL7dvZKHbUrRDKt2BjcjvydjrClAPzPJU6eML5hwN3dh32tD5N2uzQLH71/TaMi7PZrU19pjPYyEU6J6eqauXWUFw4nazZdEsHq/Fk381BViOWYd5exN0AUu2X0yAlieELaNropzEwndScLSv1Zhhw3U/yJWd4NAiQTOVGws9z3hl0zNQEbXmDALDdHViGiC9tCdz+mFgwrUpGgdRRz+xDeOx+MgZDWsdlrJsPOFvJKK1rnrfeljbV99xlWH1iv3TpvSbRDlZGga6IVwfWEvOvrmYy/IvNmIN8q3PXzWOLVsHYUpnIPqw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(61400799027)(261009223027099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003)(56012099006)(261026140227099002)(18002099003)(22082099003)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NuKCPci245Rem618WA4IMjgtSTyoQ8H+yuGI+aq2C0VQqh1JzJMlqNtWah85juFAz1hrcnZtD5tpScmeM9n5gWQJKR5vuKTiIJjIDDClGVNTKieui1fIt83xEL4nRR3y4OMxSdgqMuSOq5g0iVuo0XlEpxhBeOa3L6OnUzBOlTnJrrzCYTC+eF9maMrubEowQknUoaA9r7ZmbGeczb3d7laa4KVueCA0GhAJzIP4pbS3O0NMTddata05kxcA913erVrqcx/XHMRR424ung22XhNExoHiCLqWJlXkr7QgYK8TtRSy7WUCkSJAqRHMc1olaThpIwomGNoXbwPNLexHwm/VqG+lZsWIfidKhhnbRMTDnNRykvuzygxofGERsk0ZiVvNN4rRCi9w/34Y7ZfxfAxgF4RUHfPNaPcYXVVCE9ePuPq6e+LUXHKFBMBdhtDW
X-Exchange-RoutingPolicyChecked:
	i3UH2sD/1KclEH1fdCxei6TRPVXHJyerHclCD3VscBBy5Yz3H6nAHTV1hqfQuhFN0P3KivFHmTrCE0pc2mLHUQ4MUURiOgduqhB/X9avRl/QRqFaZl38sG5WsvD+a/2fZbha+VggGlDT1Mi38xReQ8Z2Cs/6802vDdEzHFsaV45sh+Vqs2+Sqmmc7dNFnOD01qzLnU7STuvSyYaJkP2nQ7/8aP2443Y2Ky49rd/41UGQigeplvhRWNi00HMsPFgwJVfY3rsO8T0uEveTDbKKr6uB8qcXCzthcQpt4o6f3AP8zhWGxGs4eC+Kkl1HxR6iq/g9X/Iu/gHEzsW1JMlIXA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 14:43:45.8527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ffcb75-38da-4e72-5323-08df336f8a1b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY6PEPF00000048.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9126
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX1M9HzfBPXcXq
 WdUKUUjwS3gKiGTf7xOytJvLXgcZj0V6chOg1L2NGwdlATQpWAuUOLHJVlvZEscHpGL9g1ViEu9
 PaBBapdAo3IMd8wrzXkzaG+c/nOrCyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX/26dl9RynIxv
 I9A9mA9q+HCSg8u0RKbhS8a/f6+YrTeiHbQgJ4nCRl1DTLhOBBffUb2laZg7ZL71kIk+0BCXrHp
 zNGgaTprBcuy0m++XMa1YQTikOx6ZivcMfHFYUljqJKu/x2X4552whRd8wrxoTLVoIirCaRxH2p
 rH84Wf0S3pl9D+Ujq/HMNax1zUKmq6dx6TIHL0cxPez8vhANZBgifTmBTeTQidkik28Wq6dmI9K
 cC2v075M910LEsUtKLx+IYgtaox2/DoaYJJTd6vI5LjQrtcEFaZqJhjZpn9dIwJW+iVMxpNLg3U
 E+ETH0oddbMip2hRUuj3A363ekDcP88fpVbPvGNWElCGIZaCA6qZFGmsJOZOguU8OfwIMIDQX2P
 m7tsVg4F8+eA0bfpG9qdynIN8MiiNmQryTBb42nP2/5Aykr17qkM357aEzliIbHhZXch7PZ7w1Z
 Cg1BCP5IqO/ojyvkTWQ==
X-Authority-Analysis: v=2.4 cv=dbIVTnXe c=1 sm=1 tr=0 ts=6adf6727 cx=c_pps
 a=ld1257TWEKwLI69vH4Sekg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EqUtfZC2JWYDft-4DwIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: dE4f7f5-VSZw1ZkncJotWio2NYDNbgqC
X-Proofpoint-ORIG-GUID: dE4f7f5-VSZw1ZkncJotWio2NYDNbgqC
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 06:32:06PM +0200, Olivier Louvignes wrote:
> hw_params() derives the slot width from the frequency given to the DAI's
> set_sysclk(), which it takes for SCLK. Generic cards pass MCLK there: the
> simple-audio-card of a HiBy R1 (Ingenic X1600 as I2S master, 64 bit
> clocks per frame, mclk-fs = 512) hands over 22.5792 MHz, so the driver
> sets up 256-bit slots for a 44.1 kHz stream and the CS43131 plays white
> noise. The card cannot simply leave mclk-fs out: simple-audio-card then
> sets no clock on the I2S controller either, and the codec, as clock
> slave, fails hw_params() with "SCLK freq is not set".
> 
> Add a set_tdm_slot() callback so the card can give the layout instead.
> The two channels go to the first and second slots set in tx_mask, within
> frames of 16 to 64 bits, the sizes the serial port clock tables cover.
> When set, the layout takes precedence over the one derived from
> set_sysclk(); zero slots go back to deriving it.
> 
> Tested on a HiBy R1, on v7.3, with dai-tdm-slot-num = <2> and
> dai-tdm-slot-width = <32> on the codec node.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> +static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +				unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
> +	struct cs43130_dai *cs_dai = &cs43130->dais[dai->id];
> +	unsigned int frm_size = slots * slot_width;
> +
> +	if (!slots) {
> +		cs_dai->slots = 0;
> +		cs_dai->slot_width = 0;
> +		return 0;
> +	}
> +	if (slots < 0 || slot_width < 16 || slot_width > 32 ||
> +	    frm_size > 64 || frm_size % 16)
> +		return -EINVAL;
> +	if (!tx_mask || hweight32(tx_mask) > 2 || tx_mask >= BIT(slots))
> +		return -EINVAL;

Should we not be using rx_mask here? I think set_tdm is usually
centric to the device.

Otherwise, I think this looks good to me.

Thanks,
Charles
