Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772941;
	b=kHcf4yc0P3k7+/8kIe4mkLgYC8DwydPXxVrKnWcBJ+eNgSxeJSMuFQSHv51+qmFP3b2n
	 eRbrUuQ8uYjfDcNtKL3ojsoerbNx84NpMN6ekKNbTmgM9ntcOI8M5GgbE6T00doT0OXNk
	 8N0K/4oOR5XE1MTdFa5Z5al1J5bs2UmVS01wmrA3vZui4v9ua7XeAnq9OywnYc9LBIx8D
	 kR11BmXreBfPBdpC+lcMyl7++rn9QTovW60DXHDYUhFjv9l62wFu8oRltjuWMXXBmM+MI
	 m8RygH52idkI5efkliCTitDQaVvExOvPiLvMmacrUT3vImgi2SAoCQjwyAVFECbG5Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772941;
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
	bh=k1LhsQwtYXVBtlOI4/5n6cDGodCYVc1TmPVxrcFcg7c=;
	b=5CbIOsqbItfnstvlxxEFt2ZaW7ICWJgYZNTFWUPqh7wbkZtxXR7ohZTV/oLJ0hFHYHs/
	 DZFs9lBTiMxR7ud5n6+NQM+3F0CHoQtKjhlTFL1s69SPVG2hzOAUsFNGU2BWR0Fg4MMU8
	 chCkuYVscLf/K1UY9ykWROxXtermkGVoev2nf9LwJgl7PDaMyUxY6WW2YovSVPjHBPyqj
	 fnlH39F2FBDFTXK37GXoJg6PKJq7PXB+NRw0dDh7xOzc3mQmNh0lRhvB7KNqB+kYDJuFX
	 F3gWP9eo9e6OyHE1+UCCU8fNWWirsWkVDz3jQUlagcVeQayJr/xtT0/L/AVEXdoA+lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hvF+Jhvy;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S4iQBWQQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D6606A321;
	Fri, 27 Nov 2026 09:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C28D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hvF+Jhvy;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S4iQBWQQ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR9LSTv540834;
	Fri, 27 Nov 2026 03:48:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=k1LhsQwtYXVBtlOI
	4/5n6cDGodCYVc1TmPVxrcFcg7c=; b=hvF+Jhvy6oaXlRKxDsxhihSJZfD3TIbV
	Jh3UWfDvnFk3EmKTl+cb6oQ4rT7uzV2wg1BG97FvM0J4OYTadFN8hBm+VY6Zq+Uu
	CdfCEcq5g62KbEC9pXs85nD1OVZTnUyf3E2PGyQO8Ec+T8UuuX+tt+Xft+gV9a16
	7XJqsSxIoxNm4KQYwqPc/QtzOL9wLZDvByrXr5fJV674/Bv9HQgEjSRCllmu/QDY
	+b6G0CpgDkorz7rqK6/iMHXvqrJuWwwLdD0dAbS3FDvjI5iG53LLmNF80sxnzTSh
	Oi9C6/7itVUzxXAkp6Gueirjh5HsLDY5Eg1xWqHOSWKtS5PF61Tgbw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020109.outbound.protection.outlook.com [52.101.85.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jdbdv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 03:48:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK4sHhfDhElvbpcolM2fU7WXWrNiLQfj1KNczZQq8i5lt6R0aIjhqCpxMphqcP5jZE0s2XDcZH+zEHV0f48rw/1NJpve5scfhy2n1EURbmppAOdLpcXKg6xrJdqgrzlohUM6aYLHLkoncIT+vyRz1ZJBJl1d1UjqUXlgsCtYYWblpNEvRaFehDJhlqMF4XlajGKcQ8wokYUV1dEA9BqCPmzhpEdrwyk9cPEja4sdpOQ7IKf7nmr/djyb8kZfjU37tWwRy/GtYsXo135ICk99DsRjb/ZPIXIWnJBxmlWGq2+75HT/CkSU7Oubub8mwQYkjGLpEeQFjRX4JYYYTqcuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1LhsQwtYXVBtlOI4/5n6cDGodCYVc1TmPVxrcFcg7c=;
 b=Rze0JjLiGLl1QOPikHSdENVXfJMAbQ0meoXg+Iz1oiUg7RrKapD4nf0OggQJZFZtY65fHgTElQimaUn3Li8GHU0JHqNyo/6QIhIbwKLxModeYrJEJSoGsKZdy+4YcwA31Kzvk4AsjV0JHqxjziH4YxSBJ3PDpJkM3wY3YxTEMGvnCpQMMjIhy9ZRBbGDosC+BrwouWSoeSGZU/ysYPD1jsYzM2nCHAnnFgj5TEX3mn39hejWs/2/ckRU7B+emFuYys+aQ92K/BqG4nfAv0HVXDYmLhVHVUeZTmrdGV9U0S7OUzVCBuIbbs6NIVSZ+WVUUrvfG943XOort3BYTJtpHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1LhsQwtYXVBtlOI4/5n6cDGodCYVc1TmPVxrcFcg7c=;
 b=S4iQBWQQR11OThhNb7D7LhSZPYJiH7Lcb4wrITlhsBtsg0Yl+K0T1AtYzX9VduQYEcBPFm8hha3ZkzlU5LL0fk7cuHxMe4rNG9Mhq9BPczcbYpIPLuw/6EgOjiaHigciBTnYQqYGlQI1Epn+dIWvtOA6MTRSxpC9m8pcod3eS3U=
Received: from PH7PR02CA0011.namprd02.prod.outlook.com (2603:10b6:510:33d::8)
 by DSBPR19MB035845.namprd19.prod.outlook.com (2603:10b6:8:b08::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 09:46:21 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::2b) by PH7PR02CA0011.outlook.office365.com
 (2603:10b6:510:33d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 09:46:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 09:46:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25AF9406555;
	Fri, 27 Nov 2026 09:46:18 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1A83182024C;
	Fri, 27 Nov 2026 09:46:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Volume/Mute/Posture controls don't need to wait for dsp_work
Date: Fri, 27 Nov 2026 09:46:17 +0000
Message-ID: <20261127094617.1932934-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DSBPR19MB035845:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d48478e1-6b69-499c-16d4-08df4c6b4a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|10067099003|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UmkYnl+QMgaLZk7TeCea4z7Krw8x0LY3p8ytmziOFBT3kpAQXu7ayp1tuRQhTljs8BEMHrxfH0GuO+DgpvZmyNGSbXFJufS6ouUmnNFrwADd1KJf1BHwqFQqpm8FlOTjfu7Y/+ogrQCWR1i363g3Q6nbc4aPWAf/m2Tl/LyvklpuqfzKt+/drH1SwHsnHOpVaCYA99nNphG4vsF3NXTMgcapbJcHNwCE73o+fHFEUd9T3smJwSY7E5DBryA3AyBwlmVrof0mFrT5+3b23YYst9EXLRblenXQFFuW3K1szSyBTiF1CC1mmX0XDVm01aPwD8zRx9732u26WOlt5qN3LAIcOC9+/Ks2hK/TVLQm0W9jQ6Vs0HSoOAyuueNf2/+ts2rB3DZIbadobEnoVstXoibWlYJfNtN7kM609LhGSqxB4AFQ7IsIk9zcu4lZQ0tdwG9tVgp0WPW/ACJyMWwuBWmFrG4FO89U2yT+peCLe/oek6kPseQhL7DWd0Sjvok3maSBzdgy8/0h+Q77iMIuKe+CW4/DKO3rikSKvUJAREKIjSieLPbqRlE5pLfa+BrSGsQ8AqjB3SHWvSdk2P78/Eti8t9gKyMNr4JmjISHlSCLqbQI2A33gSzu5ELz16ItJsud5KthfAl52hVHyuJ1F3YyWHE6jjFqOS8pv/D03JIu391ubNCAOh7TmYy1YEfoLb+E46Y+uc290KH72oERNA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QRV7VRpC+nWqBvyv7qr0b542FPEXcl1iN1tgK15MgkOHghLTOkfpZ48Px/ompIboffI5tr2aaUjRd8KxdSJbn3m4zVnrNGo9bgwMZLqphjAiQbS+P+5gB/ei0jBwK81mku/nwT6BLJSX3rSLp6GfIHKbiJHtTYMtiyuGl8GIu0yEYSomK2H+PmwoalYyefo3fswez+osKIeArhMWF5k2paHibTkyhjm5qIgrybmiSr/2PHWbbmJngDsBTTK2ib2r+9iWeNrXkwQJb8bMUUPHvxdB40oNajtnrzGlQTpAeerYtFncZ/sSaZFp+gjCh8WEs1itDMpB8hjful+wfIs76iaMRzjbwyILAb9beRn/IbAYbc4zdKjkYxWPb4Icy4mYV/cZo5cAbmKNKi7XR0cKLiCzuvBxxXFtkLrpe27nLHT9aOmdgk+cdVT92IBug0H7
X-Exchange-RoutingPolicyChecked:
	d2aapwfd/EUOIkMvhTODNuhlMM8eAHoamAOT3ajmI5nzzUq5xcYWZ0KU+z1JShUtTCq5ZGSSRM4iM/u4qu4XNxsTS3y5JAThJIeDyVEbYnDDNWUlUuv9QKBzPKIRuMGX/tA5SuJyGNi0F4s9BkmXZcgFjFfz6E3dk4w6vyHAUyp1c8BVX1LKZDo8KSVAICiIop2vWhz8GymZeUT6evyuA/rFRBz+TU1QGdlSX5p3hEQIp3L82lAsyKvtFQzg1PlgyBfRg/M9duPDDVOoqbSvLcA0ewSkKIX14AFBnhiLMUiIa6SEkW4eZ4nUsTgJm2vkYo5JLbVggS1Ap877G7nwIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:46:19.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48478e1-6b69-499c-16d4-08df4c6b4a3f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSBPR19MB035845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX1LBuh2IFLmz1
 wEYBcBN0g5hp+YlIBM4ss1/asyo+2DtqSgwU4jTZoE2X0OJDCBkbvM5+r5qy89yfhHSqkHuB8x8
 bQMEFTiMajNvGwq6ovsvyYnxZWeEBXaFgPx8KBttYjWZjwipyp5iV350pv3zfOxRF4Y6imhwuOL
 TfK6PsVLFVgTKqTO8C/Q5co8vakbRevk22weFAW8EZhQaWuHaj5cLkZzBZNK1qjEYIubCiY4nnv
 jgbPV43Oqp2GZrzju5xtFnGUjhanNxtDf4cgFXYclF0Oz93CpogB/g9IPAxILWeJdDF7/jprFmr
 UxVAaPzm5b907Ndae+5/f404FbiGo5viUKr+CWPORgr4lwEZAl5UDhp1kxjVaGhU/7BZLnSgCNf
 YwVzMYIbg/S0dD0SW0mzmVgj0jE4bkjDkqu9QO7WIPCSrDGkf9c8FPCdvbBI9gpTTnA/1Ljj65b
 Vxn9yJqZQwID0rTuXeg==
X-Proofpoint-GUID: RH9gZzTw5qLBnvosTe3LFd1c3LMNfW8o
X-Proofpoint-ORIG-GUID: RH9gZzTw5qLBnvosTe3LFd1c3LMNfW8o
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b0951f6 cx=c_pps
 a=zEwEPAIedI49nOb3SM4JYA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=d2_-I3JtFws4nPXTW5YA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXySRVTFcqqpOx
 Nmkg8/bauHM/3LA+KW3wHQZ+byRQTzds+IcCqm36oSkXrVneWX0BKxPTb3Ba1RQGNM76vru87cO
 DvRzwDxYtHK/+Z2//7+16wJeZGqpTBA=
X-Proofpoint-Spam-Reason: safe

Remove the special get/put handlers for the Volume/Mute/Posture controls.
These are not necessary now.

The original reason for the special get/put handlers was that the
downloaded firmware can patch the registers to non-default values. To
avoid the regmap cache getting out-of-sync with the actual register value
the regmap content was fixed-up at the end of cs35l56_dsp_work(). This
meant that control get/put had to wait for cs35l56_dsp_work() to complete.

This is now unnecessary since commit df4167d658d4 ("ASoC: cs35l56: Patch
soft registers to defaults") removed this fix-up code, and instead used
the regmap patch to set volume/mute/posture registers to a default of
zero.

When the amp is rebooted after a firmware download,
cs35l56_system_reset() puts regmap in cache-only and this is only released
in cs35l56_init() after the amp has rebooted. The regcache_sync() in
cs35l56_init() will overwrite the volume/mute/posture registers with the
values from the regmap patch and then write out the content of the cache.

That means it is safe for the Volume/Mute/Posture controls to read/write
regmap any time.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 72 +++++++++++---------------------------
 1 file changed, 20 insertions(+), 52 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 439063084d4b..0ea8c69d93fc 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -103,26 +103,6 @@ static void cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
 	flush_work(&cs35l56->dsp_work);
 }
 
-static int cs35l56_dspwait_get_volsw(struct snd_kcontrol *kcontrol,
-				     struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-
-	cs35l56_wait_dsp_ready(cs35l56);
-	return snd_soc_get_volsw(kcontrol, ucontrol);
-}
-
-static int cs35l56_dspwait_put_volsw(struct snd_kcontrol *kcontrol,
-				     struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-
-	cs35l56_wait_dsp_ready(cs35l56);
-	return snd_soc_put_volsw(kcontrol, ucontrol);
-}
-
 static DECLARE_TLV_DB_SCALE(vol_tlv, -10000, 25, 0);
 
 static SOC_ENUM_SINGLE_DECL(cs35l56_cal_set_status_enum, SND_SOC_NOPM, 0,
@@ -138,44 +118,32 @@ static int cs35l56_cal_set_status_ctl_get(struct snd_kcontrol *kcontrol,
 }
 
 static const struct snd_kcontrol_new cs35l56_controls[] = {
-	SOC_SINGLE_EXT("Speaker Switch",
-		       CS35L56_MAIN_RENDER_USER_MUTE, 0, 1, 1,
-		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
-	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
-			     CS35L56_MAIN_RENDER_USER_VOLUME,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
-			     0,
-			     cs35l56_dspwait_get_volsw,
-			     cs35l56_dspwait_put_volsw,
-			     vol_tlv),
-	SOC_SINGLE_EXT("Posture Number", CS35L56_MAIN_POSTURE_NUMBER,
-		       0, 255, 0,
-		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+	SOC_SINGLE("Speaker Switch", CS35L56_MAIN_RENDER_USER_MUTE, 0, 1, 1),
+	SOC_SINGLE_S_TLV("Speaker Volume",
+			 CS35L56_MAIN_RENDER_USER_VOLUME,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
+			 0,
+			 vol_tlv),
+	SOC_SINGLE("Posture Number", CS35L56_MAIN_POSTURE_NUMBER, 0, 255, 0),
 	SOC_ENUM_EXT_ACC("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
 			 cs35l56_cal_set_status_ctl_get, NULL,
 			 SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
 static const struct snd_kcontrol_new cs35l63_controls[] = {
-	SOC_SINGLE_EXT("Speaker Switch",
-		       CS35L63_MAIN_RENDER_USER_MUTE, 0, 1, 1,
-		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
-	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
-			     CS35L63_MAIN_RENDER_USER_VOLUME,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
-			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
-			     0,
-			     cs35l56_dspwait_get_volsw,
-			     cs35l56_dspwait_put_volsw,
-			     vol_tlv),
-	SOC_SINGLE_EXT("Posture Number", CS35L63_MAIN_POSTURE_NUMBER,
-		       0, 255, 0,
-		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+	SOC_SINGLE("Speaker Switch", CS35L63_MAIN_RENDER_USER_MUTE, 0, 1, 1),
+	SOC_SINGLE_S_TLV("Speaker Volume",
+			 CS35L63_MAIN_RENDER_USER_VOLUME,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
+			 CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
+			 0,
+			 vol_tlv),
+	SOC_SINGLE("Posture Number", CS35L63_MAIN_POSTURE_NUMBER, 0, 255, 0),
 	SOC_ENUM_EXT_ACC("CAL_SET_STATUS", cs35l56_cal_set_status_enum,
 			 cs35l56_cal_set_status_ctl_get, NULL,
 			 SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
-- 
2.47.3

