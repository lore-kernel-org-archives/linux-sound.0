Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A4218ACC
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057753; cv=fail; b=a4/66smjNw3BOaHAFrybmyUGwkrQ7Z7K19dfWaNjN6U+lGrDsYe1iZIDMW59I0AGOyvkEITp5zuGqr7rvA4qAbmC6eavcIDoksxVIxupJmQw8r/c4zy7Ma/WHRBUIbWWUXD2SY+kRtvRwE6ty3iXuHA+x+Rql4bvkBiUaEqLMVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057753; c=relaxed/simple;
	bh=9MX+4sRoDKJ4tR3lGUqKugsfbpt23NgOewUoN6TuHzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jKGQg3NlptF+JcsFocmv2OKvSBiK+OfpCAFPXy8m+8L4VzQkWdJGRXHHDiByuBkzgT54Io6VDOv1SiSk9utL3IiXIzKWa4vqqfNx80BccjGviCfac13UjC3sMeZOhG7+d3CxijPuo8Ber+licAM0pMTuDsQue6NeJ5I9E95TisM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UC82lcQJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oYEBUud3; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UC82lcQJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oYEBUud3"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI5fMRb1364442;
	Thu, 18 Dec 2025 05:35:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PKgZNs5r6Z72v8sZhAc/Z7uGeBkswBcdaZc38BlaJ4w=; b=
	UC82lcQJ5+KA7z9MHiBL0GUkXoZ3MxwTedZbgMlGGQk5shHI7lJzhENLQiIgHUsH
	dOOQUEboDg9ccu6Xupw2jHFOyrLxoRrb0Rk31oQUB86K6a39Us2rLXe2d9G5MHFN
	fmz3EOzuAMbgzPeYdUwYOdFClXSdQsLIuQEPlyezJr+tIPp2rgmrutVIWbhHztSQ
	jYK7JChEqtv68oZmZG+Pe4Oso2cVAcTuowOSEadr8IJjVfZNj4kPcm1pytKY8DEf
	rWmo47lm1FOtE+JZU4vOTpl9vEnJKucaABWu0D1vBXDVl6/oqH7eMFF6FLoiJebr
	rJcLyKKuiDjgqAXi47kVZg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020134.outbound.protection.outlook.com [52.101.201.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eje0hf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:35:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfPY71ek3IeTXdrjQqBv8/yfmj+6ffX1/HHGXIWkIH/q+aLujDQyQaWfmKZdEXsQRwL5NIYrZG0+zkmy5zjjiGkHObrF0EAY2IZJ4VO8SRWr/gqGxji5EeOXXGjgG2Uf7sAIcBboAiIhvY7z5nIP2wt7E/gvfO6pFFif7c6GDsM2YsO7BCI04/je8WLJuOUPUjz7lndahdZBMjkYFp8Xhdt3hkwWcp4YLOxphMR9lrC+58CBTcMNjKbIgY28QbOzGV27lfnAPcpuFqXXg97apVMwiAUYUTR4lKdPBxzsNVzYgpd4ifCRuzRpWa2jFyBWqR9cQh6L5pgYHu0HpKOndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKgZNs5r6Z72v8sZhAc/Z7uGeBkswBcdaZc38BlaJ4w=;
 b=WNjvo9IOwvFXGmAk7zstSd8c0gQh7dMkz4nzaQ28gssVbgIM3iYQm/OlVK4jKKFqX0dpWXGclqdnd1hbbG+8koW4iuAcVdOBXgNqZJI1Lc7i70QkJoIZBBcrC2vNHucyYYadrTGhn8r8BPmEvitHoaqC/+2a+ePaiYMdF2mdw5RLnYKoAdgytDwmvr4avV8J83dix2rnr+LOHWuSbdX0bMrGba20e4dURhEjqhnesyKiCymzs2zXpDmttU58Uh9fizccFnyQrnAYHTBZgWuIw9hc7PV23szqBUdUiv6mCvEV0NS27Gae+/TNBx5Gl14YOuyaUu/tjIf9fgzTkdqrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKgZNs5r6Z72v8sZhAc/Z7uGeBkswBcdaZc38BlaJ4w=;
 b=oYEBUud3P0lCmrQ194QosikKZ2o8t1m5QPm8/DV2ENfMYSy3iNsz/meGoV+CQ7WLbdAmX+3EjQa2PmgoiPeOh0UmpV0itReuWKGXjK3ifmo8fVk+S4p6YFI0JeYFNnEepCxIE3V9LFpSIcBqQIZ6qQLnF/nYeFXLa9Hxed5qbLc=
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by MW3PR19MB4283.namprd19.prod.outlook.com (2603:10b6:303:41::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:35:26 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a3) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 11:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Thu, 18 Dec 2025 11:35:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4483840654F;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E37B822542;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/4] ASoC: SDCA: Device boot into the system suspend process
Date: Thu, 18 Dec 2025 11:35:19 +0000
Message-ID: <20251218113520.1287693-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
References: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MW3PR19MB4283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 599c2213-503a-45c1-fa20-08de3e2989d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UXkc9YAjoDQJgH5RglLlPmtkrF5+tmJLmMzdvaFyacO7vDGpUXHQAoFm+MqC?=
 =?us-ascii?Q?MXPM5NhPOGZyFmjXKfiKXFcZ4osoJ155zWx1LJm4E1hakrwhuP+eVQbjt14z?=
 =?us-ascii?Q?GWct62GYZer+Chehky0RhlqupcG2PSK2y3mO4kJ90f0szj7Js1617I2khQm5?=
 =?us-ascii?Q?gOlmBdyCWVz5PxlhOneqj3fjgRkjNgHujEgjsVO+qM+0+TqkzVMVV/YJntVh?=
 =?us-ascii?Q?HWXvw20ZK34nk2nAVgT+UMuiEtV3HtqQoBYtGzXRqgfKgIn0+vY/f1pppL5a?=
 =?us-ascii?Q?beEOMrFzpL+ofOGqAMYUOtT4R8i6wvmwCudmi0xVr4qc/It0HeCgcOZPSZrH?=
 =?us-ascii?Q?/xWNRhcUhpDuIQeIwWUmgrKoUWfC/GT/kseTu+kF8ma+CgipKlaHRYyHnlj9?=
 =?us-ascii?Q?TEj/hlCGI3Z7+ue8aIpo4REWAzPsb0PHQQo0TqEbYtsypcsUyTzjLgwqGK5m?=
 =?us-ascii?Q?9FZhqNgWNZxJmaa7PInBGomYg404vQOF872QsC/kif+mSwcIIapJB+I3fTse?=
 =?us-ascii?Q?QpHrpAKNHuxC9Vs5uUWjvby/D5GDJbD3RoKNTETjC85MQ9DGeFSasJPK6btP?=
 =?us-ascii?Q?QvSjZznm3HSk0Yjw2MblemGwtZm2Vf4rqeameQ/cogpUTIkMgCJaa5dnQkqS?=
 =?us-ascii?Q?gV6rGxuSD1ABPSBTIJGwpoHFpFN+U4FC64gj+KgF9kJg5XYgXBMVA05YKnAB?=
 =?us-ascii?Q?955n7aKhisXRvAM9LnBU8t1GZRFVyylV/UOfVFPkkDXk57v0UNGtyOcsMdud?=
 =?us-ascii?Q?+9j1t3qyoux5AcQhH3t8JsKJyfYy3FB0ptQGR82glPiAkWaJ46EBonaCpM75?=
 =?us-ascii?Q?vtnbnaRMpxu4GT2CvPIMAgECc7VYoaey8xyz4Mi0Ooh0sIiy+DsjLqn3MBEZ?=
 =?us-ascii?Q?Z18wMq0cMhlmdHlXoNiKAXZEWjDJsr1yUK+AQxGBLDXDRpGoy0k3PzJJOwvZ?=
 =?us-ascii?Q?mH/x7ZqsM71aK+m+kgMRvdCImVWyJKxaRFRna3n08q/6pPw50GpYHQlLwbUs?=
 =?us-ascii?Q?M65oSTLQ6eo2f52MTcJPrmT1I3cpWNBpRXoZBuZSvEtzaNWgLElmilI/GkUJ?=
 =?us-ascii?Q?P4mME24JR6iqP4ihg7ZAMjNuBuQmccyGmIv3zx6D8FRV4ylYwLYC1rLO8MRP?=
 =?us-ascii?Q?Ipb/Smn/2jZd9mj6qpny37qBRPzBfc89BB0YQWEtqYVFSnqOhOu82XwQ3EwY?=
 =?us-ascii?Q?/EDx0/IBtm54QhAGkGR2aZ8JIkQW7wAgLFTZkNzh3IiZ7YiWABGwgWKGWnnT?=
 =?us-ascii?Q?dKP9Dax/SxSddZSOV0HU1PwdI2dKuoZyZalAwl/yo45NusFnGyIogveTBbAA?=
 =?us-ascii?Q?n0uRpsPVWok+zG6E1zzX+K8ByFa3G+/BJSh/2nbeKNoowQOp7sUCqlaNfRy4?=
 =?us-ascii?Q?Q1WFTE+IbtDcGUGo2gA4UobIaeZD9rWttbn90kV7NZccwc3kRgvkQLz6gH+/?=
 =?us-ascii?Q?0CfLYHx37jAy4Sf/ibwZM/IRjBtmJ1VcvrPTTxk7fCk1yFjhK2TQ/+/02Zvy?=
 =?us-ascii?Q?+xWH57brzg/1O+kRUfmr5pJHLe3IB6xivIFJMgBDib/W7qmj6l/XMEJ7cbbx?=
 =?us-ascii?Q?Zy8IllgW+Ok/EozZhhs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:35:25.6533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599c2213-503a-45c1-fa20-08de3e2989d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4283
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6943e702 cx=c_pps
 a=h3Jk+6XEKCuoUZR+ZnWw9Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=HaEzm0aP01T4c4w9AGMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfX9y6dHCHR9s0p
 VrsB0wA1mMDwXbeJ5O4DXHALbdROCeLvVZYgACdDGiA+Sx8EE8sH7nMrnqj0ExsSxBmYfqvbpBx
 OJA1P0w80wI/7GCf0AFO/mm225tPUy8SobX/s2hgJAP4fn9Sniz44tRjTxFn9I+1c3CMRZm4Tz8
 ubO21WDeSUaAiaWpZ0V8ajsdkjlTM5/CVAyNyzwvMEAXYTxNmldOtG3TGk8yRrEcU6cS3hE1/mq
 OUBEdfBD2Pa4N6ZSYtIyTyvg2du0dEZOPpWPc2TjyYxFv6hzkWjtANqkk8OBXnqKu+ohkNMGwVU
 wJJEhV3cvU4nZQUvnIN0k4jA2WtT6scLFzj0ZrgTTtti7pHkT7Aqz4b5OvPRloSTWaPD2e4CWYW
 LNWmNCS44ymMkMV+B0iZ9I6LbOeuVA==
X-Proofpoint-ORIG-GUID: x7Ky6eyJj0JANgl612k1Ra3-XjIeHM8q
X-Proofpoint-GUID: x7Ky6eyJj0JANgl612k1Ra3-XjIeHM8q
X-Proofpoint-Spam-Reason: safe

When system suspending the device may be powered off, this means all
state will be lost and the firmware may need to be re-downloaded. Add
the necessary calls to bring the device back up. This also requires that
that the FDL (firmware download) IRQ handler is modified to allow it to
run before runtime PM has been fully restored.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_class_function.c | 71 ++++++++++++++++++++--------
 sound/soc/sdca/sdca_interrupts.c     | 17 +++++--
 2 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 8f4772a5ca4e5..5a818d958543f 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -201,21 +201,12 @@ static const struct snd_soc_component_driver class_function_component_drv = {
 	.endianness		= 1,
 };
 
-static int class_function_boot(struct class_function_drv *drv)
+static int class_function_init_device(struct class_function_drv *drv,
+				      unsigned int status)
 {
-	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
-					SDCA_ENTITY_TYPE_ENTITY_0,
-					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
-	unsigned int val;
 	int ret;
 
-	ret = regmap_read(drv->regmap, reg, &val);
-	if (ret < 0) {
-		dev_err(drv->dev, "failed to read function status: %d\n", ret);
-		return ret;
-	}
-
-	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+	if (!(status & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
 		dev_dbg(drv->dev, "reset function device\n");
 
 		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
@@ -223,24 +214,36 @@ static int class_function_boot(struct class_function_drv *drv)
 			return ret;
 	}
 
-	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+	if (status & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
 		dev_dbg(drv->dev, "write initialisation\n");
 
 		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
 					     drv->function);
 		if (ret)
 			return ret;
+	}
 
-		ret = regmap_write(drv->regmap, reg,
-				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
-		if (ret < 0) {
-			dev_err(drv->dev,
-				"failed to clear function init status: %d\n",
-				ret);
-			return ret;
-		}
+	return 0;
+}
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
 	}
 
+	ret = class_function_init_device(drv, val);
+	if (ret)
+		return ret;
+
 	/* Start FDL process */
 	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
 				      drv->core->irq_info);
@@ -406,9 +409,35 @@ static int class_function_runtime_resume(struct device *dev)
 	regcache_cache_only(drv->regmap, false);
 
 	if (drv->suspended) {
+		unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+						SDCA_ENTITY_TYPE_ENTITY_0,
+						SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+		unsigned int val;
+
+		ret = regmap_read(drv->regmap, reg, &val);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to read function status: %d\n", ret);
+			goto err;
+		}
+
+		ret = class_function_init_device(drv, val);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable_early(drv->function, drv->core->irq_info);
+
+		ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+		if (ret)
+			goto err;
+
 		sdca_irq_enable(drv->function, drv->core->irq_info);
 
+		ret = regmap_write(drv->regmap, reg, 0xFF);
+		if (ret < 0) {
+			dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+			goto err;
+		}
+
 		drv->suspended = false;
 	}
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 928355f5b1003..9666b1e6cf1f8 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -278,10 +278,16 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 	irqreturn_t irqret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to resume for fdl: %d\n", ret);
-		goto error;
+	/*
+	 * FDL has to run from the system resume handler, at which point
+	 * pm_runtime isn't yet active.
+	 */
+	if (pm_runtime_active(dev)) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0) {
+			dev_err(dev, "failed to resume for fdl: %d\n", ret);
+			goto error;
+		}
 	}
 
 	ret = sdca_fdl_process(interrupt);
@@ -290,7 +296,8 @@ static irqreturn_t fdl_owner_handler(int irq, void *data)
 
 	irqret = IRQ_HANDLED;
 error:
-	pm_runtime_put(dev);
+	if (pm_runtime_active(dev))
+		pm_runtime_put(dev);
 	return irqret;
 }
 
-- 
2.47.3

