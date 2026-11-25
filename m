Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604952;
	b=MI7q6iDI5GRt6ddeQ9BVL0lxvz76QV23F02QORJ2H3FttpN6nnyhlXJF8qaCVerdgfTf
	 H8CjRbQNuMssM5p/GUk6Ywq1ymyY5QBRHrKAdHEMkvii9WDGYPO3MGrVm9BZkZaLy4REx
	 PsG7yWbfwsCetc0EhoAx/0CysUZCAVQm6beRNcJ3Wuy0CDKH+EL6SUIzVwQ4D1WJI9Pq3
	 dn2EgfMDkHN6JLf0HdqWyaggZ2DwIcGd9o/QQsJNj5ZoFptHkvwETkitkqF+NXLs95pdw
	 f+t79xPxzVS5Wdkjj6OIpZdDtOCqppdOd90eyWaVerY/FXku4px7BInIMvvRHbwDb8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604952;
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
	bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
	b=pD4hTtVukmwUfG66BN2O7bzp0+W53OghAj/6vaXZfgz6L+2jQNUyKZmantXA4w0nNgpg
	 Vk7OeNtvAwQHNzIeN09Feth4ZAfgCdCnO/XJMOUa/DY8F6jLm+lSV99Vl0fBDL47CaxUX
	 lO4Ap98bDmR1kaymMKYHogPCzHHxwmOK4IeN1TBwYZGemfcPe+oBgCEz2QTSP4utkLTb4
	 bWKi7rlc5sprffT3xlM0qVuk3+7Am8oJ7JaUaYY/iLcd/lmfNhOI53+guLhEVSyO7trEg
	 TksjFl0qU8fs+/511KUHLPWNbiPjCnJI8Kyjua8ceiPMgZjtG6fsu+U/Iu/p8RPZNJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="dW8DGxG/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LuDb044F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D082606A32A;
	Wed, 25 Nov 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D082606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=dW8DGxG/;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LuDb044F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9boG54081208;
	Wed, 25 Nov 2026 05:09:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=; b=
	dW8DGxG/iRU7cLC6aRbm2nw4ushhZLfXRyCPbn0Ss2vy42XWzyEz33WctuM6kN9N
	uJbHwTTYS5ay4aukAWOJMzGEdB+EIE9SdfaYHSzPSqTh9MWqgEuKX7bOVGQ3v+5d
	buIwPFWPCEF/29wEIgXn+yezyz20QpF7I4SxeH14HSeg+s2EUmm9SZUyICahpWmb
	iBBfwZ4KZPpStMomjR1te0N0mhKYXjlwdFOpApO67VlVsRas6tMsRfdrO/lQrnEY
	sRUYB+OEE5m0IJhDXkfB9OnZmkxA7/FLsEOz9szX7RWb26sxDqahTplZIXHB1GHA
	J2Ebn8RXmWjMBnxyuAX/MA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022083.outbound.protection.outlook.com [40.107.200.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jah1b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:09:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir2e902mtdtDyRwbUCnltbEMdU+Ncx1tjjGnsNPDDXpJ4ZLxgTqCeIq5O4Ixmj77gdtmmJqBfmNsSGp+8/OA4nQavZ+n6j1HSW4NFRvzCz4yu52VT6LnYQmfA8uRZ8ZIG6FjqJUQ68ejCi8AMrVlm4gzwWhRGyUXeazgsvuL2mXVN3l95E/6WnJ/0z2O9TFgEjh03lVtkwsjVZ3kZneg2ArBv40OzII6rws33LA0PJwg6B0HgbpCtf9jv6FGaqWrxPwaYHdc5n7Ns2x57KfeKmHtIPN4K1vKBa2RNeNX0LgPrQi+tWkm/V9ihbbB+sGkxqo3a0C2maQXCppQ8GFsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
 b=TCEaw1EX6EQAjuY3Pmb2a0DagSUrVQEE0su4iLl3MFPa1gwaN8vd16ACg0IxUmQnJajLrAzC2GJsbhigHodFI2TDtGCH4WSICrsj6D9N802woWntFftHtAsrWfMszjEJmqeel9IAyVIQAWLFF9sa2Uua/BdfyNgkL0PulsVEMBeZAY2UvigDAW/AXhUjgbykOSSn9RHOkmqtY6sDxZaeyOnSXw35/hrwcT9H5SFxDweUJ0it/XMEPzm9FWZf/kK3dC2gp/kKd1WXNVZDLe52GtuTttIj/IBRjyqAD/JzGKJWbkAqr+jKLJ9UQ+EcBYR832ui6whRLh1FOpAVGHziaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcRzsr/IK1NMCnIPJLxlSMVR1vTlqKqpV7hGYWIajFg=;
 b=LuDb044FnxGmhXZmtgXSRayNLfjhGJuYoX+v6LVvchLgqhcL+3bKBDZP8toKaKm9jtcA/rF44O8V8sXbVfnd6vjpzCcuy5nnWrmKjh+VvZcqw5Y0oEsJlYlfMZpAHEMpru6PPnusqn9xzNXMokrZFTdO6WvMqN03Qyy8Kv6DwLY=
Received: from PH2PEPF00003857.namprd17.prod.outlook.com (2603:10b6:518:1::79)
 by SA0PR19MB4301.namprd19.prod.outlook.com (2603:10b6:806:8f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:08:56 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2a01:111:f403:c902::b) by PH2PEPF00003857.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:08:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:08:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0B5C1406553;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E79BA822545;
	Wed, 25 Nov 2026 11:08:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 2/4] ASoC: cs35l56: Rename the DP3 DAI to cs35l56-ot127
Date: Wed, 25 Nov 2026 11:08:51 +0000
Message-ID: <20261125110853.741337-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125110853.741337-1-rf@opensource.cirrus.com>
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SA0PR19MB4301:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9506cf77-ae84-404d-d39a-08df4ae47f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|61400799027|82310400026|56012099006|10067099003|261026140227099003|261028144727099003|11063799006|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261102123227099003|16102099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Fp9qrc+MyuRnAv4npDaogsy+f7de0qooPCRLKH7BKpr78EfGgYwR1J7Y5nHkYX/E3a8owwiQaeNr8+qkgvRCBKbb6Sq8yvrjfO7kZbDEylZN0wEkVOQBz0VGhftBGQYPSHScGXL2JBa117bNLQv0r+8eqou65efN1rmgFtPzW24kn2I1Kd9qhrJZuVwrysxvBmi/BJ2/ucsn6jZWjMEWHcomS4q45IHAZiqL6JxMSiPheOBObqGhYkcPR3m9NqQBnNzgo/q6GCGmE/CETO6pBdMdEnztg0R5FsvLtZsyym3rYLR6+UObo88LeE27OsCQgvDSgDTTyQET/n1BWX/Yq+cbuv4/NqsI59yk+MgDSEYqtLzk4sEXzaQtTyFDFce9gNlkas7xSSoK2pM+2FW2QbUVJpMBQynQyK/m8zoP2uDeZFMC9260YgUojT6R2Dl2VSV6YwtaCRWcScYkr786HfckS+5GUHtRxyqiNJjCIJDhEKmyC330M0HBInmAIeMoyAELBjLQ6i7LoR2FF/hmoQVV9ydGepWiKkLOz3VVoAE62fyKFKayEbSOsVtcgtInwe0HE44k/nnRvZY2LiP8Ylp0fonDy6ajmn5+pmiCxnoBZrje8SgB5LlwQ7OWUY7hIs9Icti2za8/K91quZ7ovdy4MShYrVroEjg84xx4K8O27Ya4VcLQfBQBz/zKBzqSDQOjDcpyhUTCwWiQKY6OhA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(61400799027)(82310400026)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(16102099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9cNbQRV1SKsevIwCfaWfqePPrf+KPBIcpBgtCZGYMekWE9oHSuUUACIIoJcUzGOpKTOZs8GBC7mrB376i854pwoqB2cFESKUl10sjJSguTnFKhktygQXBMXYNyNXwiO8kjMoh2l6MHloR4bsaPtFTt7jgpZ0XJW1w+DJwX7lxy35toWKJevZB0K6N+nWse/NXjx1gytcz6y4DJgsMoKsDU3ZohtMw3+F2J6mS71UMrjEP3ldxMrJTe+yw7T9tH0nJX1nVKqRZfvpZIrjVqSmquJZT2XLo+sLiseb7k2Ekx74vyXf7glkdH0I0bSooJyNVGW81WT7nLWyCOp8X8ZJ1zNYi9y/l12VEavc98Xr+E54SyDmgqXQsZgN+V53EpNuDlhzFtGOHMETGOY8BK9jhu41I3Q/UbD8cNI9okgMxYaSRMOHcCJn0prYNz5hXQmY
X-Exchange-RoutingPolicyChecked:
	MTmkVlRa5L3If+PbYqv0UwRECsobmHA24TwChZj+ggObUwdLObnoNjXSpE6TjNpqyeji2rqbMZ4Vc4vkOKEc4xifHiq1LugXq+gP13D+qYy1pP5ZlxJnLd6EjIhnwsKERAxoyW3mU4kRrxE5q71UamApBmDpkXdF2e3MMWAKdF9/GqUNanKqdNeP6CRx1U+h5YxlQ9N1gUTBU1JXCbAKYmIe78XY1nPKJrcL183mlPnnHASsNjvEOQnuQggKotVgiRXXg7aFBWbL9iriS15i5Euadt3tRE8bZ5iZW4MmGTeIYQw/uxp3ITTSX+NaRqd1lOGifT1ZpbqOJEvZoFFHwg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:08:55.3376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9506cf77-ae84-404d-d39a-08df4ae47f2c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4301
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX5OQQDLrRmb0r
 e2AfnFZjBE55htMxnqJ/xFohvyGjNPmoWmlNhAqGglbvIYAc7gykjrVRHfi+dhOCQcIMKhyarim
 s5F2sWvVDik/GkqsMOYwVA95oOL4zEZ+k/3nc9BbuO+d/vCwJ4BFSU6y/oi2OhjKeQchp56lLId
 Sk1Fxz+UTPf4fVTODo01JD37YZ66CKFAkeT6Cs3Fpea3nDH4Hv6mn59ZO3t45g/y+wCxlnIiZ3l
 ySsO4o1ztEqGxW4RWgsqyirNgXNUu2KuLFilQPeDcDeKDj1W4rwRburcDWhEuFGlSFkN/6Z+jkZ
 9F6mti2p+E9B97swy1KkBVPqyKtv1E4k/5UJ/iQF9z8of1SbPsAQ6ElmyE7W/GGiXr3fwl9iJDQ
 17JCli6pCDtqQewyidqM2JT0lkSE5MVzcqcdRzqLcb74jxB0fRE6Sc19aOYHLmHOwDS6rpQd7Qc
 R+MWwizr21fKwkGKnFg==
X-Proofpoint-GUID: y2IFe4TuyhHTOZs8AgJ_Ym_zN2W_Q5en
X-Proofpoint-ORIG-GUID: y2IFe4TuyhHTOZs8AgJ_Ym_zN2W_Q5en
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c1cc cx=c_pps
 a=ZzZLShWY4Ra8+E12r48fxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=4lrPNRuSzXD3DHeaKO4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXzAdzr4Sdj6qe
 0XLtS61W3vWuzTRdN34JPWgOEuOtY1tdi+G8BGpxoQPLY3D4LJNSKZ67KEn3uxuemPrGJXeUhxW
 fQvQQFYgt+jJ6WauKdnr/bZ+NA3WFAs=
X-Proofpoint-Spam-Reason: safe

Rename the DAI for DP3 to cs35l56-ot127 to match its actual function as
the SDCA OT127 Companion Amp output (a type of codec-codec link).

The previous designation as "SDW1 Capture" was incorrect. It is not for
host capture and never has been (this function is on DP4).

The use of the old DAI name was already removed in previous
commit 4b7f393a01f8 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
OT25 DAI"), so there are no users of the old DAI name in the kernel.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index acb202559dff..439063084d4b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -436,7 +436,7 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "ASP1 Capture", NULL, "ASP1TX3" },
 	{ "ASP1 Capture", NULL, "ASP1TX4" },
 
-	{ "SDW1 Capture", NULL, "OT127 Source" },
+	{ "OT127", NULL, "OT127 Source" },
 
 	{ "OT25", NULL, "OT25 Reference" },
 };
@@ -855,10 +855,10 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 		.ops = &cs35l56_sdw_dai_ops,
 	},
 	{
-		.name = "cs35l56-sdw1c",
+		.name = "cs35l56-ot127",
 		.id = 2,
 		.capture = {
-			.stream_name = "SDW1 Capture",
+			.stream_name = "OT127",
 			.channels_min = 1,
 			.channels_max = 4,
 			.rates = CS35L56_RATES,
-- 
2.47.3

