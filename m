Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081509;
	b=2qq3tzSCQbxGVYEn05ERqMItk7zimOS254R8gtAMADA2mcUN5canRGEYFO7zqNw8+gmU
	 X9iN8mJRvT2pzuQIR2uZcdRB8Mpu/ycP9h1XpWo/C6TfJA1uSB+kcHI6mesxOUAgc3CVC
	 EaIHLwDEEP3sp+jwQ6LGSy+1AMVzHAJQU9tRwsaUhYsFnbjJHmpd9mDLiu7UdbNoJBK1u
	 H+1ljVmjK0imEpqJwZH/SK8L/ib2QwWV/TswqlVfG/UCtQq48gVKRj1eF6PzSkIim8ly3
	 Alj9SanGuHQ29ZobDQOVKXAYKuV7OOydWo2kjfpt1kwQXMtkrsilI4F5mTIVGbtN+Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081509;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=gG2n3TGjr24Nn9xA4i7KSszGOvvIuOAbqzONdIp2mmA=;
	b=jZ5hPblEAcK5Kq9WE0cnVEBaslU2TE6A2JYSUP4HPUa38nGF7cc278E7I7jP9am8TlXy
	 UALbzTbJV2ZabYamxzlvAybAVEkZ57gaBB71usfnsxcAlZSWy+p+VjjaRAYVyNBhj0shw
	 /y4yG3SgCSz8N6bG1v2afyhHJSuWYb08uvelRuisBpJ77ye/gn6PmNsLDxrQ0wkHC75WM
	 bDr/Xv8x09NccHzLfntpTexa9H3dN8GabeWIYcAd5m6nQ+druISbmYHMrAasTwa90SAtc
	 nljENXBhUteBnFy0+o6X/wAHTiALs4W7r46YY2/01qrBrQrR0bp5INvXItQA5Y5beKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bG1XQ9Cb;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=0LpLsBY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E3606A32A;
	Thu, 19 Nov 2026 09:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bG1XQ9Cb;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=0LpLsBY0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ8ZJaT1904208;
	Thu, 19 Nov 2026 03:44:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=gG2n3TGjr24Nn9xA4i
	7KSszGOvvIuOAbqzONdIp2mmA=; b=bG1XQ9CbmsPnpJqj+uyGTPn6itNoDfqcDu
	U5NyFC18n9ZkKHKTutuI9arGnYg4V12HVX3ZJ3X1hbHNYdDd/Md/BcSmR5euAnyn
	5OK7+5tsViYeNRlENo+5gl9to/PvbagTD6PSnxlX2Q2GqpTZA2anoW3D0qmpeQB+
	StAXKY4w7youvKdOrgUY3feul4GRiUpV67UgCCXEQvgUnwAl7n1R4roXaKu7ae/u
	canyGndCyrlfZ5vvirsOYIdBFQ1aSUutL5snI7gpRUWaRU0x1yd4c//Z9dmmZa8S
	0DHz15o6B0tOw0DtYErIbjuseCpiG2lj2RrxYhaeRulh+YBev38w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020141.outbound.protection.outlook.com [52.101.193.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j0ytskdbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 03:44:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae2ULhLNuFSM07CBlNVP2dxq000dWLDp4vZ0oFEyXRU4mhgsz2kyy9sG+dp2qvrLApFdAXejVDjS+4211rriEYif42OQKs1VQSu3GPEVo+OAkaVpT9iF3Tl4h7QYxoK6ic4uL6CQ22/TQHzKdtmC/eMoQRVp9kFhZ6KkmWAGp/G/Yh4JdsENTWHOCCwuNqEboPsPG1Rg3LlLqsFCVPkogRPUULLqYbfrZmScLu8hDcXBoMmV/QwbLtYDX6HwTIkNVKbys1eS9K3rPq4h1cBigWkiuEt8ehT0wTTJ62Drayly6FC3xsCZpdPmvs/VSAzInhcnKHjrCbFCI7Izpe1FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG2n3TGjr24Nn9xA4i7KSszGOvvIuOAbqzONdIp2mmA=;
 b=Tff0JghkpuGmpL5X/Wfj51xrJrmMZJtkxIemh9IvCJNEPTryuf0E8mY1ql2h8xxUFU2B0Unjf2UfobFsqo6e5kY16R5WqeCfcYh0b3dG54mNhoTdXOrbYJpAVcM3he8Zle8rl1ZaojdWGFG/Rh6mr2mWi4o/faWyzQfW7pkw9YfnpbwPRM9RDKH74EWc5UgHx00OW9dqKXdqxxLqMA1wW2hQArnLPRSHn/El+i3CY5Y/x8+A/vJ1VJ59qwRaQjuCs8EBNLt8UKcrMjWhyxw2aW1H9EMxYVzWRgmpI6cJ5SsaDA1yUuegDBiBkkawEy7Xv8D06PdZmZlB4baqzcj3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG2n3TGjr24Nn9xA4i7KSszGOvvIuOAbqzONdIp2mmA=;
 b=0LpLsBY0kIppMpJelCb0wuKCYPE1+T3udVB1UIgFMJ/K9T3kqoOKR1A4MK/w/gQA3FooBvJnMxtyb1LyxLL7dTxm5hVTjOkha+l8LP9lmoNotulV+LzENRuHEOfbyTDKUrtKXKhruFRmZ6fhfwtrnp+45dtZk+O8x4x4ba1Y6zM=
Received: from BN9PR03CA0325.namprd03.prod.outlook.com (2603:10b6:408:112::30)
 by SJ2PR19MB7439.namprd19.prod.outlook.com (2603:10b6:a03:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:44:54 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::36) by BN9PR03CA0325.outlook.office365.com
 (2603:10b6:408:112::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 09:44:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 09:44:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5464D406545;
	Thu, 19 Nov 2026 09:44:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27F30822542;
	Thu, 19 Nov 2026 09:44:52 +0000 (UTC)
Date: Thu, 19 Nov 2026 09:44:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, david.rhodes@cirrus.com,
        rf@opensource.cirrus.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs48l32: Release the runtime PM reference on IRQ
 read errors
Message-ID: <av7FEs0HNjmnd4wR@opensource.cirrus.com>
References: <20261119075733.50138-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261119075733.50138-1-zhujun2@cmss.chinamobile.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|SJ2PR19MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0b89a0-d0f8-4f1a-016f-08df4621c342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	YcHSSsjIebVT4z0/cmeM1RDorkaxC2PjBIEZ/0l/zVbJrq+5ZtkLyKdZn2TFSo8+0INDsQJqwOMPnzinclf+WUDRr1GgSEYr4AvCLWvNDfWgKcq+iUJ1sumBlpyShz56TEa6aC/I1csb73bLqGPSl4RV16N48nYgf209ScezPG6LKVG+9zb6EFrn0RhhMXx5IXV04qytcYei2hZA/R17AkNbP5q9Kd+90YdNbq8Gn6urOowDhEiurQk2OwEJWy8zrqwy50KhjPmLgiL+eAZxIuNN+m0/a1OI1xFDL+pV1ycv9OFeS5RcYRDBd3KuSc28BTl3ZtuDsBVfo5G9dcbGlKDdX5TsQYMDn/EOAJuB/Jj115oBymph6O9dWaoL9+EHel0f6YhY7+uK1ueI47R3skGX9rj2KjdroymAsfpJBWsAyJD1ZfNM7MDfO+AoyIIvRAg0kzIbh2AqPMRSStROvcHcy9SWiZJxg6/QXuox4mYX3sGp2LHUxRSXwPPXq/N+RUukaD8jZnKbsmIzI9XQ79D7F4VFX1FRmQ1EYm/MN8EGLVtWWV2NpuVogUGkDidOktdrFIcvLbvLpPKUoH/F1oFabO/MfDDvzFYVRmN/GKGFFLF2yyvTHBEF3m6Ltz2Ooek0bMDVSf4h3JvsL92m6E3ZOaR+vW9hcqV8BqnGn0NgYRHqwvPAfpAcgE3esjW2iE1lJcp8NroOhxptT7a7fQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wR1yiAYEdbjqv+vEr5JwoanFX1rTafF/jyPMRrR3eXyQ7uxos5CHyHzSt43CZFQ7yY5kRk3UCCsVJXrpKZHMnoMtW+1RVGeoBrdCp9qdbPlslF86EZ704eVOb88VAHcho9GvMJ8CQLsQs1dikzwV17td2ei0q/81KnNDjIQ7fbMqSzqYdSm8H0zY2S+A5Y/Y7PVA3qC7sjPZoV7O/Qxv6K4cit9XSY7mxx+4tQkkdGdnkL2hkBeZLcwH6Cn/ojJCMCMvnVq+Jhyl3rvfZvQDvHest+ZMrlBNPHH2FVjHRuoNK1LQcDBacL9nAhvoMAluHMQnN8ppRhDXAtvI8g7hkqpXWndKnm6Fcdl4HwW+kQlH3Ut52DAPakgWpn2/3lcfP2wkKgUDVk2yfVP3hmBDxk4Cr3ceD1jLPnb4f2RkiUUeGHrbmbS+0s09mjDrS16b
X-Exchange-RoutingPolicyChecked:
	J0fpsVvzf9R/a+/f2SCl8M1msfCpM0VNSW7kxixP5FSeEU++lE++C2eNf0vlotCH7TNXpj6HcTvJgZcxidLqM64MC/Rbm3bAMvZpW3nYhKITYiExrr90+pTIPKTF54vLX+5wQEOtGjDGQvOLu0AlnrqxhA66QJQjXNdoK8V8uzoCnWoVuzvXQN5nPKkmmbZYNuulbxGR1gtYeoAxsD3Ba7K4lnOctlmIYiUfAv+u7gcOSK4DRFLYFv0VaQNkbtuhAbcJTLB4V5/A4zDiS52ksfnqDAAzobSr9unRAnlWh6Qlb8xyBYiLAtqcxFXAOg7PLSz6qZOsDh5/XIlx/UZ+Jg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:44:53.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0b89a0-d0f8-4f1a-016f-08df4621c342
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7439
X-Proofpoint-GUID: ehS3nYTb7jaESKLL7oJnLI9tqD4uLzG4
X-Proofpoint-ORIG-GUID: ehS3nYTb7jaESKLL7oJnLI9tqD4uLzG4
X-Authority-Analysis: v=2.4 cv=V4ToQuni c=1 sm=1 tr=0 ts=6afec51a cx=c_pps
 a=GGp2JTg3dHMzCsOndft0Og==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=R5C9hjxsAAAA:8 a=w1d2syhTAAAA:8 a=HSPaobv99ewLfxkDG3oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfXxxIAj71eXT4v
 N375nIqatjgsMdDtghZNxgeXPXWPdBnOMyZ2oEXgV8Q5yqWIXAx6uFVv7uGHSX4ZEIs6IbrLI2C
 aUAuf6hDt4skya5dWvU1FNlDWPZMMPQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX2VX5FjAjomLI
 7+f8QAq5ChDizwwmPvmjcFZvpI+8Xm22HgAEGLAoaQFjb0mCUAA/F8AvuddRBjVilefhHWcp5sH
 43l/GdHI8iGt6G0lLDFWU16fIL26vBJD2iX3ncyzR3Z5sL8vC9HYtvYLqNRMOKx1LqzWGl3Mpe5
 xDofqkJ14AT3EOyi6TmhXWUS8EyXouKtMP3EgU3v8aX4IgiFIckIDd8SDfZxYEEDZ/4GssDFgrm
 +xUWPZYbecXiiSc2jnKMqyAzA6svEMADrOwxAws/K87BkkpkpseytPo2MXoo4NfDaK+aMBCMoYl
 1yP9ygBJhyUTjfuW0u8M2hD0em8yKuBlVJPf2dcXg6Oh8qqwbMKhIyjpJBFSKhcodFCwQfvFUMP
 cCcopu2ThQYfE2NMypgqP9qUt4JSBcruHjGhTbncs1gThSMFmkSvZr+yhxznLH/ma8V8pbw32lK
 Kib9RdXsAUUGGCXLanQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 19, 2026 at 03:57:33PM +0800, Zhu Jun wrote:
> cs48l32_irq() acquires a runtime PM reference before reading the
> interrupt registers. If either register read fails, the handler returns
> IRQ_NONE without releasing the reference. This can prevent runtime
> suspend after a bus error.
> 
> Use the existing autosuspend path for both read failures. The handler
> still returns IRQ_NONE, and a failed runtime resume still exits
> without a put.
> 
> Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
