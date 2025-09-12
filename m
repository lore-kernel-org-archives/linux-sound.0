Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426E2EB5B0
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673333; cv=fail; b=A/mYe48YJURnrRplB+JFI1iHFgYUuADcZAFwoMf+9gUUAE04XosFueq4+eb/xliREUCSsvZYrMJSSwpfLfRDxOD/EyvmbSFxBgRE6KBbaGwUWMndMYSS5ODN6ei/J6TGHpZ+OSdEF/N/oCIUkNokoH3lkVw/LOqhBWsXjBwc3Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673333; c=relaxed/simple;
	bh=gE7rFN7g7/0k2XcNqIxkGp0oJdxLsPQRdz10GH81f5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7P3LcMe/axJVkuYfASSOMuPzp6qm7OpJJGwoH4I1Y7B9F+DXOlzTHEnOejMdB7yuFL+r+d/T8E1DxtzC1te3SpHAYYdcXxhZ3+DDzt+YDRHTpLBB8YVaxwCMguUTtRKuUle8Iqb5bqGDl/Uoi8UT0jB1tznfRvXqY+n149ieLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p2uZlG7A; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0NmEmABv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p2uZlG7A";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0NmEmABv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7NqXd1382687;
	Fri, 12 Sep 2025 05:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3JbeA7I57BjUK9/W+Kj95w2xjDYAwVthLa6qU2CCBUE=; b=
	p2uZlG7Ac5ih0dIzWo//CMcpvtZiCHWCF2QzFvqGWLXxvVJ3GoWtRcyoc85A7G1g
	EKc325NW8lZYt4MEADXZuNEGOiJ2P1WgehypPtYF2w7YidCmcEpQS7LPb8M2Jbzs
	oqjLbD0R/2NeGN8gZ+DxUJrxNxmJqGRpVrWJhhKEhOlehxXMCWQABlRZpuNER1AU
	CFekLk68DqkL2v89Ojtt9qFILpPqRZ1WgGsvz/apQZkGKNAYJ4USl25yWMyaAzPA
	j3takWHJVu/uII09qgEhdjI4O4qgFxBv4RbbmMVw7LDjtQonjeayF+2owc5RXNYn
	pXzRMlrZRocjL7tpavLbfQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2116.outbound.protection.outlook.com [40.107.237.116])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drXz28QGa4yvtQr6INGeDg3m4XPI51UWgrINQgKUDfaa8iIZ9D5nFyloK1WOFIN5Q36mZSeEa/en1GWwxEB/wh2GHkzA0IJJAet91fdPIOoYvNyb3Gvdk7tYekErZ2MTr78/QBJyjKe6pS4ulUZMOwR2Zu90lloagGzKXvduPeKP+DsMPz1/djDf3hmoJo9KViGCHlCmSSf2100OpJw88YxWCuRCpOfcqq9UZPJaWKP1G2KxpV+uFsFE/17ewKr+VPLUV8qKecBDbJ1B+tOknW06wb0qRgPAfLTf0LThBfQ+08G6WaSOi0sZ9JxUY7lMnW2o/hEPR2ND23Q4sHT5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JbeA7I57BjUK9/W+Kj95w2xjDYAwVthLa6qU2CCBUE=;
 b=Q/cS5nC0+EGuOqMVbrLnO8h5UUtmlqsf59ILm1r3xkLhr9kWUVfwSwWJxWsdytQXp9LSU7Z7dqFXGd2esXlEaMPy1xjKnWXCIdCW3Hi4jnQQkpXHHi2p0qzbnUEer2zzdymC8dIcR/byiwPDkIf5g+WxapJOb+v53Dmu7YgmMwQAxLlccoayaxYxXSNmbvh7/vtNOx5z3+2z2wLS8npyeesPwCdViPFzzNwG32pwpAuWePeX37sggrRiC760fZuNMw/eBM5PZnOaO+USN6iPV3ZkVRkW0HiPpI+bBSngcm+4GOmdRVKL7SDWPWejy6n1CfhIY73+bOgVsil+lMTRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JbeA7I57BjUK9/W+Kj95w2xjDYAwVthLa6qU2CCBUE=;
 b=0NmEmABv1MoNLV7251L5th49LO5VNob9Wp0D9bPXK3ZhX+UkSjT5D6o0m8hhqvavGQipP3mQhz7jQv2KUrZz4v2DZ/LAoCxv72542zKZl7wMR01IViwg/fLOT8QM0KaHbDBLramfmkB30fbw+HZHHo0ei3bT91LrZh5IuB4YidM=
Received: from BY5PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:180::16)
 by MN0PR19MB6287.namprd19.prod.outlook.com (2603:10b6:208:3c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:11 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::82) by BY5PR13CA0003.outlook.office365.com
 (2603:10b6:a03:180::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.8 via Frontend Transport; Fri,
 12 Sep 2025 10:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1018D40654E;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED08C82024A;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 02/19] regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
Date: Fri, 12 Sep 2025 11:34:47 +0100
Message-ID: <20250912103504.2679226-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MN0PR19MB6287:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8cf2d24c-3773-48c1-2840-08ddf1e80c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dsMh6V1fb21yfhjqYlZciJujvclITt9xp/TP16uv1eoZNTC2lp9gEKKpav6X?=
 =?us-ascii?Q?6+Kg9t3Qi+L5hqbZR4wRwT9pNgkTv5e6ynr+EW5f7kGe8Zer1VAksocYUf56?=
 =?us-ascii?Q?NlZwpgcT2aC3FUrBplW07M+LqnL+FiAGKNZZxbo05ab1H6rcRAuloaczmIxF?=
 =?us-ascii?Q?wPzkELtaru9mlf6EiXmiDl2844SgnmVQpPibUJo3GYxM5fgRiCuHvAVDdvVi?=
 =?us-ascii?Q?CWD53ansKD5MccyQiz5Wnex1l1HfbNax4C+/nBsNEAviqU6+xjcEcL7Nn8dT?=
 =?us-ascii?Q?8cnAPC5wjeO65oGCg4lx1xmYOq9u1pz3sWevrzD9Qm+sOk7kemll+cTVf2CX?=
 =?us-ascii?Q?NnY3Ty5kVyAEkS1dJqx1ukhtdW7U6apWStYuvzuHhPOYvLttO9vmJ2ZrWOlF?=
 =?us-ascii?Q?w1689SlfuvaUVIXLG1b4RLX1eL/LAFDEGvpk3a1bQK75kJAXtB8g0R0LmOWj?=
 =?us-ascii?Q?m/iOO+L3bjJRfgH8X0RC66xRaKbSCe+jkaVu/d3LYsBmQv3BQ9VVqb5ILSTU?=
 =?us-ascii?Q?PT0bIJbA3UefrrG9bLUbMyVszcKDsGrcumpXQf8km2BPEbnRmuLqH7eGhW8H?=
 =?us-ascii?Q?tP4EMLqPstTY1fQ5178HHg09Ah5+rdptNoHpFnlJJNXUeNJjYQe8gLh4tU1p?=
 =?us-ascii?Q?vEsyJlNqoo95lFhoG9UG3L5/OAwqwJqKWvhMoESWyO3yjvwXjTSxxwjgxfr8?=
 =?us-ascii?Q?blCsRbF+rIj3zuc2HfAZuuk5Pd0TaTXhrjIAGcZapOQZDg3kbxel8WMyCPex?=
 =?us-ascii?Q?dXGlf/TQV+rXWvMAr4u1WYvdl7SKCclCEG1RYfD2kRvH7OOsjXoX1ZgZcMIm?=
 =?us-ascii?Q?f28oxSXD64AGVDOcZNpWMS5zcaN8mokiytKeuFNiN63LWLp7y0QurkGMluoR?=
 =?us-ascii?Q?sD0oWJY/CTIKy6Vzhp5iUIQ6jp37l4xI8+IGGsCa7JZj0IuDX6+t68Qgz86G?=
 =?us-ascii?Q?14apyOVrwBthQ2KS1/XQH5kGgVmQx7cLO3oqISXPoueIs5gW+7pBPiPuIhem?=
 =?us-ascii?Q?C1axc12MinRCwLqtN6QidhOlMZ3LAhodBzuTrzj2uFTxwoTWumu7HuOODigO?=
 =?us-ascii?Q?r/o6drFPovRlsAcKx3aiozCy/JezTSQsBvI0UWGfqwLoenj6RX8DBgq/lpgj?=
 =?us-ascii?Q?rQqkGYdCnnqboE/OE6RxG7GqwXrZvQRangMup7FNzP9dpu0DjBPAh6iboA93?=
 =?us-ascii?Q?9sraH0yGbDop6l81B0cUX7zCss9oG9NuE+WNuynJFuyycaUXw0R3LToJsGt5?=
 =?us-ascii?Q?85uMdK4feKqZ00Kz5jY2GWRepst0v2swL2yR12kLTGcsmr6AzbHwfE/MWQVZ?=
 =?us-ascii?Q?BIAzyrVD/LE6qiP4IXnd5LVkQrRulPWZ6RHNPgzYLW4+0OR8OC/MIr9yfSTT?=
 =?us-ascii?Q?bI46DgagsSQes9YNhugT+Io0b3vdcvG5WBzhHkfhpc6oA7laxjncjqUyLyFG?=
 =?us-ascii?Q?0hnzgb3UqgdM1ORe4izsmPJKSz5dFHDAlfDbXhdv7kUSmU8rNeWNG0EWzlDC?=
 =?us-ascii?Q?YtSEka5NWJRW+fLZIFnKkHihjxqkPrl/ndDp?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:09.3875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf2d24c-3773-48c1-2840-08ddf1e80c45
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6287
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfXzI1PaptAeFmy
 K/yWnVnfgZXvvUGe/StL7K0dA+QJHuqUdPNP7Urdh0ydvqiQ0dhAH/2M5Hx/rrBeiMzxb7t7dKy
 jn4SsxsYu8CcIuzqL5nk8HyPIyk/iET8Bqav9qU3Crg3OJL1vqqkgExYrNF6jkaEfYu9adLuuLV
 Wt62j5qseAd475qLC9hTwIAJLVuY6OzZsEqyYVw98HyFnhKCurDRL23qy0TcShP4B4kJ2IH10Jv
 eJ/MqXVjD7NQYAZ91ZEJt7soly9L4z/48RE0P0NLcAbdzFKYNgjfV1ipI9/3JVw/LtyBTICec3f
 EOrBiHPutj0yJajoKgIOdE4IWokb4QPMbwzjam/ZzgON0RQcfqdGO8vK5e+T6A=
X-Proofpoint-GUID: 1D-_B3ueXhOwQ924dSH0_XwGi9Bm-aEB
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f765 cx=c_pps
 a=AOHpgdKyObXj/ZeNOoJHqA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=EeMxKaNHpS4G9r6iSpwA:9
X-Proofpoint-ORIG-GUID: 1D-_B3ueXhOwQ924dSH0_XwGi9Bm-aEB
X-Proofpoint-Spam-Reason: safe

Currently, the code assumes that the device that registered the
MBQ register map is the actual SoundWire slave device. This works
fine for all current users, however future SDCA devices will
likely be implemented with the SoundWire slave as a parent device
and separate child drivers with regmaps for each audio Function.
Update the regmap_init_sdw_mbq_cfg macro to allow these two
to be specified separately.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/base/regmap/regmap-sdw-mbq.c | 23 ++++++++++++-----------
 include/linux/regmap.h               | 21 +++++++++++----------
 sound/soc/codecs/rt722-sdca-sdw.c    |  4 +++-
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 86644bbd0710..8b7d34a6080d 100644
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
index 4e1ac1fbcec4..70daec535976 100644
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
index 70700bdb80a1..e92988aea3f0 100644
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

