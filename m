Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A73279DB6
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975758; cv=fail; b=FydA+Kj5jN8EUjtgm7L+Rv/XXvpgG8ywnotYBng2rxEzIbjE95Qf0gp2iea8RTrzDu6indQoeNtSXFqt8senUBSEM+6cEYyb4ehB6qXPup3wwR0lGrPBKvCmC8AkYV019oNhcu3V3QX0RwLDN+gXYoOQJtbC752Jd4XoWfuJJZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975758; c=relaxed/simple;
	bh=my5dVcHuSBDKzNApoPqopoFPftqzpbm3sT2itYTUpj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p03igiZFm0HW5mGGQtdzze8/EYNqXUKOQsR5jyRpk+pfvohK7HiOCvAjeuMtW1kZZK5m4qg5ONXi04nNtBJ9ehqFZxMsvAfc8HF/QHD/1CKQgNdXHpKPDTh3ywc7zcLkOocKYHiNHQSY+14HoRGSlmptqx0wGydhEOpLirLOZ8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XmQCQ8xx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JmUYr5wo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XmQCQ8xx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JmUYr5wo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAOJH941189;
	Mon, 20 Oct 2025 10:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AOcC6Batq3tgQ5kKpMXnPu8ckw+NEuxObYOIM9TBeCc=; b=
	XmQCQ8xxIW2T4PdoxFWulLBiNeF6K63nQ4aQTt0xhyDYwhk5olYjcL+60G7Kg29X
	Mn87+Fhu8ZVLGIrxZZ+DzoTwuIMLy/LtnfiEce57puPMmJqDEIehFAefTZl+ZV63
	6zEvd34j9GO8dmOyiMTGYeL33Qd0tvWzT7u6eWE4MlmSZZRogUktJhMYGVpGR2lh
	xuIqyocWmns7dvj7pUpR3QbZXItITLnIhq+Tqycw4h5OfwTcZ1gwjxfk+R30TUaF
	/g6z9i23awNtBqLLY93Cu7Jkx/xvjlqPEGQxfsOT9H9gj6edpQkPZsuC8e9eUN6l
	527G2UALYv8Y3k1twlK0rw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020117.outbound.protection.outlook.com [52.101.46.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7LY1bW4tWFOeeRxtJQ98/pJNYLh11PIiZNWfDwKAbmXIoA4srFOAumeu2A4xA6+NDdEJEjwsnuxPQ8PZGLr/6aF+itqe5M/9mrhpOn3IOxqL1cn94KOhSXl0B45PuOjF/OoQC+pVgz9nD1HvoFV097Q3YIdYrgnfVTFOsojuzQl1RBzGjWmrcKBLHsiYOVx+T7Na0cLJ7atH1qQcHBP5Pg41tskSRyt19/xb7ROwCFpEtPkcGWKbVW+DBnfeFnSqufTYKEZtSENoNOfnvaB25ftFKYrLPD71cYjqrvm1wF86pD+VyPyCmM2RCuJKUqQryq4WeU6IFZNIV+uiV1Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOcC6Batq3tgQ5kKpMXnPu8ckw+NEuxObYOIM9TBeCc=;
 b=Ew6HIfbQNx2fR30CvBBuIYlrsXxHhoPD200YfKNpCZXfPd/z/9jUAwJRoQ3EFB5IImxsHaEk5KgZpxZmbcF2U6MNwLn8wx1jjLH/Ui7vln8u0nJNQNA3w6q5BDpDmL5lQpg3VjiCUiAj0VP07NKdu/nXtLtR61Tjzp9zCF1V8oMjsKMaj3Iw7TKAjJFeDHvi2uxSMHUeGP++YCvOB+VhxW+OP1hZ6CbnF28ZT1RVVmQa3BrRRwK6KeNWpKNZuYGTbWDYkJwDe/tc0vXrBRes/8AUTVUAWWbzcHdQTcGK6fCGsc9EyvdJnO3DQbzj2bFKoL/ktbpAekGsh7TJsjztbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOcC6Batq3tgQ5kKpMXnPu8ckw+NEuxObYOIM9TBeCc=;
 b=JmUYr5woMnFe8mLCT1yWQWXILrEf83rye+KE1t2qXtSbelvuHpF8gFEi1HbBFJPl7o9oNba2QjnTrwImOiHnqEHZNXcCe+Ll5KNb99/wWW/iD9kC690tYcB3M4KVAxHdoeDsyFwVWJaLeOMaH00jZV4DLkMN4BDTg2603fBk/qk=
Received: from BY5PR20CA0027.namprd20.prod.outlook.com (2603:10b6:a03:1f4::40)
 by MW6PR19MB8039.namprd19.prod.outlook.com (2603:10b6:303:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 15:55:19 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::1f) by BY5PR20CA0027.outlook.office365.com
 (2603:10b6:a03:1f4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32F29406552;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 25AC5820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 02/19] regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
Date: Mon, 20 Oct 2025 16:54:55 +0100
Message-ID: <20251020155512.353774-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|MW6PR19MB8039:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a02bb533-cce1-46a5-a856-08de0ff11193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?57oo5+8JLh5vpJlG1BzWqy5lT3v8fsP101dP8Gxd3i6eKXiSkENS6i5bJJOn?=
 =?us-ascii?Q?CSBEkQByRyJYuKkV4yQc97YIg2nZevHP7OWyM/54cF9XHN+OYio4AmgdfkMD?=
 =?us-ascii?Q?gBQkYJqW3bx2++fcL/T7+C+5tSmCeCRnCmejRKaD9en4PCGh50rJLnTk5SE2?=
 =?us-ascii?Q?zyx1vDJdOr/UcbI40cuPh+xzDPNRU6J2jOvSO9Zi52AjQLX28gLR2jPoCVhI?=
 =?us-ascii?Q?86qYeL+URWGVD17y/gp/9PTNaIJK9WuW6fy1PHqhHxoLoplG69W/9xoxIgUP?=
 =?us-ascii?Q?0Rb1Qj+/B3PG+nNIrW1TA2rXYY3dWywHkNT2SP79HptOEbo+9p1+MHdOIIgc?=
 =?us-ascii?Q?au+EE/kQ7mAsqk9NvLjy6zwnsMhaFb4064gWyXWoJOGoBn7xLLKrpiNLKgCD?=
 =?us-ascii?Q?AtPzMELfsGgVwnkyvJ1dQQgx2KULCPDMmyFdrUukxAJxawlNne9GplhKy9NQ?=
 =?us-ascii?Q?CqYEpMeZiQkWlPMXddUOFvgnitOvOL55xnrFiTxiMNXacbYUO69DBuK6sPOW?=
 =?us-ascii?Q?VUu1T0Xsh/UOk6YzWBvJya8DKPrx5M4sAr8NYfMujvSuLm53CDu/wo5lpokL?=
 =?us-ascii?Q?Mey7tKanHUwOULUv9oJEORp0j6vkpMkCo16nBaRekyARLGtzfHHmttZpWPBG?=
 =?us-ascii?Q?vkvCo1UFsW5LNO3iAWXJpQprygITmPlWNBATWiflrQiE4RDFzx1ZEMb+CG0p?=
 =?us-ascii?Q?2DN6yTmB6mL8ETFDUSaP/nzsyuu/bANyiNzBWQ/kIkLFs2zFLtpoFG2stVVq?=
 =?us-ascii?Q?pIQPqK+WamXb8in+en1urFgmukkT9kVeOVo+pZ3F14VRugYPBXxgbClnYMWe?=
 =?us-ascii?Q?ys0aUXwXs23WuW2UEx7ebNM0+H+hABR6JQuv4fS2Sm5bP6+nAMOEl/r12tJg?=
 =?us-ascii?Q?UFGtxJNH8MtUAD2RlvIsLJVT+TWcRNe4n+OgaPnkrfJIfhmLXmPkKIHWHA6G?=
 =?us-ascii?Q?bHx5gEEWarh3vjbPo5U90kkWpW/ZfoXIDX3HzlHJumB+ddWvVu8Ymn55+GDz?=
 =?us-ascii?Q?pDoPaFD5UDZrjh48lepBmygqvcRiIP66k2GUZzeMve5WWsx7EbdgIXjaf06x?=
 =?us-ascii?Q?5/6pJXzrwmmFzx6XNsjAmD5rtAWt8J/8ULNOVBOmgAEdsfosA1sJAMZuYwet?=
 =?us-ascii?Q?VSKzZz2RoHRjl+diLzZoIPQuFQ9eIRIJZXoaTZNg5KrUZOvST1aZLspjono4?=
 =?us-ascii?Q?UG86oiN/qFpQm/epncdl47A/80nyMBU3Y8cg10GUx6uvyE6DeUmeHWgiN5bC?=
 =?us-ascii?Q?JsfZJ1WrRI6CwBGQDFhp7XeM5OIhGH4lPHAgpXkLuTcXGNEL2OYe9UuCAEoq?=
 =?us-ascii?Q?k7i1FlYXmCrIYlr/xK0dyfWyqV+t+0TWASJQb7fxposUt6+hjU4uE3+p2iKC?=
 =?us-ascii?Q?JALFi6Bphwwz1DC2r5SBjyrn1HRu7U2C9QAyJkJ+nmz9qoF57C4RsTRPCki0?=
 =?us-ascii?Q?YQj5KuuE64+V3v8rEjm/c81SX2uNJiKEHyMAlYZqcySkbUxnH2wUnD51rcfx?=
 =?us-ascii?Q?bSQ0oBqlYA225E/ay/pydkG9Mb60nXjnk8xNrDkgVMRoDfZM5nArzPenGiGD?=
 =?us-ascii?Q?XADPWPx+/25JV3TNd0A=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:18.6265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a02bb533-cce1-46a5-a856-08de0ff11193
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8039
X-Proofpoint-ORIG-GUID: etnER3N_hm0kcnmUQEpKOTpL8YkKcqcC
X-Proofpoint-GUID: etnER3N_hm0kcnmUQEpKOTpL8YkKcqcC
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6a cx=c_pps
 a=RrdOQlmmxp+bQeXV/0G7LQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=EeMxKaNHpS4G9r6iSpwA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfXw+HRIsASrraW
 GxJ7jqsETuIm1/vlzvedsnQoAYcEKBiaaBueakrEaL9nZXnmtRF21Z+jr0Mo72piRMfxuFkvNuG
 kugX3T2cLdOuGixAbMwZK52fcdCP5O8l6BmUVzNOGk2/WbBx9avCIKxS7KR8tCM5giWYmegQ7dM
 KIhIKraqwG4aYT5+uK0B8p27q5x0Ume5twopinN2xGS/1gEn90aYWb9/hVgIX65KmajQ1M+XlKC
 PPc36cGc4UQhKqnzJU5aE7G7SmjplGAzo6Q/wYFvo8wRNiMXYg1i7Jszed9/I9ktUHnD5e2mSwz
 82FS087GLxpLZyRbXQIZDuCKegPt7O4qVbCgUwKFWF4FzM63/0c54xIbT6LDOGoYtqYHnZu0v7s
 2kqpEBalr6ajxktCmEewFXESaNqyxw==
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
index 5ea40c1b159a8..a0f5601a262aa 100644
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

