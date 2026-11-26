Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707870;
	b=K5Wlje+Xss8JQAEiUAurbOC8hmAdCZO/oNdfdeFF1JeHR+C26eXf2gccNLzkLHSk0Rzh
	 wZAFJ72qs+RYIzFy5UqU2brbmpNRuMIQxxJi2X2wtUmJ27mueITsPPowzW9PN9Ge9v6wM
	 kNEdEjhYVfrdFD6AjXH7PsFwsvmxy47/4pYQ6GxA7Jg35IDHtW62hK0acQEhhRwcTjlGE
	 9HjVoZvsGnb9C3Ltil244ZZr2zSIDpXcOftv3qIr3YkmXMxp8q2sZmG1uvnA3AocsCw8w
	 Tyr2IFYF/kB9g8IZz4YsxEz8pWbq8M/0I09yG03xAJ7T3H5Eu3ZEDS/lCOFoNurhXUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707870;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=PM7B01L6enuT9mqUnM04KDMzHeet63oVIGJE2uiJP1M=;
	b=1wokeDNFpL67QsqyNdlzPcNIQD14Gt3AqGpYLM/NyaezsYHoOS008SdvLa0pivA3IsDS
	 QCHAKB1WfiQipdON9440Mzn++nxeV4jhXGQd5FvSrDXqXRC1h486sYGAsP+QSiGSlyph9
	 Po8BiCdvlyQinC8w9dOzoAim6UkFxxzPtDSyBwBhArspu+SHAUhrA37Cru6UxLdIvH5nX
	 E+9NhlMSmUK6LYjM8zMeWl2gPih5Cxna89cG2co3eJNoPn8XeP/Z7xgIoyN6yRE3iX84c
	 WBf7DHFGeMYOtc3xThuetbk6tico0WmBUst/NS4OlxG/geXEaASAqlJ7X4cqRSVHCKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=DpYoI7pr;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yVGlj6SM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01279606A31E;
	Thu, 26 Nov 2026 15:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01279606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=DpYoI7pr;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yVGlj6SM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFY8cl281478;
	Thu, 26 Nov 2026 09:44:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PM7B01L6enuT9mqUnM04KDMzHeet63oVIGJE2uiJP1M=; b=
	DpYoI7prZFEgwgU/e4GHtKnY0BlLGAk2Fkvn+JYLGu9uH9+hlvhnjB5Gp0f/X5WM
	2mhT0jBvIJ21FibpEdeEOtYuvgxRSQwHZc84+tMbxj2VlhgvqTH7gibnvJSkJSPa
	gf64KLNkowieCmKUwl5DJ4W9rTwvjUTVSnpvDXgdiPM5QO56T5iLZTjW742gr2a7
	o2bC4KgwSxqSKlOZkTDt3q42GVtNnt5ckVcc3GPxnG1xIsooeBzDCHD/tgFxqAsz
	KG6Uf7wDkVUV0t3+3awBB2Pj6LjprNzFLcZOjZPtjIy1vveQ9/zcIV73nCfElNeh
	zDyEGhXyvKr6I++Wu2DkqQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022116.outbound.protection.outlook.com [52.101.48.116])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51884cha-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 09:44:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9VbH3mvDppSY8/54oH42aK+cSqMXMpSyUJWZYUol1wzeSZ4u6XvoSMQY4OqEpmVyKIjhpCguxdLUfmZoyYBMiNONkdt4MEPwTnRnkPckslSki60sSDFHNMTQ6WG/YBUo8VIH2JJ3XVmUc194DPRXdYitw5PE3KgSK06yJuoYF/K69kZc9akMBfvCkdUSDuLUoxoyfxh52JLjpPeNbUAFJqGsAda8Dn2tmo2HcvEpQ5aCKDn6xZ3ceTioTPXApaRaNM0apa+pMNe3RFBBp7TABeiOhOnQO6R6IAPRr1F0wfuohL9oymd3iOTg9Kc3XaLsFZQev715TGGjeSTuj8SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM7B01L6enuT9mqUnM04KDMzHeet63oVIGJE2uiJP1M=;
 b=GmePKO2QxK6czl4L7emrhOptHnuFBFPjsyQ+lOaqSarfFrtaejH9CglJ5PpTtYpVnLCNrM0+mufi6YC8Klp+Vqz6/iBAA/Nxoc0N1lViA9A7s4DpLA9kcxwaJjnP8dSKXAymhS9h85exMsLPQo9Er6PG5EJVrXO3zo7Oazl15cUChLS+hPCHoctFU2FsCxdEG+/5oIczniS8FULIil0nQyKKq5nl40fuCf4jxZprgdaOGcrnUscphXgXtVnt03aKLsf2ju0pCUb0rYj0bUqqkeY79vJLjeuop7c9dy2g2/Tzyk0U5Rj1uORkF+EgvpDoUAU4+d0JeWeottATereVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM7B01L6enuT9mqUnM04KDMzHeet63oVIGJE2uiJP1M=;
 b=yVGlj6SMlSQa1Ks76TQ1UssHERNw0fVwBHpZQEBDuen1UEzK6Hm+XdtxxwQMyOYS8DDkkPTsJ63ESGYNdI0Xz+Y4ZuOm7wMu1q8OS9lEK+FYcH+Pz7qRXGW0All+ml0A9AGqrS7x+F91ucZ/3B94/EiXlQyhcrdpfK6tdZau0rg=
Received: from PH7P221CA0066.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::29)
 by SN7PR19MB7576.namprd19.prod.outlook.com (2603:10b6:806:329::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:44:13 +0000
Received: from CY7PEPF000000EB.namprd04.prod.outlook.com
 (2603:10b6:510:328:cafe::8c) by PH7P221CA0066.outlook.office365.com
 (2603:10b6:510:328::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:44:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY7PEPF000000EB.mail.protection.outlook.com (10.167.247.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 15:44:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3C274406559;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 29609822544;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56-test: Initialize DP3 mixer registers in mock regmap
Date: Thu, 26 Nov 2026 15:44:09 +0000
Message-ID: <20261126154409.1665214-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126154409.1665214-1-rf@opensource.cirrus.com>
References: <20261126154409.1665214-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EB:EE_|SN7PR19MB7576:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3489f43b-6914-4a92-8291-08df4bd41dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|22082099003|18002099003|16102099003|11063799006|56012099006|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fU38nDI9GOMJnYbBDw5cU2DLwFaXEuUNyfWclaA8hwgTJ1762JXdjRUrbmRE39LANm6Qak4DN+5JGlsCxyI8H3qUEOUpOJ6bVEOXllleuq7efYBwiD3y5NtLMgSdiGBfp77Kl0nfwWdCRwg4WO4IfRNOyuH/VtKs/RsyAdGsVYsENm+bwPljkZHu52w5nfg5FT++CENkQh5/kEu+iaDXmUGYz6/IwUaWapkwTtEKrysFuUdDwEix13g/tc66XARxWjAme7OFhxHQPUn+Mer+Z52KykQfKC7QmatEC2g30GU/3mBrXYU2lX7eoCNXO+6RN3uYnSUDKtWUb/LGABmVJPKYBcPOOGGYcNLXvfnXnr0xvStj+oCnYtYyBP+CqVcrUYpuLj9YTL2Cm8LDoyqIsM7vDvDaB18seA0vDKpNfcJrGiea5rclQrQ2sowYChy4rrwheE0+YgtCuX5R6ww9V1732dxS3Vw742P4w/GBt0K6EZzw9tXbPeSRaXDF/HILwNafXZrCnTEZams8TjyV2MgO317xWYaOmPniQuakdjFR9TNbZwVHag87WB3LjKhtGGaf6Y1DctXFwkl8ikOUj2Q8/homsyQSVLs1mNUL1SM+frIB5mRHDZGi9FhlVYV1y+RJf47E7HCv6AqfL7pD/nKtA1r+pVEPMx/MEVBO2T6gvTarTv8OlDSTD9ZSBy/DkDADIdyob8n2AClxyxir7w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(22082099003)(18002099003)(16102099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	neqzbaQ64GHmeDbcnt/EKtxL+ma8o2x+wV4xgkj9OmDrw3HRh3l3nQHBiUWvuiVemSlZUL+LjThNjoWbRzI/QrQs/Fr6a8g374j44TBjF+ig5Rxf6rF+ho5ybQKUW2mAGUVV+qp85cxJ0H159hlJPgZLy0ZvF6TG4nN3i3MCfpfCNAr2nWqw7/bgPoevGjMQVP3k6K8iKjFfoTTh84/+FVUws5U37BUJap/0iUQm0tXPPgrFpv6looe/MY/vIg9Nw1K0m5URKEkJ3rIBPU+Co5ZEZ/RtlzR9SuCIDcxn6Oi61YGBLlXEL739SX9McFkMZbljRmXc+lTIhxWsr1lCtLMRLgRCMOxK6bzkwBOcda7mcBtP+y0GZW3Fkz15lUgXcC8RE+nngDEVQXqyzGh/LlYzDwnap59VnSi5MXtp+ckSl7Oc3PT666A2ZzGUYFqQ
X-Exchange-RoutingPolicyChecked:
	Cwd3j0JWk6KmqGZVhKnyJqcFTnyg1+T9FQVRkuigSgFnKb62OVQwE9dlNYLLVk2V3n/k+Nznclsg6YnA007VnpmE9dXMFE0Y+3UcH35p2aaLv0XyZ4hI+EdV4MV9C7lc+rnLBhTfDFpdik1D/RwNZubJvshwQIi4pIrHpXYjIchs6eCvF6baMk0JKdnqLtkEoqPvSqPy4LEiy7sOLraisdSGiYX3SWXiOcAFPWbIqFMddOISrLks0EVYYKQCUYHhsfnJLBbn7WlG0UCRP0Rla8N4EiQg74iPCjmbPthAzCwFUdTBUaJCppfZFEwgS++/HV2vB6zbhV5KR6Rp8jco0w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:44:11.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3489f43b-6914-4a92-8291-08df4bd41dea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY7PEPF000000EB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7576
X-Proofpoint-ORIG-GUID: aRbE4AZroDbhsMXPbjDLDvktZq0rtD73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX88mro+T6sefU
 hCW7tUZ9XPslfs8e79Rt48F9psiw6b8tUYtJBB7UQ1V9orhDlZ7JbYIcluYoRnHY3m4AmfKzAS5
 yYImiCXDppHm/2EMmjJF8eQNsfDSOXZZGe9JlQlFHa+fWfOQmclwMZf4C3YqZ13+13uNSPUUlKv
 034fTLRg/0pM5qptkRIdTOFviMMIjR+NGAElH5BJFipgtqN/7hQz5lsFndbWrdjTjp8IhYbErzZ
 mWDOqmVcXp39LD9bVOG6hANEolbT68g6kTYJ1s1PGWeuH5CGCCl28sxsPo2D2cVQcNtAr+P1s6F
 EW5cDw8/HxAQ7oH8+ICEathXNy+OH8JjhcIIo0iWOsYPbPNG5aEPcvrUw5+fXtBp9FhkVD8mEQ3
 /bTgKvzzTq1zc3c/0wSqw9tUGsl9EfYhf7cMCZLaRGU33NPnLkrDTZp2PLt5cVbxZEGMqgzkqWx
 41bT/K8Niy1QJRlszjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX+eqSJDdHDCzb
 uuzQVq5KEOyiZG1QTVdLV75xHrfboajtWPuRG8k5eTNIKiiV9jODXJgY/F5JRWgueyN3KCXcFd0
 ZV6PnCCFHMsDSnkhYoXKKUVDs4RsLDE=
X-Proofpoint-GUID: aRbE4AZroDbhsMXPbjDLDvktZq0rtD73
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b0853d2 cx=c_pps
 a=er6SsJhWVBF8D4+n+SRFpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=IgvGPtANmmiebJJGFgoA:9
X-Proofpoint-Spam-Reason: safe

In cs35l56_test_create_mock_device_registers() put dummy values in the
simulated CS35L56_SWIRE_DP3_CH*_INPUT registers so that they can be read.

This fixes a problem with the cs35l56_test_component_probe_omits_sdw_mux()
test. The test aims to prove that component_probe() does not put a value
in the regmap cache that will be written out to the registers during a
regcache_sync(). But the registers did not have a value in the simulated
regmap, so an attempt to read the register would fail instead of
populating the cache.

Fixes: 406541bbf4eb ("ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index 362da30b949e..2285076b9d0e 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -280,6 +280,7 @@ static void cs35l56_test_create_mock_device_registers(struct kunit *test)
 
 	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_config_registers_range, 0);
 	cs35l56_test_fill_register_range(test, &cs35l56_test_asp_mixer_registers_range, 0);
+	cs35l56_test_fill_register_range(test, &cs35l56_test_sdw_mux_registers_range, 0);
 }
 
 /*
-- 
2.47.3

