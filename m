Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191132;
	b=pYFwp08Ry7tRVdO9dD6AIqlbs0iKPebpVVpdRuNSEWAbD3pSwvD1uypyTIhShUZnjBoI
	 S+lfwx5NeBPAHqcS8I89aaiov+OYS9v+n3NbqdpemkGtIWk/QrxBkAUi7QtYTPOnw0uTK
	 Zufj2oeyJDRe+NfYkgmbBcxXOvIZxjj/UXx6/tJ8QzH6HpLZVgjqQzSaMu3U9dv/BIpfv
	 d8sN0CPOXWnBHDIoQfLmK7C3pVky9TI1upUVi1obeg2Otik+CBQYEA5c/DgLaW3FzZQSi
	 Hydjjh1I8PmKaTrwCTjEoy82JYvU+uidljUOMUrImNf0fZqB1Zd4GZezgcMzxXa3bOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191132;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
	b=Rs3xeBBeQXKQ7Sy8R9l1RQJAyoWvJjhBXgC4GLcdw8fXjGmjizr7ppQPhVkhbWNXbxzn
	 dtXTtsPEAo7kayr0O357IbeRdxSzCeZyDtgGKagG4kibmL+geIfKI8tBZUGFpjhPFNF/+
	 agyBMf01vr/Ynz4CPlO69eIQ7YNihlUxr+8/PuTdYFTm9pCHEb8hIqcBqIVk1W8a005Gq
	 88waNrXoLBEyEd1BXH83qCSgU3DIFyO1mKAIwV3yFy5dcHSCBXnx0/1WmpKI3zQ+2yjGx
	 EVXXDtUvQJ28FPOG2uhYxyMb7NeAcL9okjNmjdcKofyS64kfVJ9gZ89Nh9Mp0KlvTnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WsnGfsOH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jaxaqVWx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E5606A330;
	Fri, 20 Nov 2026 16:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=WsnGfsOH;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jaxaqVWx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEUxUs787558;
	Fri, 20 Nov 2026 10:11:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=; b=
	WsnGfsOHuz47E9QxlSki7PPu+24ylausbmqY1s+9RK3ChQflIn5qq4c9KtudFPrS
	o7Y+qbIyHhvTVUXheZ3jEWY51pKTT5BnlR/Fxu2FG2zTYE0x7wc7ukjplEzYU9Hj
	WZdvmjD5WdAS6dOxFjoQGkE4fk5qmdMwMhopa1Bw02QXvtpg8xmpvs7HVVttMEUw
	4WM0oBjliMNocG7akNIE82MzKjNGAxSozsiI4VCMzPNXS0Wsxcp+SV8M0kGGL6b/
	ef2sKyKxchyeld/mYomxuox1Dvy5oFTIrEfYd/330vpgSc66CaKX6/3w1Vh8IPgo
	tLuQUPhXgCbFFEYn2Z+WOQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020086.outbound.protection.outlook.com [52.101.193.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au6uO0qIcORldanFJPa/fgQ0sujlQnvkie2Vnog5Zl/jOtsGSHgjIMoZV4OS75w+Cay6jvLr2km8ihx/i5fTJCeKCEvoTcReBBYRj094UrezAruVeZrzH+ZruXfqUseaIwVMVwlrWDZWOMnhZOLDnR9giEdgGsAvMkEvci2kSLven2zmRvvyPwgN6+Y0Do+M3kfcjeD2zjH2tRyBaTNUt7dEFagkRTGBVdLRuSF94a4t7s7aSbXuReVQkblVA23ivjfGUQw2f7v7oupRbK7qiWFyHmd7lNqrIOh2/xFI6qsJmcxQZp5HHhARjvQD3Pc/Ggd1fjetAWqFZOx91Y0onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
 b=NAS050FKU5M+ySH7gh0+4XAQe8KeWOMbUl82VyxgaNK/dJnjDAypWm7eNisE42BNt12LqY1AU4nYrotw0RueleNi3m4t6Tm/lGwvl1K7VYuV5+fDA1oCNpYR+xEd/8TGD/dH3LRd7id2o2Ts+ncPDefi2L62Sx2nrSs0Vz3OdmETlOsTE6VoOEWkEqbAVJJNssakdHpOXLx7qdcW+ak3Qtx3XHzP4nZjtd+5ya0Mvtnvt0OsqGQUCmkE/X5kWl8iNdKHLrA6MvzyWIQCTbqf4zK2SROVLHvFqyQgu6/P4jVHMpemcqeyL6Ab1k+ZxhsUSWEKVkLNiXQ4f2TY/e8foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
 b=jaxaqVWxBGYGxeQlPre1X7EcZnNCtUDn7fXg4AkS2l7jAk63vAQmjnRjrLUe3og7KtJe7WNiCBPDH8VjvoLkXUrNoX/G0dhwYqJhfHVMOakKid/riqAnW/oyZc2/HHt4btAB5k6il+aBxPKTjC1loaE3YX92SjJgS3lhHV4PwWo=
Received: from BL1PR13CA0149.namprd13.prod.outlook.com (2603:10b6:208:2bb::34)
 by DS2PR19MB9128.namprd19.prod.outlook.com (2603:10b6:8:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:49 +0000
Received: from BN2PEPF0000A88F.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::4d) by BL1PR13CA0149.outlook.office365.com
 (2603:10b6:208:2bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Fri, 20
 Nov 2026 16:11:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A88F.mail.protection.outlook.com (10.167.248.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7CB67406557;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 430E1822540;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/7] ALSA: hda: cs35l41: Unset irq if not used or configured
Date: Fri, 20 Nov 2026 16:10:49 +0000
Message-ID: <20261120161136.157593-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88F:EE_|DS2PR19MB9128:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7084bb72-c10d-4f41-7a2c-08df4720fa61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|18002099003|22082099003|16102099003|11063799006|56012099006|261026121527099003|261021121427099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ypodIFnEC5EL/WQQy7+Lh1xQWps7J6WadtpRyNWljLeBhTt39EX3C9i/nVklBd/9VIhoPobUcyImLuiixs9BgOtHaYPF3dag+52neD5njGI689Bie2oO/TFSclxC0HRu9fCNf9roc5pG7H5OJ422hf87wtkPu/YnB5+l/i3nuKN5r8H0SptZCYS5QHPlD3xl1KUaifODiWcsCAByJvKF+ao3zI+1NuApivRZGhDU/+NkI7ROTuSt+49SHpPMUfUheSf0btTiyq9sZ84N97rOWgtR0f6y6vTV9J8cD3znSlygQqIWq5Fn/fauoTJiNdlGtB/ZUqRBihcsqXBkYfKm4v0PFgO7UzIBoQRNbPym5HfB4g8UxT+v5NaBZ+82MeZOB36Tg7uOiC6p9s/fSES8nVH0kD3cTxE19Gi2L8Y55BfoVFppI412z1En5dyHiveZFc4KlZixZhutICD/guqQroHfOc15bevbkY7pAQH3Ncq2SMAltTUiQ85MHlyBJmbtzwc6z+qDr/dLnDWBnCmQKyxACkY1daNrNm3XdfHr8H7W/STHWlZjQSXG03ju+z06sYbEVBTUCOaI9KSPIDXHjODlLQPNC0bg0F03EBWynphV7/Fk5rzNXBYx88kKybkoNvna+OPtlpeNoBCZ9Ieygf1NF1q/v6MRHD+mK9TvD18QeTnpZf7yaekqAM+v9E2zskMoCuf64GR5buXuLASrwA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(18002099003)(22082099003)(16102099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QHVLWZXQXXrkv9A4FZ66op4l3cyOjh+4zFLY7tDA26toYcagb8YbHgyLr9fN/AJvLvuq0vcoJu7sVOMce6T0Q6RQR57m+X4s+2uZq8nkqnz5KfoikskY0JAJTjtVq/qlK7JQrohcEKT7ZVsIY1/aL/tEKWSFHfJrB/bSftkRIN8NCpGvXjgo5Jy/Kgh1b1ddcSY7Qh1mhWNeiXGXP0v8d0eXSqzyzQsLnbXlPk6PEL3i2QLpHsMAHHC3rygeNUDFGFk7O/hJtUCC1M+NQt3OvPWvKNC/qN35VVDMdDo/xJInejP1MBIXRoRL2/frrrZSNqymIaRQ1c1/orscYY2Xt9decp8Znfn4QrRqvW2GanLn4mbizHZGHVlPXDtBO6l8IMD2Qg8S4vAhvuhd+DhjK1DcivhogCWJqjrl0RFNJEaJ41mCO1HsRrNWX1rKf22f
X-Exchange-RoutingPolicyChecked:
	SAqAutamfdWYR97w2dcg+ArLlCyyAsSibxVrRBluEqj76qJ+wr/TlripS1w+b7V3neHjBNhXGxOqde7Vi9/u9cr/ZM1NB9fi4olRLVZdoq2RfkyP24mU5Mify5VxMIhNfCodhsaYIcTbG2dB/R9oMyXduwkEqDdr3j1nleNw9QMMLAejB32ODD1XrVDUCYnzGWBqFCxpHI4TG8AjAtbpW+Zuki6qPuNJt0ypt33ozAFY4P58Ct2o8T1Xpm+4K5NrN0tx7YQQbzuZXKVTpLtJgzK37DBQ3hZl9K9zjsMST703FDICvFlVMjLhv4vkctX19WIC3t8yHqsKCoZii3FBlA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:47.2980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7084bb72-c10d-4f41-7a2c-08df4720fa61
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A88F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX+Z0hdP1OhTN7
 /9bSwdU2zmxUbdR2fa13GLN30H+xzqsCFzBs8Rw3teqXnxWpI22JHo7nVwvb3T9YOHRHS9JK3K6
 96PgD8hzT2t42/z4do2Km2WqlLzHyf8324KmiYvA6SCgfAJun4iXafl4RTJC/Od2E+ynzEgmQY6
 o0WPDt2cq/IeSNRngovkFsiIswPPTn21fNKXhHbjVYjAKkjSHKFFK5C8hTSvknYuLobH+ClJZAh
 7zjzXgkropRCwo6T6aR1iSgrDQo89iq/KfCjoY1lrTxCrNSTBbmj/dkB0xtRZwgrNUWe5QyeQRV
 1wD55250124wb684w2jdiBEbwrPP71pcL04lNWp1oOfG/4wLIF0lQXwE53aKar4uUumu3Au5YjJ
 0tcl+U+Dn19nMdqZWrOGo0WaKhgft0a8C1bjy9b4Ud5Ow1PahxmvE8jh4cji/GPMtkyjTFZd9Nn
 4Zd6TzA1fL2eJWoYoVg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b00714a cx=c_pps
 a=Ju9Zey7g8YyQpP5MZaDBLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=MW-7GC1dHaY6nPwQOzoA:9
X-Proofpoint-ORIG-GUID: Z5YKDMQidP78FJ3cd0IoPHpMHhiRBSB1
X-Proofpoint-GUID: Z5YKDMQidP78FJ3cd0IoPHpMHhiRBSB1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfXwZZKdsH2TPFn
 sO8ob+b3j3u89bGG0nsoLG05/T3R7GaIwzvI/PdCzA8BMaQ635xRaoCmviU2omhQTII9oJr+aFd
 bjBjCKaZIewFdubaH5tCsJHObZ5RMf0=
X-Proofpoint-Spam-Reason: safe

If the irq is not allocated, or does not exist in ACPI, clear the saved
irq value. This prevents the driver from being able to access an
unconfigured or unused irq later.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index f6910916ad47..2e2bf231d3fc 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1633,6 +1633,8 @@ static void cs35l41_configure_interrupt(struct cs35l41_hda *cs35l41, int irq_pol
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
 					0, &cs35l41_regmap_irq_chip, &cs35l41->irq_data);
 	if (ret) {
+		/* unset irq if unable to be used */
+		cs35l41->irq = 0;
 		dev_dbg(cs35l41->dev, "Unable to add IRQ Chip: %d.", ret);
 		goto err;
 	}
@@ -1712,6 +1714,9 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 
 	if (using_irq)
 		cs35l41_configure_interrupt(cs35l41, irq_pol);
+	else
+		/* Unset irq if not used */
+		cs35l41->irq = 0;
 
 	return cs35l41_hda_channel_map(cs35l41);
 }
-- 
2.43.0

