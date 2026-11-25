Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607513;
	b=PeSIY8/RgXABKTqjoZqDrb4DyP1Uz47MGOIamS2FWw3VCXwid3Mh/PMc1JtHjv/BSOLS
	 gHsqc9you3tECaF0WhE9ObJMe40fZFK4F795O/QKhSRFXccgttQ2Z8xr3+Ptz5WmevSlh
	 WjHuPWzrm3FukRZvDysGY+mBVxnXBPxsuNGcbc+RrK9zVg3vzbM8Aqw2BECTVeQ1BDGnu
	 kfU+/kVth6SHZlZViyCkjmtOryenREN+BLwlarPK3vOtPRJMPqvd2cLZHdjlpqV0zcWuC
	 +fuNjfUBNoaOjoqZ1uQGYAcgWHp6q1BKe+IW5ZmB4KEDILYkp1pXnqbm66DoOF0l7nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=E2umS5IFog6eVXQaruco1fvrHR2rLhuFi8sSKAQ+hWE=;
	b=LHr/JFyTALXTwRs5/2ZLtWk8hTYWcIXmZClEL3JbpyG+qFV9mndv0n0KnJ8T22hYITfZ
	 2cvn32lH3yijTufnuY/d/kHwoWc2OyxdQDmEqP5eLMI3ev/aKhVNnLRaPb3ZPKo4JBssS
	 Jmzoto7as7RO/Jrcvfmbm5EFriC2q3ZrwoU78EgrWJaNXfVeudhwvwwD6J38wdk/e3brP
	 77Myxcdw+w8xtO+VJMmBrR4IPJx5XfQn64hatZDBytNZAl+elBIlrRKiFNk3jdy+dZLNm
	 OlUcbBV+3rNPEZkFkDy0TRq2jtVAZn8WUBkZum7dx2GVvK/Vcz/0tHJWIRwYnH1IFXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pHJsCslE;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ybm4GWa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8906606A31E;
	Wed, 25 Nov 2026 11:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8906606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pHJsCslE;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ybm4GWa0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVb2102441;
	Wed, 25 Nov 2026 05:51:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=E2umS5IFog6eVXQa
	ruco1fvrHR2rLhuFi8sSKAQ+hWE=; b=pHJsCslEYEv1gCxCkJYKx5WFMu0R71xs
	QG/G4E6ISCg4mVU9A9Hf2ydUPzcgQogRjuJpE8y0pDxRqiU71kDxr1Cc3MT86m6O
	vZ8xh4aaNVjgM992Uyq/VKfAIwWpdnONq0GcJy+3jibBb//rfjA2uhO+UntDBz2o
	Nj1bcb5VDcwV02wh6CUoTfZpxNXvHNSrLF+G9AfALGXBhlPCNpBLTCPaO9e+HtqR
	6gewg/qUJCYZkW/VpGBSFY/AssH1IELqs6AZksRAIYj2pMa8h+YRYYb5KHXzkUfx
	ZoC7k6FOAslqnTY5kDREVHblSRSpVxpCWyzvLLY/b5NVTRAL2eOwCA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022142.outbound.protection.outlook.com [40.93.195.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3wm9YtljpcAg8yT/71qAJoZ6VKZRJhNezouPrPpcMAmhinbhQWyFXWMnnkvlicDnnhAwM5XjzYltH5AUyPFJFgND7zmF++mqA5ySuMuVCrocYSh6gJ/ylWfirfCtb+jBMsV9e0G/5+Ll8pn+vcvvl2dXqUvz7WBDDv40W3fUu96v44+6YDYFhYkBS23fk/eHKlITPhFp+T0m8mWZyrmzJ1bF0gExvFJwen8ShOJfTU7HaF7NljQSRCt7uoyZ/f2KLZcGt+FZB6fw7pGXu65KlidhTuWo9IKq7AEVSIz7rSWQIcomTZ6i9jnZTCOqCiIrLp/mGzCho90MoPp0BpO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2umS5IFog6eVXQaruco1fvrHR2rLhuFi8sSKAQ+hWE=;
 b=FYgaqJE7XhsVsC6/NfTlbjn9ZnMtRcb3MTySPv/vgTXZXn72lL4miayivUSx6R0E110wjllziwe1I555Yc7uYPklZjhgpuAwUrYbaBuQMXjcPycuQ5hl+OAjcXMe1BaTW6oscn38LLa1Mhtb8p/I1njXoll9A7p5bTuy9e1dV8vzJPx23uYi0gONt2/aiUN7JpZ1qq9rZKxPC0H4DfpWz711fi2D8WualIxYRzd8mQGyCZjDFeIiAiqQOR1nPP0sTBTeL38LZCdNryyl02s1pNELgd34F9/2FX9zaMSw6x/QrCndzjfCfJ3gGvfoSj5muxv7kCUS19DUPUI/lzK8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2umS5IFog6eVXQaruco1fvrHR2rLhuFi8sSKAQ+hWE=;
 b=Ybm4GWa0BfxemRi50OiImLnOFW5Z57oPCDiVLPAadHUUrDTV+2cuU47LcOileACozrE3oC7vHrryFrZ3c93Zo/v4HMZPadjavDP19HG/5rx+8f2NMQiHHnK8V9jRlAiMma9VY2vs3+2pUpML5KpyO6pSSh/E4rLU2Wnd9EpW9Ms=
Received: from CH2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:610:4f::16)
 by LY0PR19MB002440.namprd19.prod.outlook.com (2603:10b6:404:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:51:35 +0000
Received: from CH7PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::7a) by CH2PR18CA0006.outlook.office365.com
 (2603:10b6:610:4f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000016.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Wed, 25 Nov 2026 11:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43B80406550;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 094AF82024C;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 0/7] Fixes and improvements in CS35L41 HDA driver for System Suspend/Resume
Date: Wed, 25 Nov 2026 11:50:42 +0000
Message-ID: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH7PEPF00000016:EE_|LY0PR19MB002440:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 145ede21-77d3-42ea-05cd-08df4aea74f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|16102099003|18002099003|261009223027099003|56012099006|11063799006|261028144727099003|261102123227099003|261026121527099003|261022075727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UwmYfSBh2dhx5Hi+Eb9UZuXUMVLRTR2GJcnoiIK1L441OKpQXfXOLkj7B0kT5lSLFpZgRIhFRSihMU7UBXm7lqpXofeB0ZnkXOdv5LuXBfJ5RqHkZ46rlR9kdo8cK5JCFb0HJXJWsE6nWMgD45JmQuTzQGwVzTVgTInKh3cAC6lYNoy4JC4QsLKqhKhntgw4BwWm66gpYozqT8z2OPKPD6p8GEzq7MWcuP6p14kNHZbgKvFnoiB1tvx4fDhAjLRiC2sjmSgQxXCLk2uvi4a/Hkq8gOqMFnTbN2/zinZxY6Lhae8igpKJOtJViXtu1emU39wTbiUqjDse4AJVLKh/5flbjcuHZ23JpGp9meKXkox6bibXWAleSWBXf4FYIZG5bo81LdZJZlg36MEhr7597sC4xVlB2nmfup11XAQhVB7ptLz0oworGnsrdX0/30acFI74a1w9LgBb9w3ez33HiZHqXKc9aOPUiVsBu7NZ1g5fpfU2QfJ1UTLNVV0kNkcFz/YgFrCqvVrw7XJUc2mF8Cd6DoFvExCtiT8kCSP0iRSdrEmRE7LWMrqadadhzebFlYWdsW2kV/0kKUQ+UmAUw/8VC04n1gELqtWyvnUjlOsTs/aYUjxSQy4Dfbir0i1OpC6attP6oAtn93gj5StF9ikELqP5lNyNLUkAonLfOEU4Hs90mn6rGCAsEUeAGqFpxbq82WcB6+6p/RULpq87Pw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(16102099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q6PyVGcVNxEdaSwE+TgyzobLJIH8oM6deLKLeTz3MeSBbF0FuYYZOdAQb0pCKk6d5sGlJkpIpqPaNh5mwrsD/0lrmZN5uNEk7AN1tgRppjtQAGNlooFE9FoRtD1/q9zhntG3AoWZ1fuzT8ltRkqgLFS3Ya6ziOQrpjQ8qZkptxGlH4hKkTBvHa8iZ1Ur4BM5a7/SJcIP3l1sew8VGDW/8f38d23nbE7JBydO7ECkgj3JzZrDiYvzoh15rX7vcrCWb63rx94C4HbZfQST3iYq71Bn+ucY5R7Qw/MfdgEFTeqQLyQnZb9U9u379vTdaxfNUU+kH3uJCDSgb0nUFH34AQPOVXkmOgxjcuMwXSOh2KzRRqGiWZSZAprVssYvTl7+Dk86j1bnUW3JVAlwmBXYP2Phmeug4jjTp+3nrUc3YXK76D5/EAbYVUV2dOzJ6FQB
X-Exchange-RoutingPolicyChecked:
	ViWYF4TgpH2TZwuw+s0Rrf//VopyKUsgqMYx9xKUQVH4agpQJ5fW6YzMwVwU6Qpgf3eCkNAHQzB/LBHC2SyJ7GvMLgGeHyB/jgLSlkk8UqWhz+0Q/ItJ0r2YuJRNHilOxnC1rs0tMWlYOiI272nbNmr562N6ssmrWf6+TKLi1FVyyDb4iej59OqOSQ63tLzUQ5gzRwoYuhHlHp8Sv8APcKRkEbVWo2uQZQ+10HRQ5tP5eEQm/PL7v2YjEjTjd1KpVnkKCINAtzE6MDeN3wHa+EzIS9cqimH2pJF5LNbRnZ3PTVhuzupVIglVOHmlqQwGgqImxsLZZBWld4PJ6JLyKQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:35.2642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145ede21-77d3-42ea-05cd-08df4aea74f5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR19MB002440
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX9dYzoRuJV712
 JXAd9xJyM9pAlzoZT8ySAnKBJUBCjiDPhvZb7sGVY5suiR0LSlc4lXT949b3CoU0rYvy24bKInU
 3bORP4MrxmOq5qTv/LARLec2/50ZrLHo7LPFxs6x5R2yNTUrXdl0LgOogMzol5ZPgHga9qV2i3b
 XLaU9XBlrxoWws8nAGl8eJvu8JzOapJi8Z9KWkcLpdYrA4qaz5SBUMnFotgHq+ou0TtLXujiO1S
 WVyFANElsnJKGLIJWu9YfmxXOp4bmSgW/wZWd6+CGtD6AirLfMKxSBiPBf5laU5RChq9wA8B6jr
 NlbGzR2FgngE06OGYAMRq6lHqot0Yc96NFbXWlrPwkhTGChd1dTit4lThJt02Ekr7SHbZ0BKMhv
 P8zo1YHX1sfSxVUT0wLEXAnarMZyoBM1dKI9ZPLaYvrjK+hiwVGDU7d8MHDPi4C1k4zDjNMxu+K
 0jfol6N5WWnUQ98s6pA==
X-Proofpoint-GUID: XIpGcAYbMQ4KR8oUM6hNyG3IHSBmVtbc
X-Proofpoint-ORIG-GUID: XIpGcAYbMQ4KR8oUM6hNyG3IHSBmVtbc
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbcb cx=c_pps
 a=JRl+IjCvVGCyytsd+wv0WQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=9XY0gge0qh7VRxIiEJ4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX04S7o6JJmCsH
 jOBx368aHbViSPNDu63Yw8GX+2x3Vv5Slct0rqzZZGWS6XN4cPz1JZCS1HCKCdI/s8V4UkTh8Ld
 We91Ukvsxa29+HT3Q20AVTz+0nkYA4k=
X-Proofpoint-Spam-Reason: safe

A number of issues in system suspend and system resume have been reported
on the CS35L41 HDA driver. These patches fix some of the issues, as well
as improve the suspend/resume code in the driver.

The main issues resolved are:
- CS35L41 boot issues after system resume (on SPI systems using S4 hibernation)
- a deadlock during system suspend due to a race condition with the filesystem

Also included is a patch to prevent issues with IRQs during suspend/resume.

In addition, there are 3 patches which prepare the driver for these
improvements and fixes:
- ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
- ALSA: hda: cs35l41: Unset irq if not used or configured
- ALSA: hda/cs35l41: Remove support for alternative firmware types

Changes since v1:
- Patch 2: Added Fixes tag requested by Sashiko
- Patch 4: Moved disable_irq call before suspend, and moved reset GPIO
  toggle into resume_early, as requested by Sashiko
- Patch 7: ensure DSP is shutdown on bind failure, as requested by Sashiko

Stefan Binding (7):
  ALSA: hda: cs35l41: Remove redundant lock_system_sleep() calls
  ASoC: cs35l41: Prevent software reset when using SPI
  ALSA: hda: cs35l41: Unset irq if not used or configured
  ALSA: hda/cs35l41: Split System Suspend/Resume callbacks
  ALSA: hda/cs35l41: Remove support for alternative firmware types
  ALSA: hda/cs35l41: Store filenames of successfully loaded firmware and
    tunings
  ALSA: hda/cs35l41: rework how firmware requests are queued and flushed
    to prevent races

 sound/hda/codecs/side-codecs/cs35l41_hda.c | 374 ++++++++++++++-------
 sound/hda/codecs/side-codecs/cs35l41_hda.h |   7 +-
 sound/soc/codecs/cs35l41-lib.c             |  51 ++-
 3 files changed, 287 insertions(+), 145 deletions(-)

-- 
2.43.0

