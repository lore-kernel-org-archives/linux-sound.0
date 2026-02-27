Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260703F0777;
	Fri, 27 Feb 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197356; cv=fail; b=KHHgpmJyySr4KYsTYYX99bBJwIdlHpUZp0poF2/mY6b0veT/DTuMBnNigsj6Pm0ppvCm89Mpr7+FJKCZcI6+lh2SdZNDfBdRatMUPj6p48ljhpQhE/+fAwvGKAzyXmxEerC03sjvDRFHqWWmgtl7E+Z3tn0pmI1WMYFdbEnvrXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197356; c=relaxed/simple;
	bh=lESxh+HoKqlVtZgfygzyX34YESHjvYNh2LlN4EvM5JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcVdSJdtDdRSiDnweaC3QsA0mHWNzNQLLjpMXIsg75pfKRBUCvoQuQN4TLZM6++dI5oUfwuPc/ZyTjCTCBqaDEbVakBF5ShymGIzPyKgs/sDf25YYYiOdzaw83BcOwxbdSDxL//JePlMtqBRhSEwwcweBcZIOIHtvsCHNoX96mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OzWaaOVA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0Gw1aRzQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OzWaaOVA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0Gw1aRzQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4ostH2367068;
	Fri, 27 Feb 2026 07:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sXahs4y9dlcg7AWOaWLQKL5UViqO7n/zfquaiZ0BnXM=; b=
	OzWaaOVA3trNI2Wm1aAVpMO7Cm3fnm28RWcHge7ze3RycHqSKKPuiSQAR2fIEACz
	wN1JTkeAHTc+bO4nn7DgNo6f63KFKE1qUd29vfIeFKqzcannJyfcspWq6dKw8NeQ
	llfJSzbcNg1w5i2tONyrodbZUWsTE2s5Nln+clnnb0iVCLFksW2DmqNJO/WFmpSE
	ZQTG5YiIjZXCUuxamTBLEVAEkCan4XFvczdVfW05sMeSIDPrr5/YiCzGZpyeaPXi
	V8JpMmsNf6z015va+JIUPo3IwRSRArtQCohJVdU0ZPM8qMGC4Elp7bh+zeSHD2Gp
	+mpIo7N3buKogotUEEGAIw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022142.outbound.protection.outlook.com [52.101.53.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1fh7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:02:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMRvMPKjbMqoPEi4dM1aZIKpahgCvhnON0GZQMvVYW1jj9Fab5xoGwacb61vNjIO36SssgUmjEbe4YU6BIcq27uqd5WybMm0ursaR96SzlONThyJlZj1IO+6BfIpdQ5xzbRkUYrFGny5ZH1VOtiFWlH4aU5O40RHD1KadHzXGjwfTF8AyZvHbbUVkV8+NOwAi6NcWiLPL42j8D7gk/qGShqhx3Y8iXCYuZWfDW2YJ9pWp3e28hD7WKQWTfaJbJweZCeSe5PMEfcng5XxrBvDxPiO3iFLMsT6OMED+ubliWKou98z2KUVR3AZGGDDo1PU+BbnjSV6WsGo59McqjmmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXahs4y9dlcg7AWOaWLQKL5UViqO7n/zfquaiZ0BnXM=;
 b=tBlixoQ3iSXhR27x1XVsesk29F8O2mDXAOfxV+gnKCLrMCmtC7c3uuMLIySt+grk2lxKIZfG3jANoZlD4Yo8EQS1FxpLMoqNlWuD9K6xUQoBO+ZYSDohx4ClGxR2rd/wACE+B32tnWQeNaaVX4d6syzx8UzeTPog+txYoxJ4u2FAV0V8Vef6lj757g8WMd3R3yKKwTLB1Svw+5GU/zOqS+w2n+3ZBDvhCW2zVRhlPmhJYVAMeVirjFL+hn7NJjBu9yas8CR4DtVPEsgMJkzjSMGzdEn0peHGQ+3s2WxGaTEKKZkiOKShVudAnqtKDSwrrIWPjdG6W8D9QPgWTgZLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXahs4y9dlcg7AWOaWLQKL5UViqO7n/zfquaiZ0BnXM=;
 b=0Gw1aRzQYnlArHBsTIxhPCqHNBdnDJxpjvDc6qnIyCQJYZRtgbvm30VIe06M3KuO+HheYX59Z6dUg/eel1vx8OdKw2S4hGsUWltKnkTr8+ygU/fHOTmetZmj9pW/2qixWDgxO3xwG4IgwzUGf6nq+liL4d0rJ1YMufrMlLR3hxc=
Received: from CH3P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::17)
 by DS0PR19MB8433.namprd19.prod.outlook.com (2603:10b6:8:1be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 13:02:14 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::58) by CH3P220CA0003.outlook.office365.com
 (2603:10b6:610:1e8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 13:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 13:02:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B07BD406544;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81E39822543;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 RESEND 4/4] ASoC: cs42l43: Add support for the B variant
Date: Fri, 27 Feb 2026 13:01:01 +0000
Message-ID: <20260227130120.3070893-5-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DS0PR19MB8433:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9aa9248a-16ae-49c2-61d6-08de76006d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	PQeKxHzCpuL16cLXFCe2GutlOfk71ERjMieAQD4C8aDHpEoRiiy8+8djeYvPsJxY0ojb+bw3Ay6soi7hYFLxf8eNIH8sFRsoFw5E7elpe2/j74QKvZ0JqzHCS/bDCYKithy5ykkA33Ln34tQLJGTAVmt5c4BEMilSsgfN2z69JjM/a5mEzCX/9JpGU+FSl973HGhp9R7p5GJ4bKpWNbesJPLScWnUzyodh/gbAoxeIBBUTBm2qznbfsvNnmRZoawVeAVOhJk/8y7ASYkBByINo914Y9Kw0bYno6OII3mpxwPSQKm1v06mAPdmt0M2nnc3P8VIVECkZX2+ErpSnUv5pg0YWnMetJ7Ilko00OXC0bT9fC5ChMpfvYW0eiDt3N8zdq1XVgsEPnS6CFC4R89E3Yl9XSa+Q+EYkQaF8kwqmPy4zokQbD/G+ai8w60pqr2oSoXEQjt+9g/GzOXPpypVxAHc5yX8OslvHP7GcgzPtl807xaGXJR3fpEsMVEB/j2Iqy6ts+LC98EHjvqTm7rV/eeeRrjfI9+cmDkvmggWAEZxBEG5ja++pGYrMv0X0wqSgVKn4+BynkLl1I9lpYbsTxyeQxMoXvFFmaAxEACo9aWfIWA2UPAYeyHm1SkJl323ee5hgIjplv4mAE/tHzOOqO2ePbKtEAalz0TrW7nObpjh02GF0rwXJJ1QxMkmoOrbv20/NS7ny8H8Vx1dLzu1FYZdpZdU3UMjq2spQKmxAkZgskgOEJ+muagB4TTIT7cBymsvTDw5ZwoiXSahPeBbKnumpc5nuMkoIsTnM8VrJO+wFwdgkiyUtUvc+mKrAg4celCPh2cGAbx6LvmNXn4vg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jHEfxMH3c+WkqpfndLLGOCzI7Zy2r9u1rfmQ9e8DaMyvxnmwsS03XfkSjwuoD+wimcWH2pAzO4lpfE3Nddku74mRsxDan8IRCF68YeSWnhFjWnOWDRmblVWxaKYDWTBRHeHxnrdaHLkl15SNo0WMjznV9/JCOlZVG5EWV1aQLr89OvydKE1fqlMqIVXXOLKVmuc64YvfwmIH7QAT+dVvIUaOPRQ7SaD6NN0YcfewyeLANsip9z14XsV5BRCrtrQigvePeMUCAq1yoTyDi18VVH6MjP7L+FT64kfQUhBooBGMraoCIX4bmxduom51ZjegF1SFKwOJUOAmINtP2pQ80n2PakQlGc+bL+Umwn/1OsgrlTHWSacnN9pen8YB4Dqrz8nWU763rvifL7pwExHQsr9CmdKHmNKw4G1zriYwJo4llvxbjN2pEtX4Q0KGY3V8
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:13.7356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa9248a-16ae-49c2-61d6-08de76006d57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8433
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a195dd cx=c_pps
 a=3xBwYUWp8GiLX146WrkxpA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=M7tb3-_zZpdRxA06ow8A:9
X-Proofpoint-GUID: J6fi5nN7PVIyxK8pjT3kAzRXmaFF04Eo
X-Proofpoint-ORIG-GUID: J6fi5nN7PVIyxK8pjT3kAzRXmaFF04Eo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNCBTYWx0ZWRfX/XTW5G5cL86z
 FiBTPL1WqzR9yJvLId6QbqOxL6EZaQ9lULi+uCGv4kPrglQGfIfLGjS9fzdtlxeUtBV+Vm46Lk5
 2zKA/zs29pjaxjvGWdode1wpPrKezhqRWJr2lRNz4QV75PIpXmXICcLpDbNirOo2dF5UNT5N+i/
 GlJUGMwnLqmkGTBDg/DIVNZ+4U0N6KGD7UfPvu++Aqr8LQVwj3BMzLln8DtosEwGj0C2UQJgU4R
 Y2vYFsWdeZOJAnoBWFOJna+xEbG8VnD9wQTExuhzNg3ECw1vDyteyTX69+sNwCQhjnybvp36Aig
 JpyqSekvgrXkuaA2CZzJfqPnCK7kt813OwUs3n8uYOtvj7NhGxVCrAJJ8dW9uRGDH0jrg7tZL2L
 HymLKWa0unNe9U95d9Ac24wGz3pQkV8ZevlOeoEzSUq1mo0bAN9SyMz6/wHlkJ1T84GQcmZA3ZI
 l4SpI/E93MtjMJFEzHw==
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v3, v4

Changes in v2:
 - Adjustments to variant identification following fixes from v2 mfd patch
---
 sound/soc/codecs/cs42l43.c | 756 ++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs42l43.h |   4 +-
 2 files changed, 625 insertions(+), 135 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index fd02d8a57e0f2..842d16e39de87 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -45,12 +45,25 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
 static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)

+#define CS42L43B_DECL_MUX(name, reg) \
+static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
+				  0, CS42L43_MIXER_SRC_MASK, \
+				  cs42l43b_mixer_texts, cs42l43b_mixer_values); \
+static const struct snd_kcontrol_new cs42l43_##name##_mux = \
+		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)
+
 #define CS42L43_DECL_MIXER(name, reg) \
 	CS42L43_DECL_MUX(name##_in1, reg); \
 	CS42L43_DECL_MUX(name##_in2, reg + 0x4); \
 	CS42L43_DECL_MUX(name##_in3, reg + 0x8); \
 	CS42L43_DECL_MUX(name##_in4, reg + 0xC)

+#define CS42L43B_DECL_MIXER(name, reg) \
+	CS42L43B_DECL_MUX(name##_in1, reg); \
+	CS42L43B_DECL_MUX(name##_in2, reg + 0x4); \
+	CS42L43B_DECL_MUX(name##_in3, reg + 0x8); \
+	CS42L43B_DECL_MUX(name##_in4, reg + 0xC)
+
 #define CS42L43_DAPM_MUX(name_str, name) \
 	SND_SOC_DAPM_MUX(name_str " Input", SND_SOC_NOPM, 0, 0, &cs42l43_##name##_mux)

@@ -99,11 +112,23 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	{ name_str,		"EQ1",			"EQ" }, \
 	{ name_str,		"EQ2",			"EQ" }

+#define CS42L43B_BASE_ROUTES(name_str) \
+	{ name_str,		"Decimator 5",		"Decimator 5" }, \
+	{ name_str,		"Decimator 6",		"Decimator 6" }, \
+	{ name_str,		"ISRC1 DEC3",		"ISRC1DEC3" }, \
+	{ name_str,		"ISRC1 DEC4",		"ISRC1DEC4" }, \
+	{ name_str,		"ISRC2 DEC3",		"ISRC2DEC3" }, \
+	{ name_str,		"ISRC2 DEC4",		"ISRC2DEC4" }
+
 #define CS42L43_MUX_ROUTES(name_str, widget) \
 	{ widget,		NULL,			name_str " Input" }, \
 	{ name_str " Input",	NULL,			"Mixer Core" }, \
 	CS42L43_BASE_ROUTES(name_str " Input")

+#define CS42L43B_MUX_ROUTES(name_str, widget) \
+	CS42L43_MUX_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input")
+
 #define CS42L43_MIXER_ROUTES(name_str, widget) \
 	{ name_str " Mixer",	NULL,			name_str " Input 1" }, \
 	{ name_str " Mixer",	NULL,			name_str " Input 2" }, \
@@ -116,6 +141,13 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	CS42L43_BASE_ROUTES(name_str " Input 3"), \
 	CS42L43_BASE_ROUTES(name_str " Input 4")

+#define CS42L43B_MIXER_ROUTES(name_str, widget) \
+	CS42L43_MIXER_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input 1"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 2"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 3"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 4")
+
 #define CS42L43_MIXER_VOLUMES(name_str, base) \
 	SOC_SINGLE_RANGE_TLV(name_str " Input 1 Volume", base, \
 			     CS42L43_MIXER_VOL_SHIFT, 0x20, 0x50, 0, \
@@ -300,6 +332,7 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	struct snd_soc_component *component = dai->component;
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;
 	int provider = !dai->id || !!regmap_test_bits(cs42l43->regmap,
 						      CS42L43_ASP_CLK_CONFIG2,
 						      CS42L43_ASP_MASTER_MODE_MASK);
@@ -309,6 +342,14 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	else
 		priv->constraint.mask = CS42L43_CONSUMER_RATE_MASK;

+	if (cs42l43->variant_id == CS42L43_DEVID_VAL && (dai->id == 3 || dai->id == 4)) {
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_CHANNELS,
+						   1, 2);
+		if (ret < 0)
+			return ret;
+	}
+
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &priv->constraint);
@@ -590,12 +631,25 @@ static int cs42l43_dai_probe(struct snd_soc_dai *dai)
 		"Decimator 2 Switch",
 		"Decimator 3 Switch",
 		"Decimator 4 Switch",
+		"Decimator 5 Switch",
+		"Decimator 6 Switch",
 	};
-	int i;
+	int control_size, i;

 	static_assert(ARRAY_SIZE(controls) == ARRAY_SIZE(priv->kctl));

-	for (i = 0; i < ARRAY_SIZE(controls); i++) {
+	switch (priv->core->variant_id) {
+	case CS42L43_DEVID_VAL:
+		control_size = ARRAY_SIZE(controls) - 2; // ignore Decimator 5 and 6
+		break;
+	case CS42L43B_DEVID_VAL:
+		control_size = ARRAY_SIZE(controls);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < control_size; i++) {
 		if (priv->kctl[i])
 			continue;

@@ -703,7 +757,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP3 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -715,7 +769,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP4 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -808,6 +862,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);

 static const char * const cs42l43_hpf_corner_text[] = {
 	"3Hz", "12Hz", "48Hz", "96Hz",
@@ -821,6 +879,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);

 static SOC_ENUM_SINGLE_DECL(cs42l43_dec1_ramp_up, CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
@@ -839,6 +901,31 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_up, CS42L43_DECIM_VOL_CTRL_CH3_CH4
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_down, CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);

+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+
 static DECLARE_TLV_DB_SCALE(cs42l43_speaker_tlv, -6400, 50, 0);

 static SOC_ENUM_SINGLE_DECL(cs42l43_speaker_ramp_up, CS42L43_AMP1_2_VOL_RAMP,
@@ -898,6 +985,37 @@ static const unsigned int cs42l43_mixer_values[] = {
 	0x58, 0x59, // EQ1, 2
 };

+static const char * const cs42l43b_mixer_texts[] = {
+	"None",
+	"Tone Generator 1", "Tone Generator 2",
+	"Decimator 1", "Decimator 2", "Decimator 3", "Decimator 4", "Decimator 5", "Decimator 6",
+	"ASPRX1", "ASPRX2", "ASPRX3", "ASPRX4", "ASPRX5", "ASPRX6",
+	"DP5RX1", "DP5RX2", "DP6RX1", "DP6RX2", "DP7RX1", "DP7RX2",
+	"ASRC INT1", "ASRC INT2", "ASRC INT3", "ASRC INT4",
+	"ASRC DEC1", "ASRC DEC2", "ASRC DEC3", "ASRC DEC4",
+	"ISRC1 INT1", "ISRC1 INT2",
+	"ISRC1 DEC1", "ISRC1 DEC2", "ISRC1 DEC3", "ISRC1 DEC4",
+	"ISRC2 INT1", "ISRC2 INT2",
+	"ISRC2 DEC1", "ISRC2 DEC2", "ISRC2 DEC3", "ISRC2 DEC4",
+	"EQ1", "EQ2",
+};
+
+static const unsigned int cs42l43b_mixer_values[] = {
+	0x00, // None
+	0x04, 0x05, // Tone Generator 1, 2
+	0x10, 0x11, 0x80, 0x81, 0x12, 0x13, // Decimator 1, 2, 3, 4, 5, 6
+	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, // ASPRX1,2,3,4,5,6
+	0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, // DP5, 6, 7RX1, 2
+	0x40, 0x41, 0x42, 0x43, // ASRC INT1, 2, 3, 4
+	0x44, 0x45, 0x46, 0x47, // ASRC DEC1, 2, 3, 4
+	0x50, 0x51, // ISRC1 INT1, 2
+	0x52, 0x53, 0x78, 0x79, // ISRC1 DEC1, 2, 3, 4
+	0x54, 0x55, // ISRC2 INT1, 2
+	0x56, 0x57, 0x7A, 0x7B, // ISRC2 DEC1, 2, 3, 4
+	0x58, 0x59, // EQ1, 2
+};
+
+/* A variant */
 CS42L43_DECL_MUX(asptx1, CS42L43_ASPTX1_INPUT);
 CS42L43_DECL_MUX(asptx2, CS42L43_ASPTX2_INPUT);
 CS42L43_DECL_MUX(asptx3, CS42L43_ASPTX3_INPUT);
@@ -946,6 +1064,63 @@ CS42L43_DECL_MIXER(amp2, CS42L43_AMP2MIX_INPUT1);
 CS42L43_DECL_MIXER(amp3, CS42L43_AMP3MIX_INPUT1);
 CS42L43_DECL_MIXER(amp4, CS42L43_AMP4MIX_INPUT1);

+/* B variant */
+CS42L43B_DECL_MUX(b_asptx1, CS42L43_ASPTX1_INPUT);
+CS42L43B_DECL_MUX(b_asptx2, CS42L43_ASPTX2_INPUT);
+CS42L43B_DECL_MUX(b_asptx3, CS42L43_ASPTX3_INPUT);
+CS42L43B_DECL_MUX(b_asptx4, CS42L43_ASPTX4_INPUT);
+CS42L43B_DECL_MUX(b_asptx5, CS42L43_ASPTX5_INPUT);
+CS42L43B_DECL_MUX(b_asptx6, CS42L43_ASPTX6_INPUT);
+
+CS42L43B_DECL_MUX(b_dp1tx1, CS42L43_SWIRE_DP1_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx2, CS42L43_SWIRE_DP1_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx3, CS42L43_SWIRE_DP1_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx4, CS42L43_SWIRE_DP1_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx1, CS42L43_SWIRE_DP2_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx2, CS42L43_SWIRE_DP2_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx1, CS42L43_SWIRE_DP3_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx2, CS42L43_SWIRE_DP3_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx3, CS42L43B_SWIRE_DP3_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx4, CS42L43B_SWIRE_DP3_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx1, CS42L43_SWIRE_DP4_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx2, CS42L43_SWIRE_DP4_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx3, CS42L43B_SWIRE_DP4_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx4, CS42L43B_SWIRE_DP4_CH4_INPUT);
+
+CS42L43B_DECL_MUX(b_asrcint1, CS42L43_ASRC_INT1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint2, CS42L43_ASRC_INT2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint3, CS42L43_ASRC_INT3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint4, CS42L43_ASRC_INT4_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec1, CS42L43_ASRC_DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec2, CS42L43_ASRC_DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec3, CS42L43_ASRC_DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec4, CS42L43_ASRC_DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_isrc1int1, CS42L43_ISRC1INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1int2, CS42L43_ISRC1INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec1, CS42L43_ISRC1DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec2, CS42L43_ISRC1DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec3, CS42L43B_ISRC1DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec4, CS42L43B_ISRC1DEC4_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int1, CS42L43_ISRC2INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int2, CS42L43_ISRC2INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec1, CS42L43_ISRC2DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec2, CS42L43_ISRC2DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec3, CS42L43B_ISRC2DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec4, CS42L43B_ISRC2DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_spdif1, CS42L43_SPDIF1_INPUT1);
+CS42L43B_DECL_MUX(b_spdif2, CS42L43_SPDIF2_INPUT1);
+
+CS42L43B_DECL_MIXER(b_eq1, CS42L43_EQ1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_eq2, CS42L43_EQ2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp1, CS42L43_AMP1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp2, CS42L43_AMP2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp3, CS42L43_AMP3MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp4, CS42L43_AMP4MIX_INPUT1);
+
 static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1174,44 +1349,6 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
 	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),

-	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-
-	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-
 	SOC_DOUBLE_R_EXT("Speaker Digital Switch",
 			 CS42L43_INTP_VOLUME_CTRL1, CS42L43_INTP_VOLUME_CTRL2,
 			 CS42L43_AMP_MUTE_SHIFT, 1, 1,
@@ -1601,35 +1738,81 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	unsigned int *val;
 	int ret;

-	switch (w->shift) {
-	case CS42L43_ADC1_EN_SHIFT:
-	case CS42L43_PDM1_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-		mute = CS42L43_DECIM1_MUTE_MASK;
-		val = &priv->decim_cache[0];
-		break;
-	case CS42L43_ADC2_EN_SHIFT:
-	case CS42L43_PDM1_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-		mute = CS42L43_DECIM2_MUTE_MASK;
-		val = &priv->decim_cache[1];
-		break;
-	case CS42L43_PDM2_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-		mute = CS42L43_DECIM3_MUTE_MASK;
-		val = &priv->decim_cache[2];
-		break;
-	case CS42L43_PDM2_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-		mute = CS42L43_DECIM4_MUTE_MASK;
-		val = &priv->decim_cache[3];
-		break;
-	default:
-		dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+	if (cs42l43->variant_id == CS42L43_DEVID_VAL) {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
+	} else if (cs42l43->variant_id == CS42L43B_DEVID_VAL) {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM5_MUTE_MASK;
+			val = &priv->decim_cache[4];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM6_MUTE_MASK;
+			val = &priv->decim_cache[5];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
+	} else {
 		return -EINVAL;
 	}

@@ -1722,11 +1905,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {
 			   0, NULL, 0, cs42l43_mic_ev,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),

-	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[0]),
-	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[1]),
-
 	SND_SOC_DAPM_PGA("Decimator 1", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 2", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 3", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -1871,53 +2049,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {

 	SND_SOC_DAPM_SUPPLY("Mixer Core", CS42L43_BLOCK_EN6, CS42L43_MIXER_EN_SHIFT,
 			    0, NULL, 0),
-	CS42L43_DAPM_MUX("ASPTX1", asptx1),
-	CS42L43_DAPM_MUX("ASPTX2", asptx2),
-	CS42L43_DAPM_MUX("ASPTX3", asptx3),
-	CS42L43_DAPM_MUX("ASPTX4", asptx4),
-	CS42L43_DAPM_MUX("ASPTX5", asptx5),
-	CS42L43_DAPM_MUX("ASPTX6", asptx6),
-
-	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
-	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
-	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
-	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
-	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
-	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
-	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
-	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
-	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
-	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
-
-	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
-	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
-	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
-	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
-	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
-	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
-	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
-	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
-
-	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
-	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
-	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
-	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
-	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
-	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
-	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
-	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
-
-	CS42L43_DAPM_MUX("SPDIF1", spdif1),
-	CS42L43_DAPM_MUX("SPDIF2", spdif2),
-
-	CS42L43_DAPM_MIXER("EQ1", eq1),
-	CS42L43_DAPM_MIXER("EQ2", eq2),
-
-	CS42L43_DAPM_MIXER("Speaker L", amp1),
-	CS42L43_DAPM_MIXER("Speaker R", amp2),
-
-	CS42L43_DAPM_MIXER("Headphone L", amp3),
-	CS42L43_DAPM_MIXER("Headphone R", amp4),
 };

 static const struct snd_soc_dapm_route cs42l43_routes[] = {
@@ -1963,16 +2094,6 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "PDM2L",		NULL,	"PDM2_DIN" },
 	{ "PDM2R",		NULL,	"PDM2_DIN" },

-	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
-	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
-	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
-	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
-
-	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
-	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
-	{ "Decimator 3",	NULL,	"PDM2L" },
-	{ "Decimator 4",	NULL,	"PDM2R" },
-
 	{ "ASP Capture",	NULL,	"ASPTX1" },
 	{ "ASP Capture",	NULL,	"ASPTX2" },
 	{ "ASP Capture",	NULL,	"ASPTX3" },
@@ -2060,6 +2181,261 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "ASRC_DEC4",		NULL,	"ASRC_DEC" },

 	{ "EQ",			NULL,	"EQ Clock" },
+};
+
+static const struct snd_kcontrol_new cs42l43_a_controls[] = {
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+};
+
+static const struct snd_kcontrol_new cs42l43_b_controls[] = {
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 5 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 5 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 6 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 6 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43b_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43b_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43b_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43b_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43b_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43b_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43b_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43b_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Up", cs42l43b_dec5_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Down", cs42l43b_dec5_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Up", cs42l43b_dec6_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Down", cs42l43b_dec6_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE("Decimator 5 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 WNF Corner Frequency", cs42l43b_dec5_wnf_corner),
+	SOC_ENUM("Decimator 6 WNF Corner Frequency", cs42l43b_dec6_wnf_corner),
+
+	SOC_SINGLE("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner),
+	SOC_ENUM("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_a_widgets[] = {
+	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[0]),
+	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[1]),
+	CS42L43_DAPM_MUX("ASPTX1", asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
+	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
+
+	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
+
+	CS42L43_DAPM_MUX("SPDIF1", spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", eq1),
+	CS42L43_DAPM_MIXER("EQ2", eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", amp1),
+	CS42L43_DAPM_MIXER("Speaker R", amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", amp3),
+	CS42L43_DAPM_MIXER("Headphone R", amp4),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_b_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("DP3TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP3TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA("Decimator 5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Decimator 6", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("ISRC1DEC3", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC1DEC4", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC3", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC4", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+
+	CS42L43_DAPM_MUX("ASPTX1", b_asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", b_asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", b_asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", b_asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", b_asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", b_asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", b_dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", b_dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", b_dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", b_dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", b_dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", b_dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", b_dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", b_dp3tx2),
+	CS42L43_DAPM_MUX("DP3TX3", b_dp3tx3),
+	CS42L43_DAPM_MUX("DP3TX4", b_dp3tx4),
+	CS42L43_DAPM_MUX("DP4TX1", b_dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", b_dp4tx2),
+	CS42L43_DAPM_MUX("DP4TX3", b_dp4tx3),
+	CS42L43_DAPM_MUX("DP4TX4", b_dp4tx4),
+
+	CS42L43_DAPM_MUX("ASRC INT1", b_asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", b_asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", b_asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", b_asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", b_asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", b_asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", b_asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", b_asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", b_isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", b_isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", b_isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", b_isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC1DEC3", b_isrc1dec3),
+	CS42L43_DAPM_MUX("ISRC1DEC4", b_isrc1dec4),
+	CS42L43_DAPM_MUX("ISRC2INT1", b_isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", b_isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", b_isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", b_isrc2dec2),
+	CS42L43_DAPM_MUX("ISRC2DEC3", b_isrc2dec3),
+	CS42L43_DAPM_MUX("ISRC2DEC4", b_isrc2dec4),
+
+	CS42L43_DAPM_MUX("SPDIF1", b_spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", b_spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", b_eq1),
+	CS42L43_DAPM_MIXER("EQ2", b_eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", b_amp1),
+	CS42L43_DAPM_MIXER("Speaker R", b_amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", b_amp3),
+	CS42L43_DAPM_MIXER("Headphone R", b_amp4),
+};
+
+static const struct snd_soc_dapm_route cs42l43_a_routes[] = {
+	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
+	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
+	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
+	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
+
+	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
+	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
+	{ "Decimator 3",	NULL,	"PDM2L" },
+	{ "Decimator 4",	NULL,	"PDM2R" },

 	CS42L43_MUX_ROUTES("ASPTX1", "ASPTX1"),
 	CS42L43_MUX_ROUTES("ASPTX2", "ASPTX2"),
@@ -2110,6 +2486,81 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	CS42L43_MIXER_ROUTES("Headphone R", "HP"),
 };

+static const struct snd_soc_dapm_route cs42l43_b_routes[] = {
+	{ "Decimator 1",	NULL,	"ADC1" },
+	{ "Decimator 2",	NULL,	"ADC2" },
+	{ "Decimator 3",	NULL,	"PDM1L" },
+	{ "Decimator 4",	NULL,	"PDM1R" },
+	{ "Decimator 5",	NULL,	"PDM2L" },
+	{ "Decimator 6",	NULL,	"PDM2R" },
+
+	{ "DP3 Capture",	NULL, "DP3TX3" },
+	{ "DP3 Capture",	NULL, "DP3TX4" },
+	{ "DP4 Capture",	NULL, "DP4TX3" },
+	{ "DP4 Capture",	NULL, "DP4TX4" },
+
+	{ "ISRC1DEC3",		NULL,	"ISRC1" },
+	{ "ISRC1DEC4",		NULL,	"ISRC1" },
+	{ "ISRC2DEC3",		NULL,	"ISRC2" },
+	{ "ISRC2DEC4",		NULL,	"ISRC2" },
+
+	CS42L43B_MUX_ROUTES("ASPTX1", "ASPTX1"),
+	CS42L43B_MUX_ROUTES("ASPTX2", "ASPTX2"),
+	CS42L43B_MUX_ROUTES("ASPTX3", "ASPTX3"),
+	CS42L43B_MUX_ROUTES("ASPTX4", "ASPTX4"),
+	CS42L43B_MUX_ROUTES("ASPTX5", "ASPTX5"),
+	CS42L43B_MUX_ROUTES("ASPTX6", "ASPTX6"),
+
+	CS42L43B_MUX_ROUTES("DP1TX1", "DP1TX1"),
+	CS42L43B_MUX_ROUTES("DP1TX2", "DP1TX2"),
+	CS42L43B_MUX_ROUTES("DP1TX3", "DP1TX3"),
+	CS42L43B_MUX_ROUTES("DP1TX4", "DP1TX4"),
+	CS42L43B_MUX_ROUTES("DP2TX1", "DP2TX1"),
+	CS42L43B_MUX_ROUTES("DP2TX2", "DP2TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX1", "DP3TX1"),
+	CS42L43B_MUX_ROUTES("DP3TX2", "DP3TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX3", "DP3TX3"),
+	CS42L43B_MUX_ROUTES("DP3TX4", "DP3TX4"),
+	CS42L43B_MUX_ROUTES("DP4TX1", "DP4TX1"),
+	CS42L43B_MUX_ROUTES("DP4TX2", "DP4TX2"),
+	CS42L43B_MUX_ROUTES("DP4TX3", "DP4TX3"),
+	CS42L43B_MUX_ROUTES("DP4TX4", "DP4TX4"),
+
+	CS42L43B_MUX_ROUTES("ASRC INT1", "ASRC_INT1"),
+	CS42L43B_MUX_ROUTES("ASRC INT2", "ASRC_INT2"),
+	CS42L43B_MUX_ROUTES("ASRC INT3", "ASRC_INT3"),
+	CS42L43B_MUX_ROUTES("ASRC INT4", "ASRC_INT4"),
+	CS42L43B_MUX_ROUTES("ASRC DEC1", "ASRC_DEC1"),
+	CS42L43B_MUX_ROUTES("ASRC DEC2", "ASRC_DEC2"),
+	CS42L43B_MUX_ROUTES("ASRC DEC3", "ASRC_DEC3"),
+	CS42L43B_MUX_ROUTES("ASRC DEC4", "ASRC_DEC4"),
+
+	CS42L43B_MUX_ROUTES("ISRC1INT1", "ISRC1INT1"),
+	CS42L43B_MUX_ROUTES("ISRC1INT2", "ISRC1INT2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC1", "ISRC1DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC2", "ISRC1DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC3", "ISRC1DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC4", "ISRC1DEC4"),
+	CS42L43B_MUX_ROUTES("ISRC2INT1", "ISRC2INT1"),
+	CS42L43B_MUX_ROUTES("ISRC2INT2", "ISRC2INT2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC1", "ISRC2DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC2", "ISRC2DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC3", "ISRC2DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC4", "ISRC2DEC4"),
+
+	CS42L43B_MUX_ROUTES("SPDIF1", "SPDIF"),
+	CS42L43B_MUX_ROUTES("SPDIF2", "SPDIF"),
+
+	CS42L43B_MIXER_ROUTES("EQ1", "EQ"),
+	CS42L43B_MIXER_ROUTES("EQ2", "EQ"),
+
+	CS42L43B_MIXER_ROUTES("Speaker L", "AMP1"),
+	CS42L43B_MIXER_ROUTES("Speaker R", "AMP2"),
+
+	CS42L43B_MIXER_ROUTES("Headphone L", "HP"),
+	CS42L43B_MIXER_ROUTES("Headphone R", "HP"),
+};
+
 static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 			      int src, unsigned int freq, int dir)
 {
@@ -2126,8 +2577,14 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,

 static int cs42l43_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	unsigned int num_controls, num_widgets, num_routes;
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_kcontrol_new *controls;
+	const struct snd_soc_dapm_route *routes;
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;

 	snd_soc_component_init_regmap(component, cs42l43->regmap);

@@ -2139,6 +2596,39 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 	priv->component = component;
 	priv->constraint = cs42l43_constraint;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		controls = cs42l43_a_controls;
+		num_controls = ARRAY_SIZE(cs42l43_a_controls);
+		widgets = cs42l43_a_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_a_widgets);
+		routes = cs42l43_a_routes;
+		num_routes = ARRAY_SIZE(cs42l43_a_routes);
+		break;
+	case CS42L43B_DEVID_VAL:
+		controls = cs42l43_b_controls;
+		num_controls = ARRAY_SIZE(cs42l43_b_controls);
+		widgets = cs42l43_b_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_b_widgets);
+		routes = cs42l43_b_routes;
+		num_routes = ARRAY_SIZE(cs42l43_b_routes);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = snd_soc_add_component_controls(component, controls, num_controls);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_add_routes(dapm, routes, num_routes);
+	if (ret)
+		return ret;
+
 	return 0;
 }

diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index b2fa2cd1d99f8..fd50feb26ae99 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,7 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;

-	unsigned int decim_cache[4];
+	unsigned int decim_cache[6];
 	unsigned int adc_ena;
 	unsigned int hp_ena;

@@ -103,7 +103,7 @@ struct cs42l43_codec {
 	bool hp_ilimited;
 	int hp_ilimit_count;

-	struct snd_kcontrol *kctl[5];
+	struct snd_kcontrol *kctl[7];
 };

 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
--
2.47.3

