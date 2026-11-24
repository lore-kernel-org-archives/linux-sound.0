Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527814;
	b=iHOg9Iz4Swv/hAtDi+Q4rirqIcmlj3kj0oFCLW0F1Tu1Fst8zxNikw9Q18hq9iueSi3j
	 JScq3kfTB/h1wVixSQh8KjhSFsPkdXNEn1hFEh4iKltlVX+BXfX6V3R0Y2tKc/PMdWFIH
	 Ji2PlFDyFkJFiA1gjx0kAYNBNhd8CHs8PseGqm4an16C6A/T8+OicO7RU2V59EfMt+fxz
	 jLmNSsn+S2Vs8DDrQ1D+02GxkrCOyhCL/y4zTypwq2bUIwlbwIGhDUXlbXBXEyGsRzBVB
	 IayaCMPepoZHPvZwudrgRr8yqlEuS3ZbHoqnCmeUb69NIuY0MTyOTISnstQkUUZouDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527814;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=VVTz56kJiputM/p9mlDmTGS0AL4iYx/30HwU9mcmpRU=;
	b=srsRU0GscntGf13tQDNTqPqJ06jQCm8UJZhOC1WeZC7IotKMyqFot/h+dR9swEGmjQms
	 UiQ6/N2GZRqNDunQcMadD7hSnzQTj9vFXuSa3j7nERVWc+stkPOFzPSvdIWNE/aBBabjm
	 MfYfchN5TPYDd89jKfTiNmOBUmAYwYOjeUc9Gv0zgJ5I3nA8/XPQW08bC2Yvnd+hRhySo
	 1WfBAPz/qD0VqEhrMF6NEwsMKuKZGvJQ8tEEpctaZbNTHT7kz9om8rsFXLTiraMdEKM0G
	 m1qtZqR7zx9+1TFZfzb5LvZ5oV+JRWJZfyK3lV7IamWa2u3WUDoiarW5qBUrNrPON6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="LgyPNlH/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Pj7oj8q0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E539606A31E;
	Tue, 24 Nov 2026 13:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E539606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=LgyPNlH/;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Pj7oj8q0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOD5YJv3736947;
	Tue, 24 Nov 2026 07:42:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=VVTz56kJiputM/p9ml
	DmTGS0AL4iYx/30HwU9mcmpRU=; b=LgyPNlH/FAsAgJSEKB4/NWoA0aNhCib7Dt
	UbkAtmVNXShlmN6fHAEbKTa82YvJ4b8arPbX8N4qciMbtLd7kmFJn4WrRcRzngij
	EYArqdZY01V2/MRPxRkAk6RAah4W5a0T4XkgKKVJjNOftAGuK6TFbq2BP9vrzq3U
	7qt0XRzyZJklKlBrz7tlowCoA/c1J0pUisvSOnHDtDWmYM9gWjRhs0Ow0MEHb9i+
	y7IKjsFIpuLQgqm6/iwpezvNjQOwd1gd3tNjlJVfakYy6Jo+yg43xuMX2wvQYqW/
	XhwMsEyEsCaicwxbR3c95pPjcq1qurRFVZpp9/Tf+zGpkJL5P/kw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021090.outbound.protection.outlook.com [40.93.194.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51880p69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 07:42:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvJ6AyiBVPzdqOhgUyc0+nWLycLYTMLezeGrWgAwkmqAzdZ02oWNJE+DXpvCVCuCr5JoPqv3j0JL4xCWDp0H92piWxLRF5jryaWr1wVIytnTcZ2wYBGk65TRzyrKiOL2Jlmf/zuhbXE9vPEmad/4lwgZciTYGTx/1ijvQKj7vjg1uuxoxawpXoJzfyny7tEb64gI4s79soMulbizWSCEq5JCs2Ng+O5rmvq/2V4jQdthjMQrRR/fYVZKnI2svv3ScAq6RUCmYeZiugLMkME8r87gZtUaymucyr8utO5ZTcVRw6txPZ9S7zzPXG2JiZMJsm4ZJNL7cDyEcbVPSlIWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVTz56kJiputM/p9mlDmTGS0AL4iYx/30HwU9mcmpRU=;
 b=MAodaiprkTYyTcfDZRhassLbX2oECKgKz35l7aomtXV9SwxC8/7wHod5UIJ6F78VPZqsb9tHua+DskqQM+mpYjs/Iip58w5Ffxycx5StDw1z2Dria7AwuBrjtDPk6SwxyXYAfOsLozqpAf3twIVkMr3QOUO70gBUzYEvvW1zfPIYy79eM599wURTuWP9g6a/cDbXgl0r3hz0DADGaaZGvoFhHEoUOPREOzsHZYKjpM/P0ofMH9/V0kZIlddv5mlnnlIwIVaWEDiJDT3WI95trL/bZLKEwc1rF8iJQJD2oKbumyPdyfTBMYxNDYbK50u9LWgjKgz7aY2CQVPo+X5iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVTz56kJiputM/p9mlDmTGS0AL4iYx/30HwU9mcmpRU=;
 b=Pj7oj8q0DzRB3fPmUL+04+a6ogL/BrckBGPD765UcBSZyizpBYxwEh1dwpAetaq9Xu/onfgeSCBO9MlrjSMYWeEAZeou9aWE4F+Chnc2R2me8X6iy81cabGuvUbjF64RH7bdtX27A/gI6MswDYsAfS0Ema1JlgXk+wkqULcZeRs=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by PH8PR19MB7166.namprd19.prod.outlook.com (2603:10b6:510:216::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 13:42:53 +0000
Received: from DM3PEPF000265BD.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::49) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 13:42:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM3PEPF000265BD.mail.protection.outlook.com (10.167.23.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 13:42:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B3ECD406550;
	Tue, 24 Nov 2026 13:42:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 98706822542;
	Tue, 24 Nov 2026 13:42:50 +0000 (UTC)
Date: Tue, 24 Nov 2026 13:42:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 1/4] ASoC: arizona: convert audio pdata parsing to
 generic device properties
Message-ID: <awWUWZNGQdkHanR2@opensource.cirrus.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
 <20261123-arizona-asoc-v2-1-6323d3c0961a@gmail.com>
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
In-Reply-To: <20261123-arizona-asoc-v2-1-6323d3c0961a@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BD:EE_|PH8PR19MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: df915bfa-ca4d-48b6-98b7-08df4a30d62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|23010399003|18002099003|16102099003|22082099003|6133799003|3023799007|10067099003|261026130827099003|56012099006|4143699003|261102123227099003|11063799006|261026121527099003|261026140227099003|261021130227099003|261021123027099003|261021121427099003|261028144727099003|261022113327099003|261021135927099003|261022075727099003|261022105027099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	QSgFMA2LDH/OOSHTMfVhIHTKjDtg2euX+PtCuI7mroqyxvb3z8mdBu2tObFWLp9ExYIcoW5KnPLlZb0ZHryZ2meD+PBEuy5fcW7esgAa6pduE5ccPV5jhFHAhT0KOI0NVUwsmSrNKGYPHbKseQlDsQBkfz6iyPRr1aXN04nsLWUKwYILhgXuJjh7Vk0NxCvZn6QcntLbCfr/giSQVfNy+dM6IdWASoOFeogaexaewosBu+ihn7QDsQz1igbbqu92a1aivkt3gP+yBof1xJ92M6h/Coj10ZrPD5Tkbul56zY/XW+50Sf+r/vhQujZbJbjUgDzB1uLf9K8s3yOUkQRWH/5PobROTfMeDdSgo7T1W8P1+hJE7hsEUDR9Vj7hQFhDnMy5fzB583Qh78AX0la/955R4nR7i+TVj9SVn3RrQWbWG0UUtzqqD/2zoCNE3vcLpa6inq27aqnu6IMgYj7Y1VtXn+0dRGcZfKIAY3oE0ZyBniE6rf/H+bYlJdU6Huq2O7byk11tfjpgh04nOqADNY1aaHORyyJyoG9r1YicClkDwhJ9OEEi8hRsSiFPtptqRE43RIeqgz3RF3xFugwj8IBqdg8ereBRMsQ60/lJpFdKavhBrpzcN2nQAq5ADZAF2Xk3mmcyxJYziuiIYPXRQSo6RKP38nk1j2lqp4JBag9bB2kQSgE6gR8CoiwzXBvCOmH8XE7nRFTz3WVqaOuUw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(23010399003)(18002099003)(16102099003)(22082099003)(6133799003)(3023799007)(10067099003)(261026130827099003)(56012099006)(4143699003)(261102123227099003)(11063799006)(261026121527099003)(261026140227099003)(261021130227099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022113327099003)(261021135927099003)(261022075727099003)(261022105027099003)(261022115727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dqGXWZUmn3Pk6fB8uxTmhGlXvwP6RyAAzNjC52hPSZErdh91GBC/fWnhtefqevsbh6IPmscan5cRblSsRu6R00NpWjoGfzwfkFZWPMd3Z56uoVdBbFKC3JY+eBnLoFqwQqbtZrjk5qerT0luxc0/KjdzwNx0y2SLakJ4ZEATRQpIgwEkCCbAsHH0Gws8HD4dWxW27o6ZQB9svGqICOLBm1sOBe8aYFbOIYgRP0KlKMoG5v1t5S/DxniKl4KdeltQEypHRdu6gSPkpTcky9QAeXUVMVa1mrpxDdRftocxex4kyIgtNcBDq8zNfhAZnEWJrc+BBYXaFURmuIyMnGwM2JF4D2k/3MsfK1cHPPM88Ur4boWL5zof9FsJElR+eIbYBewUXo3ex4LFi0PJVXc0oHHZM3P0BvrGWRlbN3LTtG0JRk0ILMxyp4oZYBpxl4oG
X-Exchange-RoutingPolicyChecked:
	Xh+VFLBPyquRZQr6nbOAEfvgPv5WOgcB274a+XekhHw22lTCJAoaaVmtQwSDVyYJEWx+kQPaOTPAUeM5jw3tWIVcV1dXSWqtnfpUBFhBYVO+yhINZXHWDZUE2/tXid1g4cntJAV7TDZrsF3YSrZrVfxj7OvuZMquLtg5CK4DbbvOnuBPhk/dtZ0zcVGLDXHzT35mnR0IfXIXGXdeldiLC8g3hPeIHZjvB+mT6ljL6ybJdGc0BhMkd46PJ93ssfE/4YQGBXft2+TrRpkuQaIiks5eexCMEATayFfh//66gcjbbrSipjEgUlw7pshp6M5OUNPYdT9P6D6dBDfZWo2DHw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:42:51.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df915bfa-ca4d-48b6-98b7-08df4a30d62b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3PEPF000265BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7166
X-Proofpoint-ORIG-GUID: jRyuvqLT3mhm1wlUV2rDrmseiczcUJk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MyBTYWx0ZWRfX6w+2lZmx7kF8
 WaZfuwbLs8W4Wjpzbs/sc+vSFW/bDDHAcQJM106NNYXBl0klXYXfbNEd0YTAjhstTFD6m7YlqbY
 irPEgO+ryKhA14n+kbph4rzyL6usJkE9YEEUUmJygeiDZi12rjC5uC6Ng9yYH73NwYoP9x0CWpM
 o35HVKBtMERTkQsSZmm1rffYIXss7hR14AzXq/dkQh+WFVf1TOMwQ0rungzAtKOz2reKQk2G48l
 m8ae0YeQgMaaHxi+RsMNr/p0Tm1n3t4HssjqgosrKgtdhjhRX5mfcd4t+epp2ulOnVBpcpbWUQW
 9l9E+gMyalXWGL4DgQz4lXcleHeDl65h3L68eZvO3bdcnIo1yaNysloYKUNsRQ5QD4QyPewmUYX
 aIqMa4O8WfV8+Bz7UQgxQL0MRbCaD9pJ3lZhasrwEO00qxBiBoxpfd9ZTf8ja02ur6UPYPAoXxz
 DjnmnNUnbaLjMgUGURg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MyBTYWx0ZWRfX7KBXgj0OP4nX
 iDW7Xd8xHX2XP0MHyyv0Ynw8Vl1uZBIl78tsl2xJUMMizOo9EQOLsPVn5cGpMU647aWsUwEaGVY
 NyRMlu9rMwISnIgEiNpq0QCeT3hp88c=
X-Proofpoint-GUID: jRyuvqLT3mhm1wlUV2rDrmseiczcUJk2
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b059461 cx=c_pps
 a=1SMuVRNdJx3IktO2ty4UNg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=qvRqzaMWwMpBHLIkv58A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 03:00:54PM -0800, Dmitry Torokhov wrote:
> Switch audio platform data parsing in the shared Arizona ASoC helper
> from OF-only property APIs to generic device property APIs so audio
> parameters can be provided via software nodes or ACPI in addition to
> Device Tree.
> 
> Align the audio configuration array types in struct arizona_pdata with
> generic property types so properties can be read directly into platform
> data, using boolean storage for out-mono flags and bounded array reads
> that preserve unspecified trailing elements. Drop the CONFIG_OF guards
> and obsolete error checks around the audio property parsing calls in all
> Arizona codec drivers.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
