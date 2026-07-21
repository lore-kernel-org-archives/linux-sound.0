Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CF3A4F23;
	Tue, 21 Jul 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644629; cv=fail; b=RLQO4rCO9fJ67t7DmUojBwQ0xyRUqirRlLmzVKGCDaV5HwIP0vkCAD5NvrYDA2zqOkA5MuaMbtvyp2LtRR/AJ9gYm4orHvhm4jPb8RtIZ7+y+bg0ySh15xt+GOY7cmsUl3l4jKsoiw/wXqPGakFHHvsJCtj+mo1WGpoM49vteaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644629; c=relaxed/simple;
	bh=h2g5xpWO0xU2qJmaNanx+FEDmH6vDHSR8XPnkfrVm5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1PL0nfXLugkGqWkF7RfrfCWJgCB1lXQUB11Hd54PFjhEHsnSmUb5JKZq9mjsu1aaaLgIwXJN/ucBQVa/qUc7XT2kA5SK5F6N/KBa5fmeymBcYcdwT2k+dezoWZaJLuV3EQ22hDntswiBvqJczI00SVpm2dUEey8XZCOMIOUvAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kzrPYkaN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xsLeJRtU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kzrPYkaN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xsLeJRtU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L4kmsl1776439;
	Tue, 21 Jul 2026 09:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A7hRsGAfWMpYU2FwyDQo5fRg99Q4jLunXHRQfXcW/b0=; b=
	kzrPYkaNFkzelREN7YKxVkYdNKBc1nPNaLiDkpS9yJawQoLrChHvKXy8KaAV8Bxa
	WaeiXILnKuCDq6MZsaXCbtISTsg3nDRty7Kr3sT2TNq5hq7MK67ZtUTdcW3TjlUo
	MYPyqDVxQlfX3BWwVRwROL2WM5dM6eumFGug7l6JW+z4mXkUyQaBvTLnzxGIasoW
	fmtsI7ihK4bNjMktpKITfem4F4chgQgyq9BnJXW5/zYofyEf/a0mJ0sCIMdn+Y7z
	DeYfswqPPWbcmz5CDE8oOaPHP1T0+P/2ONETROz/UwLMdNAmV6BIxAD+Qjd7ITZ0
	Sq+XVl/xVIiFnkDjV1dqrw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021111.outbound.protection.outlook.com [52.101.62.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vym7n7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:36:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpbD9lO7yWoKTF1aS+Wo/jEGkhw4eAasK85n/7lU1TDQqNDEF7u73o74pLfYUfXAyMvZ04cLuIQLWcOUatoQ0lvjnfHxGLfQIk0P/t3xypu2UtUmYXcrjvRYbK9SjIaI2psQA+3fqqHkHN4lXf0Pdo+ueAD+4XEj0EctmgDQIZ/TE65Ulgs+YSL28Q+aA2CapOPAGQ/IIKnV+7D5IpyMsCOfBTqfJTnGAXqjBQuxdjQvgmGk0Mz0shIBTM0iPSeo1s1+JY3d9dzd81A2/oUEdMp8LBKO7fuh4Hef8l8FVPAqvpEaizs4JyjDOdvNIVfEJ0lz87f0/XF1A3xdtq3F3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7hRsGAfWMpYU2FwyDQo5fRg99Q4jLunXHRQfXcW/b0=;
 b=kwldsR/ltYav3aOcldAgM0dTDbdhoE5UQUtVAfLpT11jpfs3DG91ZAepFpcRlbqVYlA40pyyrdgu7c5Vr6nW4U6Vz4ZPTwfLmyROv7UQM3f4Ejck22OFCt3OHwS7hea7Y5dynkYaiH8CG1mCzrXn67Bv6yxp7hl63Lz4/CxqGK8Sm6yjP9aAde16n5/twc/bIW6TD/nsw6RVHR1XoMJomQ75zLYK17+CwZpKBXP+0BjNWqMBeLjpjapUejyEmn3mtZV/8T3S5PvuKUB8uQtB+xt4wrjEnJa0mOyqLJKT4B+HCO5oWs3NQkxkXcwQof43kd+Z66Sz1RVzIreqp3XCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7hRsGAfWMpYU2FwyDQo5fRg99Q4jLunXHRQfXcW/b0=;
 b=xsLeJRtUu3AVBkitEr+qWgXe5nCBYeIqwOPgaeZkgM4w8O6UamU6KKD3Gpa9mN02tXQoHoHhQbzPYPBT75P9XG9TeN2xD5m7NatCo8f0CHc45mSixoz9F0lEjgxUzEfkhFyTku/tbUNv7pncFwBbLYJhIOiNXpc7wwbH5gK7SMM=
Received: from CH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::15)
 by BY3PR19MB5202.namprd19.prod.outlook.com (2603:10b6:a03:36a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:36:46 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::a3) by CH5P222CA0001.outlook.office365.com
 (2603:10b6:610:1ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E25E0406554;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BE5C5822554;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 6/7] ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
Date: Tue, 21 Jul 2026 15:36:35 +0100
Message-ID: <20260721143636.361814-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
References: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|BY3PR19MB5202:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ab55aa8-adcb-4311-090b-08dee7357c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|61400799027|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tmGksz4FhBPCwBXH705wqgs6yTVDRStAUjbUqiXGvcLeRc3QvfQUhCUgZcqKsT2hUNTeZE7duvQPPTUzZ0I8++2ft5vnblRAFfnNCHOBOnIZHmbHfFbO5tCqJdP2CzizTi7EkL3UzWUkqT8jjQ6Uc/pGypOuCHySFJXk42cYSFUUdJK9QCAAiExklCLz6KUZwnW/qC46CNhd1wLfsLxz+yjZP7pEbotbvo8KcaoC0b6GfWHc8A5lbaD00x2BGM+qvyl1rvtpnAhhtgq/uzdY9R1gohBBTE0+UgZd+24WXvAUMMGyIcLCY6aFap1ZdEpjOKhSWHgeBHMF6LcATG8L9uoTLjvWFReA3ymQqftFtYlRkLUn8vjAUy3+HuoSQtlvPh6uonSCHAJptQL+OE5mXCx++AIMEDVlE9i4k7XqDfDmHbqX3hm0Q7LuzeuwjyPVnRHS6y2OCXhRil+HanLlTj/XuvjBU0Bln0SQCB/dG1JrX0UHczuAJloFan75vmkBZU8DsIjQIgaQOaowje6pl/SKxwNgkaKtoV0IUV0s5ZIFXZcMxkPVi+j2Ee+L3HT7JEj9q2ZKIdfVr1jM3yyFZ5daYThlm8RRoTGhIHBRN5kS7VfDXoWw9dVoUv5pvVErlh/v0MrE5p+tUGKB3OgaQMrcajM2xc85OKp9oGRlv3zPMEPYgUYd8ee4XlzLhJtC9iRI6Oyx1HSIPYr9ebM2eQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(61400799027)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xrHKzNcrpLxrXYO5VzLBzxVyDLJu89tsuxaySGsAa9pBK27eD9rpoLfIAjnC0m5fDfA8at4v3lZUmE+9Z3gA1Y6PE+kABF1Kd7YD3+DhAItyQkBP6Wdc962G8zM5sAZNcXtRPciZ4GzsB1JugUrq+u/JnRPeMCNlLaGVQ8RIFohrvHZ+PkpMHRYecUEKiZfd1/o4E1DRZHJm5NRnGV2F8vC3cciljKKieU6yWgKd28vPKgZlVJhrjKBkI7pDB0JVGJbxPOLc8VV14FmMXSfwlWuw8YKtj41F3bT0stpW1yN4NaNauat+StHa5/DyLP6htDV0Ig+V5BSbfFTzHYUJ5zDwe45ia5JMiD7PVp7bO9jFAxHaQplulqSNLVZNnoLEm5NknzUppC1ZB5J0ZAp9++2mGtb10+yC861lAGpj6PhA5hGBGiw1xUHjpTao0EGD
X-Exchange-RoutingPolicyChecked:
	e6PAtoVQz61xKwFirXjY0ZCvTQZNNTyIzchyjNMpRCSRgJaKAwTLPVHclE7/yniSslo3ToayDJrwFsA1c/aiueJmUJVR6t+ARC5ha6SYrrz6ReaZ1DPiso9/ktSta2MPKA0h92CVV3k9BUnOpbiZmgU/dwXN0curHgjwfu148O4oWPL2Oz/pvVAwL6yBVNr9QVKvjb6GUJ1WvP5w5mZFiI9E+Ms5LBoKoUcAiuzWShtYcEpNz3pI+GsX34wWjuomvbf5xpJ8HWomWiXghB/8z2wbEVYVKdhLG1GkmKrjglDYEnTIDSIE/5y3qCyKm/JkcR5SKrAyubZZsnmIlvaALw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:43.1068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab55aa8-adcb-4311-090b-08dee7357c0f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5202
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX2rJPvItYRvqa
 806ieHBInihpSAeroebx5HbwCua87vwGtK65W56NmvHT7VL/9dOzCH402n0DHVtRC7PB3YfCCiy
 OfFmITctNuLnuYSRzsbEhupVVQ0KoHk=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5f8402 cx=c_pps
 a=pLVGl/zQNnluPJXkQhez9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=cTvsH-JCG-SXLsoZKIAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfXydS/t5NnlF+h
 TYAjyX9tW14xcJ2lb3FbRnBlWJ3JM5gxnyUtz9dAw6WKe7Oy5E182gebkcVxc3+Nw0CIwvmqWpE
 OTfC+ONE1fmJlUeFiu9m/g+uNgosGJBkGyaTSAstZdPbnCYBBCkflxscidkXsFmCzCe1Okl9+QW
 nE2jewZVmloFJG+2n13c4Hpdj02uhl8/FtGRtjGWWLww2PMAsrS+AMKfjnsWA24u5a5KDyaYiqJ
 BDvsurx7w0pVa4l7QhtMox68e4lHR+jahFwLcfgIiX/RrN8UhhXdqkg8mCCmqZ1dXcmf55RpkXn
 Kxc+M7CGcqOIweWM3lVSa7uJ6++tgj6V6GaKLaYZkXwQeRUeMoC8szOtEL4yhO1YCRnis97x/Qk
 efCdiBJJ9o+3QHdI7aTp+HQL6o92KJHzzsxpx8A+zO5AEazkq0sIK2jqK+C6NCrta3D3uOISsZs
 mTlDB4R/BVP+VY+bE6Q==
X-Proofpoint-ORIG-GUID: fI-yEp9HrR8dP8UOizNQ3Gf6cFJIBbZT
X-Proofpoint-GUID: fI-yEp9HrR8dP8UOizNQ3Gf6cFJIBbZT
X-Proofpoint-Spam-Reason: safe

Currently there are some race conditions around the boot of SDCA
jack detection. The core creates DAPM widgets/routes quite a
long time before it creates the associated ALSA control, and
the jack detection IRQ is currently registered in component
probe. At the time of component probe, the DAPM widgets exist,
shortly after this the DAPM routes are added. At the time the DAPM
routes are added the register value for the control is checked
and the appropriate path is connected. The existing handling
in the SDCA jack IRQ handles the case the control doesn't exist
and updates the registers directly, which works until the DAPM
routes are added.  After the routes are added the DAPM graph has
already set connected on a particular DAPM path, which will not
be updated until an IRQ is received when the control is present.
Thus those updates are usually not reflected in the resulting
DAPM graph which can lead to the audio path being erroneously
powered on/off.

Switch to the new fixup_controls callback to register the
IRQs, this is guaranteed to run after all the controls have
been created. Which means we can avoid the aforementioned race
condition and as a bonus no longer need to concern ourselves
with a case where the IRQ handler runs and the ALSA control
is unavailable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v3:
 - Switch to sdca_irq_cleanup_late was done in the patch that
   added it.

 sound/soc/sdca/sdca_class_function.c |  4 +--
 sound/soc/sdca/sdca_jack.c           | 44 ++++++++++++----------------
 2 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 5ae6c727c796d..2fb2b043c979c 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -191,7 +191,7 @@ static const struct snd_soc_dai_ops class_function_sdw_ops = {
 	.hw_free	= class_function_sdw_remove_peripheral,
 };
 
-static int class_function_component_probe(struct snd_soc_component *component)
+static int class_function_component_fixup_controls(struct snd_soc_component *component)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
 	struct sdca_class_drv *core = drv->core;
@@ -217,7 +217,7 @@ static int class_function_set_jack(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver class_function_component_drv = {
-	.probe			= class_function_component_probe,
+	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
 	.endianness		= 1,
 };
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index ffa8709649248..3c84d17244a28 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -41,6 +41,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 	struct jack_state *state = interrupt->priv;
 	struct snd_kcontrol *kctl = state->kctl;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
 
@@ -55,10 +56,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 			return -ENOMEM;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl)
-			dev_dbg(dev, "control not found: %s\n", name);
-		else
-			state->kctl = kctl;
+		if (!kctl) {
+			dev_err(dev, "control not found: %s\n", name);
+			return -ENODEV;
+		}
+
+		state->kctl = kctl;
 	}
 
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
@@ -96,30 +99,21 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	if (kctl) {
-		struct soc_enum *soc_enum = (struct soc_enum *)kctl->private_value;
-
-		ucontrol = kzalloc_obj(*ucontrol);
-		if (!ucontrol)
-			return -ENOMEM;
-
-		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+	ucontrol = kzalloc_obj(*ucontrol);
+	if (!ucontrol)
+		return -ENOMEM;
 
-		ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
-		if (ret < 0) {
-			dev_err(dev, "failed to update selected mode: %d\n", ret);
-			return ret;
-		}
+	soc_enum = (struct soc_enum *)kctl->private_value;
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-		snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-	} else {
-		ret = regmap_write(interrupt->function_regmap, reg, val);
-		if (ret) {
-			dev_err(dev, "failed to write selected mode: %d\n", ret);
-			return ret;
-		}
+	ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return ret;
 	}
 
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
 	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
@@ -201,7 +195,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 		struct sdca_control_range *range;
 		struct jack_state *jack_state;
 
-		if (!interrupt->irq)
+		if (!interrupt->dev)
 			continue;
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-- 
2.47.3

