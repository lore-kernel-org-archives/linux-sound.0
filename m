Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792661896;
	b=EXGbgDh4LLrrf1OGB+PccJsKrPU0v7VlJziljPCrKjCLLwYSBuJyA3m65Pco901Z4uvt
	 trQkj5eTuwnvbRyf5LXEWkDRD54Ge9jEsBVDc2j37xD+JXWXowm4purTXNtxgH1y+9iD7
	 /fHMeV6iHUy9HHGDoJI2lGiL7iIe37ced1FKCvDaq1nJqrnt+/VMt8av2OaF+nM1d1WvX
	 0BmKbt392GcmfmRmKHm1C6jxZKpUKn3zqf15CaBtEuP5cxO3D5uxyZptP1uFSt2Lk0a6h
	 F2yTHj4YxD6lPSAiKFi9uvnHaVC3XqX9GzN1/vt80vC1QfdHWR9Y18nGFNeP8IHzJfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661896;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=dOd6BHdVl9jzGnwN6g6hkOeo812jJVoyj/MjnTdcoAQ=;
	b=IbvyetXeKBCkP6O8VAXGhoLXpdX+QUPaqmtfSUcXR7Y6bcLkwQW1KTyc0l42+M5t8aVk
	 VbqxmUlg+fzzFBMZWazGIbnXHcSbUkDlFT7OB+ddNjeM0fzrAnUgiDXg5JK0yQ026124l
	 Bml7mYrwEFIdgnxjZ+El1t0KxgalngqfD/0utRCH111EFzt5XZCHiF99IG2ef7cLVyQJS
	 sgyZ2ZmeP3FGzZK+x7oZcCTD9pmpSg1Ss7AXENNx+VysXdf0nOXHDsozZHoFujotSw3wI
	 2S3ZA5Vw/NVeHg8QItyqRsUX3/bXpUjAL+/lNwABRnfGfQZkye2k8qva2R9BMwew0mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=H5AZWfYo;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ZEgzqej7;
	arc=fail smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53552606A332
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53552606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=H5AZWfYo;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ZEgzqej7
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7IMIq1982984;
	Thu, 22 Oct 2026 04:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dOd6BHdVl9jzGnwN6g
	6hkOeo812jJVoyj/MjnTdcoAQ=; b=H5AZWfYoiQDmwM4HAiksqWNk0SVjJZBtDQ
	FFpljgHXgRVFSu5J8Z+lHPp6R9vkDza0HGgybN1pDI6ZILw47lijyiuX1BsUa8uB
	av8iNFpCRkX4qW+o2Ao4QsB4UD+B/PdBhnQoGVW2fghwGufuK9+/CM3uEIMWhEEs
	RWpzdFJUx4SRXb2OqMSTJnP+NK0qfrX0X0P9s3Ub7aWzpAwpg7AJzzE9BiNXmKwV
	pqlMGaP11ajyGfJeCj4LYa8/uW29N8Ox0nJsjr+YnwBUdfcT1WO0ZZpZ7NiBA1Ak
	IQZfkrx0FgaJ0SspgiC6EkDcHLrHMmO0dWDNr4HBqO9q+Z18CSlA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022073.outbound.protection.outlook.com [52.101.48.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hf9808c6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 04:38:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyEHVm0K07BVeMV+zbOLOct6VfWwmLUHG4cbh8GUKXbQmN6ErvXODyVPf4Q9H5o9os4PleQSloZb+aNfe04huwwBhGNP04DT7PFigIYcyUqBUUunXrXGDHTWMijiPfGeowU/gcKyHclEI01SDxvwzb7+mCNeQ/kTjLeNUAxB/62RZziBEmP1WCT2m3oNGyAFim8kiTTpY6L0/YCEcrMAHC6LUDbtC6cQSxwnl8roscDepLYUzQgdU0Ap98pjIyibbHj9LFU+AfYaz6kGx6osI1zMUfkeQy5qj9A9TY/rTuMvwBhfNc7y7XOq+SNxrUt+QRoWT7YctAYDhiL85kY/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOd6BHdVl9jzGnwN6g6hkOeo812jJVoyj/MjnTdcoAQ=;
 b=HPYUh0oS/FIyiO5jiK4px/2METwK3OeWavTq+k94gfMDuSQ/EqBBxr7yjPkGJHNyHzEg5obgXhhI+Y0LzKDLrTqYMmK13L21mz3jgW0wErAjc9SjDpXW1Oq0R5TazEDr2X2Ti83K37RMUVHGKWfRqnHgTIs+IDOf8YKJcpTwUQEZW8ucF/F2boZlZ/pHf8PLZu8vPTPvthl5Wx9y/5/770o0R2wM3aXN/RVZVas7H5cUzElpjx6MfMhY5LrXDouD0X2YvfF1d4K1rrWPtIGj+vp3mgpOepTjzMQZI5Xa5UKbDaHL6adpc+YsTgxXKuG5aacGMaH3S8ZbSNwRZ9Zyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOd6BHdVl9jzGnwN6g6hkOeo812jJVoyj/MjnTdcoAQ=;
 b=ZEgzqej7LwLLfmJk5MJt6PsWA65iUaxlrQUnUAVwstlEquWmMCSL7bsoHjeYLrj7KBn8ysIMT2CQNhUaTzzakUADMb7KdrJn4mZZUIX+Fe6lxtqyqhN6FMXhR5+24xijnyOzo4CtAR4KN7wsYExU3b09f6ZAScTXCDZDBkqGk5w=
Received: from PH8P221CA0036.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::25)
 by SA0PR19MB4173.namprd19.prod.outlook.com (2603:10b6:806:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 09:38:04 +0000
Received: from CY6PEPF00000049.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::56) by PH8P221CA0036.outlook.office365.com
 (2603:10b6:510:346::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 09:38:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY6PEPF00000049.mail.protection.outlook.com (10.167.247.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Thu, 22 Oct 2026 09:38:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 19D27406540;
	Thu, 22 Oct 2026 09:38:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EB59582024C;
	Thu, 22 Oct 2026 09:38:01 +0000 (UTC)
Date: Thu, 22 Oct 2026 10:38:00 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ASoC: wm8994: fix MCLK gating for AIF clocks
 sourced from MCLK2
Message-ID: <atnZeHMvosF97hu5@opensource.cirrus.com>
References: <20261022074743.625223-1-m.szyprowski@samsung.com>
 <CGME20261022074753eucas1p26ebe5f299d94a00260716a4f137f21b5@eucas1p2.samsung.com>
 <20261022074743.625223-2-m.szyprowski@samsung.com>
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
In-Reply-To: <20261022074743.625223-2-m.szyprowski@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000049:EE_|SA0PR19MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d539a1-0d96-45f4-86d3-08df30202bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|16102099003|22082099003|18002099003|261021121427099003|4143699003|5023799004|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GU+igHM9+FObzMlGSMAD0w6o2VuTJTCfT85HDzRKe0jIbSzb8Hf/CFfho8XpqgoyVOk9peP7BhLvDU1ykrQ21wnPrGPszs0yXBLbiejZK4zhIkowRDuGGIyojWj1Q9BDXFHcWvR92p9QC7wRyfesYRVQytSQ35xrhu7Dday0II4Xy9B7pzyiToFoc9+GfQKRSo2cG2SmamAyfy0tmpG6uexUNpuzPCOUaHwjT2wZh/VGREvpaHsy6V1Um6WtbyVyATuv+nyqSlhIlsxS16M83lGWryf37R78P5xhSAUqpOOltp2gC1WW26W9kuwzr2WhQOjVnqT/6yNmdhI90fGIgBMSPJD5JDz+gtW/iEitUVrjhwVnhewMEU2oLwswGJEaU4GkxlSz9RVm/ahAcBf2e8AKFdbZxowmBYwyL+zFlWVll6tS+hzsyF1sI8bxi0fxs6azxVfbHTPFbechs7MNYb64LILEOBH6NVQ5PTIXkgDEc1XeiMjfvV/kO83GEaXIIa6gzjd1+W0zHreEorCXpVMvalP0MScAwhsbyXgf/FTmT+qwOnwPITFh94uiOmIDqGXIimajyW+C0G9qBIlQ3RiMFDGjUf9/5NPJ6zJ0YKn3c67wLUZLw37FO9uBmRjFAAYEzO0o3Q5xGqGuHG9+oqKSd/fxtKKKHf1gzxiCztNHUdZlYposDr3hSH+fc3o7M2ie6Mh/QAsHUZVbj8GbIw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(16102099003)(22082099003)(18002099003)(261021121427099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GlknIdSalkIIeKedJNAMmlpoIAF2xwz29PjivVUMOE2++f0KwjZ4LpTVO/03QVC+X2Nd4vmtZ8ceqxKMX9FSVB3UeESbnsY2V+ItuNpXSUJqZSyFqO6ErLezQCLD4IWLrX6dQXH27GhjbWw0Ew2cdV71XpwX1Prq9kZzOxzeWdCLonVUqbUeuQBjq5C35Q/4Y+UDEQ73d56KZB6IMI4eKR6x+iy5hP74JCPeml6zLO5gE4I2XAlXfrVBpPNkGtwG1HPZ2OU37GbzwlFihz1Fe1iTfBTqfSSYe9/jIOPa5wlMHAWMWEF2uYNmqHheX+JyghRPGDmwV4Ohy1yGsZ5YBjGdFdVCPpd2fozvxMJB4LWOHlLIY8BHI5/T9YrxaZh9dlozrRjgDikReInj+yvfhzGwZ/Q65r9LmxCkPhqLHjSKZsYWbrmGxHrnTlJXBPmZ
X-Exchange-RoutingPolicyChecked:
	5b6EDw0mvMqK3W4ipNzApsHc8PVo5cHYgk3lT3oiVyCfBAJpspzFwZ3DgLpEvhHfZa01EJKySP5tAVRUnuY1CgLVDF8z+qdfOXpCtQNwlBBrznUmby0Iac7KQHCW+wv6IvHYi/tEPQphkBE2M5qIpb5ozaJnGlrDVulHgpvEFMliqNee7iHelsUTnlXRmq2gY4UBCvtCUhK4WcbWz3BOUvMdzKzQCgguBPwCOkFly1L7JdzibpMhW4strAUgJZRgNqpEkfNg9PFfiTXd4NeSU80La1gr6+2YL7htrZpEx3puf1g7k50lsTzmyyJbzgDa3gbXJEYJ0AhLrTSzPdkDww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:38:03.6887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d539a1-0d96-45f4-86d3-08df30202bae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY6PEPF00000049.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4173
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXz/5EAHrbQpzS
 HVSM8ysVnt68X9WMTttzfnwMohn6kd3KIHBoNtx4FrVwmgBWFTLsrPGfYJp+RtYpoQd7PuBSeEk
 2miasEbDA5Icuip7u8wPm6mDISg3upw=
X-Authority-Analysis: v=2.4 cv=Er5HPicA c=1 sm=1 tr=0 ts=6ad9d982 cx=c_pps
 a=o5n9MpPAMAXLgzyrJXPTXg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=hD80L64hAAAA:8 a=w1d2syhTAAAA:8 a=92EV-Td5O-lQIe5qmq4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wRsLYUGA4-Mal_v9be_hdMXkPHedb_3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXza8yJImCXuF/
 DNDpLWJUTIiL0KVFcs3P7aYhbAbIvp8nRaCPG/DJ7LIiSbk7vWaH5nqecDFtYrEeOTtDOqGoW1j
 FGoU5cqhzUgEGN+dEXd4JEO6BlzUmQq0fiPQEtd0qZ95mT5zcwmEzHK96wxcxkfb+NoI2xy0PcQ
 pPO1AVsFM1irSCn7rZS8GN+frIJX1LHkLmTb5KnXazRFBDi4ZCru3q6tg6H56wJIuBx6YvjV5s6
 Pem7oxAr+1vzxbadl0KkN/uv0kfkYI/PKy8ufBTdv8Fex8oJGAhA9YARHzh17ybx4t+XqcLUGWD
 Ythk/rWh9aE5mul+cbNnt28asAnXMLAD5wT7fp0V4PFJ//EEUnxDWOa60bfTBjyZoXhP28xBQbZ
 al8wIqaPITkOjU9PA3jJMLD1qDnN6nk6nYddBtmutK+KyT4wHRxUIQr0K6NjVUB4OF9xiO93fd2
 rt1s8umipZoB6/HeXrg==
X-Proofpoint-GUID: wRsLYUGA4-Mal_v9be_hdMXkPHedb_3t
X-Proofpoint-Spam-Reason: safe

On Thu, Oct 22, 2026 at 09:47:39AM +0200, Marek Szyprowski wrote:
> aif_mclk_set() masks the AIFnCLK_SRC field of the AIFn clocking
> register, but compares the result with unshifted field values. The
> MCLK2 source (0x08) therefore never matches, so MCLK2 is never enabled
> for an AIF clocked from it, and the AIF relies on other users of that
> clock to keep it running.
> 
> On the Exynos4412 Trats2 board, AIF1 and SYSCLK run from MCLK2, the
> 32768Hz PMIC clock, while the codec is idle. That clock is shared with
> the WLAN and Bluetooth chips, which enable it only once their drivers
> are loaded. Until then the codec runs from a stopped clock: FLL1 fails
> to lock when configured from that state, and the codec floods the
> kernel log with FIFO error interrupts once a digital path is powered
> up:
> 
>  wm8994-codec wm8994-codec: Timed out waiting for FLL lock
>  wm8994-codec wm8994-codec: FIFO error
> 
> Booting with clk_ignore_unused, which keeps that clock running from
> the bootloader, makes both issues disappear.
> 
> Fixing just the comparison is not enough. The AIF clock source can
> be changed by configure_aif_clock() while the AIF clock is running,
> for example the Midas machine driver switches AIF1 between MCLK2 and
> FLL1 while AIF1CLK is kept enabled for jack detection. The MCLK
> selected this way is never enabled, and looking up the clock again on
> disable can release a different MCLK than the one enabled, leaking the
> enable count of one clock and underflowing the other.
> 
> Shift the field value before decoding it, and remember which MCLK has
> been enabled for each AIF, so that the same clock is released on
> disable. When the AIF clock source is changed while the AIF clock is
> running, enable the new MCLK before switching to it and release the
> previous one afterwards. While at it, report the MCLK number 1-based
> in the error message.
> 
> Fixes: 001b83d395ab ("ASoC: wm8994: Add support for MCLKn clock gating")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
