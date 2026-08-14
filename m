Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A823655FA;
	Fri, 14 Aug 2026 22:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746942; cv=fail; b=ec4IT90dr9PvnHdWlpUySWVQOndw+O/guCn0Sy5P+ToQelWAWbWcNBQGnyyhh30IU0UTRCg/kxMKKgsCglvkUdsq5KnHACYWZ1d9ePOsczzkZYTgzdQh3kAcJQajJiXQBNvA5/Rn97xha6ATc04aP4vmjRBSHcFUxuipya61dbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746942; c=relaxed/simple;
	bh=Te/AukHNBHZmujVfCH8IICCXWoka5aXpd4Zp/g3kw9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJnPHjnzXg5QHr/ZXrlZBN+JSLe1UK32D/a/nUIzGiWvjTLJ1skJvnx63Qm4kPq+Izxv44WZdnyXKq41d7e2qhS0di1SI86Iil0aVUbGfwc1gU/GdGm9EbEV5CxWxft3OpTKgJQxmhBQ4l4xBTSG1JuPaUTWeTSiHhTrZSYYZ7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W/K+xabJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z7g6UZ95; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W/K+xabJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z7g6UZ95"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EMOO7M2180044;
	Fri, 14 Aug 2026 17:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XC5LOXl4hxPQ008V9Eq7nsKpD3/8ESi5ZHF1ZcS1jD4=; b=
	W/K+xabJZslRZ4J//Fxf95YDBFwfvf8cTweF+oqpovlWQ9M6m+11QS2xXZESH/Mf
	7fqCokXYFQ2fKq6raN2bVmRUOXTLH8EEr/FRFFRZjTirVuN71Gkz1dLc/qpPAAsq
	CWiEH/iTo5EhS15+c9kWdR3hoexLdcv+rxJg5o4DtLhrLuNLd3VBk1b3yHLm5MX7
	0j9K1tTJ9odbpm+dW/RtLl9JybMGNc56ek9Zi2/fB5qKYAKuntjGGHL8U7pQ73+6
	L+FsGZfK9sCaG9AKA5OygyR2K0iHEBOkhqF8+JhCNsEQmXlzGxLJK8afpT2+897D
	cIrxiIy+3IgYY0hgR/bL6w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023107.outbound.protection.outlook.com [40.107.201.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjvyk7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 17:35:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxcIyQpeddH8I/qp6GxataDrdeLpmOYAvHpqz2mF1pMUEmJlEXG8cDaVAWbBinX7II3XHleley0YOOn8U34zfZR4wN7rDLWjrsoi2YSilhxGo121GwqfvrhDcSPF1F66h3W8x2PmigtumPIvvmXHdl9+9Q9IWPA6FTKfiOc/umPU21bxh/zj7VhhnxoXuSNuRLbqliQNqXbgmJGMuTCjtQW3YK1HvlrUJYngNwwL1IBGAI6ymCYxh58PcYU85owHhcNpdiCXJHfTtPPhdbzBGybLGIsma36VHdBFVL5hMjy/oYBFS0G1nCIjX2m2ZdZKJ2y5KKFGXR/EcUbttuuuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC5LOXl4hxPQ008V9Eq7nsKpD3/8ESi5ZHF1ZcS1jD4=;
 b=g9ehqrEMelJxzSmGnNilHcR7L5c/06V3PjQtrY2HU90Nfic1veLo4P9D58aWEYgj+8wPUdrM9Qlb1eRHyP24tOISAyaCvLLzfOrGALBrqIZJjLKRrhfs93/HJIqyrFoapncUTJdwXkQnC+ZH6wQ+t8l9JygvwNNhatW0BD7+7m93EaRhRWF+joIW2WKhOUUOTUAT8WyuAFWEoLRAOyD3iurtmOPO2Kt+AcuESP4ga2b+d7a0o0qXqkAZtl8mUeWTHIwLkwDuZBNg++pyNBk9LmOQ3v0Ce5oFAO6eYEhofSnaHn8MfXps2NPXxJX6o6j22TNdrKJ0GpZwubouXpoTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC5LOXl4hxPQ008V9Eq7nsKpD3/8ESi5ZHF1ZcS1jD4=;
 b=z7g6UZ95K9Ts/TrJWb8G6BycG9mhi6sDCcVIk8oNE/AATnvWRpz0U2NLXepXW2sDxvjq1q4tA9FkApI0AYKneFPngdK/V19B4cjKAvosdQTUNJRQ2TTTEXeZwHS2iK9cD7jTZCKs8/4aWS3zZqR6qLLmqw4/lFuUI7kr2pGMe4A=
Received: from LV3P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::21)
 by DS0PR19MB7564.namprd19.prod.outlook.com (2603:10b6:8:144::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 14 Aug
 2026 22:35:13 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::5c) by LV3P220CA0028.outlook.office365.com
 (2603:10b6:408:234::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 22:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 22:35:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2820D406540;
	Fri, 14 Aug 2026 22:35:11 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3463F82024B;
	Fri, 14 Aug 2026 22:35:09 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus
Date: Fri, 14 Aug 2026 22:34:53 +0000
Message-ID: <20260814223456.611160-2-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DS0PR19MB7564:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5c996df-4081-41d4-c049-08defa544df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|61400799027|23010399003|921020|16102099003|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	l/LwZFQJCgh8V6WRakQQEWi3E1Cd8fJuZVCzokWGrDt5Ow52k0/vbh+sQtP/tdx7sDEig3f844qQc+H+Vg3RzNw8DIuFFHms6O4jJrQfgs9g86xBcGjYIVenRMRy50NMlMMGgwUgQ4cEZXuiHEmIeFPfxi5GUr/BIqEGPmAJbr4JWkWpxI7UPYa4LoWWVafDeJeKv75jUKX48COP2+vTUohlYIfhho++t7+Xi3Gz4GlpgF0KJ5fqwY8PdmX7al4qZoDtkD60NPWyic2l9g6WGpkg05S/gvHB7ur2ejjBuBvW4nU+Tyf+KzS5oq80GsY10FoYlZAzb4SeB53ARirhKgEO/kRfO0FoOka3Tm6rcEreWaZhtrpjvJlWA6w+EbCtR3HbLZLESE4HykCo9ECRyDu1iulFm4/pTzfPDS+doENAVpLgOINhh/iU6gYKjGM0Dv2rA031cC0WWdhnV7EVPOUidWsQcUsoM/YuY912dZS00QZ7HiTUhK6VXr3qZ7tSy9+NThKzvEWVjOo/UX28Ml3mvIrEZnePIeWH628CThIWr47+5jiAsRquK+kwhgx1Sm20AZ8vNmQyWxBE3+sEzvMT+UUSsa2k65kUMcDdMXgllscjCrQgpPDD8qG4mCsUd6vZsPmjaJqycvc/iUyPYdIvMSzyuYl7aO5uskTBDRABuInQNuXLGGvn0zMTNr7em2sTKKv7CfhNRIIWWEWNqJ1C70tuWPh02d/acqtkCcY5Htl6+SM6MdRWMrsw9UWZ
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(61400799027)(23010399003)(921020)(16102099003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zlonMwpQ++4wTnXuOt/JSDcpmAyZbkLxeaigo1Y7UGuB+jKvFN9CTczrixI8AlIXEeVgqqgRCDZvdO2tj2I8YdiJal4WP+5fnc4V2Ohy+hfhOGx+5e35HL+/vy2uOSyrwafU2XU1CwCbfYTRLMc7msuDC2oj7TrElJy4Hk5LzM8otftIBC1k5nVlK/VjENbK2i5KIE/qsNvfKajcsPtwC9TZBkQ4Yg0rowUwhuq5bD17E2Os4nDsA8pl5YbYmgolteYDCVCRak6aIpaZyBNO4wUHDrVqNy7Kg7fKmPTtxEUwzNJsXyZJcNdDf2DARHlTKo3w3LWvSU9YeG1Ef75k6W/AEy3JSmGL/DP0Yw+dTMnqjXDswCCeKv2Ejl18hIy/xYKzFSOdnnW3KSITRDaLApEopmJDohPyjKZtFQ+qNRCC0LjZt6KpHuNiiJ/X5ToG
X-Exchange-RoutingPolicyChecked:
	afa1a78CQDDqN48b6sWz1i95KllZGXTWZ7cIy7kHnxG7XZYQXPSL1FUCu7kTmelM0U2QxXjMrkUgBaJ0S66w/8/DftLJyFYjwUWyw/1+DG6xUuavpje+8CknkBXFdJwYdoCFnDseBKFJ9sARs4KPKyEILyixENbtk95EGNCoP5g6+/C73k3GsymjdcIfSL5HfBmxmVDnD60IOze7aOKAKc7GKMoGcXs1bc9zQn0KFNyeswX/msLtCN9qzzGdtMg7WCRii5rWjM0jomYYmCqS/HngcSnYm1G/2B+57tUey1FO7oDpRk5vgp77opgdP510J0ptLjYv/s2RxDncFqn1gA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 22:35:12.3339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c996df-4081-41d4-c049-08defa544df6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7564
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX0ItyrG1FWIBY
 m2DHkMh0LQx3D/F1IHBuJCcKou/HaFDklVqaAN4iIfRa+x9rGTERO66yrx7Ed5ByCneY/t4ZX2s
 yNAkEyfrUS6PuVQt76SaWOpoZFMDkFanyUdmv1Tnf1UkG/J3rb7EEWQKHZCprqjDaxtGBXN3A4d
 +cKPQmDzIX8R79rthsby0BZcJ5HhrGJaty9xZSP0nP6pS4nQ9CSAI9LfiyZZOZBzHNzXxPJOb72
 b3VlXA7d9gD6mnGQ0VlgjwsyBNUozndJeR2CwUk//j5Yzod90EOD5YDSCAkBQdov8vW/M0Fs2bR
 5+647AoVBUQi227S+1LyQM2tafQrEQPv0IZdjx5WJQdMi7QombdexFwaEOZAteXCSPfpLf+YHSM
 UeGcT+SmFmvRMpy3vSwoqHy1sSA81TYnBG9XNNQDoxJDUyuvzK3AKGOV85etdxDrqPOcXU2tYti
 ff+pXeYpGSt3C5ZyRwg==
X-Proofpoint-GUID: gV2Z4ZplkBWyMlgrZIOlwmlty_1hIDTs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX7d5L5EPxm1SP
 UoFhh0FHHLLf7ii+5WE3u3k94aKULGlpz6hgfmIac1phACkx5d/XUFDH+F1S2oszlGD2OwgvxV9
 Qfz2uMrND8HCI2/LRbs0ZQI0XHEg9ZU=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7f9828 cx=c_pps
 a=OwVlNtrKK1PtuIndSPtdtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=98ZdnlpWABS4w4T5VXoA:9
X-Proofpoint-ORIG-GUID: gV2Z4ZplkBWyMlgrZIOlwmlty_1hIDTs
X-Proofpoint-Spam-Reason: safe

Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c |  4 ++
 sound/soc/codecs/cs35l45.c        | 77 ++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h        | 23 +++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 764dbaa35042..57982b8ae645 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -51,6 +51,8 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_WKI2C_CTL,			0x00000030 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
+	{ CS35L45_SYNC_TX_RX_ENABLES,		0x00000200 },
+	{ CS35L45_SYNC_SW_TX_ID,		0x00000000 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
 	{ CS35L45_ASP_CONTROL1,			0x00000028 },
 	{ CS35L45_ASP_CONTROL2,			0x18180200 },
@@ -134,6 +136,8 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_PWRMGT_STS:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
+	case CS35L45_SYNC_TX_RX_ENABLES:
+	case CS35L45_SYNC_SW_TX_ID:
 	case CS35L45_ASP_ENABLES1:
 	case CS35L45_ASP_CONTROL1:
 	case CS35L45_ASP_CONTROL2:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac..9f0cdfe9fb92 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -6,6 +6,7 @@
 //
 // Author: James Schulman <james.schulman@cirrus.com>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -195,6 +196,43 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	return 0;
 }
 
+static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = cs35l45->sync_en;
+
+	return 0;
+}
+
+static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	if (!cs35l45->sync_pin_set)
+		return -EPERM;
+
+	if (ucontrol->value.integer.value[0] == cs35l45->sync_en)
+		return 0;
+
+	if ((bool)ucontrol->value.integer.value[0])
+		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	else
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+
+	cs35l45->sync_en = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -607,6 +645,15 @@ static const struct snd_kcontrol_new cs35l45_controls[] = {
 			 0, cs35l45_dig_pcm_vol_tlv),
 	WM_ADSP2_PRELOAD_SWITCH("DSP1", 1),
 	WM_ADSP_FW_CONTROL("DSP1", 0),
+	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
+	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
 };
 
 static int cs35l45_set_pll(struct cs35l45_private *cs35l45, unsigned int freq)
@@ -1064,6 +1111,25 @@ static int cs35l45_sys_resume(struct device *dev)
 	return 0;
 }
 
+static int cs35l45_apply_sync_property_config(struct cs35l45_private *cs35l45,
+					      struct device_node *child)
+{
+	unsigned int val;
+	int ret;
+
+	ret = of_property_read_u32(child, "cirrus,sync-lsw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
+
+	ret = of_property_read_u32(child, "cirrus,sync-sw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_SW_TXID_MASK, val);
+
+	return 0;
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1110,10 +1176,13 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 					   val << CS35L45_GPIO_POL_SHIFT);
 
 		ret = of_property_read_u32(child, "gpio-ctrl", &val);
-		if (!ret)
+		if (!ret) {
+			if ((i == 0) && (val == CS35L45_GP1_CTRL_MDSYNC))
+				cs35l45->sync_pin_set = true;
 			regmap_update_bits(cs35l45->regmap, pad_regs[i],
 					   CS35L45_GPIO_CTRL_MASK,
 					   val << CS35L45_GPIO_CTRL_SHIFT);
+		}
 
 		ret = of_property_read_u32(child, "gpio-invert", &val);
 		if (!ret) {
@@ -1134,6 +1203,12 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 				   val << CS35L45_ASP_DOUT_HIZ_CTRL_SHIFT);
 	}
 
+	child = of_get_child_by_name(node, "sync");
+	if (child)
+		cs35l45_apply_sync_property_config(cs35l45, child);
+
+	of_node_put(child);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 7a790d2acac7..f8a4713ae92f 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -35,6 +35,8 @@
 #define CS35L45_PWRMGT_STS			0x0000290C
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
+#define CS35L45_SYNC_TX_RX_ENABLES		0x00003400
+#define CS35L45_SYNC_SW_TX_ID			0x00003408
 #define CS35L45_BOOST_CCM_CFG			0x00003808
 #define CS35L45_BOOST_DCM_CFG			0x0000380C
 #define CS35L45_BOOST_OV_CFG			0x0000382C
@@ -183,6 +185,8 @@
 #define CS35L45_ASP_EN_SHIFT			27
 #define CS35L45_AMP_DRE_EN_SHIFT		20
 #define CS35L45_AMP_DRE_EN_MASK		BIT(20)
+#define CS35L45_SYNC_EN_SHIFT			8
+#define CS35L45_SYNC_EN_MASK			BIT(8)
 #define CS35L45_MEM_RDY_SHIFT			1
 #define CS35L45_MEM_RDY_MASK			BIT(1)
 
@@ -220,6 +224,22 @@
 #define CS35L45_44P100_KHZ			0x0B
 #define CS35L45_88P200_KHZ			0x0C
 
+/* SYNC_TX_RX_ENABLES */
+#define CS35L45_SYNC_LSW_RX_EN_SHIFT		19
+#define CS35L45_SYNC_LSW_RX_EN_MASK		BIT(19)
+#define CS35L45_SYNC_LSW_TX_EN_SHIFT		18
+#define CS35L45_SYNC_LSW_TX_EN_MASK		BIT(18)
+#define CS35L45_SYNC_SW_RX_EN_SHIFT		17
+#define CS35L45_SYNC_SW_RX_EN_MASK		BIT(17)
+#define CS35L45_SYNC_SW_TX_EN_SHIFT		16
+#define CS35L45_SYNC_SW_TX_EN_MASK		BIT(16)
+
+/* SYNC_SW_TX_ID */
+#define CS35L45_SYNC_LSW_TXID_SHIFT		8
+#define CS35L45_SYNC_LSW_TXID_MASK		GENMASK(10, 8)
+#define CS35L45_SYNC_SW_TXID_SHIFT		0
+#define CS35L45_SYNC_SW_TXID_MASK		GENMASK(2, 0)
+
 /* ASP_ENABLES_1 */
 #define CS35L45_ASP_RX2_EN_SHIFT		17
 #define CS35L45_ASP_RX1_EN_SHIFT		16
@@ -320,6 +340,7 @@
 #define CS35L45_GPIO_CTRL_MASK			GENMASK(22, 20)
 #define CS35L45_GPIO_INVERT_SHIFT		19
 #define CS35L45_GPIO_INVERT_MASK		BIT(19)
+#define CS35L45_GP1_CTRL_MDSYNC		0x2
 
 /* CS35L45_IRQ1_EINT_1 */
 #define CS35L45_BST_UVP_ERR_SHIFT		7
@@ -493,6 +514,8 @@ struct cs35l45_private {
 	struct regulator *vdd_a;
 	bool initialized;
 	bool sysclk_set;
+	bool sync_en;
+	bool sync_pin_set;
 	u8 slot_width;
 	u8 slot_count;
 	int amplifier_mode;
-- 
2.43.0

