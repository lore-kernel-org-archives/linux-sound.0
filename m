Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72B36CDE9
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=kAt8I5iBk8ca3zUAbz1Ua/5hM2AtwDp3KY1KORInZorL9z6pQudJ6fqCsLMdTnBNYaOOxX/SS7pXid5AyWSxAE7DJiPChDfWRPNRCGsL5fEueJ9zTjfMZknqCxT97mpGjQwnI7ERClAac5O+GytDCfIWpIQarAxB9gdWr7dlupo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=Kz/26gn4Y8KCKz2w6nrJ871IAITUmbMf7UWVKYFA/Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEsu81Dm27/8m3KPk/EJqzmiPssDiqfGeOHzu/twLmckkzI7OgzXldy/Eew77n0/TsfWALJgAPJbMW5+WJWkGAqKnjmcVtJviZhgU0GMeLzB1C5W/zbVpEAXJ01GLR3SHt1A0D2JcOHPmpm5MNXcHxoeElhN8NdR1ods37nOnTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XY2tqmqQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C43zSfkK; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XY2tqmqQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C43zSfkK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5859A7ec3552596;
	Fri, 5 Sep 2025 09:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZcpbmXN6r/mWlVGw8qimcJcnW+pV7veJ4TrVK1y02K4=; b=
	XY2tqmqQiAR8OQDJ92ji1ZDMAnUVPZsjCGHmC0nAGwMsmJ21aXe5dJ8Kk3EzXf8w
	mw5Bq5EAQQ61P56G7caCfCPaMomes9J3eIcdBPBbk19NRVFJMpiNI0apvIhHaAKs
	aklQ1eVpdJDY7x4oKyCUlS+y/3/v8VUdJuhzMojIblPwcl9+BnPbSKUnDf4y5Vtg
	ZcoPe100shSMnpuTbCdjP7/5s3TdW74NrTTQ2aZZLAu5YyvGX92J07X7i4NlWNFt
	c559ROCfrqwtC991okmI1bvcEWGAjd2Xfqu3tFngrMbpMuzaR+ARYRrPbUKplfZK
	TL3eMUPPXW/rH2rhhDhWAQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04hn2231.outbound.protection.outlook.com [52.100.162.231])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48yw0b0bk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXsA0lsodKsheRNB85lKDG54RnnPvM8vAZ7+Z7mydcYNhJDiLp3QYH7KHAEY9F/pYrWtBTTFpB4L+QnIO2eBjIDNNa1AD2Hyqj4ubZ7HWkvIZBX60bw5Iw8wBua7QcWvfXzxbEgsYnpIqDgZ6ckhokCxsboAZnXwOBVrwju93XoueuZGZZDvNTFe5ARPx4cI40AAy88WbdEtxlFK+A5D3/G+f8eBdhGeZXOaHOVLv+kqTpUVjkFlfrbbGey3obhHKL3u3YyPgZOFyY6MIZQb5NzoPRfSA4k1R0sQz9v7nVdFxy0a46qsPVFetFieYWKHcAwy6wwszVNEo6O2B8p4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcpbmXN6r/mWlVGw8qimcJcnW+pV7veJ4TrVK1y02K4=;
 b=eZMzZJbbcHpFfBxDQVRKv1RWk2+/fXJIk1z3ciP47pmKam3zTZ8ykZIHF1aWM8sHhpwz12gPnh/zsD135eFDZCZJn3QoPgE8v/JmF4HtIhzAy9zuXquV7Kfzl1otabGbPCt7K7wxxuyXJdUWS4kShEoQHric5Yl0JO3DAGFDApsecJy0W0NtLEAD3U0pzHcGe9V1L7q8/TF558A+e+/vKB4pnx/hbu/YED2GDG+a0sZLQPEaoES/4NohSLZHeI7ExWKqe/SVBgXjNSDhp9O1BTy8hYGW4X/y/Z6U6VgPQ62EXj2bVb4yRqWtoYMhGDwQKDIPgV9f8R/xU6Dnbhf8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcpbmXN6r/mWlVGw8qimcJcnW+pV7veJ4TrVK1y02K4=;
 b=C43zSfkK9BZ7cN8ku055GXsVmLVeF8YEQRZ2UwTQPS12d+v4Kr2ADb8m3u+Rf2TtB2aQNff3hfJShga4MtkldE2PPb86f9whIIld9mY+J7PmNHwZLpuuh+Gw11zqkzzy5mXujl0Q0CgjYDa+65t8QKOY7aIISviQxwSbUJEzzH4=
Received: from SJ0PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:33f::19)
 by DS7PR19MB7649.namprd19.prod.outlook.com (2603:10b6:8:e2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.18; Fri, 5 Sep 2025 14:31:32 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:33f:cafe::d2) by SJ0PR05CA0044.outlook.office365.com
 (2603:10b6:a03:33f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.8 via Frontend Transport; Fri, 5
 Sep 2025 14:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.0
 via Frontend Transport; Fri, 5 Sep 2025 14:31:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BF423406542;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B88682026B;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 02/15] ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
Date: Fri,  5 Sep 2025 15:31:10 +0100
Message-ID: <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|DS7PR19MB7649:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f697585b-37e8-4e02-782c-08ddec88e756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D/9pD9huGON1zEd0vPCasXKDyXkq5PGz4ZnbU6Kif+fZQunsqoM619ABIQLn?=
 =?us-ascii?Q?rX2Y8qmwiyhGKJiuiXSZm9xATAACrr9chLNt2+YL3QG7slkJVkvdfZRBEMpC?=
 =?us-ascii?Q?H35FZNdOVtpTWXwOCFuj+PKi9zWW6IlhiGf4PwsphQ/vPS5NamN+YGzHemuh?=
 =?us-ascii?Q?sYJOuloJqF+yRHTUNfn545Q0RZnA5FXk01y9L1QSCRQfahwsjwdPGPS7neOM?=
 =?us-ascii?Q?3l4SI2cVTDd0ooKbsQVJhgc2PotIlXaNfTUpDa5/hjkcGniBq2+azj8wzz3X?=
 =?us-ascii?Q?bn5SSccCdnKPrL6KfcHqwBYibMHeRqEUU9+EtiyD8ZFnOTCwjqtcvZ8NUINc?=
 =?us-ascii?Q?h4HvK2uOLEX00aQSVqehYBtXYLph/HUocw/+T8Ry4KD6PBdyVih9TjmpqLm4?=
 =?us-ascii?Q?kD/6+ulMZCYEoQQ7+hQsR7o+rVQFhWfxXAAJoeyLzudRjFcPTWp5uw0bUtFj?=
 =?us-ascii?Q?d/mclbMrcd9CHnGMv3NI5G0zIG6nGf7e3rhQldIp3gX+2ZFD7DuD5wekIY/6?=
 =?us-ascii?Q?1PjBaF2y5cT+4B94wC3UrKW6nRUxLN7hAZG+wBQTmUsH7SK6+8wnu2mnosLw?=
 =?us-ascii?Q?EA4PelBcnROflHQEW8zUo7AyfR/CZiEOWCRWwJv92anBoEDAI7/kXXVKZJLs?=
 =?us-ascii?Q?Jh1ccjofe61QU9wKODbrvK3KQs0oN2BpOZGa9OEL95QXjjhLa+I2Xf6opvP8?=
 =?us-ascii?Q?Bt3hXtCWukXz/8qRv60qTJj6zUVORDRQ43C5d3YHPcVjlznU+31G1cfQ4Hpn?=
 =?us-ascii?Q?hYffh086ZtngOSyUGqcTIdgFEdYS+ScggcanLgPjil0cZwzF7haxjLsZxUFR?=
 =?us-ascii?Q?dakIYxGsLChuRNFjIa/MJVlqKtm04DbfyvA3nc0pkExRnCY2qA0WRClNX6SM?=
 =?us-ascii?Q?H4dQ3tM1+mKeGDBFBIjifWPFpqkkJ0fi2F3rHnTKDBP4amPXpdRBzp3OwJ63?=
 =?us-ascii?Q?9VDR8a4IVgHlLRe4EHTaZCgv6JCB4BAoA23VRYZr7Z/nRUJuCkiZLwiro0xB?=
 =?us-ascii?Q?Tpx8PZntWtmeFgg7/s39LZHAHh5x8iv4q3Hoxfx/jLFUsb+WjzC/MJ/A37Ux?=
 =?us-ascii?Q?UWSR1mDZi5lDYPLhlxYTpFuVSxL7EGQz/R9XMWQM/aVMnw0pXXpppp8JziBi?=
 =?us-ascii?Q?GVtDzF1e/q/3RL4CyfnQkNz4XuLO0fDCJoXs8SNnuzrJ25Kv+PehBTaSVLJ6?=
 =?us-ascii?Q?pmCpb99YIWfA6PJv4jFa3Lqj1OPekdJoPDvI4+U1k9ZndxvR0qnDDOmNKMmu?=
 =?us-ascii?Q?XJxg/D7c0mL1ZBE/PMmomHDEjDXdNcXn9LQGPCTUYTgTWBF4zG4RQCGQ7oRj?=
 =?us-ascii?Q?4Fb8V6lhsB0o4szcFiETrmc2Ss4AsGD3EBEfZe1cbKefOl8UuKyfKZqkmVG2?=
 =?us-ascii?Q?wh3sJYKXr8lkjiu85bhyQ+/G5hQ0tz2n8MOdGtgsAy9H3fYvcYHC9aHkU3cG?=
 =?us-ascii?Q?ULbvHuV6LV7sDZwDHPTpz9knP6t195o3GtmOnb+qFuY+ci7nxpfBYLYDr+C0?=
 =?us-ascii?Q?YFQM9l60JHjearKpb/4RvmacH7Ts2CZM8hCH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:29.4138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f697585b-37e8-4e02-782c-08ddec88e756
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7649
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX1QWPPz4V4dKA
 mCcjoq23bNwCCwA4tvj7DEoHtnqNfHOBFqfOWOieL20rDb5bZx5ht1zDq8nsgdzsaIOwcVrRgeT
 8pRRCFuTRFgXdc2KTZqzVdU10bkUlnnqYafqZL5YbIeNIl5htbb8bvLa5Dw7bK5X75LG5huFBld
 KXjOVWFSrfB//TArx/WqphH+miEG6wcoYnXfaVu02J7m/4I378+aMexVAM9D8gBFTxpuO4u2CVZ
 5gywRYgak0HFgEoYv4Ks7ZTLJMW7MLqaCTobBJyt7wSyIkAa7Y8RoLB6lroW3BrFFAlcJZ5whgM
 pW0urVWRNyUCAD8HuocjhnEBMd1S8YW1IiU/xSY2iHSv8wgsfBd67rFx0Ujp4A=
X-Authority-Analysis: v=2.4 cv=YJufyQGx c=1 sm=1 tr=0 ts=68baf447 cx=c_pps
 a=fPIxuW9dnW3cIHt0UphT3Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=2W7Bv4yKaM6PJBoyyCIA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: x-hLz-2ujXABmbS0xfF8LeI1gbCqj7Os
X-Proofpoint-GUID: x-hLz-2ujXABmbS0xfF8LeI1gbCqj7Os
X-Proofpoint-Spam-Reason: safe

SDCA interrupt handling is a bit odd, the SDCA IRQ registers are
defined on a device level but the handling of the IRQ is at the
Function level. As such the regmap IRQ's PM runtime operations need to
be on the device itself to ensure those registers are available but an
additional runtime get is required for the Function child when the IRQ
is actually handled. Add the required manual PM runtime gets.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 42 ++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 79bf3042f57d4..6775f0f7b5659 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -11,7 +11,9 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -86,18 +88,25 @@ static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
 	struct device *dev = interrupt->component->dev;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
 	unsigned int mask;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for function status: %d\n", ret);
+		goto error;
+	}
+
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
 	ret = regmap_read(interrupt->component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	dev_dbg(dev, "function status: %#x\n", val);
@@ -130,10 +139,13 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	ret = regmap_write(interrupt->component->regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static irqreturn_t detected_mode_handler(int irq, void *data)
@@ -146,21 +158,28 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	struct snd_kcontrol *kctl = interrupt->priv;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
 	struct soc_enum *soc_enum;
+	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for detected mode: %d\n", ret);
+		goto error;
+	}
+
 	if (!kctl) {
 		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
 							   interrupt->entity->label,
 							   SDCA_CTL_SELECTED_MODE_NAME);
 
 		if (!name)
-			return IRQ_NONE;
+			goto error;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
 		if (!kctl) {
 			dev_dbg(dev, "control not found: %s\n", name);
-			return IRQ_NONE;
+			goto error;
 		}
 
 		interrupt->priv = kctl;
@@ -174,7 +193,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	ret = regmap_read(component->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	switch (val) {
@@ -195,7 +214,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		ret = regmap_read(component->regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
-			return IRQ_NONE;
+			goto error;
 		}
 		break;
 	default:
@@ -206,7 +225,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 
 	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
 	if (!ucontrol)
-		return IRQ_NONE;
+		goto error;
 
 	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
@@ -215,12 +234,15 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	up_write(rwsem);
 	if (ret < 0) {
 		dev_err(dev, "failed to update selected mode: %d\n", ret);
-		return IRQ_NONE;
+		goto error;
 	}
 
 	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
-	return IRQ_HANDLED;
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
 }
 
 static int sdca_irq_request_locked(struct device *dev,
-- 
2.47.2

