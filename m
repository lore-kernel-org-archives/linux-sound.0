Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A13E0240;
	Mon,  4 May 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907421; cv=fail; b=UcG/57IkgO31hLVHSoXtgI0PABnzCRFI/mMr48tDcdxp9ERFoZjo6e4qBE2EtFPIFPrKF/YW4RoWxFLe/F+vLX6GJglqlRrVI17bQAZAFjePaEK1jCqnCDkW2up1M7iJ7uoHL66tIgqPcpqjZSaImRi5lgPAL7ONA3T0csVAVhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907421; c=relaxed/simple;
	bh=BswhWfZ/V81BoCuOZmcC4+LlHCkwqlF+xp7d4pPgTFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFXmLoAxUCYXx3H46FwaLrRfYMqxXt5nIHPaJM4yGQalQLuPl0gM3gutVWsYZBYdSvBNaqUHU1hSG+9u/avGjPgGUR998fL1P+Ph7d5zRiDXxH/um72UE5xagRnFpwjpbV8TrcCcQpL1nsDW5EvXXoiUOfx4YGid9utxPvCoCu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UOD6xDms; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lVB4ca7u; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UOD6xDms";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lVB4ca7u"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6444xMJo3637866;
	Mon, 4 May 2026 10:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=AjmXiHqRmbajApgs
	Nu7xzgmMIrW+BnRF2yANZyNMdP4=; b=UOD6xDmsGIvCtT/KZ5DMc2KIz1Id7jwK
	QP9okMMbnm2mYw+IVL/pqfRKqmlmadSwFQ66+zRQ+RUreCDPzeE2cr9XPETquMHY
	/eU4y2KjNgFnR4jQsP5gqdNpMS1MUFj4Ia/+XETarp/QDW3hQl2KlD7fsU3yZkHH
	tWWxrNqUGoIBkgKBCuyXjFT7tuACHfTF9hSTCcLrYIBFj6GHbxtaBE8cEwS7kndv
	HQVFYIrMW+bKLZXKMQMu/uoJDCmZHUXoTQe/eFzEUo8JL5qQmUmYL5EsJ0dWUIEG
	z4p0lbhq2aCtkN9vrHmUvw1P/zvlz9IfaYMpj4b44NqAYLiUbsxqdw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020079.outbound.protection.outlook.com [52.101.56.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0t2q0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 10:10:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYIH6nRMXYg7dha59T94b7baz1ITf9wp0/WxqHoFQiQVFbyLIdKL6zdjkv5adszuE4AJpWNXdn4K3G08RieMNv+JI7QCTSoOjygeRxdatA6jNC0F9G9DmmQIrikoKaohcMh3JO9Jy+y67/12f9HV9g+1b6slhJUWADSR99JT/YTIhNvFv+ZBqSQj/4EAmFVnkq1PJY4sGBoPP55PrJ4fIqJQ7iInE7x35uw8EGp4gMPcH9zzy0tQsvVp+1lNyik57cQ6cccYZj66ikoj94SAsmo299hIqwXa+IimMladRzjnlb/PEdcbnltagG5hbZp1Qzbk+XXgg8hPSavNWRvYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjmXiHqRmbajApgsNu7xzgmMIrW+BnRF2yANZyNMdP4=;
 b=ePEGg9iSK8JKYeXwzuhO7fYmpafGqSiwKM0A5wzLSR4D4vlHmwLJk9IMZqYTx3Zs/WCPS/h9TFJqLEqp0wG1LAKj9QlSR26QQ5XB5qXSp3+PpADcuznF7I/V6Kl1MkJa9LXd8wpl77KZrsFKCl0QAQ7LQUzW/yO9k2hdDJiVZoV8FmppR6WCVBtvH5tV4EepEmOBnWhpLli5PAuYZULOxg5YkV8K+1i8GxnIzacoPIb24oUPr4dI1Fqdc1wK2fmezPJQfl3gFu5jcP2tGdDTZZ9LXpUnzg6DPBy1wky0vBFZEKM6gyiWiNx4OkD4mOvTDjzZALKmfS2ujasdV7Z8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjmXiHqRmbajApgsNu7xzgmMIrW+BnRF2yANZyNMdP4=;
 b=lVB4ca7uYDH0XLscwhRhrPynmV9jC5DJd0KDouVq+c88mOUut42zsuBbqHTwhd+Mo/gYLI3h8ELf4x93d0ktL+EbxbDs2tX348BQEAk69Z2NxY61HZC9zvfonWDwUuMVmw+nJ0qM8cqY06zvMxz8asIKU8Y0xgQ7GC0twu/VWr4=
Received: from DM6PR03CA0022.namprd03.prod.outlook.com (2603:10b6:5:40::35) by
 DS2PR19MB9054.namprd19.prod.outlook.com (2603:10b6:8:2b5::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Mon, 4 May 2026 15:10:09 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::1d) by DM6PR03CA0022.outlook.office365.com
 (2603:10b6:5:40::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 15:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 15:10:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E3A8740654A;
	Mon,  4 May 2026 15:10:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CCC6B82024A;
	Mon,  4 May 2026 15:10:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2] ASoC: cs35l56: Use devres to destroy workqueue
Date: Mon,  4 May 2026 16:10:06 +0100
Message-ID: <20260504151006.3374934-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DS2PR19MB9054:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: addbde7c-3125-45b8-ee6e-08dea9ef3b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	biNb9w/cti6ewHWsQZf2l4LgGcN3WUEeCmtDnJV9Km6S4EQ6a2jrCa2XiU16hFWl0Wvp25+cTEo/3aK/Kyu8tjSWKOALc8PW8uMTrS9yJXefc21qwway2wv1pdPLqWtih9smm73O7w5mgGnrLnK0qeshdjJAOIWQCykjlg9H7DhwAvYvCbca5HJ8ys1fNpJsNoJ1csxi9Y0nJaTmB109MRWxs/R211GBZPW7lW03HMTL7sXCgiqzti8geXrUcH6+byTBhpzp0NKfYdvDwsNPkZtp04wTndMAn1iZNXDVwNKe6zoBeRuOXyHkiG0j84y7luGYXb6diDrZEkdu4gtc1M+bBlJqvRsRdHH7L6cJg6kNz8L/GXRNZRV146/2nmlge6fEk9B9/HW6eT0l/14xdBp9/9T4erFK9lTAh0NmzLRr2fbvQOTHoHWE90KP13LxTO3jvEsrdw6RYLm3o9hvOFV1oFBMXPEUdkMXiQkKsSn7oXtqqiEDBP44wmkLnyVXx35S31NfhLRjGTnefZQrVz7mXIhChV5bE/W6OEY62neKnPBw4F7q+Rtsrn1dxN32e0GLtTy1NNTKpiI5Tgng8Fpipat8zLwvNJ4CTBJ2dklH8Uz4NEbWPDbNr+VuWa9fR2MtBvP81f0yX5DmrRYRJR9CQ4KsziEIWP/KIjTAf84=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vF/celGCwX53bt4EUOKO50xhX7/Z4JSRfUGC0ZvFzHo3n31NKulq1eO21l8a4GLZn3GHGY57aLoJPg7dBMhcacX2gTosybuosHtKQBaDoq4pg/fIUmgiOS2h4HQUnLjQ34FV57kA4eKnS1nqJDOXuCmis2JUOqSojWr/veYeK7ZOweHKINwOiRrO/OvlbKeB+iSzg0H4+ahI+kdRsULu0AZDluxcu23BqoE1ReiCDcYGtJCUivci5Zbk3EIY2M8+6xoOM1c5rdwgqI06EwPVBsEb0Hqk2Ztc/hxPD+wvr6OpY4jug9hvDCvGv7bYqT2zUss328Xc/xgkr9keT6ygEeVWzd/qWxvcPm0YuwDVW4gTUKNfVWucVjDK6hG2oNs5eYNJ1cXGjISuTyEKLgW0dBZ03o9EHpEOx59tqzT5rqHU29h3YWd5z6LL7YdC1p0G
X-Exchange-RoutingPolicyChecked:
	V/XCniaIXQ8UZGz+9FUsqZJSlW14YCamt9WoK3npd5ah4hQH/9MRhQgVBFE7Y2EG36jRb5dIIKmVKHrCc3hhx3yUYHpXyb5Q434lIeYjN7Zj0VZBB1A/wbioztUTY5VNMzsjbWlE6Bz4GdOlePgqjGTa0klQyBgEOMsVbBElf1XzZGEgrLv+U/kU7sHuTgXV9HaYp7eyd9ew2D0kOqxYvwin/xxIJohrlohCEinc+H8Emu/r/rQSMSf9s9LtuxENo6QvXu5jI4c2darjRWZa/a3rK598/0n9nvO2Dw1+eZH9+YnuWb9G1dq+hhjAjsyB6bfAxJ2braOC4zq9m2JzUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:10:08.5190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: addbde7c-3125-45b8-ee6e-08dea9ef3b24
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9054
X-Proofpoint-ORIG-GUID: uSRmTm4AmJQ9dmk4160kzYWlCgYSDGT6
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f8b6d6 cx=c_pps
 a=kNb0EPoEURSSyKZUeQUlVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=FQm4P8T3Tmml5pTXMhUA:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NCBTYWx0ZWRfX1QS0DbP44MEZ
 UOX6Mb97/zTuI03oP93r2unC/kuEe5r4MqEgMj3CGSthF3cg6da7eXYonVxJ9hkJ+tmgU8ynwKG
 8owGivtb9COPuPGye9K0J4d+U++ohp8e0TSHHZFeiwokb7WhSnh3xABlT6O3fJui+fSeBRjC00C
 j36NZk+WM+N9eVnMIICsatYBLoPHi81/FJ+XQYwnwp3mc/u9mCMxyj80WDpXN3mRO2/7yvR2FRu
 RSNleBOMPOPNMOhQVNq4Hvo5WXQfx8NbjydhwbvhEmJZfbLZUnNs+BP4iapJ34w2a8tgUCHY9sG
 vg1oLxopKz6UNL4Vl/IIZKjyyEbcsmKa1EqXExOxdluk+oZOIsM7bDsO6Kr2g6jHqIW90Nqcsh1
 JY0wtOUkfTUeYmosqiAmRDPTgN8c72fGDut7aWBFAruJW5Ca6AHWjkimdeDMHfhXYF92+4r9EHT
 95dqUyx+bU5jFM0yy0Q==
X-Proofpoint-GUID: uSRmTm4AmJQ9dmk4160kzYWlCgYSDGT6
X-Proofpoint-Spam-Reason: safe

In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
cleanup function that flushes and destroys the workqueue. This replaces
manually calling destroy_workqueue().

The error path in cs35l56_common_probe() did not call destroy_workqueue().
Using devres keeps the destroy_workqueue() automatically ordered relative
to all the other devres-managed cleanup.

The call to destroy_workqueue() in cs35l56_remove() has been changed to
flush_workqueue(), as pointed out by Sashiko:
https://sashiko.dev/#/patchset/20260504110743.3341869-1-rf%40opensource.cirrus.com

The use of devres cleanup was suggested by https://sashiko.dev to avoid a
small cleanup inversion window if destroy_workqueue() is called in the
error path of cs35l56_common_probe().

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Change in V2:
- Call flush_workqueue() in cs35l56_remove().

 sound/soc/codecs/cs35l56.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 378017fcea10..26fa94c98775 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl
 	return 0;
 }
 
+static void cs35l56_dsp_workqueue_destroy(void *data)
+{
+	struct workqueue_struct *wq = data;
+
+	flush_workqueue(wq);
+	destroy_workqueue(wq);
+}
+
 static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 {
 	struct wm_adsp *dsp;
@@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	if (!cs35l56->dsp_wq)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(cs35l56->base.dev,
+				       cs35l56_dsp_workqueue_destroy,
+				       cs35l56->dsp_wq);
+	if (ret)
+		return ret;
+
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
 
 	dsp = &cs35l56->dsp;
@@ -2066,7 +2080,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 	if (cs35l56->base.irq)
 		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
 
-	destroy_workqueue(cs35l56->dsp_wq);
+	flush_workqueue(cs35l56->dsp_wq);
 
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_suspend(cs35l56->base.dev);
-- 
2.47.3

