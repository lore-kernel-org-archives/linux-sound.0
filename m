Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B3383A5
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053789; cv=fail; b=Tjp9ncODnA3xS+IAcGL9aoKHFFoVoigkoiubnHDJR0eYP/GlTd2eNUGpI7AIAj+LAUtQyqX/+sr9s+bljfy3pBOM3+ekcSWUaXcnB0cOrdbYX/9Ct/Oc6dH3zuxE6WqOQRnHXQzgjIwgZzsAAhLPWovgZ5eqZc7WEsz0rrt5KmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053789; c=relaxed/simple;
	bh=ybjlwAqfbnz1VuwKk8gLONIRakUAkwHvrYahLZr6Kns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNxYoWlr5+AiUtoGZuzx9F0uGBKocqPyiCbUNiofEUM83qAshDxqb5ON5MpZF8oj1uE7nzaSAUmmey5RW9wgF0EjvwgKMo3WGoIFaNlZ7nRzVmZK2KjjV7mAdomvW0Fg0mxdFdtzbiai0sn4JFzgj/Oaq9m/HbRVeoTZGFtSqjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q4fpuI1g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A5tlE4rw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q4fpuI1g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A5tlE4rw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C3hS9O021703;
	Mon, 12 May 2025 07:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3yUvGNEdSS61tSP/8ieAuH40ZLa9V2B64sw4jB38U+E=; b=
	q4fpuI1g2NH0ULrYRBHhkUuJzCosXlogW8IQneZ9mHkjZFjsJxe4v0z76gVar+HZ
	4RUWSfJAqvYMWe+Usm8o32aJE/Qt+Kp8rtZn8ZLIPxeGIF3CWIZWrcmPXVmYSjUF
	Oqgyfbae5sr5oSVA1owNXYtuv2+elscD6lu6mSeuZweE74abljZTnkvTM+82Vo0R
	FXN6Dy0/I4Gus1EQ9KySV+jj4usk3xnpUGL/8AEfzj9YoWDDF87UqBG5LQUilHrg
	3zv5Y2Cs/wlNV7gQOpNsZMr08ow7lQasa6WOSYG6Ekc6H1nClxTepKbN0M4SJGyF
	Hc33jJAbaOdkJdeasvpEqQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46j471a6td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:42:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLdamqrHaKA9l/UM1SsdRunoTrprmeYSDxi9keqz9S9rSnLBjUHOuBHObc0BYuc50PYtRnNaqQht/nZWbVUrtGBdT+r4jhQCXXFg3BYaokUteital4dU0Uk2KQZMeoTDrqR9DA88c9Ot4quEGiimW8Ej/32zMFPoRtqJeu7hQihTR1g61jMpJKSYt5IvmwTOxahHqGFnLX/aoZOeZJf2tphDevnOvlcu5wcEhfWWtbrEYn5xlm+QXIoZjzjhC1NF466SBhzJG6/ea1DABEXOWO6cqroVjMfanpNxpDycH6TglzLBA7Z1LD3SbNfPM28kJweTUz1oPPNW/2wtPkCFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yUvGNEdSS61tSP/8ieAuH40ZLa9V2B64sw4jB38U+E=;
 b=aUCoIkg427YQ0gN7hSsaLAjo0BaYqVVLhj3YilFVm8HxJ8L7eBVsoJRqm4cOHJ6a+WXYfB2sd+Ggt+exzQniRxwQZo3OWt2yyt9uKLaZAaj/+V9gAK2bwpj1FLZqMyxV1r3chcWKKUEAgh6V3RsoQ16v4MebuGF18URNR043aKt4dy2ue0H9qI5Zqcd2R230414YpRAfHvTj0kfopan/8QtqwqWZzjqgJu90DRWfaXwUq5qksskKN/tEJRDHHBygLOJg28Tdoz+vRPr/sYsONIjwFVWK2o5mzIGjht1FsyCMdunk1xlTKCHwZN8w0FXa7hkQ+T0s/TrxZnxrZ1fuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yUvGNEdSS61tSP/8ieAuH40ZLa9V2B64sw4jB38U+E=;
 b=A5tlE4rwcjz+VJoGWIm4BO2sEC5fVD2lJ9h3scWCIZbWkvN6I+n7oJJ9NiqMNnTqlWxcsoyxMy91DcvcgoJ31IC4Ifk9MjLK7TpqFU0osihR55bYD8Z3xdLpSGKzE6fEzh/FI4ajpGxfKqUDAt4R0n983G4mQIAkgaVjK0NytA0=
Received: from MN2PR22CA0020.namprd22.prod.outlook.com (2603:10b6:208:238::25)
 by BL3PR19MB5260.namprd19.prod.outlook.com (2603:10b6:208:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 12:42:44 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::88) by MN2PR22CA0020.outlook.office365.com
 (2603:10b6:208:238::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 12:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 12:42:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 14334406550;
	Mon, 12 May 2025 12:42:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 08243820248;
	Mon, 12 May 2025 12:42:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
Date: Mon, 12 May 2025 13:42:39 +0100
Message-Id: <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|BL3PR19MB5260:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d440e608-7098-49db-7fb9-08dd91527d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q05KQhQXbOKtgvUlS975IZezEVr2RAOx5HTg5qYbUHcIULdl3nrJCjrspwtB?=
 =?us-ascii?Q?9bAwStf0wqrrOH86fIUfvE7BeVzILbbMl/GjpsFLALmfPt4T8/iDg8W9wsEO?=
 =?us-ascii?Q?hyRA0KvjfogTg9eCjWeMDYCm59okGJgD8oZi0PjDg/+m5vAdD1l+smPpC8O1?=
 =?us-ascii?Q?f0VO6NSR4c+lUhWihgToQ41DFL4nlFUvFmE4nCi9Vf95V1wSqvL6hHToK/56?=
 =?us-ascii?Q?YFkjzVpusTRIhIglS0Hopzd6jLqPsk5yTQVIwBuV16XWur0jDUh54xMmgSJF?=
 =?us-ascii?Q?WeWseXq5ewCl0iu3IFhiSXsmOMzi0EqDKV5Wuy2Bjwiho9j/zogyMmpmbsYe?=
 =?us-ascii?Q?0mxis5gdnVg7FaFaqDqaUl04OIKkli/uYRg8vmZ91p7/54osp9jqEGZ1IRVS?=
 =?us-ascii?Q?5Ezc4zLhE3H+03eFMf3vsBkK0+sEEIBaIqFwBMeW6F8miqQHB4qVjI+tV+rV?=
 =?us-ascii?Q?KBt/Dln4LZggjFAjKd7dL3M3zgAiNDu3rM0lMwxu2Iix3RRfBNSBenEJ4qIH?=
 =?us-ascii?Q?8JUT30+Hf7Z+CtjfNhl7YdPio42EYIUhbp16XSQtbtMZ5n8/xHg3zcJ42HII?=
 =?us-ascii?Q?0+LCwpIw84d+8n6n0ZPa1J7KLx8gfJAPp4NxIGe5RIDrIHGhEM/b/YuWHJAq?=
 =?us-ascii?Q?+25JWhROTL3Xe7kblNuV/aSULB/zCf0HjM8OgHEIPOvaJLgAMmYPBK32/UWK?=
 =?us-ascii?Q?UZJLpXmEdOWi0/jeHhzPJIRiWmcDGN5NVdOedjd6Qu1APV84CSyFMM1p3lk1?=
 =?us-ascii?Q?crMJk9mDS/2yCqrOTM2HWj17B6Uyhw0/59hR36o6Yxo2xzv7D1NEsSHyUk3j?=
 =?us-ascii?Q?N+ecm2ZUJdo/TZCTUQk2qh7MiSzTlefHlKfMSL36lSc4Ko2v9w4M1RCyoG85?=
 =?us-ascii?Q?YZ1WG4JOuvpjxllmQiaLBGVW8t1Ap2CvG6rnV94XsUqOvSxaqVM1/6n5NJK2?=
 =?us-ascii?Q?+9DYP1CXTU4YUShNZye+e5JODWwhf80HjOYccAsynxdCFo+ENlqvTfiHcNCG?=
 =?us-ascii?Q?O+Ft5c52KSsS5DCV5CBN/o0r988kLz4rUh9/Sv7AXk8D1GBteVedf1S6XJUk?=
 =?us-ascii?Q?6tEny9a4lCYPzjQBMme7cTRgpph+8cs8B5LBuFUz8apJ/Q8gjtKJEAht+aZw?=
 =?us-ascii?Q?jvJrki9tKlqGGmUt5tB5aUH8F/z05tIHQLYIBR1zAnp92hVrP1yMRhJf7q7z?=
 =?us-ascii?Q?1bhFopmGQYxiIPsZ7FZLDK+sIF/47WlCOjIlHfUA4KtgkRld65175WyGivW0?=
 =?us-ascii?Q?FVpPUaK1vqROhcU+/8jwetHHndlnsljLLZARN0SOr/h6ub5wAh/CcSjQGrYR?=
 =?us-ascii?Q?mW1fQb5MEHgEIkBR+oUx5lmbHaQccVa4utFoqJcc5CAmhGt2evVBR3o9EhNf?=
 =?us-ascii?Q?5IvQqoJqaGMCGVyjbmoVD7wGsYkxSYX7aZzXw9jyGinCGVl+a9D3D9jwUbAs?=
 =?us-ascii?Q?J95wf9fY3q/L7UEzDZUNN9P3a1OcFl02B4mDIIfeoMFh+acQRUnzMtgpqGwi?=
 =?us-ascii?Q?04rN/5G5fUiYHUrEdEN0z2GDIvT+bqHvKhvY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:42:43.4970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d440e608-7098-49db-7fb9-08dd91527d99
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB5260
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=6821ecc8 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=-luNUMnvTHZ5DhWRc50A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: rDgbrX2Gf5euzNSfhA5dyXPSlflRv-ma
X-Proofpoint-GUID: rDgbrX2Gf5euzNSfhA5dyXPSlflRv-ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzMiBTYWx0ZWRfXxE+kPfzeuggD Cg0UXCyt2FCfhGA4hybT7YLIFLvydL5aIEgPIsa9sScvOBDRRn66McmrqWCLzFENDKSgXkGSNY0 T9XPQ8EaFtY+SzDIaf+UfAWYW2C2MHPLcXsbYWpobUxfaltrcqQHzjZc1fcxuT3iXthKvmlD9er
 92oP6lKezgrzVLNG0v6EquJle/V+BqLRLYYvPTJefA2oGxc83ybsGuXY5Vz7NNU4zGm8y2Uf3Zh o3j+k/UevB7263gvhVCYFcWFypFWOPXayAn3FutPasoTiyclU96tTdDEyh2b+cMfxkSmxBr4FZP 9LW3YwI0FTOovDK+9ASJ0UmImOStb3Ebbz+FXXNzAUryAoHAEs8ETdDR0r6L0qWhSHWEghcg6He
 W+854XsC4GekKwxceNeAAZy4/9wBPpl2sdzNfGoTrxXaV6Dwf4ddVS1dfF3gmHg7NWH3HTkT
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the
ALSA controls required by an SDCA Function. This maps all User and
Application level SDCA Controls to ALSA controls. Typically controls
marked with those access levels are just volumes and mutes.

SDCA defines volume controls as an integer in 1/256ths of a dB and
then provides a mechanism to specify what values are valid (range
templates). Currently only a simple case of a single linear volume
range with a power of 2 step size is supported. This allows the code
to expose the volume control using a simple shift. This will need
expanded in the future, to support more complex ranges and probably
also some additional control types but this should be sufficient to
for a first pass.

For non-dataport terminal widgets also add a pin switch to allow
that endpoint to be turned on/off.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

 include/sound/sdca_asoc.h     |   6 +-
 include/sound/sdca_function.h |  10 ++
 sound/soc/sdca/sdca_asoc.c    | 241 +++++++++++++++++++++++++++++++++-
 3 files changed, 252 insertions(+), 5 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 414d461b6fc4a..d19e7e969283a 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,16 +12,20 @@
 
 struct device;
 struct sdca_function_data;
+struct snd_kcontrol_new;
 struct snd_soc_component_driver;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes);
+			      int *num_widgets, int *num_routes, int *num_controls);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
 			    struct snd_soc_dapm_route *routes);
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 83fedc39cf714..77ffb1f4e1ca9 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -206,6 +206,16 @@ enum sdca_fu_controls {
 	SDCA_CTL_FU_LATENCY				= 0x10,
 };
 
+/**
+ * enum sdca_volume_range - Column definitions for Q7.8dB volumes/gains
+ */
+enum sdca_volume_range {
+	SDCA_VOLUME_LINEAR_MIN				= 0,
+	SDCA_VOLUME_LINEAR_MAX				= 1,
+	SDCA_VOLUME_LINEAR_STEP				= 2,
+	SDCA_VOLUME_LINEAR_NCOLS			= 3,
+};
+
 /**
  * enum sdca_xu_controls - SDCA Controls for Extension Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a0c1eb99e97b4..e3debfe55eb04 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -21,6 +21,7 @@
 #include <sound/soc.h>
 #include <sound/soc-component.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 static struct sdca_control *selector_find_control(struct device *dev,
 						  struct sdca_entity *entity,
@@ -69,6 +70,16 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
 	return control_find_range(dev, entity, control, cols, rows);
 }
 
+static bool exported_control(struct sdca_control *control)
+{
+	/* No need to export control for something that only has one value */
+	if (control->has_fixed)
+		return false;
+
+	return control->layers & (SDCA_ACCESS_LAYER_USER |
+				  SDCA_ACCESS_LAYER_APPLICATION);
+}
+
 /**
  * sdca_asoc_count_component - count the various component parts
  * @function: Pointer to the Function information.
@@ -76,6 +87,8 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * required number of DAPM widgets for the Function.
  * @num_routes: Output integer pointer, will be filled with the
  * required number of DAPM routes for the Function.
+ * @num_controls: Output integer pointer, will be filled with the
+ * required number of ALSA controls for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -84,12 +97,13 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes)
+			      int *num_widgets, int *num_routes, int *num_controls)
 {
-	int i;
+	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
+	*num_controls = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -99,6 +113,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_OT:
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
+			*num_controls += !entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -111,6 +126,11 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 
 		if (entity->group)
 			(*num_routes)++;
+
+		for (j = 0; j < entity->num_controls; j++) {
+			if (exported_control(&entity->controls[j]))
+				(*num_controls)++;
+		}
 	}
 
 	return 0;
@@ -792,6 +812,207 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
 
+static int control_limit_kctl(struct device *dev,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control,
+			      struct snd_kcontrol_new *kctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct sdca_control_range *range;
+	int min, max, step;
+	unsigned int *tlv;
+	int shift;
+
+	if (control->type != SDCA_CTL_DATATYPE_Q7P8DB)
+		return 0;
+
+	/*
+	 * FIXME: For now only handle the simple case of a single linear range
+	 */
+	range = control_find_range(dev, entity, control, SDCA_VOLUME_LINEAR_NCOLS, 1);
+	if (!range)
+		return -EINVAL;
+
+	min = sdca_range(range, SDCA_VOLUME_LINEAR_MIN, 0);
+	max = sdca_range(range, SDCA_VOLUME_LINEAR_MAX, 0);
+	step = sdca_range(range, SDCA_VOLUME_LINEAR_STEP, 0);
+
+	min = sign_extend32(min, control->nbits - 1);
+	max = sign_extend32(max, control->nbits - 1);
+
+	/*
+	 * FIXME: Only support power of 2 step sizes as this can be supported
+	 * by a simple shift.
+	 */
+	if (hweight32(step) != 1) {
+		dev_err(dev, "%s: %s: currently unsupported step size\n",
+			entity->label, control->label);
+		return -EINVAL;
+	}
+
+	/*
+	 * The SDCA volumes are in steps of 1/256th of a dB, a step down of
+	 * 64 (shift of 6) gives 1/4dB. 1/4dB is the smallest unit that is also
+	 * representable in the ALSA TLVs which are in 1/100ths of a dB.
+	 */
+	shift = max(ffs(step) - 1, 6);
+
+	tlv = devm_kcalloc(dev, 4, sizeof(*tlv), GFP_KERNEL);
+	if (!tlv)
+		return -ENOMEM;
+
+	tlv[0] = SNDRV_CTL_TLVT_DB_SCALE;
+	tlv[1] = 2 * sizeof(*tlv);
+	tlv[2] = (min * 100) >> 8;
+	tlv[3] = ((1 << shift) * 100) >> 8;
+
+	mc->min = min >> shift;
+	mc->max = max >> shift;
+	mc->shift = shift;
+	mc->rshift = shift;
+	mc->sign_bit = 15 - shift;
+
+	kctl->access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE;
+	kctl->tlv.p = tlv;
+
+	return 0;
+}
+
+static int populate_control(struct device *dev,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control,
+			    struct snd_kcontrol_new **kctl)
+{
+	const char *control_suffix = "";
+	const char *control_name;
+	struct soc_mixer_control *mc;
+	int index = 0;
+	int ret;
+	int cn;
+
+	if (!exported_control(control))
+		return 0;
+
+	if (control->type == SDCA_CTL_DATATYPE_ONEBIT)
+		control_suffix = " Switch";
+
+	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s%s", entity->label,
+				      control->label, control_suffix);
+	if (!control_name)
+		return -ENOMEM;
+
+	mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
+	if (!mc)
+		return -ENOMEM;
+
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		switch (index++) {
+		case 0:
+			mc->reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+					       control->sel, cn);
+			mc->rreg = mc->reg;
+			break;
+		case 1:
+			mc->rreg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+						control->sel, cn);
+			break;
+		default:
+			dev_err(dev, "%s: %s: only mono/stereo controls supported\n",
+				entity->label, control->label);
+			return -EINVAL;
+		}
+	}
+
+	mc->min = 0;
+	mc->max = (0x1ull << control->nbits) - 1;
+
+	(*kctl)->name = control_name;
+	(*kctl)->private_value = (unsigned long)mc;
+	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	(*kctl)->info = snd_soc_info_volsw;
+	(*kctl)->get = snd_soc_get_volsw;
+	(*kctl)->put = snd_soc_put_volsw;
+
+	ret = control_limit_kctl(dev, entity, control, *kctl);
+	if (ret)
+		return ret;
+
+	(*kctl)++;
+
+	return 0;
+}
+
+static int populate_pin_switch(struct device *dev,
+			       struct sdca_entity *entity,
+			       struct snd_kcontrol_new **kctl)
+{
+	const char *control_name;
+
+	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s Switch", entity->label);
+	if (!control_name)
+		return -ENOMEM;
+
+	(*kctl)->name = control_name;
+	(*kctl)->private_value = (unsigned long)entity->label;
+	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	(*kctl)->info = snd_soc_dapm_info_pin_switch;
+	(*kctl)->get = snd_soc_dapm_get_component_pin_switch;
+	(*kctl)->put = snd_soc_dapm_put_component_pin_switch;
+	(*kctl)++;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @route: Array of ALSA controls to be populated.
+ *
+ * This function populates an array of ALSA controls from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+		case SDCA_ENTITY_TYPE_OT:
+			if (!entity->iot.is_dataport) {
+				ret = populate_pin_switch(dev, entity, &kctl);
+				if (ret)
+					return ret;
+			}
+			break;
+		default:
+			break;
+		}
+
+		for (j = 0; j < entity->num_controls; j++) {
+			ret = populate_control(dev, function, entity,
+					       &entity->controls[j], &kctl);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -810,10 +1031,12 @@ int sdca_asoc_populate_component(struct device *dev,
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
-	int num_widgets, num_routes;
+	struct snd_kcontrol_new *controls;
+	int num_widgets, num_routes, num_controls;
 	int ret;
 
-	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes);
+	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
+					&num_controls);
 	if (ret)
 		return ret;
 
@@ -825,14 +1048,24 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!routes)
 		return -ENOMEM;
 
+	controls = devm_kcalloc(dev, num_controls, sizeof(*controls), GFP_KERNEL);
+	if (!controls)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_controls(dev, function, controls);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
 	component_drv->num_dapm_routes = num_routes;
+	component_drv->controls = controls;
+	component_drv->num_controls = num_controls;
 
 	return 0;
 }
-- 
2.39.5

