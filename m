Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B328C851
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892156; cv=fail; b=RPxy0afixlzrWDpPEOJlCly7e3QQgqm0THJrsQImOy+HXbHlEBUeNKvL9rOkNm/YGoR0hL7TyhlHhkIoFgkYJfm5qbpckygUbSPNeXBGQipJIRiNRF9223R0bbUEKLvlw3A8MzTXhdBIfCnmgpMKlfQlodl1OHsEDMvhMItba+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892156; c=relaxed/simple;
	bh=qXv1pNGwTA0dKhq1BUDYJae8tL4o3b0dIUnaZFyrUQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eaj4gzhTZy5AniNaXlg83FJiIY4jwsToKmGnz7i3Ire1nHtTCM2va5gsb/QScQ50Rqj1EDI8HVn2o+2nSV6Vk67/DNaZXCUEDAqjyDBMcdbgO2mRbMhNpEBHZAgN6jp/6dTxOGKuCTUOpXddZBv4W23aIydgiMZhwjIElr3L4Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YuM1H1cl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TXNc9n6b; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YuM1H1cl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TXNc9n6b"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676gQAO028854;
	Mon, 7 Jul 2025 07:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UYVPI6sZ6jqzWQOSSnhkX+f3wRWmabg4RDGA2xA5PiQ=; b=
	YuM1H1clFUuyVWtQbbfNNYMKFs24Z6cyVlDfTTgeLSTzTSUXOSJ4Y4qhvVgXrYbG
	vjkCCeEITKmQu4BGUDGVCN9wNMUMbNPQs3lIcu16oxGqTEotreQM0IVm4jaVURA3
	TuotEME1y0rdA7OxGLdLXe2pJJ7zb6qr/wtLA0YwRLYvtIddjq0jLJMwu3fzLx6b
	Yrkcs31H+/4LeLcJnaGxI6WSZHPING3+YhnoAXl6zEHl5cdTeKhmtvzhrmQh4KZs
	FYXwWjtVE0sKvjD1DmflZ/XKM4bawa8OpHhcTVvQkljTCi/wYBPxRDBNcivvv89D
	+VUgLONv34awwBNObi0IwA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2092.outbound.protection.outlook.com [40.107.92.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47r0pjrrx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlCT6L42CruWXuwD7Tg/ZVqS/XJ2yuo84QXqsPetU3W0IaS8XNVXcVys4j9+2hagavrU+GLmLB0N3Km+8ghqqS3JEX4niZEbX+0GLIDP7r/D//Lc5NkYCCCpc2KQT9PG0hJXFpsDbX2v55dGgKUmKYMMmh/OrmX2FcbRYzdX960dbcMdDDaytQRVdlOWXPIBR+Vh3L00PvV25RcyQOpfKoso/AqO7xYNodvJcaWoNxh7WmimDkqvMr8A6A/GLX7GatC2EpXStBzvFiWJpFSa1/U9WKCVJUxN7kfMn1ZZcInEmcDLuBbnflvbRuX4jxndBVbnACv58j+V6zsBdwbtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYVPI6sZ6jqzWQOSSnhkX+f3wRWmabg4RDGA2xA5PiQ=;
 b=Io5KeQke40qt+nboRDDfQ1YH3vZ8QDIJ+4Kp5QS3+fLohXaVSDJWvon07KIjw6AONDxzDbQHePRbEK8viThZ12G5S7gjcgyEbFs0ClfJ+HBUeEl3lQyqwgBs6eREcaTJMHRno3RobuAmN+QfVvrFTrW8QPMy1omaFvJ2GskM/gHXrPwTRPnUbfSdOJ/4+EwTHi+2RUxgpanIwfmSts7YLO7KsdNHJozlj2/eZYWa6GgChJ5S/yM/93WUKILpJpWVl+mu7z/y0OlAS8gV+/FAEjHrauzU7zh/P3EWiVpnJlXXHUSFTZnCFrGMTbOSNYW79zifeFGCzouYmOiQlbYD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYVPI6sZ6jqzWQOSSnhkX+f3wRWmabg4RDGA2xA5PiQ=;
 b=TXNc9n6bW/XFrqXPZ30Hvv6qWIpLnZVAVu5waGiALpopL7VTGi0q9woAde7Ba7HgYDDW6OJcLs6EfJnWIrwvv82aQY9AcOW5jpixwmJv1goky5PNmHQyJ6lNLJx7n16V0T5LSKlaMtfLucB6kOc9q1sUOfQAXkzIlMrIb1g9yqo=
Received: from BN9PR03CA0901.namprd03.prod.outlook.com (2603:10b6:408:107::6)
 by DM4PR19MB7239.namprd19.prod.outlook.com (2603:10b6:8:10c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Mon, 7 Jul
 2025 12:42:04 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::ec) by BN9PR03CA0901.outlook.office365.com
 (2603:10b6:408:107::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Mon, 7 Jul 2025 12:42:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0D8340655D;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B91EC82024D;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 7/7] ASoC: SDCA: Add hw_params() helper function
Date: Mon,  7 Jul 2025 13:41:55 +0100
Message-Id: <20250707124155.2596744-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DM4PR19MB7239:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 805b9606-38c9-4196-189c-08ddbd53acfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2RamJy11loYt3RsQ56GYFI2hZD9GSqzdpPGhObdoWNeJ4wLOGTgQRBZtpT/p?=
 =?us-ascii?Q?B205eXYblk2eMTOiXVUG6b4kjdAhSPSNGF0mwr24v5tY4P41XnSBXW17J+Xr?=
 =?us-ascii?Q?rREsvRSW3hSasvSzh1DTWqyP3oCcXc1G1Yuvt3ijBodRa2UB+MPF2t8nrxZF?=
 =?us-ascii?Q?QRsy+j6k+RKP+KQ8TOrawvUjwDwyRlNnPxJ28q/abfvxvAwxguj0oh7mTx9Y?=
 =?us-ascii?Q?xTEU6lgxW3LiYx4pcp9K+fxQDOovlB8W38BC7M87IQFcAVLBg9/nJgQIQ1Oj?=
 =?us-ascii?Q?h7CaNns8hse/fQhIG0cA7E4f8Cbv3NdDaZCIA1sf8Xv5dIbTuvSP25UZSy5m?=
 =?us-ascii?Q?SBdDWzLI+klmCuId8+pLC9HWDQScc1VNYgk4CWiwgYsNaIoA7SXsanJYc+JO?=
 =?us-ascii?Q?DjuwqfvjmJFg0PWevtgTkl1DeMMMlmmkpRSZsFCCA9igflxpx+xG/Eigi7jO?=
 =?us-ascii?Q?GGK0m7Jrh6evJgELrajpkMPq6oFrU8Jx7lEZkhOehlnRmHTWPq5nPEfKGZn9?=
 =?us-ascii?Q?RWsRL8gAEvqVt+db4M9efVg6oJLoQxRfabFjqPqJ+mjtN+q256jQ5VhKXj0C?=
 =?us-ascii?Q?XKDqGX+bSc5APnJtngH9vN6YGrv+I7lxLlGiRIne/AWVxqGZ5XgCdhNp2RxY?=
 =?us-ascii?Q?pj0GVRY6+30h0lJ1RbdhfEdpBMpPt0hw/YK1S4PkTiT+awJ2+uaTq1Jt1VLs?=
 =?us-ascii?Q?dvOB9R0ZQppZQNSR26/ZDN+F9Gb+NYF0WGb5pvmzlmjMCpMIhPwwhlzsmFfm?=
 =?us-ascii?Q?q2y6X3oGnwr4V5UOWoKAOrpoK429w6h5D0LeIAJs/go5fY9eolhIUU4MEmx0?=
 =?us-ascii?Q?5UZTw2XY7sY1kDBgKriNc1ZjK73ptfKbxx1q7xM608f2mRuzCmOihRGEKgHf?=
 =?us-ascii?Q?SI3TdOBJJ6HdOg2lLe1BEoyuCPsbBK36jkFQbZ5MW5zeWyqH7u4nOMfecQzp?=
 =?us-ascii?Q?eYGW4zgI8WsaIoKvQ6QMT2WqCM46J/dmrBgN3WFvEcIZPzBupWXdoLnoPwby?=
 =?us-ascii?Q?nWC27M80eXZ6nVfAE1LVII9wWu2oML4AvDwevC3JJSEwIIQdfZRI/I7O5sxe?=
 =?us-ascii?Q?cuL0RSXlymALSc/c2KyMnw2g/pWfglDI8ow1SnJGxVfB/KIvRkcDIz839tI9?=
 =?us-ascii?Q?yPUgGhA2v58QDozparhlakYlrMWuBhCeEFXUqRdkLdTfJpCyvLeJMRH3vpY+?=
 =?us-ascii?Q?uhXxDqUvpXrxwz4MWuZXkrameUeY+NNQkYS+xp9+GWlVcDmuoY+edE6nQHBm?=
 =?us-ascii?Q?FXe56OzaBzZ4ECPPJufIOi7Cs5n+QfngicBb3qXtDTTJbwUAf1GpFBa9WFth?=
 =?us-ascii?Q?HYNoYdREHW8ZTVdT7z1KufSUL661UH0Lro04mFdxrvtNBe9972ysricf3+Xp?=
 =?us-ascii?Q?WRkNVd89k0ENdmSuomScCR1taZdV8Hgy1NQ53/h7WOvjYdHjia4HIhke4h1A?=
 =?us-ascii?Q?u7LOmFHt+CYN7wEGrC6DKXRaHplyVZqGRKPf5F+C84PDk605Vfc8AXQZA66T?=
 =?us-ascii?Q?KEt4Bz4/ai/fGV849PQCLfsmgoikMz19qPet?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:03.5959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 805b9606-38c9-4196-189c-08ddbd53acfb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7239
X-Proofpoint-ORIG-GUID: Kbz794bciaLRvr__bBH9AkdOwVpREqu9
X-Authority-Analysis: v=2.4 cv=dtDbC0g4 c=1 sm=1 tr=0 ts=686bc0a2 cx=c_pps a=aLZL+48Wq4J5hv+wjYjuZQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=axZQriD7o7AyN4llW9EA:9
X-Proofpoint-GUID: Kbz794bciaLRvr__bBH9AkdOwVpREqu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfXz5FbgA/TkoJP yvmz73WheW9gJmi4GM9UsJ5AkzxXtS5vVpOYJfd1mXq0e6Yj6j6byappzAEFTUNWoMJM+0smlBg HtAnU640pf2zO0xy7xJhk7jMSSznz6ychbyEp79NK9yZjffZOKKaGiKIY5J+JOfBC4fDdkn+hQE
 FWHcahNSdo6EvNGR/kg0HjXGyTPEaDrgC0NzvneOVhBNyFUkIcV9EuTkI6BLdfYSS535QKogmBy s8Kuxed8m7tXBQocCYr3SQ/GVOmcQlAoI/qOFEbcc96prQtffueSyoxIsBxznbHTmYHl0RZB8pt qHP+RbZAM6pJbl4rNL/6NbYsyvi5CAOn4yBePyrg+WUQD7Q8NwTrO57Hx44B/ioZtqDELaEpwFJ
 McDfkd8SLhQzWfhS8EsMQTjGJqlgnzc8125wvYigu4r4iMdSvm5gH+pnD8F+gJeHRx1wZn0P
X-Proofpoint-Spam-Reason: safe

Add a helper function that can be called from hw_params() in the DAI ops
to configure the SDCA Cluster, Clock and Usage controls. These setup the
channels, sample rate, and bit depths that will be used by the Terminal.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_asoc.h  |   6 ++
 sound/soc/sdca/sdca_asoc.c | 180 +++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 800a26adcd8e..aa9124f93218 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,6 +14,7 @@ struct device;
 struct regmap;
 struct sdca_function_data;
 struct snd_kcontrol_new;
+struct snd_pcm_hw_params;
 struct snd_pcm_substream;
 struct snd_soc_component_driver;
 struct snd_soc_dai;
@@ -51,5 +52,10 @@ void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
 int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
 		       struct sdca_function_data *function,
 		       struct snd_soc_dai *dai);
+int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
+			struct sdca_function_data *function,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params,
+			struct snd_soc_dai *dai);
 
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 03c663413cc9..252d72377091 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -22,6 +22,7 @@
 #include <linux/types.h>
 #include <sound/control.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/sdca.h>
 #include <sound/sdca_asoc.h>
 #include <sound/sdca_function.h>
@@ -1443,3 +1444,182 @@ int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
 	return -ENODEV;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_get_port, "SND_SOC_SDCA");
+
+static int set_cluster(struct device *dev, struct regmap *regmap,
+		       struct sdca_function_data *function,
+		       struct sdca_entity *entity, unsigned int channels)
+{
+	int sel = SDCA_CTL_IT_CLUSTERINDEX;
+	struct sdca_control_range *range;
+	int i, ret;
+
+	range = sdca_selector_find_range(dev, entity, sel, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		int cluster_id = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, cluster_id);
+		if (!cluster)
+			return -ENODEV;
+
+		if (cluster->num_channels == channels) {
+			int index = sdca_range(range, SDCA_CLUSTER_BYTEINDEX, i);
+			unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
+							entity->id, sel, 0);
+
+			ret = regmap_update_bits(regmap, reg, 0xFF, index);
+			if (ret) {
+				dev_err(dev, "%s: failed to write cluster index: %d\n",
+					entity->label, ret);
+				return ret;
+			}
+
+			dev_dbg(dev, "%s: set cluster to %d (%d channels)\n",
+				entity->label, index, channels);
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "%s: no cluster for %d channels\n", entity->label, channels);
+	return -EINVAL;
+}
+
+static int set_clock(struct device *dev, struct regmap *regmap,
+		     struct sdca_function_data *function,
+		     struct sdca_entity *entity, int target_rate)
+{
+	int sel = SDCA_CTL_CS_SAMPLERATEINDEX;
+	struct sdca_control_range *range;
+	int i, ret;
+
+	range = sdca_selector_find_range(dev, entity, sel, SDCA_SAMPLERATEINDEX_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		unsigned int rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+
+		if (rate == target_rate) {
+			unsigned int index = sdca_range(range,
+							SDCA_SAMPLERATEINDEX_INDEX,
+							i);
+			unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
+							entity->id, sel, 0);
+
+			ret = regmap_update_bits(regmap, reg, 0xFF, index);
+			if (ret) {
+				dev_err(dev, "%s: failed to write clock rate: %d\n",
+					entity->label, ret);
+				return ret;
+			}
+
+			dev_dbg(dev, "%s: set clock rate to %d (%dHz)\n",
+				entity->label, index, rate);
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "%s: no clock rate for %dHz\n", entity->label, target_rate);
+	return -EINVAL;
+}
+
+static int set_usage(struct device *dev, struct regmap *regmap,
+		     struct sdca_function_data *function,
+		     struct sdca_entity *entity, int sel,
+		     int target_rate, int target_width)
+{
+	struct sdca_control_range *range;
+	int i, ret;
+
+	range = sdca_selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		unsigned int rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		unsigned int width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+
+		if ((!rate || rate == target_rate) && width == target_width) {
+			unsigned int usage = sdca_range(range, SDCA_USAGE_NUMBER, i);
+			unsigned int reg = SDW_SDCA_CTL(function->desc->adr,
+							entity->id, sel, 0);
+
+			ret = regmap_update_bits(regmap, reg, 0xFF, usage);
+			if (ret) {
+				dev_err(dev, "%s: failed to write usage: %d\n",
+					entity->label, ret);
+				return ret;
+			}
+
+			dev_dbg(dev, "%s: set usage to %#x (%dHz, %d bits)\n",
+				entity->label, usage, target_rate, target_width);
+
+			return 0;
+		}
+	}
+
+	dev_err(dev, "%s: no usage for %dHz, %dbits\n",
+		entity->label, target_rate, target_width);
+	return -EINVAL;
+}
+
+/**
+ * sdca_asoc_hw_params - set SDCA channels, sample rate and bit depth
+ * @dev: Pointer to the device, used for error messages.
+ * @regmap: Pointer to the Function register map.
+ * @function: Pointer to the Function information.
+ * @substream: Pointer to the PCM substream.
+ * @params: Pointer to the hardware parameters.
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from hw_params().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
+			struct sdca_function_data *function,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params,
+			struct snd_soc_dai *dai)
+{
+	struct sdca_entity *entity = &function->entities[dai->id];
+	int channels = params_channels(params);
+	int width = params_width(params);
+	int rate = params_rate(params);
+	int usage_sel;
+	int ret;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		ret = set_cluster(dev, regmap, function, entity, channels);
+		if (ret)
+			return ret;
+
+		usage_sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		usage_sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: hw_params on non-terminal entity\n", entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		ret = set_clock(dev, regmap, function, entity->iot.clock, rate);
+		if (ret)
+			return ret;
+	}
+
+	ret = set_usage(dev, regmap, function, entity, usage_sel, rate, width);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_hw_params, "SND_SOC_SDCA");
-- 
2.39.5

