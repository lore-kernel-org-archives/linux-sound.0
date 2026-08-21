Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20138372B39;
	Fri, 21 Aug 2026 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328640; cv=fail; b=FKsWoIByDZz7MucwBpzPHX8aqN9AVdS6HdiFwDKW+/o7+C19Fqfx2JjYtsHqZd11jH04Qx7+TrL2BG2IV9lh6DewhvxyWfoeuB2sw5KhICQdVPdSoqLPgegH3BgejcHi3LF1+1QFj9n4xdHTWG18uyQzk1k+/b3lugQnZDLNIzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328640; c=relaxed/simple;
	bh=1iHUPU1SXUSokLVAsNDSbuHH24uYPrB/Xq/qCy/s1kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Owf+YzC3foq/t74EUu6qnT48+Z/cNbaKSRQEATNttF8idglZI7/2E/jeOqFMgJZbtMTqQALtB10gsBmpt0QkPzy3J9E7Dl1JFDrQCH+B7ROqHB8Hjmdg2oGdxUdD+/DSddin5kMfwORs0JPk6uhlYCjnCrB62r2FQmq8I7gT8+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J3MRjk31; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mz5gKLJe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J3MRjk31";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mz5gKLJe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LConE71438573;
	Fri, 21 Aug 2026 11:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UvjSd3r9Qc6slVirT1tZFTLSeDonRcVhCoJY6tKaFu4=; b=
	J3MRjk31QpryJaphgbJoAExQyHmUYcXoNGifOd8eGjK56I8Mo8Jf8/u9iKxh6GfH
	nI3bSIrypyYrLkQ85FMwS1kLIDoZK0yM0U8pclOx5cMQUCi07kOCZVvqMbEDWkDI
	vLkcPVj2Ru2hJIWltM1knlWTj0xwCl1bCicRUVC0nk9mFnS1aKAY9H5a5Rv6SRqM
	j3yiEhY7VipbGb+VFCzw/UtsiFRAPRrMnwL/hYX2V7b3hDYJoCOG29mkTlxvB2dM
	nCzNCR+nfzvIsPEn6M1ButmroPcr96t8a2U5Yj0YnlF9lb5IpwQTgjx7UO1vqgW4
	IV8zUqucttXiVd2Jr0ZbTg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020117.outbound.protection.outlook.com [40.93.198.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g4yda54xq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:10:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABdWxU6e5DkClbkjHNEHQ56dJdsgG8KLvMpPGCer0bMTyhD++tm20cxY6E3sV7qD2Fb77k1L0w4JBLWru4R6ClAIpUujP2Mu/wqlRDQbn+0SmLeCIo3OoczopbtsmECQI7i5Tjz48iqnmHfnzyiA7nbaneHkCguorrRfBZmSK0RHkKGFRm0Q6MtGFr9kVs/a3XkxL0slICDmzk87ZH6HOTyYQ6EGvaJ+zrN9KSq349owu6aGFWOOL3UPm2LkfqCo8zDIN8Cx5vTOGL9Yq6RM/4lse+mTE+dZlNte493aXz3abLPnm2im84mnChbPqgSXVM+7HfWOIQlr+Wdwa41fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvjSd3r9Qc6slVirT1tZFTLSeDonRcVhCoJY6tKaFu4=;
 b=JAXFQUzpZgu9rC9RTNEH4DGB+nLoocDozbsr98gxwLx1JFfe7UKBmbHd2hwNmlLy/RvivDk6e+Lrbf4PmKAoW4MDvg0m2Cs8g47ns99JiICvai1idCo8N9isDf6dG3VE4YZWupNRzT9wIYI5GDBDBceBa9mxWe8rqwUAHmfxEIfeCahakYJBHtCmYGvlp+bJqZGh1KDDG8/rMcHRjwSFSWFXTpzyEFA7fPZUfNm9IsFYliJK5m19WtfDpAOLre2R1LtHddb1mpKm9J9pu00Op+tnYd3Xttwac+y4cQqW3ZTU8jbcklosz0RqXaQ09rdt2hKkb19soBn/OWXOYy9BdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvjSd3r9Qc6slVirT1tZFTLSeDonRcVhCoJY6tKaFu4=;
 b=mz5gKLJePJk/MkM9xHnMzn8qtu6/+rw103EG9Gej/+gIsy4ztzJ00ODoan8Q63ZQEH1hFjfkbyZ+9FypR6ZK/XUzsKA1pTT55RMH0CQEcvmIB5Iyj/RtC3rvKf7lLlGOteYTHODdzUuZTxbPqRFzqlYfsapMD6Yi4VOMwj04eHg=
Received: from CH0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:610:77::6)
 by CH6PR19MB444274.namprd19.prod.outlook.com (2603:10b6:610:30b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:10:13 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::39) by CH0PR04CA0031.outlook.office365.com
 (2603:10b6:610:77::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 16:10:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2C128406542;
	Fri, 21 Aug 2026 16:10:12 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 385BF82024B;
	Fri, 21 Aug 2026 16:10:10 +0000 (UTC)
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
Subject: [PATCH v3 2/2] ASoC: cs35l45: Adds support for SYNC bus
Date: Fri, 21 Aug 2026 16:09:43 +0000
Message-ID: <20260821160946.95258-2-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
References: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH6PR19MB444274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1167f159-0c08-4191-820b-08deff9eaead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|82310400026|376014|7416014|56012099006|11063799006|10067099003|16102099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	x57fuza6pyZNYfsTe8PTrByDFtVCSqHfcb8wx8jMMChWSjkH2uXPZgRm8G9O6MOZ7VpONbCEhcfo546dyuRbgeLx6GAXW2UOK9MvoorIagr0HH5b3hclprWj3iqN9DkBBu32wVSjjU3NnrIdPCflwu3Hn3e1FWP8S2zYUVdb8Se8DQc50e0QgU6GW5+GaLvKK4chcSZkxA2B1W7Na46NYVcpN9NmoveCSg/YV1EWtRbJRiLxhtt4vyL+5WQiqQO3yx2enpjNNXpteI90r15uef9kSHpn4yPm1WlBodsZEik2wuXgVnZOkF+sHDTeRYwZDKLLuay8bmsZSdbqKS7Zy8DG/dJvKwcQ+E0fkW8wz5bem1STkUVWGEfCZoNcXwc24VL1XStuuCZV2CPaw2KuCek2wSgQj2ZnsE3le006PQvvLgATWJC1CqjJSYWN4GEIdTCfVLuy03Td9fthnf0BOu7XQIjEoZIpKI4UoiR/2GO1pYAROVBcBZhajeJqiA0ss9gOEBl3iLIFfzevYcKskjJYlO2IA+nkj4G0qQMLjqHXJbxPpjw6oxqYjYsKEWmSXp/+YSjF6dV73UAQ34B03eM500ksziPXhN/REev46UbG+jNwAWGZ9PfXIz/FswjbhihuJM8ywGENmGWzQ8F7SY+w1Ur8/3sJogBjE7zbZUw3BlALm5R/1glWIW8tjjskbQAroGoA2UmJGfX33yPxpPEztg7FQASjFYa8HDvbDpXiqC5VNEq6lZivmlD5jEAv
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(82310400026)(376014)(7416014)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dVyKldcKODmp9br1O645yyziXmLLm+yLfW8KLvuImGYh9ckbruDgkUZRPYDs4xC90FMRg6b4Au3PiZ8qi3GVEOdW4KaUgJhdyh9g+iliTy44i3FAlfQiLv/yWdnYbM87+T8j+BfGUMjn+M/eOyy3xr0Tbqf+ji9SsW1Gw7IdFqB90rxSkJJAmLaP0bl5By9onyuB2M+gMiQmwiYTVIl0aMOBW5LnewBUuWDOWk2OL2diO6/SjQXutGxNc9/3HN5FG0qX/NvG2UxdzGdt9ZD7FwH5uWvrEQi04BGs/L9w17X4X7UdXIcMQ8adJapKGwmawnll+PaMfMG9vaKpbmeRlZG0L7RCw8uTep9OxDi5yCTlZvr6+mV47drkmS1YtyKt+sDQFuyJxKwpke60hVdDlZDN6VsBzDfeIMCrDTwkCzzTRz0HAIh1g7PkvqPPBsTJ
X-Exchange-RoutingPolicyChecked:
	rEbFIm+Z2srKPDxXAXhwI77Msx4u4A5lxCyv+uJLO9qjFw5e40ZupR1j6n4JQ4UEqPWgrZY0ZBVX5oEGFiaYNxbbddvhryZ9D9aA57kZyvHcHc/8pcprNJI0jni1I8CsvKAAXG+NF9xpwcIyPoFXqtiuxsJlOiJPbUzmvHOyOrwPrGhytUSkPXywSjKeL9PBTK8cvgSKuuCpsZOPmky1GUZg4LSuiC8fD/Wouh8gseAjovv8b8rOgfzoN1Ur91lrFIKDhfFsTmRJzBX6gGT7enVFki8jf5zjE2fb8Hvs6POhMYiSqmY0a3NgtfcHU6HaoxadSaVs0QObwwfleVz4Wg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:10:13.1328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1167f159-0c08-4191-820b-08deff9eaead
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB444274
X-Proofpoint-ORIG-GUID: 5-yFyKrtoZq8W14j8tn32CL0sPqbM74Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4HxPZp/5adnU
 CYL+hlTKf1laGWFfkL3kX6M2gbCnsm8R2/7l62dz+aNd8yAWKph/k31ArC0+7gRzg8B5WSWCgH7
 CMlBDHch3dLxC/W3z3g4aRd4kYhV874b8J3dIlNRj8Z5zOmkIBdcmEyzkec/g5C2H788Cs+5e8e
 q9rB25u9wL7i+vjbnSkdxUgnEHzq+78i/lOoxQiPpHj5+nNRR01xgXCpu2fbI3Ch5QqKtvp7s2W
 UaU1/DNqOqB13b8+BZUckvAE7+PkodtvgluoOaLUuoDpkfJrv75V+4SoJIhKLhu03lGKCVQ8y0A
 eXpr1OZ/VM+3msSrLjTD9RZW2JJ3E9NXVoRS2/ryJQBmXp0+i957m8+3fZMu9g/tMs4+AxySsmz
 KPM4IQOx92KlLuphHkBj0EXntt/QPUDvokRfoDsBKI1QN3LWbvzL9N2MkwIOFmIIujR0AJLk/8h
 C3/jmXXTcJneNNIsP1Q==
X-Proofpoint-GUID: 5-yFyKrtoZq8W14j8tn32CL0sPqbM74Z
X-Authority-Analysis: v=2.4 cv=cKTQdFeN c=1 sm=1 tr=0 ts=6a88786b cx=c_pps
 a=UIcKv52QUy3ZqpRAVMOEHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=I_x9miFozz5syUPFWzIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX9vfT/zzThKGN
 Ky3Jcz5VyVvA3Oh56Uf5e2TiGyFgLPmc6z0ZyfTcRA9nkv9JmOEQ6Hou7DiLSXImCG8tVBHfM28
 g2PNHQSMiKy4LLBkDEaDdzt7Xvct934=
X-Proofpoint-Spam-Reason: safe

Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c |  4 ++
 sound/soc/codecs/cs35l45.c        | 93 +++++++++++++++++++++++++++++--
 sound/soc/codecs/cs35l45.h        | 23 ++++++++
 3 files changed, 116 insertions(+), 4 deletions(-)

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
index a032bb23b4ac..559fae09674c 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -6,6 +6,7 @@
 //
 // Author: James Schulman <james.schulman@cirrus.com>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -195,6 +196,38 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	return 0;
 }
 
+static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
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
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	if (ucontrol->value.integer.value[0] == cs35l45->sync_en)
+		return 1;
+
+	if ((bool)ucontrol->value.integer.value[0])
+		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	else
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+
+	cs35l45->sync_en = ucontrol->value.integer.value[0];
+
+	return 1;
+}
+
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -591,6 +624,18 @@ static SOC_ENUM_SINGLE_DECL(amplifier_mode_enum, SND_SOC_NOPM, 0,
 static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 1000, 300, 0);
 static const DECLARE_TLV_DB_SCALE(cs35l45_dig_pcm_vol_tlv, -10225, 25, true);
 
+static const struct snd_kcontrol_new cs35l45_sync_controls[] = {
+	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
+	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
+};
+
 static const struct snd_kcontrol_new cs35l45_controls[] = {
 	SOC_ENUM_EXT("Amplifier Mode", amplifier_mode_enum,
 		     cs35l45_amplifier_mode_get, cs35l45_amplifier_mode_put),
@@ -880,6 +925,19 @@ static struct snd_soc_dai_driver cs35l45_dai[] = {
 static int cs35l45_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = snd_soc_add_component_controls(component, cs35l45_controls,
+					     ARRAY_SIZE(cs35l45_controls));
+	if (ret < 0)
+		return ret;
+
+	if (cs35l45->sync_pin_set) {
+		ret = snd_soc_add_component_controls(component, cs35l45_sync_controls,
+						     ARRAY_SIZE(cs35l45_sync_controls));
+		if (ret < 0)
+			return ret;
+	}
 
 	return wm_adsp2_component_probe(&cs35l45->dsp, component);
 }
@@ -901,9 +959,6 @@ static const struct snd_soc_component_driver cs35l45_component = {
 	.dapm_routes = cs35l45_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(cs35l45_dapm_routes),
 
-	.controls = cs35l45_controls,
-	.num_controls = ARRAY_SIZE(cs35l45_controls),
-
 	.name = "cs35l45",
 
 	.endianness = 1,
@@ -1064,6 +1119,25 @@ static int cs35l45_sys_resume(struct device *dev)
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
@@ -1110,10 +1184,13 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
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
@@ -1134,6 +1211,14 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 				   val << CS35L45_ASP_DOUT_HIZ_CTRL_SHIFT);
 	}
 
+	if (cs35l45->sync_pin_set) {
+		child = of_get_child_by_name(node, "sync");
+		if (child)
+			cs35l45_apply_sync_property_config(cs35l45, child);
+
+		of_node_put(child);
+	}
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

