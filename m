Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567061C84BD
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084130; cv=fail; b=FLTmG0z/u8qy0Hg4I7RGjR0u/42+iKm6qKI9nkxr97d5YdJbUaPAuEPn5HQ8Z2yIofbKuZw3S9We7kLt7wSkmJmwUGCGcW8EIbIzbeUyf5af+igQl2/6rXhoOIA9VGf5kmOxHp7oSL+f6pyMVKgSPFBmMZq9RUH3vjsatN0UHRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084130; c=relaxed/simple;
	bh=kEJsVUkI84yHzEmuwSbwEMUeojAH58iIeU3xmZg05Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arWraAtk3/ifWzGzFGRwcNPsdNEYoIANja7Y/L+Wg4/Yi8jleU7O4PwyuGjGNIzirtZfsgb7RuKyYT0wQZP358mxQPPXFQ6kSPAZdRyXGUT6h3sRjm3Ui2Mrv5wJHdzb9p/DkVtqR1oPl/a+hK2i6I7O/80HS43GAzcZurn51S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JmL5jmnS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CBzlXro1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JmL5jmnS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CBzlXro1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4jkTB3667332;
	Tue, 25 Nov 2025 09:21:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6qR3wBjt/FUlL+QeZHj3jUyAL4dJwLsmQMk9JLNHysQ=; b=
	JmL5jmnSJJaQpYbiYSKWWsaKGy0/kVHkQix1iSbonyov+dRYkcK0Hv1h876GzXXT
	pVHObeDLbsBgaPJNpBc9IAPgjt6Dqej63+24HGNy2erU1bSsTRj6cjenGWdfc/1b
	0G253eLideQu4aJfTwXXP0DSn/KsFOCR9pO3PYX2xlEkJ+4RAHym75m8kN1N5Ab4
	va5ZcxuVnIp/sHrQ3ymE1dYDrr32Kc6ujU+t1KFMArhDGCSn0GiBvvHZKMJSqkaE
	EboLEy5V5SdVg+Ci7Eoa+xLBQ8oAfYT53R5rAxNMf+euSWxFuv7PeMlnvJBEHSXM
	qjTxJ19hcVjwXo5DP2vLUw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020101.outbound.protection.outlook.com [52.101.46.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkb7d3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyEYhDXsLPFrRvhhvZSIi5A/b82NUGOvABbpIjL4asOgNc3Zk8ZlafKxNHE5RIWywuOM5TtGvUy3mkLXN9Pbnk5ylBQXpdVxmpyiJFjbZfgwkVeV9vlLXmQI+P8Q2uiCLMeAXHtqWRuqqiaPQSm0DPKorn/I0SL6i2K/JzXdscNR5A7864I5hFltwwIWxjxthzYB2x42JgYv1SRWgmsljfwsuQFev9O9DwEfxH6bSh31ZfUxmSKP8cKs+7QcY3dETDE356eKZwMgO2tCM1/sIOakc52CrwiyguhHMo80iT6Ubr2lBQ8ALx6RwRdIdwT6849SWSj1Pot1jJQmVNv6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qR3wBjt/FUlL+QeZHj3jUyAL4dJwLsmQMk9JLNHysQ=;
 b=PeyoUXvWWPI+iqbA6IXrDC6ZJwNJkVksOfjJGSBLyLOO1rn5eaAsQE/N56wYFmU7RftCKYFJu3jBQJ8slL7FGUHvlbWDA1x+Ry8ddnNG4hWVZzYLANFnJuIQDCueOyF1Px2C0Te9+SiTtJbcATTKMUbHCpdiN1fkFj9ykoszQbtx8yvpQm44CBRmz0q811YG9Hnb4wR2EI5qBThwsDFuZP01C9B3Ks2kCYGHO+MHyV5TPE3QmGAV5j/vFp/i2Z5jRaFOPPC/7vb2GhxvRnDna6H7/G1lCXAdnM9o+zmMdPB1G/gwKnTbeeHzAD6boEOKW5cx5a617xxzePiv1LoQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qR3wBjt/FUlL+QeZHj3jUyAL4dJwLsmQMk9JLNHysQ=;
 b=CBzlXro1yyr4l1P5hunooBXMsgdPKP9eylTyKLV+YFUcVpb/ZqHTleR+ioe7ve06+qqckL+VCSZkI5HIPmM8Qyl9ow3FBR6KWzBZthpbA4F9jvadnCuFaNA/aPUJOi21pzlfwGjnNc14/AagNs5XQlja1vxAQk0O+HzES2IPx5A=
Received: from PH7PR17CA0008.namprd17.prod.outlook.com (2603:10b6:510:324::8)
 by DS4PPF86F4A2197.namprd19.prod.outlook.com (2603:10b6:f:fc00::a2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:21:36 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::4d) by PH7PR17CA0008.outlook.office365.com
 (2603:10b6:510:324::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Tue,
 25 Nov 2025 15:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 860E0406554;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 74F9782026C;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
Date: Tue, 25 Nov 2025 15:21:26 +0000
Message-ID: <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DS4PPF86F4A2197:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 050c7729-c8c0-44dd-7445-08de2c3652cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gWB2jj4g4yE9DFXyNUZXNqwZ0/6bx/nAlUegxciyDt2TTQCytSlBvYgqrSFZ?=
 =?us-ascii?Q?MOe4pqyb/jSHfD66FXD9yTJ3WTGm5zCakUjMLfet0K8/3OLOrQnhG8kJXVYp?=
 =?us-ascii?Q?4IzY0psGMiRxLj0X8f6ty2iFyYIur3teGDI1hIio6xE+2Ky2vNPujfFcfiue?=
 =?us-ascii?Q?JS+lnPAlp5fGnGrCRtkjE7dIcc9jEQ2mWf2wCvGYJB3fGLPh2CIsK4Yo+0Vy?=
 =?us-ascii?Q?yJUmoQ2n+OkvoxkIGeECnC4PdVwtnoFiO69x7Jls/ngh3kJaoKFJOJbwPoSZ?=
 =?us-ascii?Q?bI7OYpCe2Fqerk8l/T2PS820BlIZsm9tLivRKGaBac+D17HWKjM6wJRuW/8I?=
 =?us-ascii?Q?9zEhu7/J5Frg0ak+bEx6cXIl5NrVEkSGwaRGzixmLDIl0MjYOmvbMNMFqr7W?=
 =?us-ascii?Q?7nz23NeHIp1UDTzqVFzXUUulSko6f2e5uJiCfipLROW4KqawX4V5mrncpwyR?=
 =?us-ascii?Q?fYMs+toWTN2rG9JS5uBYcuPdSxHA6GCDbrMCpvZNl4U/L9rYS6Znlt7P/ZLV?=
 =?us-ascii?Q?klEkoubVySuzEzbW0iD4EjiZAGgmvr82Pk5akiq5fWfwhR/uyEjpolJBa5s+?=
 =?us-ascii?Q?mEfgf0q0JwJzW3CLz5Im7xj85X4vHthhzVwhvDacXSmoKo7fnjPLhzIXojHG?=
 =?us-ascii?Q?yr9mwNXKFQ9AdKZiq7vJwo1+r685YTcXEkR3COtB4wKPIz2rHsj9UDMamY6i?=
 =?us-ascii?Q?/yvnxtmz3NI1MzIB/hv7jiK7kt8KS75H8BS3vPOvoLL3GmpWgOngxvAw2M4Q?=
 =?us-ascii?Q?+CrqFywTrG/oLlIL5qzMGaHinlTbSlyMl0dplxiri6X3rt5vaU2EZ0UEunqZ?=
 =?us-ascii?Q?miJ6Y0pAAL1O8xwv25xbMiicG7MHbxqPtUqG5IS63uPiADKPEpmH1AhDoC9Q?=
 =?us-ascii?Q?M4skBw1bSyCGpSRvcT8ezwmRYFFMmd96SVumZzaaDBejbHp2Th3Sl1djqHpg?=
 =?us-ascii?Q?VOLaMeBFm8hxYoOWKZLctyX7mkSOZ7O/JZFLWQ4EJX3a4nNxDDI9FHxaS5of?=
 =?us-ascii?Q?PIQQ21UVoCMj9+9LxLzM667h3aW5aCv/VVk6iVQRhHn2Vr+44rUSpau6fF37?=
 =?us-ascii?Q?L9TQ3+LiNDKVvC7cu6dxUFm4m343BA2kfSaatVXJsgIU5UN++sR01ZoSJIdj?=
 =?us-ascii?Q?F6n9pZSgSoljXaibFX4iNd2/vPiDdNLWlvLQVhdh1sopoE/W4eVB15zrRsZb?=
 =?us-ascii?Q?tt+T1RrhXtig0VDUohLc2hUKFqFA/llFe6l8deZR/7ueWxOLSnAXdtUfc9ur?=
 =?us-ascii?Q?Uv/oYM28j5QeWS9hVZcChOKdGFSzkC+Hlcynd4KBFgGi0SonqsyUQcr2IYX0?=
 =?us-ascii?Q?jeZX6YLAH4H96EmIURwE29S2+/HxhQyzTqcs54y5D+OXYmKjOw/1XArj2kJy?=
 =?us-ascii?Q?P6Cgl2wSaFzcV1qQKYKZGzc9DWllI+NZJdhUidaUwqqG7fSlHMaf3ysRA6SF?=
 =?us-ascii?Q?06jbyfdd8JR1JPI4h0vJfKTMalz3MDi5XxIOh8uEMR0h8gWNi542d/Mpk088?=
 =?us-ascii?Q?Y52nj43PqhVGHzIEz3QBW05XTkcuErF3xVKI2f/ezZEMZpda0WJCfxUawdcY?=
 =?us-ascii?Q?r6i4QgITY2VSCVX5vOE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:35.9267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050c7729-c8c0-44dd-7445-08de2c3652cb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF86F4A2197
X-Proofpoint-ORIG-GUID: AsRNB4uI2T0UoElgELaF-SUHwfyU-uH8
X-Proofpoint-GUID: AsRNB4uI2T0UoElgELaF-SUHwfyU-uH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX3qebDJXt6E3Y
 m4xk/MhayqT8ADE8EHsvnDLCj9JwDs8FdJLl2DmZcwm1Zx3X5Us70XhIxsRg2oGlg93rf6Rn1bF
 IhrrV7gBp94fwDlg5jR7C+0g/3nnTA/i8mlCwMegAErBX0xxdYEh4tpwEIsWfBeIGTxtAifSWg5
 f4w7Pvkjq9kreetdj1qVY8uCbuZJjXEyNlYU+y0OEge6b80Td3pkRFO0TJ4JdXU7A1VY5UT0X57
 MV1EFkhJ14rO1Ip+bUMO+1QHJzV1yaNoxawlgm32j9ZMOSMPgK1RZf/cVypgdR+FufeyDCCznKi
 b/oBXmTxL1+GZRUhJmjv5BzI1ggEbUR6/ZS3izNs9Z9gAsA6E1K69GItQVmnBgCoOf0prGAdQRF
 +eXUKNaTQVy3sgA+E7D64GRLzwcRgA==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925c985 cx=c_pps
 a=hSUXT6xmpWUQcPkODs04Ug==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2qmRqszdQiGn4CUastMA:9
X-Proofpoint-Spam-Reason: safe

Add basic system suspend support. Disable the IRQs and force runtime
suspend, during system suspend, because the device will likely fully
power down during suspend.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class.c          | 33 ++++++++++++++++++++++
 sound/soc/sdca/sdca_class_function.c | 41 ++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 349d32933ba85..438695291257e 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -238,6 +238,38 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	return 0;
 }
 
+static int class_suspend(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	disable_irq(drv->sdw->irq);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_resume(struct device *dev)
+{
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	enable_irq(drv->sdw->irq);
+
+	return 0;
+}
+
 static int class_runtime_suspend(struct device *dev)
 {
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
@@ -278,6 +310,7 @@ static int class_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops class_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
 	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
 };
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 416948cfb5cb9..dccd0e531cefb 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -33,6 +33,7 @@ struct class_function_drv {
 	struct sdca_class_drv *core;
 
 	struct sdca_function_data *function;
+	bool suspended;
 };
 
 static void class_function_regmap_lock(void *data)
@@ -417,6 +418,13 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
+	if (drv->suspended) {
+		sdca_irq_enable(drv->function, drv->core->irq_info, true);
+		sdca_irq_enable(drv->function, drv->core->irq_info, false);
+
+		drv->suspended = false;
+	}
+
 	ret = regcache_sync(drv->regmap);
 	if (ret) {
 		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
@@ -431,7 +439,40 @@ static int class_function_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int class_function_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	drv->suspended = true;
+
+	sdca_irq_disable(drv->function, drv->core->irq_info);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force suspend: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_function_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force resume: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct dev_pm_ops class_function_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(class_function_suspend, class_function_resume)
 	RUNTIME_PM_OPS(class_function_runtime_suspend,
 		       class_function_runtime_resume, NULL)
 };
-- 
2.47.3

