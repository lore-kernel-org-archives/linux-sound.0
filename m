Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7891D34165B
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641146; cv=fail; b=r7fDDYEf4D0M4cgP3juyahx38mEAVyh525IYtPkW4OJY926TehXUdV7VM6xD/n9qa0Gov2wQMbVlQboqdH0Wx8zJ8UlCrgJUN896ycPgsTxG7jY+mBP21t95BaFn0S6yBWwFhl8aZhclyG+Lbm3qvWCaWk4M35EF4oYwwosBvaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641146; c=relaxed/simple;
	bh=CAXNPJ4/TM4mIZCyi+fX5HzgidbZ5O2Z1WG3WTXNCac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1UNDDPj0pfVX3jOA8R5PAC+aV/rHTarSPw6XwL7NS8Owmbj92W6KiXWwsFHaGrDOFCtidjhNySrWhqMMwwYWgJsHIQs68XO35zoOTNua5Um1NbPPdLltpsg2WToCFZLYyTR8z7Y9cNGcKQufbZvOUMzeKLswiZWJXRjAwzgW3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jvcxp/sW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JJpP/uhz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jvcxp/sW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JJpP/uhz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eULU683500;
	Wed, 8 Apr 2026 04:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7eiy9uyKJymGSgO5pqqT2Guq/0E7sdmwvgnhEhbri88=; b=
	Jvcxp/sWFm30bv3X5/r5Uh4Sxw6KsYjMOY6q36rg6sIzS50jo03hD2e5SpSzf/HB
	9ZxtABGhiyWSHlFJ9GyEnoQms8BbtSMm7LtN8SLB/56v/5EmQ6mFqzNssyX/1i1Y
	emy563bzsD4P7HEdc/T0qK9h9+GeGB/63H7bA+yyxEajXxcQKJLLHY2Uieuzu2SP
	VqYP8LDXDCBiEHyO3/2916sFuBY5PHdPr3NXcVCVWcLSxRreqCQeMvKG6TjvlN5u
	lju7ccxguDBGdLl9mFbzos8TUMTzeI/W+ZIYjfVwm5isDwCdkHkPA+vdtFqe7Dkt
	EAQ6+pjzbZxXpy3K9kUCvw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022079.outbound.protection.outlook.com [40.107.209.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7j1wy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvDfjRvdV3v3MxO9RgvR7GrAii5qZsRTnTlhmZFLth2KSvGPfgJHMN/WhtCy1cD6PxPeWzUAcbYRZG452G6JXdsuR6YIEqz5iZIpw+mPx6ulyoZM93INm0J7DshNAIT/PVsVyrd0x4Goxc4IyrCCesP1GRBtk66hfn6HFwkE6WnDDTiulhCxosEjuT9/VbQOTflLGMEZ1Srt7uEI/9DMoGMygHMgfew2nZ9k0LrcW2Ipo2kYGqKAITV/ytfUxwcoresDOdkWfoY19EkleIcBsONpeVQTqDF4F87n9ErI8k/nxk92eWAFAodE7F2WFBDUPe+Tbe3E6FHaEs0s2JoRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eiy9uyKJymGSgO5pqqT2Guq/0E7sdmwvgnhEhbri88=;
 b=i93vy2oN7V1W1/o2Twb32NSTduY9ffyLpX6zg7eW45t3xjFLMBCANxzdLZchinyRo9eQAhNk8znYF6npgMJU/8SqhXdLzPjSX7ix6E7v7CirQQ61H92eRRyteVdp16+QWbAiERs6+8W3Pz6RMjqenstjeJLHAH/N8f4zLbFVAtgKV+XH61figD94sm+8DTAEASpm3ohOQu4zTlYnMuZeSKEn0Zua4gvslHWWdkwGSUUcrLfI21lVlTTwLpbA6aDsvNAIFkZNLw6ia7/oGEZt5kWMjyTwp39hV9TeKyuYrdzzCSVM/nmHzA2W+3DWZKtHHLTcLE3Rx9ecz62yp+eoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eiy9uyKJymGSgO5pqqT2Guq/0E7sdmwvgnhEhbri88=;
 b=JJpP/uhzFlGkpwy3norvdRxgmJ+jg5Vww6YpJR3o1yVqJmT+009+bWV9dG5uYYZF7aHN0JaUVnWYgteIXlneeOkP7G2f3BKNVH/1xR33/Zg1vPLIopf2vyTvRjN9rX7pxVxTP5F6Gk6IXN7JW4VMpAqAtrkjxP/LCeQBmUzC7Lw=
Received: from BY3PR10CA0008.namprd10.prod.outlook.com (2603:10b6:a03:255::13)
 by DS2PR19MB9103.namprd19.prod.outlook.com (2603:10b6:8:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 09:38:42 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::48) by BY3PR10CA0008.outlook.office365.com
 (2603:10b6:a03:255::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Wed,
 8 Apr 2026 09:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C1A88406544;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A963B822540;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/5] ASoC: SDCA: Fix cleanup inversion in class driver
Date: Wed,  8 Apr 2026 10:38:33 +0100
Message-ID: <20260408093835.2881486-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|DS2PR19MB9103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d0d74d47-2a8a-4922-b62c-08de95529eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|30052699003|376014|18002099003|56012099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t/ZIODEH8kRczKfPRS0aIcyk+/DI1Bq5c8k0bawwzYiUjFmZfGZcUSao2PlLG3gJZoy1fIaJSNWLCqrBDp7K+3l/ZwMGHk7ZPS05IE+MuA3iQYScQF5uiEnNGxh5nsrgjoqdZFPDtZOzQpVw7js91OX1PtUT/gy5TGR+1eCr0jEEtzCwhhbhZ/5geNVkh7mEucTA6s2IHp4beeATNBHP8i7WoLJfFAp59VlGbxiaNGBe+OKjOZZ1b+MaF4gb3ndQCNFkvJlYepQom5mewLh69tIdwUl2I/nJVvu8mAARPeSZDpV27zzWKsjFpoCJyRy2vc8MqQBLL1IxG33FSTjaDl6E+wbYn+dP8u9O22xxS2/mzBECx27Pni9hF/zYhkCBiSOtnvq66eWK/HnYgkIFkLmBtxuld1caTTCxCS9FyYg1AOeHrcBMHwsu6Y4TYIVQ+flKHkTXHoIdeI81BECZ7W5+9FvNpwm3tb8myby557Pqbi2tJXKeRg+xq9zSNYQdFPjOdA2iVFSyl5QiEvL4b25mfms0uCM/kzpRfuKiPwJrq3CpzJOlkaxegq2fm1FbW9OfjPnin2dBYA+drnO7c2/ZuLVrT0hwFIx4vOHIvE4/NVX+GRwFnmjKxwqKyn2lPzqVKpbXx/DItenlWyrXwY+TfwBO9j1xEpfo8kDNf637zn0W0ACU7xqUVdEDvlYg9s9hX2+8UFAZl7CBpjJpPjloiiJM1S+NeX4mSOO5v3yco4lhSOhSJR/cLIjFXADJeHa7fxior1yZs7zQbUN+TQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(30052699003)(376014)(18002099003)(56012099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mD0/u3A8gmDbEMx79f2jC2p1/6GnNGDkVOiWrWoV4oD6Ie5e2ois4fm0tXO8P+xMEJ24k3aSzG/9MC0W9f0epL3XCe/9XK6fQaBFmYU8tZ8IoShNe1l6tOKNYIaDmhqGnuWtjI/BctnFLs1u4nLtetlKpHf8TCMxm3Zcz199lnauEOpojgUIUfskmDg1rEoRApBgetDQC/BdsT9Vg7cUKVanGjV2K433kNXshczCMLGi8fnsRMPC+kNtUsoyXA6gdxiAztXCxBPNfKcHcj4T4P2FzcjpVXkv4WDMg7cqQIjx6AWc5cTXkLoW3f7c3OdLUzotA4wYiqRlRoyImfa1WYDBxbvlrgIcjCNDL6tMAbjjxABb5R3LA2e8PwIrnBX81OOSLaf1vd/7z4m/xuy4y/WwKFQGeE0nXTHoj5HKnSmlGw2FmpNmsiRcHVx9JFx6
X-Exchange-RoutingPolicyChecked:
	k3abKp+b1/LdT9sX/PyRmzCo6/nxNjwS3SMZGi5ioao3+bl3GOcKDBmqR0UiuYIde4z6x2Mu8M5oHmeJMGwdp+94Bm3vWwOChkz3tLpBDyjjVecPzYZIoZDWq8nM/LAV996lM9EIvBL1iuJhTEAN3HVd8Il5sdYsQPM4b+pkDTlInqnzrCCWXXC+WmKtNt3FtlgtDrlfW03Niadjlbkdc9wMlgjefz5Ptm1ZVIwUKcweCmwWW3zPv20NFlo1JSl19KQKwPpCMSvF4rqd9T7tlFTAk3qhuzZNUdtOY5EEhElvCuCUf3XKtHYXSOyJhEcJEqmTZGqV4rRhhxDs6mf+jA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:41.2009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d74d47-2a8a-4922-b62c-08de95529eae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9103
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d62227 cx=c_pps
 a=/ox7Nx15/I3RpRoI+9JZHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ovGXA3v0UUfkQ7_bmasA:9
X-Proofpoint-GUID: DNDgiKv5jTvAWYe3K7EbeBu-LvlpVsKx
X-Proofpoint-ORIG-GUID: DNDgiKv5jTvAWYe3K7EbeBu-LvlpVsKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfXzn88ldpxiUx3
 Vuy/8SdWxVi1ZKV1tGRjeMYa+05lsWkUVx0v91ScP6e9ZLhPNovGFegc/0bghRrCQKp9ud1YsGA
 zpi1/u7pdWbwjb6JAGTbgM0VyLQxhSs2fVdtSWTWUDrTsPnqWToM9uU8ny/NzAW+DXXpl0PtdKG
 lr7Hzl86Wndi/fv4Mm0dk45qX07mlS1QuEDA3b6zClC/JyuRJQiy2o6vqPD9rfvcU45aF5iLiAF
 AzwjkkfKevNHe/RusMdzoQyW59oI32oBXaB5fWieB9DBdXW0Zfc5ue+4Wf8wjzMFa4++i55TFA1
 Chd8foswscZjTFZ5lAwboTKQnOxVEYDZ4YO2JIgHNBxOelU3OqdRUSoY8Gr88Qzhdu3jWWqf6i9
 rmEv4bf82PurJfE4IUuVTlYYm26Sq7c76NHvJW29NUnYvBkq6bHu+mwKnBCrjfVcg4AW5imTgNt
 NWWdbIOaXOdIX/1c9ZA==
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
 sound/soc/sdca/sdca_class.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 7af4e5d1b347f..732737f969891 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -137,6 +137,15 @@ static const struct regmap_config class_dev_regmap_config = {
 	.unlock			= class_regmap_unlock,
 };
 
+static void class_remove_functions(void *data)
+{
+	struct sdca_class_drv *drv = data;
+
+	cancel_work_sync(&drv->boot_work);
+
+	sdca_dev_unregister_functions(drv->sdw);
+}
+
 static void class_boot_work(struct work_struct *work)
 {
 	struct sdca_class_drv *drv = container_of(work,
@@ -157,6 +166,11 @@ static void class_boot_work(struct work_struct *work)
 	if (ret)
 		goto err;
 
+	/* Ensure function drivers are removed before the IRQ is destroyed */
+	ret = devm_add_action_or_reset(drv->dev, class_remove_functions, drv);
+	if (ret)
+		goto err;
+
 	dev_dbg(drv->dev, "boot work complete\n");
 
 	pm_runtime_mark_last_busy(drv->dev);
@@ -168,15 +182,6 @@ static void class_boot_work(struct work_struct *work)
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
@@ -230,10 +235,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, class_dev_remove, drv);
-	if (ret)
-		return ret;
-
 	queue_work(system_long_wq, &drv->boot_work);
 
 	return 0;
-- 
2.47.3

