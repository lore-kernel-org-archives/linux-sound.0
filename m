Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607616;
	b=KmSuD4HgeEOJrk/ncMGEQ1L/qRWMYnFK4VnZoMzMNpEuPOA5Vin9zA2J2czGc8k8M8kq
	 pj13U0Yu1nwOG3I2jOBqiaEQ5ljgqTdybC35MdxA+SV9EM50gF4tVbp27qTX9UZU6XJO9
	 hIXRGQyaS0wTodFciVajtlYcOM51K5/NmHKIZwsKOgj/HeHHjS4CtBHE1/1WFJkKt294i
	 SD7SlU3KWWRpA2jfJa3AopHguQ0rR1mRGo3B0iC3cSn10PDyheqfy7GsEcVATZ5H0ASJm
	 8/+aVxZgJzsNtS+6VC+VArLoDrvMPuLpeReLG5KbN/AJdQ3k+ndtyc0ZWsF8uojFHHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607616;
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
	bh=uH+ct/7Yj1R3LBtMWzwegokKLmUq6H3+pfl8xo/t1Vg=;
	b=McWq66GCHhv41gtHi7Mt86DpUyrB8DdthllMaR0ufhFu3qU85QEj4ShE46Jyc5ipSAqv
	 aQtf7Ks+cKRvU1K936z/FInTqGCDrMx704QPdkeRNP/z3VXS5TVKt/WuDq41iyYV1BFsk
	 qnU6om+sO66jawde0ln8K2nGUyX14TsDhZTqu7dZ1UB8PkyKIArAJcYzOPaHCnR4vc0rH
	 LFRC+RfneG+jIMnKGaPA/UI7CY5Sz16/sxUI/68A7t07rhtfqj5s5UjXEhSU2inw97V63
	 /pB6t6DactCn0KsLLyxf/qOr3vLMXhbfSGBMLbbJfbjjXpZ0E7gtYgUojlelQE3PQ1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aoLswfpn;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ezbSbruN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C6606A321;
	Wed, 25 Nov 2026 11:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=aoLswfpn;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ezbSbruN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVMT102388;
	Wed, 25 Nov 2026 05:53:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uH+ct/7Yj1R3LBtMWzwegokKLmUq6H3+pfl8xo/t1Vg=; b=
	aoLswfpnhNxDAbF0eUfYhVZ2M8uSWS/E+Y6pys3OTxIbKPfw5PWMePE8r5m7Fwr+
	b9l5+wDnkEDI7TpQmgwlNhfASgoZIkUFg0a2ur7QdMCrJISIj8B/NTqEkPFzw4Cj
	vbhTNNAqMHklMldoT4UINjTrL1qdPp8k28NGplwhnOGo0dSPXQ6GLjofK8VXWvTE
	sxNtYoJ7aT2qyo7xdJ5rIjQlBgnLRUx6K/01P1qT5Qjr7tJb04ILwTZVyljcwqHd
	h4T4IxStmjVyqq/GhaSo95qcrSNOsEdcaCXfGLJYjUg3H8qZbwfJgdZ/6NwPDcTq
	/ORRWvchf/R4uGfeyNNL9A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022110.outbound.protection.outlook.com [52.101.43.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajwk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:53:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iy5TS5x6hdcy4gsimb+Vy8QmuOkMgUXWUjppU0ifIJRCXNu5061CHo1VoPS6hgsxWsAsIdWMMiKkBfmWRyt1fU0QiUGgX/ebTz35cO4W2BuyPuLVqXrn+0dKXSEnHCvu251EAsznNdwUxr3tOKU4yc0DHpxStypSbxZTRgr/SbwhjX/SielIfuQE8ld6FgIMP8K9dx3PfxcE8x38VVG+1xDEOzMhjF+H3XhD1MqIb94cuR9Bhw67vTyU9V4ARwrLkPyc0WCn0/fN27avKPZ86dSBuumBIcoh13br8dJlW8lmbo5lwCrVHqFTlXBD7YHTmuymuOHEeE8rOoYudrogMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH+ct/7Yj1R3LBtMWzwegokKLmUq6H3+pfl8xo/t1Vg=;
 b=D3Rkt6KnGS/YRHBf4QhP+yHQi/AmyF9PJAwIcIV8KmDddYTqsQidgDHJUXOvD4EtGaaAtnYdU+ZB/DkILQExShYVnn+FW/Fb6tlAsPPR1IU3zJoxfIbXOK6pS27+CvZcIPlLe75LaAy0mUW289PPXv8PcLjpwS/GeyjFbQzt5gfEVuTHuTzRWdTXF25xcwhjG/gSsMi7M2UsKbsk2T4GsbZ93Ap8NYENG19FZfOBHO804eJKMD9roQ7Aw7oqs9jSNKe+gLRvTt4QvmesDAODPM/O572p3sKEs8FNnKO3uoRFnhyHN6P+hXKcDFdC/INvanrlEHX78/isvCc+mEAB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH+ct/7Yj1R3LBtMWzwegokKLmUq6H3+pfl8xo/t1Vg=;
 b=ezbSbruNI3Y+SZL+dWXFf0C7pYPMeK6H2LcnU3D2GdjdtPviiS4Lkg3gHUK3+me/PoWCiKUeDeV2YW2vPchYY7ve+3ltmiabdoiVVhY+Pksq8JM0yBuBiG1aRxd5Vrqv4VneWpMkbvLR9ZKVUQFccflNaWkbgZFkigBhWLtr61g=
Received: from CH0PR03CA0407.namprd03.prod.outlook.com (2603:10b6:610:11b::34)
 by DSWPR19MB997264.namprd19.prod.outlook.com (2603:10b6:8:36c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:51:38 +0000
Received: from DS2PEPF0000710C.namprd05.prod.outlook.com
 (2603:10b6:610:11b:cafe::59) by CH0PR03CA0407.outlook.office365.com
 (2603:10b6:610:11b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF0000710C.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:51:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 95E3F40655E;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 647FE822542;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 6/7] ALSA: hda/cs35l41: Store filenames of successfully loaded firmware and tunings
Date: Wed, 25 Nov 2026 11:50:48 +0000
Message-ID: <20261125115124.9130-7-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710C:EE_|DSWPR19MB997264:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5622500-366c-47cd-5034-08df4aea7653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|261009223027099003|18002099003|22082099003|16102099003|3023799007|56012099006|11063799006|261028144727099003|261102123227099003|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XB3u8yfAn3RTlw4ZZvdA9J03b+pw4Wdvi5OhR0wgyu6u1bM4NrHioc+Wf0epq+Pe3VAMQaXu75a4aPMhpXBFBoYKeuY70ClRHrq49wPBpQH1jqt5s3IVzXSen911f3BSwsmPsPHQrMA+feYaTPEmoqDGBMD0Xr3sf55Wab4TD9Fy7lBFeqO3GXgPVQ0Wn2ymwVlrdIK5Ju9yWLHRzKPVPJbdfhMpIxK25U6dUSEhYa9oLOy3ItKl+h+aEmh7tvGKE8oWog+DrHKqM+Uw/Y1afXYMQns02MeB53tEmug/U6g4z9FptoaMZty/fuftmAFg0cWfA3ibQwSbG/nNzG1PTm0E8tvct1PAzwq32YJY3taLuWvjROuI83i6eAkBt4IKaEXVqiZ2c/tu3UNcU4jl/hkcS9qnyR88y6mhV605yRBVf8iVjEHokGNzj669U0bz00obgYw2kSptUVm53Xphfhshs6v9yNyakNUhtpBeweKAidqWu/caMioBFpOgRp83sEhu1+aUKIZuu5Gy47rOCumhX8CjJB7hrNegK5rWtIx3+5d3xkF9rrpi1WzK1doiPZQRAHuGZStreiFFoEIa9yayAT/qCw7sdRyLPf0Ijb++lOz0WEPdMEUk6ZGCKhq9msJwmqV+nI/+v3EM+jywcQX9oVoD6MUnK7HTVo3iSP0Nqh5OGJualaGNyounI4/B2n7SD9MQVddNsUIcTKl9TA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(261009223027099003)(18002099003)(22082099003)(16102099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xv2GD46pgXzWJ8Xpnvz/FpkvjX+zYI6TiL9hbc7iISYmM+B9axpBBgG+lLl9gc4VIXqiw1Za1VR/REjSTAAOHoyoYCywqP9ehzu2X9mmr11qthdQ0Up+gBpOd11HzzjWcMTqmbrLv7Z+sv/FGtimSDRO2gMYPMAOSX9xsOQ3NAh6UuW7J97dg7EOzf4alkO5l3ZI+P9wHQ8P20N865I2dt+ZdGMDRx/RyxTpjAY75Qdt1Z2PqC5fVfxysThlNDRDjfCD75gnGBci1LeIMq2VfLIKvSc587fcLq4KkTpv63aP1k3ImgP2oYtBfwc/FjdpnhlGdn+4UH4obejmAqW6YJjPiQIBSuMYUYeGY8kK46y5eivOAmggW+sL8Bjy5mq+NulnvkI9qFFNV0G63XfgRwLtU33mvq2rrUVbLtWw4CTb1cRud7IFzx72/3W3H8bF
X-Exchange-RoutingPolicyChecked:
	X+TQmdC8qfZDEGI9us3GC3LEbq2k7cEIINaoQWSVsWXujSgIWLNVMB3+7IalqjY858O11KyE1xg07vXtzSzHOMkWQYYuu/hIsx8v2u46zluhYkgqvHuMxhjsi0uJH2d95J6PAcFf4qI/DTIrI/wQLVy2uXBFMQfRDDve3GshFek6uKPmDFHCa8jItmazCKQQyaoJtlhJ8P6HuWxshr4CvWFCeLxd44z74mf9UC9/c/18WgxIbnG7Ha6QvNLhK48mxQq5IHBNMIkuXv7jqSz4mSzHMpedVLclKLDdki17u5IuDSTDhLPXAajhZN2KqimgWV0O6vgNczJ2NLIh30ryBw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:37.5229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5622500-366c-47cd-5034-08df4aea7653
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF0000710C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR19MB997264
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXwjzkm+nSI6cf
 uyMhvK1oUKLRlLXswxYGuqivrWciEmRlR+/OyYioEWww62Ta6UNlsWMw1UL6rcF3tuUXvQXqwQK
 qs2GUovjjm+AmXekwTNibHwzZyNOTEUO8tii0GeLrFLaj8FaGDUZet2uUdif0r+DAIj39kbGJii
 oRuhR8IFJfi3WODvSBz/Y8DMGMd16F4mSTO+n8EjSvDopyQQFuGhjP1Jzz/YH0QwR0X3BXUb6JN
 zn/xfGzAAU+bAm4at+Ml71ms6CvkzVjb3lvhzU77k8FOnANCvYXho3K9Fs7sVsyjvn+AZoXO0L2
 RVCpjHotcMsDbRY/QOcUV0J5ZWqzTIwubyQsdjmLaxdxDllJ+U/dRt0FXGGbREOCMKa3WzpAO0T
 kccE7g6jBxkmLHvmDt4EB1Du15tIW8cQfSYgKwq+u2NyIZmljbFSRb2S8x4reZBDoTQyVA4UgYf
 /Ohi1zzsxJkdzubtBXQ==
X-Proofpoint-GUID: xaGrRhA7swz6sabJvSR0WkfEa3Cd8qhe
X-Proofpoint-ORIG-GUID: xaGrRhA7swz6sabJvSR0WkfEa3Cd8qhe
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cc32 cx=c_pps
 a=R5lJJwLUw69E8voCr07FQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=A7nQKJpAKfRNLE_fIZoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXyOIzGhhbI3uF
 i0JvVKRSnrz4nX8ExceOS1vE5BcMwlv1ZQSr1Mz2AqSa3CK+Bt/Vx1XQrwoX0zZXPWjjRE92hum
 ZXxqChY5UB07UhaoQhPKC5j5qkCYbpQ=
X-Proofpoint-Spam-Reason: safe

When the CS35L41 HDA driver loads firmware, it typically loops through
possible filenames, requesting each and stopping when it finds a valid
file.

Since firmware is sometimes reloaded - such as during system resume,
it loops through the possible filenames each time. However, since the
filename will never change, we can store the filename when we
successfully load the firmware for the first time, and reuse it later.

This ensures that the only firmware files requested by the driver in
system resume are the same as the ones cached during suspend, since
only successfully requested firmware files are cached. This prevents
unnecessary file access during resume - if a cached firmware is
requested, the cached file is used, eliminating any potential blocking
calls to the filesystem.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 47 +++++++++++++++++-----
 sound/hda/codecs/side-codecs/cs35l41_hda.h |  3 ++
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 2c6efd07df80..51ac11270c88 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -142,6 +142,7 @@ static int cs35l41_request_tuning_param_file(struct cs35l41_hda *cs35l41, char *
 		dev_dbg(cs35l41->dev, "Failed to request '%s'\n", *filename);
 		kfree(*filename);
 		*filename = NULL;
+		cs35l41->skip_tuning_params = true;
 	}
 
 	return ret;
@@ -308,6 +309,7 @@ static int cs35l41_fallback_firmware_file(struct cs35l41_hda *cs35l41,
 	if (ret) {
 		release_firmware(*wmfw_firmware);
 		kfree(*wmfw_filename);
+		*wmfw_filename = NULL;
 		goto err;
 	}
 	return 0;
@@ -325,6 +327,25 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 {
 	int ret;
 
+	if (*wmfw_filename) {
+		ret = firmware_request_nowarn(wmfw_firmware, *wmfw_filename, cs35l41->dev);
+		if (ret != 0) {
+			dev_err(cs35l41->dev, "Failed to request known file '%s'\n",
+				*wmfw_filename);
+			return ret;
+		}
+		if (*coeff_filename) {
+			ret = firmware_request_nowarn(coeff_firmware, *coeff_filename,
+						      cs35l41->dev);
+			if (ret != 0) {
+				dev_err(cs35l41->dev, "Failed to request known file '%s'\n",
+					*coeff_filename);
+				return ret;
+			}
+		}
+		return 0;
+	}
+
 	if (cs35l41->speaker_id > -1) {
 		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
 							   coeff_firmware, coeff_filename);
@@ -374,6 +395,7 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 coeff_err:
 	release_firmware(*wmfw_firmware);
 	kfree(*wmfw_filename);
+	*wmfw_filename = NULL;
 fallback:
 	return cs35l41_fallback_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
 					      coeff_firmware, coeff_filename);
@@ -514,6 +536,9 @@ static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_
 	char *tuning_param_filename __free(kfree) = NULL;
 	int ret;
 
+	if (cs35l41->skip_tuning_params)
+		return 0;
+
 	ret = cs35l41_request_tuning_param_file(cs35l41, tuning_filename, &tuning_param_file,
 						&tuning_param_filename, cs35l41->acpi_subsystem_id);
 	if (ret) {
@@ -538,8 +563,6 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	const struct firmware *coeff_firmware __free(firmware) = NULL;
 	const struct firmware *wmfw_firmware __free(firmware) = NULL;
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
-	char *coeff_filename __free(kfree) = NULL;
-	char *wmfw_filename __free(kfree) = NULL;
 	int ret;
 
 	if (!cs35l41->halo_initialized) {
@@ -554,23 +577,23 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 
 	cs35l41_set_default_tuning_params(cs35l41);
 
-	ret = cs35l41_request_firmware_files(cs35l41, &wmfw_firmware, &wmfw_filename,
-					     &coeff_firmware, &coeff_filename);
+	ret = cs35l41_request_firmware_files(cs35l41, &wmfw_firmware, &cs35l41->wmfw_filename,
+					     &coeff_firmware, &cs35l41->coeff_filename);
 	if (ret < 0)
 		return ret;
 
-	dev_dbg(cs35l41->dev, "Loading WMFW Firmware: %s\n", wmfw_filename);
-	if (coeff_filename) {
-		dev_dbg(cs35l41->dev, "Loading Coefficient File: %s\n", coeff_filename);
-		ret = cs35l41_load_tuning_params(cs35l41, coeff_filename);
+	dev_dbg(cs35l41->dev, "Loading WMFW Firmware: %s\n", cs35l41->wmfw_filename);
+	if (cs35l41->coeff_filename) {
+		dev_dbg(cs35l41->dev, "Loading Coefficient File: %s\n", cs35l41->coeff_filename);
+		ret = cs35l41_load_tuning_params(cs35l41, cs35l41->coeff_filename);
 		if (ret)
 			dev_warn(cs35l41->dev, "Unable to load Tuning Parameters: %d\n", ret);
 	} else {
 		dev_warn(cs35l41->dev, "No Coefficient File available.\n");
 	}
 
-	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
-			      CS35L41_HDA_FW_ID);
+	ret = cs_dsp_power_up(dsp, wmfw_firmware, cs35l41->wmfw_filename, coeff_firmware,
+			      cs35l41->coeff_filename, CS35L41_HDA_FW_ID);
 	if (ret) {
 		cs35l41_set_default_tuning_params(cs35l41);
 		return ret;
@@ -600,6 +623,10 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 	cs35l41_shutdown_dsp(cs35l41);
 	cs_dsp_remove(dsp);
 	cs35l41->halo_initialized = false;
+	kfree(cs35l41->wmfw_filename);
+	kfree(cs35l41->coeff_filename);
+	cs35l41->wmfw_filename = NULL;
+	cs35l41->coeff_filename = NULL;
 }
 
 /* Protection release cycle to get the speaker out of Safe-Mode */
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 6fea4b2ad0ac..64ee70c31a43 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -93,7 +93,10 @@ struct cs35l41_hda {
 	unsigned int tuning_gain;
 	struct cirrus_amp_cal_data cal_data;
 	bool cal_data_valid;
+	bool skip_tuning_params;
 
+	char *coeff_filename;
+	char *wmfw_filename;
 };
 
 enum halo_state {
-- 
2.43.0

