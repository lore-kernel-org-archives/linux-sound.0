Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5B2F39AB;
	Fri,  3 Apr 2026 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204644; cv=fail; b=KZdK+mwhkHMqXx4NPJW9R5DkQ0/ZTHO7IjQNprL5ThoNUBjUNMSnbYx5vQKDYYUhINj3zVgFsFd8nIJ8In4uVVJn2UKhrTVA19IahFvbv/vlf9f7W2Q6AOslXYqlmkKedQUHMkKtyGubJcLdtjnq1FB0lw6aeyyfziCjl42O2zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204644; c=relaxed/simple;
	bh=xRJzp3tqutiLmOH1Msb0fnbB0snnVesiZe5bULUNoyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=olWXYnyJCqSLaUHmDT3bl29GOOZdbyioemkKKR4c6uMa3N4zIDl6yfxs3mEfcV2DKy7CN0vNirmz9Q+XzY0IKWxa76JDPaIwu4SrHn667pl1WklBFkh4GB7XI9aw81xJcO8Sjmdxx5/ZaUX70B/z/zIy1008u+UKSfbNZmNC0K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NQs2DrbR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xwte5ViZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NQs2DrbR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xwte5ViZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336x58G1538932;
	Fri, 3 Apr 2026 03:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vAsosKOHt4c79caV
	PYgK4qligA/WlL/IJo4vbhn8kSM=; b=NQs2DrbR2ppRFFeOMOgEN0cYxSfX5sJi
	P8e7voclfJWU0biPWdDtuMk40wYvzPmeQDbl3toGsCM6h6G34MXjqJjHPm/IZTiW
	Y1VAv2aZ/pCdmUF18WrupFYPYZqnM/NYXuQWl34tJ46qlwM5fYpNQ9wUuvJtPwRm
	NBcRY0sIzLRbQmNXTbvWquJNe7z/IkvszHVyDH/bQM7bz1e9ntepiTuM9lW2MkM9
	7RJgpJyKqOb4QEMks4s25u3uRI/TCnUL0xF8TTWlAeqM6xU40Vj4MCWiXbnsGKOW
	mWYr14rJk0/8F7NTdnPhG+FJ/P+fOWxemhR/RkTDSIeirrR+iYz/eQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020082.outbound.protection.outlook.com [52.101.46.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxyfcu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Apr 2026 03:23:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL8yKxWXYfYtPEOzx9nTyuenpT5MdhdF5Mmmiu3AzkLl/YreqH2NmT+JJpLPMKpjexE8+3AkmvoRRszgeQf4xAnoMMeFIS9iRWxp2u0VjJnZeuptiS4jJYHccrBd+wAvQw4Ey7myad+9go87rHVS4fBd2ikWu4IwU64bmW69JFp63PekR4w6NIjk1cdZJuxebBOh19VRjGnNBAn1nqmHmYvMc+kM/tzv4p5Kc5c4jDPqJCZLHgwsKA4EYmZ8OuQX3L9v6ixpLbm6GDThudHvl0c0ocvI6UR+IMJOChKLr0vfDC3aodlDsguxyKaihmr/wziwJ6YLJBMLFF3XEILAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAsosKOHt4c79caVPYgK4qligA/WlL/IJo4vbhn8kSM=;
 b=bJ4q1q7InjrDlzK332bpEPI0/bHsUq8wz+LZ+Zgm/3xyK7bd161Zzi2ixyHuwFKahBO24JF9suhtZWZL8XMifVB7mquTq7Pulij0JAdTtNEE2YKgUrU2DXiSBiWLKdLloCLkV1cxqdFPTDTbrm/MdYEjlY5Yuh/uhL258YNrjuoMogYoshxtPIjIOsGh7vfAvlajKWDt78dGG6UZvZwKzKTZPhBZj9UltXykqMMx+ze1quaRcbDayvUtURYXjHA20ceYuldIbY0aEUuStuVko3kR6UcsyOdo6vFFCnzXratfxynacbK7mL4lN10vWPEAfn/UWWNw+2fSsrk5lPe1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAsosKOHt4c79caVPYgK4qligA/WlL/IJo4vbhn8kSM=;
 b=xwte5ViZI77fRMiAIJv8/cl4TVC7qQDtapGVnqmfL25y2+AS4I7Rs6GGLzFQekzGhIDyRCQV2uVoJP7ms2ohSDCD7ReJDUMVcmkar44vjH6FQjZJe1Sjnb8Z8v56g2w93uKOgwJRPGagYWey7F5pS3iccn2YqFbKarITM/5jUBc=
Received: from BLAPR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:32b::31)
 by SA3PR19MB8257.namprd19.prod.outlook.com (2603:10b6:806:39e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 3 Apr
 2026 08:23:47 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::57) by BLAPR03CA0026.outlook.office365.com
 (2603:10b6:208:32b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 08:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 3 Apr 2026 08:23:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 49AD9406540;
	Fri,  3 Apr 2026 08:23:44 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2FF5D82024A;
	Fri,  3 Apr 2026 08:23:44 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: yung-chuan.liao@linux.intel.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: intel: sof_sdw: Prepare for configuration without a jack
Date: Fri,  3 Apr 2026 09:23:35 +0100
Message-ID: <20260403082335.40798-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SA3PR19MB8257:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3e0d444-bea6-4b06-1056-08de915a5309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	nCpyG3Cp6wagv8GtGMFwAc2X4emuPOO5YWCzJk+++HDh1P5Y+ip+G4ufZE4t83uDdexi/jIuZmWsm/krKWFayDgGMmE3OO9n1bYwoEjm+SEZ43dAoHw1dWw7IYlW1/UMnBAloDisNVftjjKN6R1c/aRdWYrIxSx071JRHzsQobYMMMVyVvuNObfXtWsKmDxrBxuq4ZrDO6JF67V0OAuayaennEW+uBvHzjbbWziSGUC+zWWXQSPQfUzxYvZpudpmfKWrB8nW1PygmnNsnh+XzAMDQ2w3P3U4D27gXmvehVRDICE6z04YaFZY8TYkurPKRJr5vZYFWsZu5TsfAQJpYZi010+0yKfuujuXlbFRlaA3Yml6khrLCHpFTrPR46/3sVl5N9VHYrpg6vAZWfqnbKlHN1qygZqQrjwBgWKy7vek6jGA+qBsD807XBEzDdP2tolRG8CIV0Ml/HPJiuqhE3ZCmrsBSg8KlfJ9hUeN/VVgVK/yiYIWL/rmJjfw3ZGKBMoUY9NHFnSIkthdYKvUG78dVaKGSihiFBa8tf2w+KgLCEgt9xYR3uNvFmCxf1Srb31bQudfu7RZ4LwBrJ6AEgTUOUnNYnN2oaZMikbsFkFn6CS/fNhsIbSVgIIsgv7d5qRyWi5IsrdW2kxasxxqRCzh0SPbhNVsGQmDS/swMQwaL3xkcmQ7SS5895YyVCgkK4CbVp07ii8gTPUnyzUx92JABExjC8UXaAztVF+5jSnS+LpIcqy1PnqiaByLupQgHvJOuBW1q1RFsH/lq6scuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rKfTGEK7lvNfu6aiN+Zq1W5VnKby9tH4ER4U5Zkwl4xyYADUi1Ev+8K/Vx4dtana3I+YgsMW1qsZgHX5J+fT1qPu4MjRQbjm1BwGvmLO3Jif5gkhHftPsuPHLCzuPTJ1vRyF7kP5ZEkIepIb4K/Z2X2cijobfv677+lFoiJhvAX4gVi5nKwuResbhZCZYyleRF43C2CrzzsxPUGZejIi65bsjkfx6MSDV0OhroLWoaiGQoxoWzOUkpVHjX6Z3sH1FsdmrmBa3O43JCGxMJqii4jfHttdXm0e7jbwlHCzHu6iNgV3k062BSqkEqw06MRG7511BiTPXfr6dl5nk59kPeswCrvZh/E47nhBVF401eeaJCOX4O3f6DDxDv5qXqixrN5SOSNXOepa6470AXbqR+9nkqNlH+CkmPb5A7IN+Gxl9KHVWocpRAFRTGInaV1i
X-Exchange-RoutingPolicyChecked:
	I+WDCkLli41jtWoh+RT/TSAwLFZufZ58RRjyKjYmjJntQ0QdaIATLlleLd2hAH1g8bh5Vcq9FCsc4jqB77OPqQO0a2S7edNabMbb6EvY0JGOMgKPo/IrazqLNep7+lU3oXLlp7SSvm5zJ1NyYVkNuRYyKuCGUm6C/bEW1zfQQLmXAZpZwqs/Kj1JtTAwpqHFwIftDzdTzC27NOr0bEpDqz1zbhW1VOynnEhmK71UC9JYwlKfZxt4R3aGG3AcNLiJxdRakMlxcvVos+Aiuw3YZGm9b9iTYSayYwj0o8ipEU8y+JZo46Nw2Qyb21QBr8yQugamxAHOTPxmBlH4KVpwGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:23:45.7265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e0d444-bea6-4b06-1056-08de915a5309
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB8257
X-Proofpoint-ORIG-GUID: RyysBD8x-oRWk1J74aDlluV7n21wicBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MyBTYWx0ZWRfX8RS7ujx4Ktd/
 I8mKN9rruUDNzNy0Y+YEEi4S1Vd1mMsEyuvYdHkF+0KO6WTs7t5LdA0A84yCLSo0+OWO4QfOD2N
 EQTB/8MJn6J2gVSDdAQJuvoDysyLTm/F/UtbKuZa3TYEUh7uIV/jGa3c5wEfzlxALtlAQlBmvDG
 NZ0Tc8IYEkXSSIChhkPZx3ZPyNBrrcno2LZQflowSYyH7toxqdNCy2dvhh+Pzma/z20pA2QzAJM
 58ZVXVfUMQqvPhhprbKn8BcSQRfHW+SWaL4MS4QYulY5Dh6LktIU0JYXWd0bfzjNd6x7xxvpf0t
 PVP1Q0MVJvhL4YGsj+qeYfIWnCsJT06eYMJxBjQWmsQC4mzZ3U/DBos9fsnQtPj7CfIkpuckzSu
 AUBVSpY8WENF/FSN1IlLriLwxVODCdAg9vSewxFz7CUMNFlRQDIcHHiaYn9WL4SCQOtevpx2NIM
 HbT/h11yIDHuQm5Cmjw==
X-Proofpoint-GUID: RyysBD8x-oRWk1J74aDlluV7n21wicBt
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69cf7917 cx=c_pps
 a=SBNZrs1CJjyqcQ6ja0jd9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=Q5TrXv-4B9OcOYaxxPMA:9
X-Proofpoint-Spam-Reason: safe

In certain setups of cs42l43 UAJ function may be removed from ACPI and
physically unconnected. Prepare a driver for that configuration by
setting a system clock in the speaker path too.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v2:
 - Fixed error return on snd_soc_dapm_add_routes()
---
 sound/soc/sdw_utils/soc_sdw_cs42l43.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 2685ff4f0932..4a451b9d4f13 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -107,6 +107,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");

 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -131,8 +132,15 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so

 	ret = snd_soc_dapm_add_routes(dapm, cs42l43_spk_map,
 				      ARRAY_SIZE(cs42l43_spk_map));
-	if (ret)
+	if (ret) {
 		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_sysclk(component, CS42L43_SYSCLK, CS42L43_SYSCLK_SDW,
+					   0, SND_SOC_CLOCK_IN);
+	if (ret)
+		dev_err(card->dev, "Failed to set sysclk: %d\n", ret);

 	return ret;
 }
--
2.48.1

