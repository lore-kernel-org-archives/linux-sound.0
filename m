Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B6292936;
	Wed, 26 Nov 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162921; cv=fail; b=sy7r9Metlbsxz7hGrGYxHTRuI+t0SwGb532t6WuO/9vzPAdnlP7bYave4nRWoBhWOz0ilGfFGimY6uD0Lfmv9wJtGdyL9RaIGiDEo0JCUdOTqhcOIV3PDFWI0XPaeNm3HNTLsBl9v2CBfspnannQUcZU5fANLfr8+tsBCMI3gXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162921; c=relaxed/simple;
	bh=5naoX8QFyDysc60y4jLyFk+ygmBxmOEhquq+/SUNR2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BibWQ9Tz+C9RXY25XRhq/9ZJQ6dalJXMUna+OwVwgZeFW9QFRWLHsMTKvgS88TLsQwVASzQntaL1unb2a8nV1yhxhwZJPHNdsJ9vyYqAfpXs4QKqH51MU9M5l/RxajUu3a4ZWmaeozqCv7lHiVVlUY+BnnhvNgJj8XREdBYxoIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Dc0p5jzz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sXet8YKv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Dc0p5jzz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sXet8YKv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ5cwM52047012;
	Wed, 26 Nov 2025 07:15:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/OMrTpjkjPUEscLs
	d3rHTqTFp90YgqpSKI4j9JtYfiA=; b=Dc0p5jzz5Smla2Bvr3PIlbm8VvD0WPek
	v3nlB5TFSK2JX9335TuImVdUyWOhY/EvWu9eNDyDDVeCQ1P7+UuEMz7WXkl3IlYk
	QC2QJdzWpsRHI2dhqC+313zCCD3KWCNgIhGHWxL2WQQauUcnSnsmWzaugXta8CTC
	I12gZaUTdIe8+A8dJdnLPlmonHY1RfeeZ12KeFmReXHmrT4jyvho/+wPCSvQ3gDK
	Dx/2k8qCKw9Hwra3nh2yh27RhEzPPNDzosr3HGxOQol/SlogvxPu40Dncpm0CgOr
	5uQ4jmOOWvJ9Yu4XIENMH8MAH0K4K9+vKqwSafkEa8bGRVHM7aHgtQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020137.outbound.protection.outlook.com [52.101.193.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5gu6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 07:15:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2971oT8QUnpAfBExx91M20vMZKOoElyg1cPJN8VfOrnfnMH76BKdqeVPLW3ugeVhmO+26DXf9as5PbkUJZxIKc11NHgWH2rwRAjsMXjsFyS2W4vTjA/tXat6OhwFtXz1ZsqOo5YSzB2leIbuknqdBlqgWoROPDprax43ny69mwGyiM4YmKIjdhjNv90RccwHMeJX+C7JBF1RQEEogU5bwkRxT7psd+2pChde+ziOy+ZK/xXCPlb9e8Z1hQFq3JGP8dT5SAaOif5GIVgGF1G1MIXYllOqn+vHT5yCwLld2Yx6yYQWo9XpWHTfz6ZSaVL4ngtSSPzC1JQewHywc7M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OMrTpjkjPUEscLsd3rHTqTFp90YgqpSKI4j9JtYfiA=;
 b=RQazE35uM8IczyBfHJnDsMT67E4aH+r2cnxsKpK3Fi80foZOQey4yZ+C7IRX++QPXs0y9mJASN8xnOskm1VqV6ZRvGtMstL1UESu+/gyjV6BUEWFAQIzWO0sySniis1HDqwReWQmRNFebekNW74iP+R3Qkzjn0poEzNEGsyX1u+F2svJpNH8kE6SrEVtQMsI4TuG8CMatu8h30GH2sB04vmHAGhi3Ttd+fyBc8PMlMMwrDkiTlxfUMG6r0fQuf6VgfDQ5KzS+iUszWTHQxXPbxNhEy3Ic9oGFs0wx6KROVQARNFxP45mr5YBH6q6Im4rlgMfG+ADNgcOgwQoL1vVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OMrTpjkjPUEscLsd3rHTqTFp90YgqpSKI4j9JtYfiA=;
 b=sXet8YKv9tj+O50FcviDzyqPfMpwzjh6EDo7Liy6B1U9X8P7aJPvYns8cfxkQGY+zP5lObE30RKduemyYqHK9Vr2yuUDp6ORT+Rb87SCBKVxGCbUAvEGFalycnlBR1z6XYqhAUHSfs/zDBlKHLGVt/zvcPSdJ77P+IFY4Y+6ONs=
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by MW3PR19MB4169.namprd19.prod.outlook.com (2603:10b6:303:42::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 13:15:04 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::b7) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 13:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Wed, 26 Nov 2025 13:15:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10EAA406541;
	Wed, 26 Nov 2025 13:15:02 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2F4C82024D;
	Wed, 26 Nov 2025 13:15:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Remove redundant download buffer allocator
Date: Wed, 26 Nov 2025 13:15:01 +0000
Message-ID: <20251126131501.884188-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MW3PR19MB4169:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a71b72cb-91ed-4f5d-bbbb-08de2cedcfb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yU6bo0Zfaht7fpirr0zletSpPPKLt0jKEBtTPprBZIOUN/gtQ2U/kHCsEdzQ?=
 =?us-ascii?Q?PSS/cQqylzhUDDhK6UWSmLzkMqWC8cHfAw+qDCI2NUZpLgzmrmcoyAoYR800?=
 =?us-ascii?Q?s7WFgOa1zCitwbGnIelmFxHPTzrpffKJvh6oe0FrFowQ0BeuCH8+PuExNbIy?=
 =?us-ascii?Q?XvVcxJECxJO/aKjKxc3MTACkoZD6po3NHitbdpDxxZ1X1KpPfYHnxZbMJ8Rt?=
 =?us-ascii?Q?flyt3y8xpwgzMMVNTMjR4v7C/Xiu5jNy1s39hdkKssT4NJ1pE7BN+IuKsAVC?=
 =?us-ascii?Q?0H9uzwJ4eRjKg610TfQjmFaHV9Jocvzr/jxp3u6edykUp9ttFta4w4keyA9L?=
 =?us-ascii?Q?f8LkCm7cPzruMblEw1Qh1Iv2+t7I3JDpVWAAF3v9sppxKJfz9NEmQw43dl22?=
 =?us-ascii?Q?6JWk8m5gPatNuKuP98M6gLP/f2lkjYM3PTUwPxjgFF3qQ51tWDe0kQB7e6/T?=
 =?us-ascii?Q?XcOHuNf3yS4P1Hzf8LIcdlfFzNsAzx54LGMxonKkiHLQou/dkQNkOqMqlT/v?=
 =?us-ascii?Q?GJqOl09oqD87aPFM4G5uMSXV0cllJImzn6V76ZpcNTKFGyfyY9FDtPddCflX?=
 =?us-ascii?Q?3UwdZgnrEQbdApEvONKnJ97FND41YE7c8nG51OJwaGL2Oh+iJtZ7rDSZJBtM?=
 =?us-ascii?Q?z5ABq/RJxpwgqjoey5TB5XBPTrx3oOQKi8gUHYX9pZUiOWhyuaQWqlH6R5R5?=
 =?us-ascii?Q?+FAdvQcebbKfKu1io4VAWKeXkNk0kLCyavipfTZoOL5POP9ol8KyTO8SZ4tx?=
 =?us-ascii?Q?LuFtFlTR6lI3YtEdKZt1LTXXWTmhLpzhlDf2Mq0Ddl+p5GNW4WPQ22DqSdhS?=
 =?us-ascii?Q?TbJlx/F9kIDAlXnAuTTaj+WzZsp6ryUP9dyyshqjlQj3xYgHlWMFcSvJCRVQ?=
 =?us-ascii?Q?dhijuY4QxCiAF4Z6H9Ms1kHccYtaAD7PkdCZghRg2ykzewetJAvl7nFBHzO5?=
 =?us-ascii?Q?+jCP6RviNSRMOobgljWeh2TOxpqjmGxEoxEm6H9aQYyl7M5geS+WnbH2SqOt?=
 =?us-ascii?Q?EYgmX7gM824e2ezPIC3rG8YvyvsxKMA622r8djAUm2sSO/D9OzSGrAbl4rZn?=
 =?us-ascii?Q?mK/jV+eeLW3uv2z9lnBtbi5/M/MJ4TKdwNIjr8X0pQcaubB68PNkgYt/bB69?=
 =?us-ascii?Q?VAQmuhHgJCGxA9egGLxNdJ4PFPEzOFbbn6smmSkREd1q/u6fVgbx4WOj/Ybh?=
 =?us-ascii?Q?OC2l3/FEs6BZck1HhbI0WHrBuOebYET3B7+2hC/GpsFriRBm7OVbD9ShRGxO?=
 =?us-ascii?Q?fq8WY+UA47RBN/NxrmeoXtggEi8vWt4+1F9O6/9xjZPSyWc2WkNDWTtfhwkg?=
 =?us-ascii?Q?WjgSdvRgDZ5ULNdB1lAUA5tgMrc1//pWtiJFozD6GLqNthfDBDa3hJ0RwgUl?=
 =?us-ascii?Q?cVdbGLZv7k7IzJbVQUf1DGWDLbGNL5pyKhxpfZZPrSJp8obfBQoEoerM31OU?=
 =?us-ascii?Q?mD3J52Dt7mAGlmuEtuqKDIeJqdUJMXlCPC8WLgDx1I0jU1haqGETDP9kPwtM?=
 =?us-ascii?Q?mNED/BeCwxG3Ohn2bt22ZtMwCdiviNeAQK1g6LPNUAKjR1mnIVa7znZe7WG5?=
 =?us-ascii?Q?McnaDKNd9HEU/wBHJew=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:15:03.4252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71b72cb-91ed-4f5d-bbbb-08de2cedcfb8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEwOSBTYWx0ZWRfXxjP/MhBzo4ML
 52naxNxEJ9jx89QJXxeJZ0cfgMr6KdS4GDhq3UfOjdbso4ErpLbvFc/BExrSu7HdhhNDiF723hD
 jaL0cnhJ4enI1j/acl9v0J7G2uUASJpxsR3QYZcWbyg9zso6B095xPtZlT99P7PCAmRTiBxa2n+
 ttQBRTkMX5lfIUOjLXJI1HiI3B8z2mrZzHZ97xUntvyZdCOcUab+zqGK2UhpF2X3L345BZ8+Vh0
 BfcrFfv1cfXV91yjiXQ1IC90bID7LF5+vDpSf8UM6XsPYk76z96xUaPK9mVoHLmd16LFd7sd/4f
 qpsBATQmSyXuJ5YeJQw9HTnYxl6cNKNPODqUozrlzdXZbPAomEI6JU4WEA71TYz/O0HOxTcQDR0
 BatNsS03tZZnOLZpi1emgfhEgoBYsw==
X-Proofpoint-GUID: 8BhZgyYagSrGfe0WpAOjulgUfAjImoHp
X-Proofpoint-ORIG-GUID: 8BhZgyYagSrGfe0WpAOjulgUfAjImoHp
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=6926fd5e cx=c_pps
 a=XDlTrAgoJ4DEJsetPJNxqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=5GF3xMFy31VaxR_RwkoA:9
X-Proofpoint-Spam-Reason: safe

Now that cs_dsp uses regmap_raw_write() instead of regmap_raw_write_async()
it doesn't need to keep multiple DMA-safe buffers of every chunk of data
it wrote.

See commit fe08b7d5085a ("firmware: cs_dsp: Remove async regmap writes")

Only one write can be in progress at a time, so one DMA-safe buffer can be
re-used. The single DMA-safe buffer is reallocated if the next write chunk
is larger. Reallocation size is rounded up to reduce the amount of churn.
PAGE_SIZE is used as a convenient size multiple. Typically for .wmfw files
the first chunk is the largest.

A DMA-safe intermediate buffer is used because we can't assume that the
bus underlying regmap can accept non-DMA-safe buffers.

Note that a chunk from the firmware file cannot simply be split into
arbitrarily-sized chunks to avoid buffer reallocation. The data in the
firmware file is preformatted to be written directly to the device as one
block. It already takes account of alignment, write-bursts and write
length requirements of the target hardware, so that the cs_dsp driver can
treat it as an opaque blob.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 103 ++++++++++---------------------
 1 file changed, 34 insertions(+), 69 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 36a5aefa16e7..6444ef1f7f32 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -13,6 +13,7 @@
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -317,44 +318,6 @@ struct cs_dsp_alg_region_list_item {
 	struct cs_dsp_alg_region alg_region;
 };
 
-struct cs_dsp_buf {
-	struct list_head list;
-	void *buf;
-};
-
-static struct cs_dsp_buf *cs_dsp_buf_alloc(const void *src, size_t len,
-					   struct list_head *list)
-{
-	struct cs_dsp_buf *buf = kzalloc(sizeof(*buf), GFP_KERNEL);
-
-	if (buf == NULL)
-		return NULL;
-
-	buf->buf = vmalloc(len);
-	if (!buf->buf) {
-		kfree(buf);
-		return NULL;
-	}
-	memcpy(buf->buf, src, len);
-
-	if (list)
-		list_add_tail(&buf->list, list);
-
-	return buf;
-}
-
-static void cs_dsp_buf_free(struct list_head *list)
-{
-	while (!list_empty(list)) {
-		struct cs_dsp_buf *buf = list_first_entry(list,
-							  struct cs_dsp_buf,
-							  list);
-		list_del(&buf->list);
-		vfree(buf->buf);
-		kfree(buf);
-	}
-}
-
 /**
  * cs_dsp_mem_region_name() - Return a name string for a memory type
  * @type: the memory type to match
@@ -1481,7 +1444,9 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 	const struct wmfw_region *region;
 	const struct cs_dsp_region *mem;
 	const char *region_name;
-	struct cs_dsp_buf *buf;
+	u8 *buf __free(kfree) = NULL;
+	size_t buf_len = 0;
+	size_t region_len;
 	unsigned int reg;
 	int regions = 0;
 	int ret, offset, type;
@@ -1601,23 +1566,23 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 			   region_name);
 
 		if (reg) {
-			buf = cs_dsp_buf_alloc(region->data,
-					       le32_to_cpu(region->len),
-					       &buf_list);
-			if (!buf) {
-				cs_dsp_err(dsp, "Out of memory\n");
-				ret = -ENOMEM;
-				goto out_fw;
+			region_len = le32_to_cpu(region->len);
+			if (region_len > buf_len) {
+				buf_len = round_up(region_len, PAGE_SIZE);
+				kfree(buf);
+				buf = kmalloc(buf_len, GFP_KERNEL | GFP_DMA);
+				if (!buf) {
+					ret = -ENOMEM;
+					goto out_fw;
+				}
 			}
 
-			ret = regmap_raw_write(regmap, reg, buf->buf,
-					       le32_to_cpu(region->len));
+			memcpy(buf, region->data, region_len);
+			ret = regmap_raw_write(regmap, reg, buf, region_len);
 			if (ret != 0) {
 				cs_dsp_err(dsp,
-					   "%s.%d: Failed to write %d bytes at %d in %s: %d\n",
-					   file, regions,
-					   le32_to_cpu(region->len), offset,
-					   region_name, ret);
+					   "%s.%d: Failed to write %zu bytes at %d in %s: %d\n",
+					   file, regions, region_len, offset, region_name, ret);
 				goto out_fw;
 			}
 		}
@@ -1634,8 +1599,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 
 	ret = 0;
 out_fw:
-	cs_dsp_buf_free(&buf_list);
-
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
 
@@ -2167,7 +2130,9 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 	struct cs_dsp_alg_region *alg_region;
 	const char *region_name;
 	int ret, pos, blocks, type, offset, reg, version;
-	struct cs_dsp_buf *buf;
+	u8 *buf __free(kfree) = NULL;
+	size_t buf_len = 0;
+	size_t region_len;
 
 	if (!firmware)
 		return 0;
@@ -2309,20 +2274,22 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 		}
 
 		if (reg) {
-			buf = cs_dsp_buf_alloc(blk->data,
-					       le32_to_cpu(blk->len),
-					       &buf_list);
-			if (!buf) {
-				cs_dsp_err(dsp, "Out of memory\n");
-				ret = -ENOMEM;
-				goto out_fw;
+			region_len = le32_to_cpu(blk->len);
+			if (region_len > buf_len) {
+				buf_len = round_up(region_len, PAGE_SIZE);
+				kfree(buf);
+				buf = kmalloc(buf_len, GFP_KERNEL | GFP_DMA);
+				if (!buf) {
+					ret = -ENOMEM;
+					goto out_fw;
+				}
 			}
 
-			cs_dsp_dbg(dsp, "%s.%d: Writing %d bytes at %x\n",
-				   file, blocks, le32_to_cpu(blk->len),
-				   reg);
-			ret = regmap_raw_write(regmap, reg, buf->buf,
-					       le32_to_cpu(blk->len));
+			memcpy(buf, blk->data, region_len);
+
+			cs_dsp_dbg(dsp, "%s.%d: Writing %zu bytes at %x\n",
+				   file, blocks, region_len, reg);
+			ret = regmap_raw_write(regmap, reg, buf, region_len);
 			if (ret != 0) {
 				cs_dsp_err(dsp,
 					   "%s.%d: Failed to write to %x in %s: %d\n",
@@ -2342,8 +2309,6 @@ static int cs_dsp_load_coeff(struct cs_dsp *dsp, const struct firmware *firmware
 
 	ret = 0;
 out_fw:
-	cs_dsp_buf_free(&buf_list);
-
 	if (ret == -EOVERFLOW)
 		cs_dsp_err(dsp, "%s: file content overflows file data\n", file);
 
-- 
2.47.3

