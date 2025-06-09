Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC62571B3
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472804; cv=fail; b=nnE/zyiTj5Q2x8RlYdfY71xtblhVRbQ1H1CrSe7WyBwuok1k3dyvBnnhk9drYctoJv2fdaibZtbTLdqj3SjXJof4KlS93nuMnNh2Rxxf6Yyn+UxUA73V2ntNS4ZP/Dt5AZAHU/py8OGZEcIbHqaCezvbQbGxbtVG9Z5FSeOax9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472804; c=relaxed/simple;
	bh=QgtDFPGN72uIJCinj60sC0cZbLGeJ+labuTqtiM3qjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMR4EUlSCrZ2OSQDTjSql7RAlfFy2H+OxWDK0a70EM6jdJiRFLmj1ipRfwoVH4PPxfe7K2FgqVFK5WoMljXXcKG07kquQkB5gcAIS08O8SaCzNoG8yCenuf22VRahlOI8E2jmmZWJ4+R1jpUWTs8oZO/Gr1WNLWZXdAu3ZsYgiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ILK+WWnA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a2g9whmV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ILK+WWnA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a2g9whmV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5595Rw06027950;
	Mon, 9 Jun 2025 07:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pdvLtR2rO61qP3yPF7Fi5QT9ukr8p8qIbNXu20Ft0IY=; b=
	ILK+WWnADHqN1uJOCNxB/BdAueKeCOBVxjVbnBDf/UTyAjyML72Ckrkh+CKsU15M
	h9d97vBCjwzF/4qjcYt+FNpdbCOrzllLCudlQqtlDOoUDGGGpf0LPKJGJSmR46Ur
	30Za8WSwQA8JntanID/bxhc3jY5bQtLMBoF96mvtktojSnvntBhLaqF5GZyOJV5g
	yp9a8y2MGH00+s95y/kpL/y/KP6e8Y+kutwCPq2Rb4B6ECoPm65yI0qi/CrHitIb
	fMICCCDxHpHw/hHo+laRpZMiPy8hruN2PATUllSEhXrSbPT6fVGbPLHTDU6BttYE
	xhc+I1lnirBQLk/PzsLg5w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10hn2211.outbound.protection.outlook.com [52.100.155.211])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1dt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeYXCWJSaAQ6DkIMa3+gqS1ojRqKgWmKjRa3Bp1tFoocDkStG/auhIYxTe7nB+/TXNYZD6ATS93TuBh+B8bzymWiC8RYJe7did9dkhH/3uyUkoIgPLAHgzIX3IdLhLbOg0UiYbbYr4+2gTqTGL9AUY/RFBe4U45fAuQsGq629chZSEsFXkUxDuNWyMwsxgxv3DKTCLEE6E+4KlyIK68juvdkp0J34M9fguDRDgeObDdIK5hxKG0S5XStAgAevEA1qFa/5L3lm5CfNq/5pA1bPu1gayvI0k20FJrl23fRfVdjm3ly10hnxK5CPZhrMCZa2QbkRl3QcbIB53gXvmMUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdvLtR2rO61qP3yPF7Fi5QT9ukr8p8qIbNXu20Ft0IY=;
 b=wG2a9C4JQ+FE3JBk2Ki+9lL+yTntFujb8+9qTr0YUecIm1Tc3X+8VnnXO5+YOC33AVdpd98PS5MmXSMXHJ0Gay0CD8VZ1KIjnNw65gemrO+F/t80Op6uPgtwsiT+NP8Er/73Ezt2SVVYxF/6Y4GHnUcTc2CJD6HtDMzp0pts+DiR5uyq67Hzzj/kINKJEp64kw1E1iWsZ9ZYsCDqvZTZ7EdSdXQe2qafUZ3tqRolYrvinP4wfIwFDWeJsIfnuPCpUM+5fBjLlE7ViZwxs8Caj2PA9vV78Q02sPw8Jb0gRBLydlG84B3jSI3N+wdLRlj8E/VVuRDmTdBsY/DZw2vFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdvLtR2rO61qP3yPF7Fi5QT9ukr8p8qIbNXu20Ft0IY=;
 b=a2g9whmVSECIbXuwykJbI0ZUlTK9jnhhxHWGeZ3asQ5rpX9KQWyntWaVXaBiMMcQs0B1GzDOt46VvdGVxYLSrecB87Fi3DFqTu7Q1UqLxcDC3UvMF08dhEgTMFB0IMa/+YLLV+a6uOi2j5ct+YfuksMqSWiVjtfzL4mavZSWypY=
Received: from BL1PR13CA0003.namprd13.prod.outlook.com (2603:10b6:208:256::8)
 by CH2PR19MB3750.namprd19.prod.outlook.com (2603:10b6:610:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Mon, 9 Jun
 2025 12:39:43 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::ec) by BL1PR13CA0003.outlook.office365.com
 (2603:10b6:208:256::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.16 via Frontend Transport; Mon,
 9 Jun 2025 12:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A313740654B;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7044C82025A;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/7] ASoC: SDCA: Fixup some kernel doc errors
Date: Mon,  9 Jun 2025 13:39:32 +0100
Message-Id: <20250609123936.292827-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|CH2PR19MB3750:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3653d18-6b25-4991-9e79-08dda752b54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|61400799027|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?puOEFmKtwSaPXZj3gvPfezQDU/PMococPk3hEbPJvKGZo2m6gSZb9b1+iW6Q?=
 =?us-ascii?Q?eyIBCKU/Gsr4SiWeipKk3lIJQJKuLVuhGFxqZHyaDykGbYZOKBGFGSldyCXo?=
 =?us-ascii?Q?ErJO3K33+2Aun6susPpo4SGk8OKU8pfWkZzkPX4sfO3eXNYk1TQ2jSLJB6CP?=
 =?us-ascii?Q?WYQpSnZ//WMugL9BiBeFfX+xP3JNRw2CiA7mRNdL9xCcntcW9R4AlALfvU/Y?=
 =?us-ascii?Q?H/keiroMUrzaYtanqTJJ9l/ITK47yZ0qIrmY1GJl7Wj8Xntcc5Mn/6rcQo0x?=
 =?us-ascii?Q?oEbw0mKDJPBb9TTwqNDphYgfZo2tv6+qUJBEMA56OTMxhU8AIytGjUUgaAj0?=
 =?us-ascii?Q?O2t29BZjSVMLEM2EfstS8mF2sp9bwCRNcc1T1bDYw3e6oLaQIhAnV0Ice6uf?=
 =?us-ascii?Q?ln3sEcVa1WyzbV8tSnDBISf6inQzCiBXtmzGCzVN5jbGx4YnjPzvN1Xn8C59?=
 =?us-ascii?Q?M9exeDyNjiXdfXu7RtCnhXmZeEwpM2XEHlN37TfVBtCFyKhdRidpZj7YnEB+?=
 =?us-ascii?Q?uqTDy6UCYcLuDgy7JwtTGR0SPFYY4lXVFXuP+ejXJ4gi5tD1oG1W8sol/xXu?=
 =?us-ascii?Q?DGLfN+mR0DX4PtuZYrJBy09Up7DZ5EMNxEU6UvBXN6BdotMvhcbG/oj++t2C?=
 =?us-ascii?Q?m5UcCitxeVdsBLWRU6B1NQt8CIOIYchnWUelBI+GDtqSVe2pk5MDy9ZWCWOG?=
 =?us-ascii?Q?y+mjjVPTDegYzzz2AfhATf7JhGxv8fAGZYfFVu/UydoOLJb2e6wIKt8s6Wdf?=
 =?us-ascii?Q?Krtm/afFx0W1xoNPKBONUR+R+5ISWjtnaTyeuS1LvdrwM0ZRz09cFvFU2280?=
 =?us-ascii?Q?kZeT/ykpGd3C9IRPMVXzJpO+VOe4bj8lev8XmWDKltWx5+szD+f11tXoMopN?=
 =?us-ascii?Q?OqBx1xhxtEeSPyUZyp5li2ONB/f8NjqBa6qoaitGOnlKz5NfICMbFbg1MSmU?=
 =?us-ascii?Q?djzKI2rxa4b1tCcMBKMmNBcDeevYAV9WaiXRSwucziPO2rfk6jYxAlTkBXPU?=
 =?us-ascii?Q?1Zqa42JoS3lOjJ83wF7ak96CB6UU8nIuBIatkeargFShCis6G+3wKIH5sLWE?=
 =?us-ascii?Q?twXTs8OZ/vukeCGRGxX2f5FkWgPQ636EaIFMgEqIiOCilLZMBGIQxhXa6KcA?=
 =?us-ascii?Q?m1VNpH3NbwipPcKWgaWgqQiSdB0njItA+3YhVBf7RXOJPPsHzamWT7UGOHB/?=
 =?us-ascii?Q?9Qx0dULYOD+LMU9kMzS4g0wXFh0MJ11EizKRGtjmtedO++kr2m4NAsZx//KL?=
 =?us-ascii?Q?FJR5F4tJ/z0q3RaCwsElev3bncXXqHU2X7G/m70OlRvUZsBK5E3An4wD0FU/?=
 =?us-ascii?Q?XxgGQKz85Z8tD+g2v5J/LqkPtT5nRQrm/Y72TuwljdYCn9XJMUVuoXpycTGm?=
 =?us-ascii?Q?6EMKC3m/+kZRr7JyNSVR0rrU9muvwepWCFh96LbgB6aFPUkAXJ8vIT8QJssy?=
 =?us-ascii?Q?oIoiCnOHItpAAlPQSSvkB4rRQxdPVvH/aibcosRbU+SPpphXTAOInhQdCTyq?=
 =?us-ascii?Q?1ixB1t6GdbJPfymrWR+cflYk0R26Ca3LWXHU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(61400799027)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:42.5317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3653d18-6b25-4991-9e79-08dda752b54d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3750
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846d616 cx=c_pps a=skXNj/QH3RHhSmVkRMfE5g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=JE3WF5roqhOJyUsBzO4A:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfXxw4xubsh/02a 67cTLZ8KxGeLJD7kxCwsvBZir7GoXmPUa29esNZLc/zgE00Q+8S2JfkYEXaRlP73HK8hZgOaUT2 dcWsSte6sX7q2XX/v/M+0MdmaIMt0KVWLpPqMD/USGu26VJ3SEHmhz0E2XSoV3+9IXvtP3Aa26v
 1SOka7ZIGGnEacjkWMPeM9vTQ4D9+0Hz0fFImQXIHrgc5rLXJE+8ri5MWeVfum8ip+dzgkS0GBq uZcDYwCvSRBG3VofoZ0U8F9G6UcxVdsQUbFqigYYby+1J6HeZAJPTXuI4ROPJVpXN0Bhtv5PWg/ Z0Xzg2Z7n3yD8tdeUUhfiTltc0Frb2jC4IePDMVL1vEB8Xc4hZInl501TBaYBc6vOZIuAKoS5lH
 N3BLc+355U5e85eIqNEHrzrXvQ38sWflB4kxXYPqgMsSSVIB//V7ixVItmlRs/Y3ozHZ6js6
X-Proofpoint-ORIG-GUID: 1o7v-76Rmbwm7LOV1qml4DRNjUdVDEnp
X-Proofpoint-GUID: 1o7v-76Rmbwm7LOV1qml4DRNjUdVDEnp
X-Proofpoint-Spam-Reason: safe

Correct some typos and omissions in the kernel doc for the ASoC SDCA
code.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e96e696cb1079..83911dab73ae2 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -93,6 +93,7 @@ static bool readonly_control(struct sdca_control *control)
 
 /**
  * sdca_asoc_count_component - count the various component parts
+ * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
  * @num_widgets: Output integer pointer, will be filled with the
  * required number of DAPM widgets for the Function.
@@ -997,7 +998,7 @@ static int populate_pin_switch(struct device *dev,
  * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @route: Array of ALSA controls to be populated.
+ * @kctl: Array of ALSA controls to be populated.
  *
  * This function populates an array of ALSA controls from the DisCo
  * information for a particular SDCA Function. Typically,
@@ -1244,7 +1245,11 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @copmonent_drv: Pointer to the component driver to be populated.
+ * @component_drv: Pointer to the component driver to be populated.
+ * @dai_drv: Pointer to the DAI driver array to be allocated and populated.
+ * @num_dai_drv: Pointer to integer that will be populated with the number of
+ * DAI drivers.
+ * @ops: DAI ops pointer that will be used for each DAI driver.
  *
  * This function populates a snd_soc_component_driver structure based
  * on the DisCo information for a particular SDCA Function. It does
-- 
2.39.5

