Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604954;
	b=B0925o0jGb8BX4lfGpxspPre1SdmIsxQqmhm1V9u8m4wtX8spAIOYN1vo9gAItYr2f8B
	 tGBwqSlylJCvs0V573/4Cmb+q/OpFsJnK6LgcT0JlPHVV0YnOBNexCdbrbWmk75AsWXhY
	 RGnDT+Hntrq/FNImU+/twUdvpEyXOTFxbVsSR2SHne2d47NnGLXbrm5sh4U+hXqd0O/5B
	 q+bbCLsx5yZNUWgDpMiXsZPXaUA1jlY20/Pj8htm7R3MNs44NofPtmdNa4v+KsJEM9uP9
	 0VNT+Hvgz/9VDjxUbPL76pgp5o4aA1QRmIC30W6sHsyfIbednkMNlejIscSexKaKYXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604954;
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
	bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
	b=Rse9aNbbOGjOXyXG5PRDfRP6hfjeBUIM6746uWU/2pszgT6sBbtJEQqk44+vgZL7LlmN
	 o9aGeLFzSqG1Cl61ChNlfzrLB1HsH7vk3dnR8GayuDMvBzNoL3QKlKDpwPrltCwUii7nQ
	 lS2kGQOgaybF3pS0pznHMU2KalXZn3+iqRIjm8ZJKRMsUMDqCXB+/rvZTSxZPRYSqBB4n
	 E/dG/qNEFImqrniY54fFVP4suyoLPa0m1dzHG8WsS8gMgT5a+L3Z+GCIEWT0dxc71NVZR
	 YEfCfo5se+foMQAFF/rfvT+NsjAJ6yQR/EZdDATi0TlNHfOoCvsifC+0mUb8/fE68iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZZr5m9yD;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="aU0cqvm/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D6606A323;
	Wed, 25 Nov 2026 11:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZZr5m9yD;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=aU0cqvm/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9boG74081208;
	Wed, 25 Nov 2026 05:09:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=; b=
	ZZr5m9yDBSYx7eeiNC453KInU9+T0QGTHeLsPOShNEoOmFKTQV2ysyMwNEYsmF19
	sTq7tzwBHYzyms1aAWWQCMvSW51OKYkRUNQOF3Bdd8E70uDFwgdaiavifOteWDTN
	KcOgXhfdX3l6HbL9iJmiBIwHWYb+kdcaMZyGqTGkiBNq4HMIiawZ0Ri9cI2TSUsB
	aeOuZ3jAffNW2XtJPf9pMkZLKTHmeHjEXm0b+4qxtZ7vtKui29uqKQgqfEdTIdqJ
	Z10yCEvbairkJFwtS4MuH5eTxBeargo5xupVRryjMdCGUSDj6TN/Uqn8C3k/T0TG
	63lpB3iAu8oJkfm/glvMCQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021123.outbound.protection.outlook.com [52.101.52.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jah1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:09:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogz5vtGxqm/GHCFF8ZMMJ5UhfmRYFvpEUIe5ThfTYHWRetbDkHM/LSnHXJZld5Qs+LRfN7NQS2sq7d7MayOY/bKYzfH0Q1Yv9qtMiMIiIJbOmPtTecJpDipO4L4+SvPMdv0zbaPFF3xFe7ZPq9NyDbAkjlflukgi8pxvsDQHBbaHilBznu7qifjrqQOnpD/MK7uNzRuvMMql79nk41KktP93xGGGHhKAl+YLQGmbZIMaeZ7f0EJDpu7WrMjopidSEHeWTpP9RXYbXRwf46j33MWRI8+JRsBG0ZPYTw2QNUzDwfaMinzoDycV5cHYJlsSE5CEEVBdGHID6knitnVyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
 b=PqBYODhROdxcCVbK3TwdahJlwnulj13CZTpY++OC9Hd0w4PY9xTI0WCwRiA90VAazDFZ1vreHm1BrJU59eb2Yax+HZ82YMKiy5DpYQuft174TfsHdgTtJLgArFzG1e7plsJSzEQ7zexi3sa8nHJKMnw7ztrQxmW4j2q/SA0htUe1jH84xnWrW1EjbaKdbPwxb/HeLx3c3IT0f5BXHkOhcg8nGUiYg2xuMqz5N/hqM2tMTpGM+7RQcBcfMWRNzgvOB9Jp3MXxwlsnP5JuCrMzWydDZvR6uPcxyfg25nMOETeY8HifPf9hSxc33Ky0VcxyKI/96EJ7AlXg6mhQTZMoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQV3JapyEOpZiwrY6ETmzkjTL5AY10IXdJ7NtbNTbF4=;
 b=aU0cqvm/iI09V0DjU6T92Phf3racDFixY+7j+lUMJU2rqj9t4yg4fDrA/4mvvn4cKtOYG7TVaxVElznz2yEwWGzn6AbMTyHXQ35eUNwOkqt6yKjaE2zVTuRkVEUhfMiVx1cQI9VT2Q5Dwm7SFEZICccHeEmcALeFxJMWGsGp4jo=
Received: from CYXPR02CA0087.namprd02.prod.outlook.com (2603:10b6:930:ce::19)
 by DS7PR19MB6072.namprd19.prod.outlook.com (2603:10b6:8:83::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:08:56 +0000
Received: from CY5PEPF00000E82.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::46) by CYXPR02CA0087.outlook.office365.com
 (2603:10b6:930:ce::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:08:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E82.mail.protection.outlook.com (10.167.247.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:08:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0F386406555;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 008D5822542;
	Wed, 25 Nov 2026 11:08:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 3/4] ASoC: cs35l56: Eliminate trivial regmap patch
Date: Wed, 25 Nov 2026 11:08:52 +0000
Message-ID: <20261125110853.741337-4-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E82:EE_|DS7PR19MB6072:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: be87ad60-a9cd-4d7a-bda5-08df4ae47f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|261009223027099003|18002099003|22082099003|16102099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261021121427099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xZsJAsrUWH1ieB4Oq/a3AdsbQQHTBG4aYjN83mM/gXpQrUsHzKHqlDPHA4CLoh9Qe5CCEmfEQqpD5l7Nndfm0sV7KQfdQz8MkVqmm8Xj1dCqfc3lXuqc//PkL4mh2D0902B8ttXAOldcXfEnAka9+MoEXQe6mY0A1ufXdCxYvBFAD2WXj23TBEd51SjxUPU/e91RjsPA5qFxq/mNuSDF9JiIOPYPoCqvo1aL8env5yN78jJr0keKdlg5ZH5meLGXkTsUT4xxvpI31XNQ43N+u1za2buT9bOwMqYLmbzI7SBU/pZrguGFn4boB3wuM0i4B0b1+Skc+fmijhR9V4YVeQvbQOAl4Sc2K7N5uumJsRVAKYI2mLRP2dhYig9lF/mdJjJggerrPsdP8TS6BE+sOJxtImajKInweNj6EJtZMUY3xjT2lbi6oRC9o6OCeJYcLQn6weFxm1YDl8Xcjxx3RF1Qzb2z1zj1laFiZobdfzkcN+biKPkZK/c7l3TAnvvb7JEoz7jZ0lIJQUV8+Z0rqCEb6x5OaHFs37vHyO3IuEA48hd6pZr0J2qnATXrd0E20kYgYd0RVdu2m/Uan+g7tEXXtuw5DAcGYMhgC4ejaV3jsx9SwWZT4c0AoCisXT0Ifk7m5U+zZuxMq32bNPP4l8MsAtlzJeJuPE1VEcVzWpiM6ux3MMmiKdt48lf1SsWRh7q4G2f30omCGEuwFPIh+Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(261009223027099003)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AgfJrG218ZzLW6aenoHRt9cFW9S+/niv5dRXBTR7RAmWi9DwxqVuGuh1QRipMIQ+pfrv7dvvCV6Oe63UN0dbf6n6TWBgvUSojYEgQnOCaqJ4bQCEKyLEqaYhvAC51piqr2vUVGXGJiU+4CfHIF2nZyQEGhjWu0uftHHh1xUS4NPrgoakWAHMAMoHFB4YdqWiTxvL2bw6Rh6MPd9AN9M3fGpOi8SnIEb21MLuJkP4JGXuL2Co0aKX5H+qg5zRkzkXZa+1wT27zH3aC+gXvObAa2JjBqxs+PlUTg2Azbx6x9joijlvwhmSRLguO8m87X4Wh7cg39nmklP49gvKy+PPJM95MePkqGMP7GCh2JfDJ7HiQli59Rmt+9yyCo0R195C2Fdpp4eipfrfaJGT2khIOoffZt7O6OOe2MMP+MA74hEretuU3ZpOFCg9q+SefCRy
X-Exchange-RoutingPolicyChecked:
	PosOgxsNfWeayTVnq2bTbII52OEv0Rhn9/C09BHQ58Ltn7iYmzFnpgfdVbluxhdiOb42sjcDAUg2+zfRU/z8GNQiK0l+qmVAA0B7qJ1qKQ9gznOoeC0C4g7rCNHD9eoDKrbaWJ/BZaAHRrcBkVs8YNsc46s9yWM51z6kDcvQmlCoVFjrrelJ1c9GgWofK3iNsnSh7jlXIuMksIb+Brb06qRrlxhoSLX6TWiOf+WFbHpGamfRYi+d70ggwvrHs66/sy+3L/mxDqOP577RmspFWqN3z1um5IE3CXKLdXer8wA8YTjO+IqlyF5lswQDWwOGX72NbxQwkVZYkZC+yFUEWg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:08:55.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be87ad60-a9cd-4d7a-bda5-08df4ae47f42
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E82.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6072
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXxgMOwo6NIor1
 STUVirmZJLrZ8P2RbxOtiAJdlLjq01WrYKfH/ITGXYBZa7XDD+GfNtfmUE4mQ3qoKEqdtLI/7Zk
 FkX1mQ++KX+gwD+DPxcoVIpgkRRXk6mhPrF+eaIKh8VxBO02Ha07uQUY6ty20AxWjSCHQyQ34De
 8h5fI9AjhfpBwGyoCBYPcOTT3rTwz2+Wzk0+HuMkNnuiru/wEgjr0xFMKenTvGKCvRkOFTAgIlt
 5alXExuYu/j3hKsYKAdEWFL9CTjqF/ql9I+TN/U9B5uKguHc2sMbOfcsmn6c/8umeXCqKNf/DRf
 dUPcboEGZN3y1N/E1svsfammvHoAzKLju8pla1WeCMm7tvyjTXVDdQlCxnogqTwnQSXpfM0BU3A
 CLvo6uuoKzQVqYPUuC01Mb6dY5k/iWafiOd2HG5556Bye5RbAqmkglzZw8O2x81s0pQaAiVyAzI
 jB3L9zcYPCPsy4bp9ng==
X-Proofpoint-GUID: LnHWCB7V12FOfcUmrRsUL1eK-BELxsRH
X-Proofpoint-ORIG-GUID: LnHWCB7V12FOfcUmrRsUL1eK-BELxsRH
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c1ce cx=c_pps
 a=bglwlcmNSKUHFS6lfo7hMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=NFHPZ3Yl8IAozPUAK0QA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX+9mWTigOYdgE
 hXMVgd6Lbd/67//o+GhtnVFInLHqpfWFzfzgFTi7j+NSngtL3twLWOyXghIpciZWjmpNZSagOsu
 xIsrDm15Zpr+bqhsCC7MmgKpXV5wYyk=
X-Proofpoint-Spam-Reason: safe

Previous commits removed most of the registers from the common
cs35l56_patch, leaving only one register in this patch. Move that single
register patch into the separate cs35l56 and cs35l63 patches and remove
the trivial common patch.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 073f7bdd3b0d..34aebf81f4a4 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -50,16 +50,14 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_patch[] = {
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
-};
-
-static const struct reg_sequence cs35l56_patch_fw[] = {
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
-static const struct reg_sequence cs35l63_patch_fw[] = {
+static const struct reg_sequence cs35l63_patch[] = {
+	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 	/* These are not reset by a soft-reset, so patch to defaults. */
 	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
 	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
@@ -68,31 +66,19 @@ static const struct reg_sequence cs35l63_patch_fw[] = {
 
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 {
-	int ret;
-
-	ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
-				     ARRAY_SIZE(cs35l56_patch));
-	if (ret)
-		return ret;
-
-
 	switch (cs35l56_base->type) {
 	case 0x54:
 	case 0x56:
 	case 0x57:
-		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
-					    ARRAY_SIZE(cs35l56_patch_fw));
-		break;
+		return regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
+					     ARRAY_SIZE(cs35l56_patch));
 	case 0x63:
 	case 0x62:
-		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
-					    ARRAY_SIZE(cs35l63_patch_fw));
-		break;
+		return regmap_register_patch(cs35l56_base->regmap, cs35l63_patch,
+					     ARRAY_SIZE(cs35l63_patch));
 	default:
-		break;
+		return 0;
 	}
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
-- 
2.47.3

