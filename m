Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530831;
	b=XYAyqcAacwNxNfuXeOGG37AnHGj7QxGEIJPoGLQOYRYlaZABC51GIwdBMZIVDrB8jazm
	 Lz4/hc3WsF+UG2F9ff5BTAyPHglBmKsXccn28Yncm2MLgH1qi+kjksQbZsK8HS2nD2EFk
	 qGuwc1yynRIH7QRltYZa9II/sAIYTxpAtJ5ufk/geTzQRjpUlzL0E5APB+Uiw+Mr8K2qd
	 PFsbfqoVYj8CQ+ea1bTeowzhIZZ1nE9ISDWGJHDB21a30akKh+m3TiVfoD3wFGFT6wX5e
	 cEwAzKLvIuH9IajqFbaMb6huj9oTeXkAX7MKK4m5sYRf/vXoqR19Oe5Cpq++hG0O1Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530831;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=W5o9QHjgM82gDML4ykQpSiEq5u8PDmt5dOat9Dcv+zU=;
	b=1b+rU7YkFxaIMP9bXqFRAxbz4m4Bcqh/EaRgb/XN4ofcQsiNhDV2L4shfnvJ5lu8QGg1
	 pFGkUbZQp1OnO/mo1Lx2F8JBJfhJukkCFUAycyGhknKBNCzvyqFy/KnPoweQXCHnj4tpJ
	 7/l7a5iMHIDV9V9JAA+DFGeQp3IMfdnWmtRdaQ/ksE2Y9kLUf9F0NEH7B9b4MU9C+U/Yj
	 0EQUPcaJENPYlM6ynvlP7XJv52emLte5Ha8ooGnJ/YvsSkQ7sGpywjTLjo1AO+ZCPVT8E
	 FpiJbtUCm+1M7B+EXmjxYiTKt8DVYu3oKtP9zYC+tzpRtFP34o6+tap/EytSAk8iPqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=D4s21Y7c;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=t9WDypN5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DC606A321;
	Tue, 24 Nov 2026 14:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=D4s21Y7c;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=t9WDypN5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODcFdB2042123;
	Tue, 24 Nov 2026 08:33:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=W5o9QHjgM82gDML4yk
	QpSiEq5u8PDmt5dOat9Dcv+zU=; b=D4s21Y7cqJ+sqwxnRvDtDTQ7GMj3t5tR8X
	ROUm27NNlWTBbMrqHTPa7oXtHavYYubsOkmP++uWHrpKFGl2eLbCtzACEXczIkR/
	U1DsLDLh7CbA4Fcupa1AXX3oHVDONDvu/0K81dsg2mCGuX7NOVo0+vn6u9jvfFDw
	/RGgDi/vR5zgeFbJiPxEbeVuk+QU0z5nmjbiVKZ2vQkcfpOwBjFtbJ0pupsxS2Lb
	4xOWOztH5G9zm5qjE1OB04OFct1ybwseJuu13MJBDiQU9kW3nN01EP3zGdnRzz+1
	j2Ivrfp2nCRah6cw1NYTfM9l3ElcgLCpj8mynpQdH5MWdrJxj+JA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020117.outbound.protection.outlook.com [52.101.46.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519j8ueg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 08:33:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGP+e4uiB8RgqHOojVPHY8PucOvOoY9BjBHDize17ThPQ8uxMD3EYH24UK4vyNiY6vKVIDobaSNJIZ7Nu3+GcgUqgn3Uva3XNJmHNT4xhStqJoA21/SfcuLbHRva0sPjHxCCKqkwYz4xoQgvaEoqYiRVef8C2L7tFmxsCMQ13SWKol6/vIxZ7CYQoT2wyyP415ZMIb/mHSJRvo8Nb+DZx/Sfn2HboaETdKe7bkpofgYlmuMNoGiVda4ezHhZwoVBZc3Jcqen85a8iCvDyWwZSzjk3hf5TOjNLNNjg8gUHmKh8FkFbT1W83O9sQFO2pciQxCncBZGXPIvJXB7BW7EPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5o9QHjgM82gDML4ykQpSiEq5u8PDmt5dOat9Dcv+zU=;
 b=KCHndp+5yXC5X8spilDkd6h/7rgr3675Kxwvd/rFCCatDOHFVgWwuq2+BThf4llJVro5kVc7IexS23d2+hZLQ36M10DdxKA58F0wTVt4I+Ytov1KyMXH2B0FvotbUlBwvzPRSUOQ0l56vecqaJF+f6iqK/IQmScGyn0F+5ZeK2HGpW/z83e0kwnirgdGfbhe0Ir4Ho8v0cNzNh0SMfFt/h3hfKQnrL0lFmbiKwHBoT5nDxs3s49czjOE+Jp1mmOuzR75IOE6yaJUJ8JLmGTIY6oJRyG0agbYgyCFG9XLP3RPVjxWZkN9REBNTfADuW/B1YL+N9TKdCqM1LPgCMRiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5o9QHjgM82gDML4ykQpSiEq5u8PDmt5dOat9Dcv+zU=;
 b=t9WDypN5kjG7/5o04gVK7s0F4csa7qqPEn+2lGLq2FNa3LF7u3SzBFNlZDqyQUlma8NkbJDXgyjh2HZbP9tYnRxUXV1TOLVXrWPLKuEgjWLG9ZJhpBGPMHBaXf1szUL0lGMlIGB4F0URQa7BNL95txsgZkkej/+7xpc6dfmAa80=
Received: from DS1PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:458::6) by
 MW3PR19MB4203.namprd19.prod.outlook.com (2603:10b6:303:40::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Tue, 24 Nov 2026 14:31:21 +0000
Received: from EA8PEPF0000000A.namprd05.prod.outlook.com
 (2603:10b6:8:458:cafe::99) by DS1PR06CA0008.outlook.office365.com
 (2603:10b6:8:458::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 24 Nov 2026 14:31:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 EA8PEPF0000000A.mail.protection.outlook.com (10.167.249.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 14:31:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4302F406540;
	Tue, 24 Nov 2026 14:31:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A6B3822542;
	Tue, 24 Nov 2026 14:31:18 +0000 (UTC)
Date: Tue, 24 Nov 2026 14:31:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 4/4] ASoC: arizona: clean up coding style and
 formatting
Message-ID: <awWftY45HMlo6lqj@opensource.cirrus.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
 <20261123-arizona-asoc-v2-4-6323d3c0961a@gmail.com>
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
In-Reply-To: <20261123-arizona-asoc-v2-4-6323d3c0961a@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF0000000A:EE_|MW3PR19MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: 8987ee7e-16bc-4901-5220-08df4a379ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|16102099003|18002099003|22082099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	5CS7f66pzLdrddNRbu8Ha2rC08BaCZVnyWcj4dScHlNDAj1/CitU7cCxpbibYHvNGON7CBX+tPjfm58ONiQUVhqVBLe82U/UL7tNHOttPMwv7peLfN7TnMRelNUfwgll9gdonKiVirOT3aAYYJ9QtRrnfMpVMGj/XTpeQt7lmfxDhdKo1/96g/yH98TQWtSVEwDAAMOYt2XH6ORH36sfXvYgahkzyc61NkxI+AFxF66xTaw8w5ZDtcoISno6vrmStV6XesvnlHPzA2uefhCazJyHJZd/NQeq0MecCtl3n5x11X4c9gvu9duUByuaf2CBUPCx+qshL1NlcKo5l7LqB1XmnbUXF0QBDrgN5pXDb0daZ5iSbaZvRo1g0tl/wbPjoepDsTP0r7NgyWVIP3JWZp5BeXeCFc4vlWsTQ73KyzfwNEojJ+E8X84MW9/lyg+0dXHxdz+f9VkcWYt10/P6yfBEgqqA2qMSxcZMcL8qzI6OmcgsMbCPJHjky86APiEqYlXuIwnqgPi0iAgdBJnuD7mxi0WzeaeLvH/Do7LN5g/FcikRt/oxbgbophf1vFKgw3nLxOqncAT/ZTamYXhjvFDv8635YZ73Gg2iTvaDZTMeDpSVvhH/NyNQbv3fvjxfuLqFKSrC+ZRqw1REnPBk0n2xg0QjWUHkNBYRV1EN1DQy/GciXgS9HryFIvz036pR
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(16102099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DzHWA7mbnDlX3omFY9l0lGKM1iwHNCxeF6e9gU5qTf3aJLRyz/6oOiAOo4kT0CGsDl+IdmE95Q1xUd/P1OlyUR0MxnXWF1GawTGaPccIRd8syuK+elskPFyYrVKC1rX5tLWO2Fg3BI7BA2cq+I/zQ8tOacWQXTTg1xx2YYHrMrnyXxPQ7eJQpFYjhCn3gvZERX1/6/BMx3aujKCRABomS8yc1x2RWnqgTBUkwxRBk5Q0OBVnMNblpSceC8OXqvm9pPK1cqm610PcVkd6aFVqqTs3i7RVw8yrA26dHYRMhOIwfvEqpS3VqkxWlopF6gipHAcNpJEo3q9KLvpAFLytS3LqHB7zWZmUNi0zvMAKyRgsXDt4u9LWRbL5YzYhBiyJcjzB1E1dy+gWGDB3GHiVYpcezSaczhDVhn4kjBwVKYqSY/z3K6/C7kgPAKgp9GIv
X-Exchange-RoutingPolicyChecked:
	XtnhilnGXeNprEHD5hoxNnV3hDCI1LP2k+YLbNoBHcAO47ycM4uiBlSlJa1Ii8CaqhUhicdGbCLDn62U+SXg5lktzXM8hZi1JIfh04Jd/iHeaSBu4T6d7fvt8ThFLABOBdbBskoHPSevQs8EnSV8JHIf0Lr7FcvsI7wZYqHJT4vrCh9FpaU4gYIG9BYUcXkNlw6kJEpuL1jQqzb07+9wTxw05HAzrPp4Q53Gv0ZGSK5y3mmFZcpQUAfTVDIDt5JBT66TGSRnjaGaNkAg/RAG0fzUwpNwNF9ee7XFx+YZ9I2EpiZQpaM/FLqgCKonfqTVJdX99Y5gfiKl4SVYM9k/eQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:31:20.1856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987ee7e-16bc-4901-5220-08df4a379ba9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-EA8PEPF0000000A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4203
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9Sp8aofIqVek
 7tV9kPjG1Hyv/2FCfNbAKfnkll/hKNIm6ts/aQzlPLCMv2XVdmc613yrs07B3XCH1KP0rucWYpg
 q1COlIKLDzDWbnswgySafraDPNHy1W28Whyn5UegGN6x7cmFF0CuXTQbS7WiE2HKnfnoAdOaVfl
 ZEczf8HCRqddWwdGUkA0+WHlcF1LLRXKZEkaZOqjNwQKljZ5X/x3w/Z75DExG/bnZ+2WytYjkiE
 /B+3/W6hk11cqrG06A0UiqjuL/u0e1rDyl+WMngr9DmYNJsiLIcG6Gxclzvmr1p8lxNiO3ahJLB
 BZkXLgQTlizP01tNpaP+6Mqi6oZrZjnarZaAYQArsJdR9Hx+oR3LAWIYh1fxcAOncTref/TpU4f
 0t9728M6Ro9A5ONtbkfUw0ZmaxgelKZP5ZZuJl6XVn6c4guN7Ax67++4YlHh5KMl7gXK6htfw6h
 RBAovD7TmNx5t81pbWg==
X-Proofpoint-GUID: MXl8fvWLmrUreA1wWUdz_3kGpnKdFfRp
X-Proofpoint-ORIG-GUID: MXl8fvWLmrUreA1wWUdz_3kGpnKdFfRp
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b05a03f cx=c_pps
 a=RrdOQlmmxp+bQeXV/0G7LQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=Olr2uEvYh5VNySX1iqYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzENMrkrFuQr9
 Gz2dLEh0JLVAEwy4//LnK6TqMhETGigz2wcgpdLwXOh2cA3dVq9M9QSyKMrOGLmLn329L5f66Ay
 F30xmIkSK+TcUA983mfXiCF279AotaE=
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 03:00:57PM -0800, Dmitry Torokhov wrote:
> Clean up minor coding style issues in the Arizona jack detection
> driver, removing redundant parentheses and fixing argument continuation
> alignment.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
