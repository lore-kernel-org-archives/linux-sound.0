Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607525;
	b=a275baii3eHw/0muLvWmiMCOmA2Nv9hRThBBqFurCambzpcTDdjQJBIdVI55QWj8adJx
	 XCutyJMKfyKBSBOuZLKHPIOhF2nAqk49zM9Cdb3e1z0gujCiDuJ0ey1g6asMAm8h8UKus
	 oPHNYLFb6I5diIJqQ4eUk9bsRWL8a6Cxup5ASXzfMU4w4/QQKn8ocorIlXv+ZlQUSX3Im
	 G00si+5QOTU64ozdwwHdam/ecKydFy2zYtqrhe34iY21aCKswI5XkZJmFTRO0fR8PnpK/
	 btFG7FXMPB2j7lX7+fynL7gQ3vmlEyaXwjFgC/EiFoUPIi8Hn7HNDECQ+gTjGoXSUuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=uOsq9XIOBT2NC5uHr58sl2Oqabg+yboMZPaakXMM+Vo=;
	b=mEyTgeOD9rflckREh5G8HPzZs27OvlRUCmXcl21VsdDM7jQF2ghzbzhQJ3wkDFSMAhVN
	 fazWs0ClBYuMyDcG8Oqz3PHpiUM5QyA6IhvY1vsOEHegxCkDAWkO5b0vNztM+NuJwNuak
	 b0Hx+8b4W/18xxPiJ0lhZaOh/mvB2w0UXePusm72bLm6zQb6TVZ+UJyx1gGKLFWw6bCn0
	 l+jvz8CD5h0hHMNvlKRxUrwISUXmeEE9WBE4jE0ZMcFG47jRsWFz4xSOkbecWsAbASrfh
	 B29vG9hxvweOPOf1ArqN04Zojiv6DJUIs66NXCMdPagSJr4cePt2NcQ+2i8wLcVH+NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=A18epWOX;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SvTrJgh4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B9606A33F;
	Wed, 25 Nov 2026 11:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7B9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=A18epWOX;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SvTrJgh4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVLD102388;
	Wed, 25 Nov 2026 05:51:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uOsq9XIOBT2NC5uHr58sl2Oqabg+yboMZPaakXMM+Vo=; b=
	A18epWOXNhKpNMiTUeZFjUFopoM0BeU/p+QaXduDU2+jVH5xycLeVFFSiLtUzobR
	f+V5VSB6KroV7AQ9xoz4qCow3AOliQT4ggqoRvZ/TjduUFFvRv30YxcbgT2zA/hx
	CEQUaZNnxOxWSkkFXOs32RaX1/GD/k+YATVf3X0ovcb42XWbl82+uyh5PthFClRv
	fKwokyzZGRjmgTcyjLERxFftheR8neJH01ztBJgQevHv1OI44S5d7Q7WtvgQaD8x
	niAYY02/xzq0jhr8je9L4bdCfjY/I/tmcDtbzCSOIpkNSVYk1yYJmBjz80KAf715
	CAfDwoCcv5PYhRYNH/hISg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022137.outbound.protection.outlook.com [40.93.195.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPMbTZkJnrt4w9U2bQbHLW0iNy+/jCu56QmQG6kwKdfjHE6Ftf/5clBV7P7meKmxKlB01NWPDRS7tyCq+oKNrfvPdxusBpH7UBF6KfHCtZr5iwN57fcS2Cb9t3/+Q5n0wBNF/i3LkKkhiyqgQsABG52igdu3fpSMyYyfro65ptuAX3K483z4xD8IYkoOg0WooQCTU1zYaH+RO3DA2xtXOFA8gDqSZjVfyypixgUbuz7R/geMFMy1tpINkPYSKeJ1zFa5Cgn8Zgb+hfWd+WYKS9G5GqXZLRD/5k5PytgDHfvsixkMVw6lt1batH6Q9XHlqP95IFMkUVv4B2QZe8XQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOsq9XIOBT2NC5uHr58sl2Oqabg+yboMZPaakXMM+Vo=;
 b=b+PTXQeweCLdVp6d33AG3/Oa8j7H3Rlyk+DD2zf9JNt8oCsafE2SVd86gQ6/QhmUh+kcdOCumlxIJJq2S51kfLeLlowSqDCfUu5Ae60Mi659h1JAoytbvww6AzfXzEh53cnHc5UKgYiUh6YMr/ErHZj3bxl5v5KMdS1Ds+9uKE8u/K6xtUucAUGkqCJKRj63B/BYIU5IjknaVYv8mcE3VMps0eEcUxVHVht71bcM3B6DH46fwnoc0WsTXAL8ZHE1WBQvQhlhQ0UnfrtqnGI+T9bBvM428mhrS4hMxXIELAMtsoSdylntyqY0COXbXtESu+nBKsq4TV5hxa+Ghd9TlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOsq9XIOBT2NC5uHr58sl2Oqabg+yboMZPaakXMM+Vo=;
 b=SvTrJgh4fkEK7V7/T0T0aC/Ys/19yktTAuRR0C7M9u/uzTvMQ+ATyFbgzsicIl6DLCXwICQNXuLJL+88gtjZualPzU0v45iIiSUCGF960ddX6MkiXQLk6UqqklH7VvoEjg9ZFeOoWi2I8qHdhiWkRhQ/4CShB0lcKKivyeEowSk=
Received: from DSZP220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:281::15) by
 CO1PR19MB5031.namprd19.prod.outlook.com (2603:10b6:303:d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Wed, 25 Nov 2026 11:51:40 +0000
Received: from CH7PEPF00000019.namprd21.prod.outlook.com
 (2603:10b6:5:281:cafe::9) by DSZP220CA0015.outlook.office365.com
 (2603:10b6:5:281::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000019.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0
 via Frontend Transport; Wed, 25 Nov 2026 11:51:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D4B5E40655F;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9CEEA822542;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 7/7] ALSA: hda/cs35l41: rework how firmware requests are queued and flushed to prevent races
Date: Wed, 25 Nov 2026 11:50:49 +0000
Message-ID: <20261125115124.9130-8-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000019:EE_|CO1PR19MB5031:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e72e5519-b623-4dc2-0262-08df4aea76a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|23010399003|36860700016|261102123227099003|16102099003|261009223027099003|22082099003|3023799007|261021123027099003|261021121427099003|261022105027099003|18002099003|261026121527099003|261026140227099003|261022075727099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2mk5Fp8VeKsSlC66gPA8ZRFXYLEPS19SFGk+W6mppOr8PrqwDal6kOhajqdTXaZAVljP2scMNQKyOtNj8nXMQbqx7DO0AeHnnjiGxwCCd17e2rxCUR2SFRKTvWmBDQ871h6+lGfTDp1PyJq9YRlp8ZLtErXMPo3UTm6EoSzU2LMHzW1GFAf2eA48pvCcLc6soqh5aST37AMR9aNBe/G615mOyKEozSElWxOLLAgUe+x7XZWQShQmJUVcd2+vDrrFj5HLGrVuf3nmS0OS7qtLgyGfYdolsDSH8fEs48diKKDPskarq1NNfo08QQ3aToUqQW7kkXPrN7+Co98o6hyYd/5OVBWdV7qylVEfU8cYHuSP5K1ZIW3CeyGPk8geh44t1Uv7Q3pOUKaCygQWHE9cObe2O1SFYdEgdVq1tO56QspNSBkYiTEb4HElqD+TbOmvZmWpSazSpf7ZGorQNwfRUMYPn5hgrkuERmuabf2ZPzRVxdvn00vlH0WQ+iwXZ6RODUxrW4Hurm1YL/ru0ccGFCGXIifJSQH7mK1EA7yd6Lyx4bIAgrVXb2kugldUC72aE3+KLSgxvZyotmWuQIyYIcWoKzzA1JDm2+p8Ykn3TDPCMbXxLl7yiv7UgPcUToTqPC4hOPnVO0KIvzrimP2LYmd3SaNSax6ewyZhbgLLsB1lfekvcIPoIOl4qwZzRCSAlrIEOtYHIobK0hziniSbDQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(23010399003)(36860700016)(261102123227099003)(16102099003)(261009223027099003)(22082099003)(3023799007)(261021123027099003)(261021121427099003)(261022105027099003)(18002099003)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bwZ5EvZA5vTVJsdo2W0PqLvoyhnKNDyw32IZbT+vgJl3UMEip6SrZ81fz9jWH+MvbZ7c08/dtGwWacINxoXtlVXhjfmtxWrl8esg1gYlqFWdVTzYXE+NojU5foutOOqxpDYRacLvD2Ofzibe+bYSCrpGi9g3qZHQT2EmDIfpwhaP9jm/3ejErn6mmtxFZU2TW9VuDxmd7236v3OWjHEqlKjWlVWcY0Tv7pm1n3AyxglNebwBC4ER3Cp05dFssmdHSlpf5OdxKtABxbfZDkclMro5dIQwRKWsgrp548otrk2MiqGmm3Zwslt2bxvBn7TQPeX3AsorNiIx0CIIzLEiLvbPKRif+bK2pQPmy238IF6WCjxOFH7gZ+y/3Rr+ApedCk1NCwLMiTPCUGpTtk4xemZeiSNXZ7nQWNq9QN7qu2wW4MxFOOdsLryeCGD/xpni
X-Exchange-RoutingPolicyChecked:
	HReIz+rAoI7vGiL1YRTLF1jx4clDmkJL+lpjTAHxUAgQUwdyccnDzLF50Kx0F0wpgC2A7JXknT0d6OlEKzGbGiJ0wrcB0MccFQrFDM5Yxpo3s4omfUvc/rXlykhzzmffuFt7QLFME4OL56catb67tiVSdRu/82A8bzsHHQZu8pCZwmT8127aSq8kWyM0i2o2Enj75QZjuoqUd8uVWLUC9Orrpo3cmLhCe7rjbx6nfcH6Aox+TUt7tXrCbXNEbh8B2QUVl8/acZSSoyWNGggGoNRgX3MHa8q8nInS8gKF3e+nz/lFegN+x/gfwmIFkKVvbXuU1ZA2m+dT839kVy1uZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:38.0736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72e5519-b623-4dc2-0262-08df4aea76a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000019.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5031
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX7qKE47TmTVwH
 f1/pijuyGsTGdtZ00+6rGjhPcZAcsCGqvuxAUEnv2Fjp6BbENSYGKhRUtVGTVFbwK+ljzuyvY2D
 9ig9ijgOmquRwXwStmYcy73lGCjijl2nyzInW4Uyr1fOdkDReWSq9AcaARq93+RBt9RP9lA0VD2
 TNdE3cs7QMn+uw7nVNlCQENqXlgcE+WQ1SXomiFkhmOVGefyuNCoNWHzojODgjumgwGI4OhpmLc
 Hsllb93MsEWPkmOiDa1rCCWlFzJnnPsoTStHhysXo6rclD/kEQ/a6cdsuXvIdPvEbL5Paow+kt4
 jdLhER5EbWlvnvJTfR2R+A7Fu8ZLQ63xBXJA3OvxskLEU9XhLUxah6fSGtNnofte2oH93ZV+Ek6
 2KFPm/2Vqoj3Ds8GEtATDsVgZxy9SQA8XVd1086CT6e+gWlmtoCdSZccfbMJR8kdMjIKDkktaqV
 gvfkzm23ho3t9mOfsOg==
X-Proofpoint-GUID: JFXiEW08G7MI5pfjL16OSaePvLw8a5rl
X-Proofpoint-ORIG-GUID: JFXiEW08G7MI5pfjL16OSaePvLw8a5rl
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbd1 cx=c_pps
 a=LmFNP1q1N8XVogtwAr/bmQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QZhCBxU6JqVPGuaT7xIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfXymEp53lusGKy
 I8n/yfs1qoBSTdfjKV/dwRdnjdFXQ4TzuP6nFoE0YQtRy98ZcZ1Q0DvUicEfknEZUlIP4/WwApk
 DYLDGv1AQpQNDpbr02j8+giGu3nIHEc=
X-Proofpoint-Spam-Reason: safe

Currently, in a small number of scenarios, the firmware on CS35L41 can
be reloaded:
- Using an ALSA control
- System Resume
- After Playback (after System Resume - if reload has not occurred)

In all these cases, the reload is done inside a work item and
scheduled on the default workqueue.

This should instead be queued on the system_freezable_wq, which ensures
that the work item is handled correctly during system suspend, where it
is not allowed to start whilst the workqueue is frozen.

There are 3 main scenarios where we need to ensure firmware load work
is flushed:
- Before System Suspend
- Before first playback after System Resume
- Error Paths

Register the driver for PM Notifications so that it can correctly flush
before suspending. Ensure any firmware work is either cancelled (if
pending) or flushed in the PM_*_PREPARE notification callbacks.
This ensures that the work item completes before any workqueues are
frozen. If the firmware load work item is still running when the
workqueue is frozen, then it would ordinarily be flushed, but may hang
on waiting for filesystem access in a call to request_firmware(), if
filesystem access requires work in a freezable workqueue itself.

Additionally, ensure that we flush the work before we start playback
after system resume. This ensures firmware is loaded before we restart
any playback after system suspend.

We also need to re-queue the firmware load in the PM_POST_* notifiers,
if the suspend was aborted before we finished suspending, but after
the PM_*_PREPARE notifier cancelled a pending firmware load.

Fixes: 88672826e2a4 ("ALSA: hda: cs35l41: Support System Suspend")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 131 +++++++++++++++++----
 sound/hda/codecs/side-codecs/cs35l41_hda.h |   2 +
 2 files changed, 111 insertions(+), 22 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 51ac11270c88..9a0063ff4159 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -12,6 +12,7 @@
 #include <sound/hda_codec.h>
 #include <sound/soc.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/spi/spi.h>
 #include <linux/vmalloc.h>
 #include "hda_local.h"
@@ -603,6 +604,38 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	return 0;
 }
 
+static void cs35l41_fw_load_request_unlocked(struct cs35l41_hda *cs35l41)
+{
+	/* firmware request is pending */
+	if (cs35l41->fw_request_ongoing)
+		return;
+
+	/* no need to request firmware load if DSP running state matches request */
+	if (cs35l41->cs_dsp.running == cs35l41->request_fw_load)
+		return;
+
+	/* block firmware load request if suspending */
+	if (cs35l41->suspending)
+		return;
+
+	cs35l41->fw_request_ongoing = queue_work(system_freezable_wq, &cs35l41->fw_load_work);
+}
+
+static void cs35l41_fw_load_request(struct cs35l41_hda *cs35l41)
+{
+	guard(mutex)(&cs35l41->fw_mutex);
+
+	cs35l41_fw_load_request_unlocked(cs35l41);
+}
+
+static void cs35l41_fw_load_cancel_sync(struct cs35l41_hda *cs35l41)
+{
+	cancel_work_sync(&cs35l41->fw_load_work);
+
+	guard(mutex)(&cs35l41->fw_mutex);
+	cs35l41->fw_request_ongoing = false;
+}
+
 static void cs35l41_shutdown_dsp(struct cs35l41_hda *cs35l41)
 {
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
@@ -617,7 +650,7 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 {
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
 
-	cancel_work_sync(&cs35l41->fw_load_work);
+	cs35l41_fw_load_cancel_sync(cs35l41);
 
 	guard(mutex)(&cs35l41->fw_mutex);
 	cs35l41_shutdown_dsp(cs35l41);
@@ -811,6 +844,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
+		flush_work(&cs35l41->fw_load_work);
 		scoped_guard(mutex, &cs35l41->fw_mutex) {
 			cs35l41_hda_play_start(dev);
 		}
@@ -821,14 +855,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		scoped_guard(mutex, &cs35l41->fw_mutex) {
-			if (!cs35l41->cs_dsp.running && cs35l41->request_fw_load &&
-			    !cs35l41->fw_request_ongoing) {
-				dev_info(dev, "Requesting Firmware Load after HDA_GEN_PCM_ACT_CLOSE\n");
-				cs35l41->fw_request_ongoing = true;
-				schedule_work(&cs35l41->fw_load_work);
-			}
-		}
+		cs35l41_fw_load_request(cs35l41);
 
 		/*
 		 * Playback must be finished for all amps before we start runtime suspend.
@@ -925,6 +952,45 @@ static int cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
 	return 0;
 }
 
+static void cs35l41_set_suspending(struct cs35l41_hda *cs35l41, bool suspending)
+{
+	guard(mutex)(&cs35l41->fw_mutex);
+
+	cs35l41->suspending = suspending;
+}
+
+static int cs35l41_hda_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct cs35l41_hda *cs35l41 = container_of(nb, struct cs35l41_hda, pm_notifier);
+
+	dev_dbg(cs35l41->dev, "PM notifier action: %lu\n", action);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		cs35l41_set_suspending(cs35l41, true);
+		cs35l41_fw_load_cancel_sync(cs35l41);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_SUSPEND:
+	case PM_POST_RESTORE:
+		/*
+		 * If suspending is still set, we are in the recovery path - reload firmware
+		 * after failed suspend
+		 */
+		if (cs35l41->suspending) {
+			cs35l41_set_suspending(cs35l41, false);
+			cs35l41_fw_load_request(cs35l41);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cs35l41_system_suspend_prep(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -981,6 +1047,7 @@ static int cs35l41_system_suspend(struct device *dev)
 		dev_err(dev, "System Suspend Failed, not ready for Reset: %d\n", ret);
 
 	dev_dbg(cs35l41->dev, "System Suspended\n");
+	cs35l41_set_suspending(cs35l41, false);
 
 	return ret;
 }
@@ -1089,12 +1156,7 @@ static int cs35l41_system_resume(struct device *dev)
 		return ret;
 	}
 
-	guard(mutex)(&cs35l41->fw_mutex);
-
-	if (cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
-		cs35l41->fw_request_ongoing = true;
-		schedule_work(&cs35l41->fw_load_work);
-	}
+	cs35l41_fw_load_request(cs35l41);
 
 	return 0;
 }
@@ -1331,9 +1393,11 @@ static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
 		return -EBUSY;
 	}
 
-	cs35l41->fw_request_ongoing = true;
+	guard(mutex)(&cs35l41->fw_mutex);
+
 	cs35l41->request_fw_load = ucontrol->value.integer.value[0];
-	schedule_work(&cs35l41->fw_load_work);
+
+	cs35l41_fw_load_request_unlocked(cs35l41);
 
 	return 1;
 }
@@ -1475,7 +1539,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	int ret = 0;
+	int ret;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
 	if (!comp)
@@ -1505,8 +1569,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
 	}
 
-	ret = cs35l41_create_controls(cs35l41);
-
 	comp->playback_hook = cs35l41_hda_playback_hook;
 	comp->pre_playback_hook = cs35l41_hda_pre_playback_hook;
 	comp->post_playback_hook = cs35l41_hda_post_playback_hook;
@@ -1521,9 +1583,18 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
+	/* Create the necessary controls, do not create them under fw_mutex */
+	ret = cs35l41_create_controls(cs35l41);
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to create controls: %d\n", ret);
+		goto err;
+	}
+
 	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
 
+	register_pm_notifier(&cs35l41->pm_notifier);
+
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
 		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
@@ -1531,6 +1602,17 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		 channel_name[cs35l41->hw_cfg.spk_pos],
 		 cs35l41->cs_dsp.running, cs35l41->speaker_id);
 
+	return 0;
+err:
+	memset(comp, 0, sizeof(*comp));
+	cs35l41_fw_load_cancel_sync(cs35l41);
+	scoped_guard(mutex, &cs35l41->fw_mutex) {
+		cs35l41->request_fw_load = false;
+		if (cs35l41->halo_initialized)
+			cs35l41_shutdown_dsp(cs35l41);
+	}
+	cs35l41->codec = NULL;
+
 	return ret;
 }
 
@@ -1549,7 +1631,11 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 		memset(comp, 0, sizeof(*comp));
 
 		cs35l41_remove_controls(cs35l41);
-		cancel_work_sync(&cs35l41->fw_load_work);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41->request_fw_load = false;
+		}
+		unregister_pm_notifier(&cs35l41->pm_notifier);
+		cs35l41_fw_load_cancel_sync(cs35l41);
 		cs35l41->codec = NULL;
 	}
 }
@@ -1981,6 +2067,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	cs35l41->irq = irq;
 	cs35l41->regmap = regmap;
 	cs35l41->control_bus = control_bus;
+	cs35l41->pm_notifier.notifier_call = cs35l41_hda_pm_notifier;
 	dev_set_drvdata(dev, cs35l41);
 
 	ret = cs35l41_hda_read_acpi(cs35l41, device_name, id);
@@ -2087,7 +2174,7 @@ void cs35l41_hda_remove(struct device *dev)
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
-	cancel_work_sync(&cs35l41->fw_load_work);
+	cs35l41_fw_load_cancel_sync(cs35l41);
 
 	pm_runtime_get_sync(cs35l41->dev);
 	pm_runtime_dont_use_autosuspend(cs35l41->dev);
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 64ee70c31a43..b374836e8537 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -78,6 +78,8 @@ struct cs35l41_hda {
 	struct work_struct fw_load_work;
 	struct snd_kcontrol *fw_load_ctl;
 	struct snd_kcontrol *mute_override_ctl;
+	struct notifier_block pm_notifier;
+	bool suspending;
 
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
-- 
2.43.0

