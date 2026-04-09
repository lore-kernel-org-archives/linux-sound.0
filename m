Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B43E1207
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753045; cv=fail; b=lSK2/tVGPuYV4GnR4nRBE5WvPXzzA4MCqO0GYHT1yzJ3ZUe9JuPpkYm2q05S7tFv7pP7Li+ZBAtYj8WBthQst8UMKLQ+rS52FeQSllVU18e2/LBhQ51KzIT61KFENu2wPJnQ9bkSdMWUUzVXrS4sJRFZp2ESGxzM/ImmToru04I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753045; c=relaxed/simple;
	bh=LbQwWptAUPimPI6YQEYAeotL1f4c6EBwjnpM/hiYGkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOm/O01psQ0B/07eGG4VoMUEux1l6eEzpDKsZnEGszJVme/zwPL92T3kAHZK61xPx+2bcVtTUyz4aRHTneOsURuwgJuJYoOdELGbJH30PZjUbnn+GGufN6LPjOZk5hLcG8DpIZZxV0ea/l/5GDIM6zgmUlP2oULixKjfrW2+Oxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mGpJnAnA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BicrSjC4; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mGpJnAnA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BicrSjC4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639AXiSd3568436;
	Thu, 9 Apr 2026 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0B5HMzvtcdk10mYJXCNuHAiY25hdcIjajms0X1ZaQi0=; b=
	mGpJnAnAfbrJVgdsOHnvt5YM5ourSDObQFa952xJAtLp+23BqVQ95+xVvsnGtFYx
	FobbQ9kQo9kl0ofzVHSvS3QireXeuBV9c61CR3MnkBURAYS6m083f7ftW8nWfbfi
	kUZtPSMl1I4SWPz2UY4eI9TRx8SmPu7yIMYeC5g74josoMW7lCjdXEYdQl7exCnS
	44LtFH2uMrxxuB/TwgTBY/Xk93O+276niFD9cmtGH1I+A3Fh22AfNBarIjnzJVyn
	4DHhOIf92ejPsqNYYKhNueDtWrprlPMt3sbxa+MsL9lLsbSFUVu/6eyc1JwPYuT1
	6uLhafvAIBVBH2u/qcU0dw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022099.outbound.protection.outlook.com [52.101.48.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7m0yf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 11:43:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqWZHGo/xYVGFnPQ1MwWTgQRTpG4Dhp/t4847X3gW7VkPXxVYrnk1vUtGO7WNokVBW8o/a/fAC3pcOfOO/g52RzRHAl/bWrQ8jgmlI0rTOt6HThAEOn1wMjb9hDzoWBCjMSFoeBKr3b52f9MvhK6uWMNFzu0hd+IpmOxQe7UeLtz7y2BVqyQ6IGK1Zm261jEvnBxUIM6xUCbnWY4KZ8UzFzlVuIPxQsKBZ9VBcQ23KGB40kd9vzcxq3YTVPoqbBoxyrVzSY3Nch46W6RAG/JawPSaK+oJh+Pr9pt24RNt4yOC1atMcpGiRejO5sbpOtF/iVnCBoKlsL9+qhwHXV02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B5HMzvtcdk10mYJXCNuHAiY25hdcIjajms0X1ZaQi0=;
 b=svX3VV/st2KkMTddRPFUKW0NKMyZ0W7yIU/PLV/zHr1FKeU4JhV7Eq5UQlmnNp5MH6DS1Wxbjfkx+DpLuvxcE/1ZC30u6zhrj9WAdVPfJVzIdLJHWYxrJ6MzkngAKuQsn/gRe2AjOO9vbr6FNMA+K/AsAX1MZ/A7EtEYm+foCw9hM4Oo74umAncstL8RjlXJFjWTIw/fZ6rXEg/hOpStH7Ahi0clT3JmX7yWmblXZCBTcXKBWRPRvubIuPB5lywF5SDG6uAhoI/MRhsVMRlvzr002qt65K+AIlVm0BfbUa6SiIzVAI+Z/mSz4uoEMJY/DyTOlXU8jT65kSTwdYkzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B5HMzvtcdk10mYJXCNuHAiY25hdcIjajms0X1ZaQi0=;
 b=BicrSjC45UKxBfxzdosC6m8n0aFLhV1o/8z6XWZreciPJKPNDgI3+iGyxWLSCv7iTZ1l7v2ND0f1pIDjJmgESdvoHmxuW0DAZ1WALykvHiRputl2UCywKK8JLhnQ53TR12UoDRwqCFh/6LDfg8zTgfSgwzCKbBYiJTg83k6A1Gs=
Received: from BYAPR07CA0106.namprd07.prod.outlook.com (2603:10b6:a03:12b::47)
 by MN0PR19MB6407.namprd19.prod.outlook.com (2603:10b6:208:3c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 16:43:34 +0000
Received: from SJ1PEPF0000231D.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::51) by BYAPR07CA0106.outlook.office365.com
 (2603:10b6:a03:12b::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 16:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231D.mail.protection.outlook.com (10.167.242.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:43:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 52D9C406543;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3057E820273;
	Thu,  9 Apr 2026 16:43:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/4] ASoC: SDCA: Fix cleanup inversion in class driver
Date: Thu,  9 Apr 2026 17:43:26 +0100
Message-ID: <20260409164328.3999434-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231D:EE_|MN0PR19MB6407:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cff8e1c2-abdd-420e-9006-08de965723d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|30052699003|16102099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1FaAwT9Tn47ixZBaJnkfaZbmVx+ISgAz1O7vaGCSFtlXm4L2Ixsn+BLeJGr1Q9Fm/GiXG7j5yykrpBQNyuQHLhm6+nQ1Nfrnc9mmcfF6mN+aFErpaYWGGddZGoagEmtLtxDuCjm0V9YrnWQQQPY7ArE71jK1w+NIdiVGIfV0/OMxAg7Rj2lbPkIdyyamkTwr7kkAjPjgsPK7MWoi1MMiZ/a0/dTnA8mnD1pcr/8QoXifOBYEjUzQiZF4YJBGXlD1Cu2yuCda+N2RZDmvDnGIzcJ6ZiT5SPhKVckV9bJZLPpmOH1diBMBI/xNGdU1XzspnNhKJKNh/CGrSqxnvh188tLyzJRvn7HGfjGrqiSkCkn1O46IfPYdpVVHruoXv+V+P6xkNZV0plp5qo973jN9uwInRgNFicmN1elGA45FljBb1vqk/YNPup/QZXorf3UkfSqg9Y25c1/OzUDu5AUG319K7sYHrefDYwIq4JOIryMUyOx1SL+00DjIyvl2W2sCLa3qg82zVGfL8RNwKCpXZwCtKKtG3x7iZob5oUc8BBsbn8Kph5r2jZ0I/9LI/n652SVgoi6OIXgvQEf33dFHHdhe75LPzkRuHHFEhIJh4ultmC+yXNku0PWvP/5FPeV0vc4MQOSUJzwjLC4KbsXI7LQngWaBtmRUT2o+cwAWcQp3VnGUfJWrHotEYc5vdWkT9myPJzL27qFqNLrYe8Fgf7T0QV4ggrJj3ta9mOMTglvvjMdXvznaM85BLYuy20scxUxrNywsXzHtOOFQ3hniaw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(30052699003)(16102099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UXylRYsKoiSNLwA5WmRczI9+vl4pzH76IkPwyNHU8loBOsMGjQdC5LIvmKkvt6+P0d1Nv1CMpeGxSGym3ISdxtwTNqEByN0SaK3Ko2REoa/j066ml7dMp7k7xb9mCyF9P65koz6Szag+j96BtzK/tx8339zI3+0LBTKVzCMGpEXb0BBsnsGTPGBT9EaXum6F3Dqt+8GHEi1nOgU7umlV5lJKBzEtNv9nWY0fmsZrybTh0eM4nw01raF+NNu86RiXndgwpuUUPMEyNjH8SBOotCzMQVLAp08IeL2pr5pJciOoPMMeODbmVXI5xsdfm6x92nMgiFH1hSV7mhK/hdTaMY/pmEAKTREb2lanXXUTYrZAtBpHHKsi0gHaBra+glc7qvAc8/ha/WtADyMfKExBmoJLUZl84eiVgWJ4qhGjo19uJo5aqcoaNvQsntf539V+
X-Exchange-RoutingPolicyChecked:
	Jxk3hg5wTiv1HWjgwo3X6oIfgnnf3GiCmiAxRLI41IO/E9yMzyehfm8irXx8N+k/+Gtfg0m/0ZliZnXLqV1zcxWtDY8WKZu/X3W/LLpF/E9BwEzt3sf3+T8CQX/c9UuWVhksZ/c45ov55dgTeEQKVit+0Jl7uGxkAXoMRZI9xJSKMY2SD/lbQIHVAJ4qFk93QElbf7FAqBRYmabO0GyPeGZ//+QJrpS8lVJW4mbloKRPUX6nEEfi7kIvfRExXRp0mH11qNP0zKRHnM2McU9vPPcNDsSUWQ7UCBIo89X8uBx6lmt4heJqqfEJ7TeVE4RA+7NjubUoRsCoDD3SuuwiWA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:43:33.7201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff8e1c2-abdd-420e-9006-08de965723d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6407
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d7d73b cx=c_pps
 a=jIXKUehVxqJJWHHvInzvzw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=AolK9SVacgQhdpKjDxwA:9
X-Proofpoint-GUID: alaH0f6B4JvEzsIrh7gSEEdBqzeMDLE1
X-Proofpoint-ORIG-GUID: alaH0f6B4JvEzsIrh7gSEEdBqzeMDLE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE1MyBTYWx0ZWRfX69jznY1D+uNP
 xcbdAd7OOheJoKFc+E6NBBg3CIyGTYSk91UGDnvQGrmt+Ooj9xpM8Jpt8AFu9r8bQTYhL6MjY4R
 GETqWn/d45Wcm9iPAXbJUQRlRxrf0gFzZHHhF4mUiDTGDE24shrI+j0UofIz4GjCPRqetoK1g0i
 cURXfd6RDfvnMPYmqAjtjMomg6eApnR+dHTAhAWKE+vaXRxLCTE/Dev7auBW/kg5vKpS09iDmtQ
 qihuL62U8Hk+kwzTJUCs/N1b8rW92VvX8ZIGcNnhgpEhztlCwFzPK5hUfemgjzitFA9wW9Cje6u
 21eP/O6dtArI03DsHK+HGYK5AhO/Y1U9OX9nNo6USz0MPNCrS/B3vdG/+einHfVFzLPQqZ0wrHr
 S6cNxMW7rPBfnbujPe46x/WLBq9jyXqau/JngVbc5RMc/wuL7ENGUjJ80TaKDa6o6nWt0vAJ272
 O9Q/OTglKyFhbZ2sOQA==
X-Proofpoint-Spam-Reason: safe

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Fix inverted cleanup of the SoundWire IRQ and the function drivers
that use it.

The devm cleanup function to call sdca_dev_unregister_functions() was
being registered at the end of class_sdw_probe(). The bus core
creates the parent SoundWire IRQ handler after class_sdw_probe() has
returned, and it registers a devm cleanup handler at the same time.

This led to a cleanup inversion where the devm cleanup for the parent
Soundwire IRQ runs before the handler that removes the function drivers.
So the parent IRQ is destroyed before the function drivers had a chance
to do any cleanup and remove their IRQ handlers.

Move the registrations of the function driver cleanup into
class_boot_work() after the function drivers are registered, so that it
runs before the cleanup of the parent SoundWire IRQ handler.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Move cancel_work_sync() on boot_work to bus remove.

 sound/soc/sdca/sdca_class.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 7af4e5d1b347f..6e9b66f718019 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -137,6 +137,13 @@ static const struct regmap_config class_dev_regmap_config = {
 	.unlock			= class_regmap_unlock,
 };
 
+static void class_remove_functions(void *data)
+{
+	struct sdca_class_drv *drv = data;
+
+	sdca_dev_unregister_functions(drv->sdw);
+}
+
 static void class_boot_work(struct work_struct *work)
 {
 	struct sdca_class_drv *drv = container_of(work,
@@ -157,6 +164,11 @@ static void class_boot_work(struct work_struct *work)
 	if (ret)
 		goto err;
 
+	/* Ensure function drivers are removed before the IRQ is destroyed */
+	ret = devm_add_action_or_reset(drv->dev, class_remove_functions, drv);
+	if (ret)
+		goto err;
+
 	dev_dbg(drv->dev, "boot work complete\n");
 
 	pm_runtime_mark_last_busy(drv->dev);
@@ -168,15 +180,6 @@ static void class_boot_work(struct work_struct *work)
 	pm_runtime_put_sync(drv->dev);
 }
 
-static void class_dev_remove(void *data)
-{
-	struct sdca_class_drv *drv = data;
-
-	cancel_work_sync(&drv->boot_work);
-
-	sdca_dev_unregister_functions(drv->sdw);
-}
-
 static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
 {
 	struct device *dev = &sdw->dev;
@@ -230,15 +233,19 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, class_dev_remove, drv);
-	if (ret)
-		return ret;
-
 	queue_work(system_long_wq, &drv->boot_work);
 
 	return 0;
 }
 
+static void class_sdw_remove(struct sdw_slave *sdw)
+{
+	struct device *dev = &sdw->dev;
+	struct sdca_class_drv *drv = dev_get_drvdata(dev);
+
+	cancel_work_sync(&drv->boot_work);
+}
+
 static int class_suspend(struct device *dev)
 {
 	struct sdca_class_drv *drv = dev_get_drvdata(dev);
@@ -330,6 +337,7 @@ static struct sdw_driver class_sdw_driver = {
 	},
 
 	.probe		= class_sdw_probe,
+	.remove		= class_sdw_remove,
 	.id_table	= class_sdw_id,
 	.ops		= &class_sdw_ops,
 };
-- 
2.47.3

