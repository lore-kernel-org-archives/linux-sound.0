Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C80A2F39D1
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797659; cv=fail; b=VmPf1BA/4HZjRsvJn88JLjcw0MW9Fb2LUUvhEmwRX13y2bwSphb5jA3wfdXYY3/InrRfHt/6hmgxbz2+ZaIakXVTbpbyReOah1fZXWPvwFBqbIHMqnPzpcrjELsWK4YfD3Sp/u+mq01ko/DbMWlG2SV/MXZLHZDoshhJ9Q2GJsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797659; c=relaxed/simple;
	bh=++5zgySuuBRVHFpTF56iW3yfycGd7OT1uUOS5WXz+Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FiPS+/9b9isruL4Ul4yMVFR7SN/dbdha5jmR8/coP5KgxIKDSS6lsLW45MxEq2q2aqYQX0HF/E2jGAwPSTphQr4BvUSU5VYStOhUfcCb86NZnyHeRJOZrNsdRY/CjnDNN+VHfMmts+3B8OrvqiXpUWyMjxe6I9DiRlxybEpZZus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YISMJK+9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hgZVDFtK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YISMJK+9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hgZVDFtK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58PAUKKd1392027;
	Thu, 25 Sep 2025 05:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ehxRklc/p3djo7oyiKjov3DFOWCWLpvqNqn2xPmtgu0=; b=
	YISMJK+9nF/uz35RVFq03gC1I6O0x3RE4NdhmjbmTI2mgBqsxPekaBalskjrHeDl
	XdF8dO4ShRRocMLI9CtObIii7tv3zxL1HtNxh31nPmyHL0U6IVD0ghqtB5o8i71X
	IhrfwfLCNheP3E4jeiF2HPb1cA1xnawd4HGzpFIMO7Y7uBqPIAygQMen6s8qQsRC
	7TMSaebD9tTtQvTWz9I3/cv7D4eUO5NqtagrGpGC9mchjUUA9FFRsYXWDVROxxi7
	9pvzJaVUE/U+vAug5afRCV22KoBxv4bMXhNjJKiuxP6zh+rEjJwdjp1/e/a//w16
	wasdYO366Uv+c2vwsjDC0g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022074.outbound.protection.outlook.com [52.101.43.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49cjmds8wr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S00z4O6RYyOZBrIa2T+n3U7bYT8hcJy6za5KdZclhCcEMymN/O60URjil4vsVVCUksqcOLL6b2tWZV8VLDhC+29VBUAJDZ+DkCckr8maYAF/7w8UGb8gUj8g4K4zCWqHT45+tnS6WJJhA+/zq22bu+ZPJiuEevtuJEMBdcFLSuLVsLr3TnKIvm5IU21vwq6LwMJlDPS9Z44nSLxmJDc0bWHHU7LHS/JUpzV8oXzNYbHV4/oIZcO6XCRvGBSNp/lQaoLcpyqvpijITr8sBF/UY2XEgJi7qoC24gl2HR8Y6Nf6KtVfbdreO6AbyLwJrVO4cs//CNe2xn7fZ/Um/KRwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehxRklc/p3djo7oyiKjov3DFOWCWLpvqNqn2xPmtgu0=;
 b=Vg9u88pxczL5loO1nfa87Z+pphPPkQa/HzYdm3OY3gXEs2V3Ojq1svgdbtmfJC4ek5SzoY5K82b7D/jnxplYz8trMmRDcGPplmMUSpIz1KWtOAZp8HrWPI+8urdlavlfr/0Oqo8ap7yzKUKhzxG7no+Ryaoli+YKp/qxtk+W3KWV52IYUXihmtQtN06Vhx0jXOMpqN94IPe1zTxg0uV41+d8rs4uDL7TWucPSEtyO54YKBieJsSohypb9AcGLt8M2aRTRnS/tDtHc9Jlk4nifCejTDcccvxS1V3WiTgeqOhk9sKAXHzkuUV5vjHJLWKaWekBDySpQWWFcPnwA06EHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehxRklc/p3djo7oyiKjov3DFOWCWLpvqNqn2xPmtgu0=;
 b=hgZVDFtK0aMRW8msnufND2I/9CccpexkTcF6kNw01tQMKaaevYNF6rsuZq+aOweAh+mqLZTO/TkkJCQrV5WC27t6RJtee6/qvQIAnnpjmkq3bCNx1o/0YPO+3hypVchfy+xVqUE8BOcQ008V/QcBqzTkjZJRMj6Fl7oOlLAsBKg=
Received: from SA9PR03CA0026.namprd03.prod.outlook.com (2603:10b6:806:20::31)
 by LV0PR19MB9688.namprd19.prod.outlook.com (2603:10b6:408:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:53:48 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::70) by SA9PR03CA0026.outlook.office365.com
 (2603:10b6:806:20::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D79C406553;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F161382024D;
	Thu, 25 Sep 2025 10:53:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 02/19] regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
Date: Thu, 25 Sep 2025 11:53:24 +0100
Message-ID: <20250925105341.194178-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|LV0PR19MB9688:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c1aaca00-c0c2-4138-44ad-08ddfc21ce13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KNN7vZCpILsXyuYKerHPH3k88rUtRnt0V3bvYdtsmSzD84XD74+7boyCdqSC?=
 =?us-ascii?Q?xvMUdOeyRXNWPpuGxe7pv0UVypZfOyUp0AXHbpO7+R3eaBnSfd88dA6zEqVq?=
 =?us-ascii?Q?t3vUw331+yQLYD3eAbPD5gDlw7dBvH6mZJMwttEHcABZoN021Kr7xdSgVrXA?=
 =?us-ascii?Q?1I35zgFF8hrb/u2hZHM5+wzPH2zbrgz2IBy2AyPaNIJoRxAT/cEMox9PXqrL?=
 =?us-ascii?Q?Ft0CcRq68vXrXtuwG3HymP74BsidP/+sm5i0wNK4nNXAnNyUIlM9kd8vvosq?=
 =?us-ascii?Q?yUqin/eJGtV9ld0eM7vypZJSXx5dWsFhPrP/iSudmqBiaI3QC/wnZOP6DTJN?=
 =?us-ascii?Q?54jC9baYbZWGbAL1xRCpZdUPoNy+/+FEVbGY7BTC/Nlv316AGK0V5/L2SBdd?=
 =?us-ascii?Q?nDJ1jz2QBdWYZEJN3VkKvyaMaSM3rSIz2HHsAP+eMnYj4EGngayTHMcsgbV/?=
 =?us-ascii?Q?mm6t14yu2/dDKMyztcTJBBX/ZHjP4tkitATIS+KNKAR3+M63AizijAR67Tcb?=
 =?us-ascii?Q?BaOpMRngWgh9i4tAn1KrN/qGMK0yMMUzAhRS0A7YaaqaxHc+BztEq1g+leGJ?=
 =?us-ascii?Q?1DTMr3cGXVjZSQIUGtrADgDHZeEKlPAG8/+az8KIIjS2FLRvq+++NwVXpyt3?=
 =?us-ascii?Q?+B6GxofGrLhib/v+suM+9hpO8BoxDj1QPVASEeZcR24INfbNwV3fdNRm9/jY?=
 =?us-ascii?Q?xP79NhRN5j/ImBXdbctZ4ig3brC5k2GKRsq/+kTbTeG3ols+8Lu4FDhOwQju?=
 =?us-ascii?Q?xSs/aZIchRKemoghkWML7cEluiBIbXW2avu4Rbf+XBeKgV63tZYmK57SAMhD?=
 =?us-ascii?Q?ztCX6ZZKXj6sJgSeBmly7pocqKjsrJuqmJ0RZ0NytgKcAVNDbHi0kCFCGX62?=
 =?us-ascii?Q?mFE1F8WJhAbFqBSj1Ch4fgzb5Homu84ZJz3xKkTxr83+Qo8XvyBbR8cN/HwG?=
 =?us-ascii?Q?EZhNvVgbAsxOraVRgpPHOBdEcgIElvmWk112bhGW2NWKwSVUhVqZcU/4DPob?=
 =?us-ascii?Q?YNor7JPSVCGC2L5n+GaipHpBnVVniLwn7zdxDgA+BZRvzCv3c3piRJSXU82K?=
 =?us-ascii?Q?DMCfgD6YkxqTGq9bSgXDXRMB0pr/VeXkUWe3mUDD+wNulltmz8l1wsSUMeco?=
 =?us-ascii?Q?DedanfBC8zdVtkgLLap1NdYhcNOQRpQVZvAEri8L2FLBe2FuZ0H919JPiM/l?=
 =?us-ascii?Q?lmvwYTbDXPfWFkvUfigOg2Vo2yZ0c9g3laIsG2/2wJOG2judhLHkBOhwCvxW?=
 =?us-ascii?Q?oZOlMv0J0keHExFQmmn9baslyyxaD80ixErh0KqTFC4IfkvBzyFSM2sdqOYS?=
 =?us-ascii?Q?Zx3UT7Iboc5mTZ9rLYsYk7ZbkZLM2IyxX4sGaTCdj5dc03eA0VbuUhNk24Yn?=
 =?us-ascii?Q?qgVZzKyFCUmHKcQGxNl+5CPCPXUQ2MIT2mBRMu8IVaWzLAE5/kq4tyyvoyru?=
 =?us-ascii?Q?VWg+EFVa6owxRftyZHklMqTK+yltAlwjzVtbzudsZl2AATvCwnGFkgPGxYit?=
 =?us-ascii?Q?FOSmUAHeY7JhOmxp2qpy71TKxlMxkVNjOh9NnGY622dfkz2e3NgG2fpUj0q/?=
 =?us-ascii?Q?u/6r5QqZnXL/Ypk2eYg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:47.5162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aaca00-c0c2-4138-44ad-08ddfc21ce13
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9688
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfXwDtpT1OlfBc+
 uaqvjRZ/osyTpl0zRDSmnptqKJ3TrpcpBG8tC6KY1PAtaMF63IoL4QEvjWgUxgI2UUBLu5Pp5Ll
 ZtDcV+VWutD083f7+nf9Ro6Tu1rLL8QEhITjVrCG9sbYOi8hTiC2wCE0mNsQXFu6hOtviMF6Awi
 flkmcTxK8MTNGN0vjLVYWH7Sq3CYExlEs3IKPwWWxYuVkEvnEYJE4UxPvYD2yvgKpCE/WfqlBfh
 BqmW80z4teQ/5OCU2cuGEyRuP8i0Y/khTSD8LkWprcaUFkzwcVQheJao1WYnF7prJIi9s8wWctU
 DJfzjiCK5Bk0YcJOHaDuCP+TBBImHIA0QfAeZAp0TKL+ASnUH4Cm+erupSKDd8=
X-Proofpoint-GUID: hmScsbJr-3yRzdQoySK3k4z_8hwQE20x
X-Proofpoint-ORIG-GUID: hmScsbJr-3yRzdQoySK3k4z_8hwQE20x
X-Authority-Analysis: v=2.4 cv=ap6yCTZV c=1 sm=1 tr=0 ts=68d51f3e cx=c_pps
 a=EjCBFqPm7gL+SGkxwm0cEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=EeMxKaNHpS4G9r6iSpwA:9
X-Proofpoint-Spam-Reason: safe

Currently, the code assumes that the device that registered the
MBQ register map is the actual SoundWire slave device. This works
fine for all current users, however future SDCA devices will
likely be implemented with the SoundWire slave as a parent device
and separate child drivers with regmaps for each audio Function.
Update the regmap_init_sdw_mbq_cfg macro to allow these two
to be specified separately.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 drivers/base/regmap/regmap-sdw-mbq.c | 23 ++++++++++++-----------
 include/linux/regmap.h               | 21 +++++++++++----------
 sound/soc/codecs/rt722-sdca-sdw.c    |  4 +++-
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 86644bbd07100..8b7d34a6080d2 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -15,6 +15,7 @@
 
 struct regmap_mbq_context {
 	struct device *dev;
+	struct sdw_slave *sdw;
 
 	struct regmap_sdw_mbq_cfg cfg;
 
@@ -46,7 +47,7 @@ static bool regmap_sdw_mbq_deferrable(struct regmap_mbq_context *ctx, unsigned i
 static int regmap_sdw_mbq_poll_busy(struct sdw_slave *slave, unsigned int reg,
 				    struct regmap_mbq_context *ctx)
 {
-	struct device *dev = &slave->dev;
+	struct device *dev = ctx->dev;
 	int val, ret = 0;
 
 	dev_dbg(dev, "Deferring transaction for 0x%x\n", reg);
@@ -96,8 +97,7 @@ static int regmap_sdw_mbq_write_impl(struct sdw_slave *slave,
 static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct regmap_mbq_context *ctx = context;
-	struct device *dev = ctx->dev;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = ctx->sdw;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -156,8 +156,7 @@ static int regmap_sdw_mbq_read_impl(struct sdw_slave *slave,
 static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct regmap_mbq_context *ctx = context;
-	struct device *dev = ctx->dev;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave = ctx->sdw;
 	bool deferrable = regmap_sdw_mbq_deferrable(ctx, reg);
 	int mbq_size = regmap_sdw_mbq_size(ctx, reg);
 	int ret;
@@ -208,6 +207,7 @@ static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
 
 static struct regmap_mbq_context *
 regmap_sdw_mbq_gen_context(struct device *dev,
+			   struct sdw_slave *sdw,
 			   const struct regmap_config *config,
 			   const struct regmap_sdw_mbq_cfg *mbq_config)
 {
@@ -218,6 +218,7 @@ regmap_sdw_mbq_gen_context(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	ctx->dev = dev;
+	ctx->sdw = sdw;
 
 	if (mbq_config)
 		ctx->cfg = *mbq_config;
@@ -228,7 +229,7 @@ regmap_sdw_mbq_gen_context(struct device *dev,
 	return ctx;
 }
 
-struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 				     const struct regmap_config *config,
 				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
@@ -241,16 +242,16 @@ struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	ctx = regmap_sdw_mbq_gen_context(dev, sdw, config, mbq_config);
 	if (IS_ERR(ctx))
 		return ERR_CAST(ctx);
 
-	return __regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+	return __regmap_init(dev, &regmap_sdw_mbq, ctx,
 			     config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__regmap_init_sdw_mbq);
 
-struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__devm_regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 					  const struct regmap_config *config,
 					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
@@ -263,11 +264,11 @@ struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ctx = regmap_sdw_mbq_gen_context(&sdw->dev, config, mbq_config);
+	ctx = regmap_sdw_mbq_gen_context(dev, sdw, config, mbq_config);
 	if (IS_ERR(ctx))
 		return ERR_CAST(ctx);
 
-	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq, ctx,
+	return __devm_regmap_init(dev, &regmap_sdw_mbq, ctx,
 				  config, lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 4e1ac1fbcec43..70daec535976d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -676,7 +676,7 @@ struct regmap *__regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
-struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 				     const struct regmap_config *config,
 				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
@@ -738,7 +738,7 @@ struct regmap *__devm_regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
-struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
+struct regmap *__devm_regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 					  const struct regmap_config *config,
 					  const struct regmap_sdw_mbq_cfg *mbq_config,
 					  struct lock_class_key *lock_key,
@@ -970,7 +970,7 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define regmap_init_sdw_mbq(sdw, config)					\
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,		\
-				sdw, config, NULL)
+				&sdw->dev, sdw, config, NULL)
 
 /**
  * regmap_init_sdw_mbq_cfg() - Initialise MBQ SDW register map with config
@@ -983,9 +983,9 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  * to a struct regmap. The regmap will be automatically freed by the
  * device management code.
  */
-#define regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)		\
+#define regmap_init_sdw_mbq_cfg(dev, sdw, config, mbq_config)		\
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,	\
-				sdw, config, mbq_config)
+				dev, sdw, config, mbq_config)
 
 /**
  * regmap_init_spi_avmm() - Initialize register map for Intel SPI Slave
@@ -1198,12 +1198,13 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  */
 #define devm_regmap_init_sdw_mbq(sdw, config)			\
 	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq, #config,   \
-				sdw, config, NULL)
+				&sdw->dev, sdw, config, NULL)
 
 /**
  * devm_regmap_init_sdw_mbq_cfg() - Initialise managed MBQ SDW register map with config
  *
- * @sdw: Device that will be interacted with
+ * @dev: Device that will be interacted with
+ * @sdw: SoundWire Device that will be interacted with
  * @config: Configuration for register map
  * @mbq_config: Properties for the MBQ registers
  *
@@ -1211,9 +1212,9 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
  * to a struct regmap. The regmap will be automatically freed by the
  * device management code.
  */
-#define devm_regmap_init_sdw_mbq_cfg(sdw, config, mbq_config)	\
-	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq,	\
-				#config, sdw, config, mbq_config)
+#define devm_regmap_init_sdw_mbq_cfg(dev, sdw, config, mbq_config)	\
+	__regmap_lockdep_wrapper(__devm_regmap_init_sdw_mbq,		\
+				#config, dev, sdw, config, mbq_config)
 
 /**
  * devm_regmap_init_slimbus() - Initialise managed register map
diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 70700bdb80a14..e92988aea3f0e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -419,7 +419,9 @@ static int rt722_sdca_sdw_probe(struct sdw_slave *slave,
 	struct regmap *regmap;
 
 	/* Regmap Initialization */
-	regmap = devm_regmap_init_sdw_mbq_cfg(slave, &rt722_sdca_regmap, &rt722_mbq_config);
+	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
+					      &rt722_sdca_regmap,
+					      &rt722_mbq_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.47.3

