Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C4175D53
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917160; cv=fail; b=MxHIBL5ZMtNa8JOPNps5Ip8/yFC5tbxsVm92HSv5HQ3TX1SDdHnDBTNQnCpI5cf0ytXV76PUx1QCBVcUHlMt4zrngptIm3mBXIHDyS5DoL6q1/pGSIYZQi2D3uZkgohbJdEUujodlNo4ilITAmvHCpwM2loBWPDdBVFgdEzS2y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917160; c=relaxed/simple;
	bh=CGUqs+Z5DC9P+LRlI9+tkYITBIeiGx2HcZVNNx2rP3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTYlRW0Lqk3xETQn0aZuiAGQ5exc/Nyv0MqAO8fC+voiwSPguafl1CEJ2fRx2ZS++kVaBJ1WObgJoPxrz+HCJ7Qvy78UoaqbSRJycfRm6WLItSnGuCCIjklKFETSyw2xR17ZGhjwa5OQHLsy5McUhWbtZSIj4RiOdj/UTnUWF+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XWcyBMPZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UEEDDNWk; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XWcyBMPZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UEEDDNWk"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5mCZ7027191;
	Tue, 29 Apr 2025 03:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FWNDrEnIVmtgu1O3g9gBFuqZwMmRoUIev9Qqr832NP8=; b=
	XWcyBMPZIP3r/LjrYcmiWfzGzbFdY4gg9n55+RuqvMFweWjSVs0FGfh9xKOVM38K
	3/ujU7zRSwk4UXoFccVCNqJKjKAJaCQiqQW98j68+oAtrCVqukmo2Ah4hhfCE5G8
	VYV927FW62tUi16Zb5lVW+Rf3z1LvvHHsrqKhvRejg6V1zTY8VxlGb6U/o9BT1xd
	7qqHiIPqUZp7ZqY1lzjd80mAQKD/Af6Jx+mvOo2wFM/WJE6JIujRs3hEDBiAqISo
	L9Rd/2biX5mzOMUcv0KtVjALxg8QmBtOi4TghGkvIHO/oPpHLzQrQNh+nZH5T+G9
	FPV0FL6nTLRFH48ABCkm0g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cgtsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 03:59:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shtEgN+U/od0gdhIk3iWO9DeQQjHhlceGghwEz0UpQeCDa/H8nmS0JrVFilxSDyPWfGrI4iGMMC0HhZgMClQZ9JCDPZolcPGV8ptdQ0bXBlrfiiffCzI97vYI7MPfxZ0BpAvGDoY39UCQVIMSfSSI91CM66PXRcBrNENhoiNzI+c7R2U5UJSUswbcrBV7OPmNT5y6HJig4Liuw82B9CRrbXfEh+5naXhorHazvhsdxquj4AMaQHWSDUQV891Sz+r25dWjaFUrTAbd5+AojiVXMCxegRVwlCixoaV2BjEvoYr2eH7GUn3msSlwGeNyHOOCZYn+tkjCpxClHRxwGat6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWNDrEnIVmtgu1O3g9gBFuqZwMmRoUIev9Qqr832NP8=;
 b=jFH+tQcSPEdSaMdswd4Rmr3/nFmEgu4C6vAes6Ri5KMecIT/WEKANUOPmIN4dj2nTumJ7HMN3aSh1x8KRneRBldl+XIDDGvlwdcHiEqCwENMey5HQseM1Sc53GopqBo4/K+jWXg5jFbO0mdEjvW1QuDjc0ZzFxf1z2nS1pUlFn2GGFfkxceO4FF/cu0HuvW6oWV09gkC65FDZQQJB5dyjOYsSBEDIxr42gI6R0Lz4QVpy+YQqbkQ8zQtzrqwofHZQAYoGjp1jg5fuJegYYgo6GnTbFJWaePP+6zxseIHlXcdMYKIZKlf4ci3V74iKId/Br4p4yy6Xq369Eveyo+l0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWNDrEnIVmtgu1O3g9gBFuqZwMmRoUIev9Qqr832NP8=;
 b=UEEDDNWkBnfUdoCo1rvSarkBWWd9PQ1MYVTDDSu5D1IkZXchU1MitB9fT4v55o9R9Nd8INRp4VTnMhLAGsZPjsYiLmZKMpkF6DCA8Szsj7xIXQv6dCInzP2WthrU2BP5wCrLQutALVHDhQlCsbC/eDLiMOyk7PhK70JL1JaL2jo=
Received: from BL1PR13CA0109.namprd13.prod.outlook.com (2603:10b6:208:2b9::24)
 by DS7PR19MB6279.namprd19.prod.outlook.com (2603:10b6:8:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 08:58:56 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::e7) by BL1PR13CA0109.outlook.office365.com
 (2603:10b6:208:2b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.12 via Frontend Transport; Tue,
 29 Apr 2025 08:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 08:58:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BAFD540654E;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A351782026B;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 4/5] ASoC: SDCA: Create ALSA controls from DisCo
Date: Tue, 29 Apr 2025 09:58:52 +0100
Message-Id: <20250429085853.258038-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
References: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS7PR19MB6279:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ceee06a1-0868-411e-d7ad-08dd86fc1245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ELv5QUYEArU35yo1EacESSiJ4pwP/gWjJcSAFn/awB6LixELaJcVmId6Oi44?=
 =?us-ascii?Q?x65Zg0fJM+ZKfYhDd7hPfWRm/pgLnjEVaSFMzMRXniBnWHJZcuAhjUk/c3UC?=
 =?us-ascii?Q?bRa3lT0xolTncMqspdJ41Jl2N5akj2Qn4zJoRc+kdO0QbCbASvxkLT2DxHAc?=
 =?us-ascii?Q?DZBvSj74bMv6cTGvZJlUB7XXL1dBoMSou8fxANgZyhLYAQ3E/F6PflwzVmCg?=
 =?us-ascii?Q?JzGFA5qnEIOF3QuuBbrAY5OWqWo3DFT3SkG/WC/pWm8jcXdHBtsshUeiS9pv?=
 =?us-ascii?Q?dAKjiaFkALOVWid60tS9RB0kcAARZMsRLy5cs5AlveqgulsfCx5q0adVDdsS?=
 =?us-ascii?Q?3N1/5VkYdF0zSJdyVkEFjYwMYLpQU2foxB9LLFRAKt2xUsSgLjMlep6+GKTk?=
 =?us-ascii?Q?HWTh+vn8aUDol10FMGmMYktZ+VReTBNAKeQykeD8FyWqghwyjZduxg4wuVy4?=
 =?us-ascii?Q?dpLZtqAhq1GsETmPEnb696TTQJFJ2tlkIQbvepza9VQpsJJpNSbsIzE2DiC7?=
 =?us-ascii?Q?M0YoGi/Mi6vPFJZJe4kE2F+GbdGFfvvir2iU7buph+qR1jdZ89d/ecUCmE7f?=
 =?us-ascii?Q?BgbzFRMwILgZMza0rBSbuAxzz8KoRUst9o+GcG5XP+D3NZ4rQVDMU+SXQ6Hb?=
 =?us-ascii?Q?KIv6sQ5BYu+zIC1nl+sDM7+kMKZY7lrrj8wVWCVInUVM8hcx1/vOTpyzTGxu?=
 =?us-ascii?Q?pMaC46nYcA5Wp/WcNNmSdGslexu9Yq+jbw4JJXJ/KLJ7jS/hewROYPE9KgSO?=
 =?us-ascii?Q?VbEEWyhyCkAgkmXL2EJ6oIooGnYDJ4crVKEhTr+cNpAEdjv+JP5AMkPJEkpa?=
 =?us-ascii?Q?2Up59zFnyhQAv/lYGylcLWuafxToUOiz7t+HUmtILuVUxQslv/g/RO6cPNsr?=
 =?us-ascii?Q?+f3gl/0E8iZkMDgJksjlJTCE0H+mNt9HjmHD2nB1bafnjwnHTINFcCJyHkqs?=
 =?us-ascii?Q?XuHsBZui95xkNQ6OVOCA5keLOkdim/5dOo9Yx5lgfXWn4WRHRpYRZi0QRmKk?=
 =?us-ascii?Q?vG6ITTv0iPnDmw5En8HdEqlO5+XlztctAZp7V+Fsq98hlXuxE5gUVxipsNdx?=
 =?us-ascii?Q?esBcg8KJsLMgvTYxFVWy+f53K215ja1E0+LbbjBnfj8GDjK1qnTkIUNOgzLU?=
 =?us-ascii?Q?ZIuw1si2RG48iSe/yDDjCYf+qWZsk5CVpN4uNZvc6+zNKvV1j8Qxeh6i/Cia?=
 =?us-ascii?Q?52woOKzg1/c8DEFbW/AtXjPlE08BHACMqJ0anIf/op2vMS6IHo/nmPdaU3VU?=
 =?us-ascii?Q?DT/B2jI1YwThSljevBhIaJFtKIA6PhXQ74TDqf0rLveS5ybeDsir9IajM238?=
 =?us-ascii?Q?lxbeA25bojj5GDTzWz0JiMRMux8Txkg8zDr6wpdG2kLMdollG+PwCjgvnyj4?=
 =?us-ascii?Q?hsCHD/LEqJX0NRsvKogAX90DE73n6ZGHwVrmyEZmnWWfrTbhKSgH9AawwwEE?=
 =?us-ascii?Q?CyTI+EArkKou68lP/mlbB+X7MREzh6/GJpkfLrifan7cIj1lcE72b4EGjfTp?=
 =?us-ascii?Q?2zYWWhPyU+QMx+NMv5evP97H4l9g/7wrQUSs?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:58:55.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceee06a1-0868-411e-d7ad-08dd86fc1245
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6279
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfXyNTh1eTBiMG3 jbJHyH/3xDCjKFVTgGFYU22mcNFoTSna/IuF3OCeQmC8LLDu4DRvnfC0dFNxNzHDHcCPEhANeRC dqmvQKmlFX3YmpAVqUXSaT0h6tNHmuXTXpXWEGEJnqGuwyGIiH/0ltHHV5UmRUeRInLZiU4RCHq
 lNtFLj9AG6/GQ+4xWWWGOjkCwK2EPJGA1G57l8JYBfV0NK96n92RkasqrAHb6QrF8qrzi5gmiTx gv5aX7qeUoZC9M0RPBkhO3VQe9mE717C2UrxLVzIyIVC1uaoi2/PZHlYc8IHwzCkitNa9kZB03P WdnKzNcULoD9mw7bV0UAi0CKaj6t3to4++g9+7Laa+NqDqUv/d7wJk5AkC5ps9SXhtMCcWxe5pC
 abfC9wVtV6qZsTPCdMv8d6ojeHBvevRFRCbR2FG5qYUezlWuhjvt5LB0qBdOdzl7eqxLv7Cx
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=681094d5 cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=-luNUMnvTHZ5DhWRc50A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: CB6zoUQ14pxgHigwcgtREQbeeBtU7l9z
X-Proofpoint-ORIG-GUID: CB6zoUQ14pxgHigwcgtREQbeeBtU7l9z
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

Changes since v3:
 - Add pin switch controls for non-dataport terminals

 include/sound/sdca_asoc.h     |   6 +-
 include/sound/sdca_function.h |  10 ++
 sound/soc/sdca/sdca_asoc.c    | 241 +++++++++++++++++++++++++++++++++-
 3 files changed, 252 insertions(+), 5 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 414d461b6fc4..d19e7e969283 100644
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
index 83fedc39cf71..77ffb1f4e1ca 100644
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
index d8ba90e2ff20..9c7c0737a347 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -21,6 +21,7 @@
 #include <sound/soc.h>
 #include <sound/soc-component.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 static struct sdca_control *selector_find_control(struct sdca_entity *entity,
 						  const int sel)
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
@@ -800,6 +820,207 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
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
@@ -818,10 +1039,12 @@ int sdca_asoc_populate_component(struct device *dev,
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
 
@@ -833,14 +1056,24 @@ int sdca_asoc_populate_component(struct device *dev,
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

