Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D382335971
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672074; cv=fail; b=qJoPuZNFlzABXhb+0KDxTzPLq60O1oiKCSsZenITuXxb2APrdUE0Jn+MuWHdv2UKyrebFilnasktML0lPluyobGxUJYlVYqegXal4dgIocuiV17jF7C+KW00pflCRPdVrZ5oHLuyiZX9ODXkCFh/nCWc0Zt0RmFcXZDnJTzyaa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672074; c=relaxed/simple;
	bh=o8wLJAzzOVZMg0phXqhMJQBCVgBgTzLRwcS9CHnnq4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwZt0AipiUQ6kpLofKFFQPdiyg01E2ezbCPrh+Tymqkxi6PSpZ4sWOB3xiNTrz+yeO2q8RY2ZRDoFSMg9/ITbXbRd+5NXZdXKgXuU58KHdJs8C/NHkLGMceMiAH8U/RiNErN3dfHgsdKuobyFyKvd7U56ZY3bZd5XCvdXdDMsNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ccqK3Fjp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V2NCMRCq; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ccqK3Fjp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V2NCMRCq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4SIfk020023;
	Mon, 23 Jun 2025 04:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gnHEK4yS3wJ5khAwaiY014Qjs6Xj5Pus0hU5Ea9+uog=; b=
	ccqK3Fjpc5+/PWZ/ao8HskAG9MfB/srPM02F6gijIqpRlRL80FCLLU7CEx2nNXkD
	ZfI05lWLta5WoIQVrXF6U5aHQdA4nzEfAUVEh6tayt7detNCMmwNWbK6cxE0/J6o
	oFweqJ1xoczhynYj94l6R6L4K9WPDUUiTwllyvcuc2KlyDWNqtbO6GvEHZI5u81R
	piXCLxZoD1VruzC3gxKmbI0DPW/FTiujM4mWx/gaw9tEW7e4bT/RqbPNcgvhO7GV
	sXR3KSwuQIXOHTF5wxdzvyoLpoFGmiGUCET7+XJrDKre0yNmSWVmayJi8pr6qB3I
	ZtcaqCD+m4KL+oe3bxDybQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2103.outbound.protection.outlook.com [40.107.244.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9gt8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFNNqAqzScgePb8WRk35uCGqWdHT3JEVeZ5EbHrVATxq1Gf5Bp0FGxgZaFhVxtqXAB/zDq0j+/wbszInCFbrzW5/9Z9gLhMw40bvCQcXFCzfou+RKMjw0E+Hy6ZamOwPBWQwX3suJoIPDYJZqLIDOlrm6FyaTuTJRbghJu0+VJKpU18rNbAGLCtF322oa/TEbpR06k7piNnU3gmKlwu3qIbWQEd0ALouCzTvrRztkypbl4cgAgSGAW6acd5qCKNNBiYuyhTKNNfhy3v0IbGqIG/rhRrPjKWybTLTQJY5y5z1LsvUfJM3EZNbTn2As3nZvFZRHYk6d1RCmAeFaU4ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnHEK4yS3wJ5khAwaiY014Qjs6Xj5Pus0hU5Ea9+uog=;
 b=caMPYy2NVc/mQ1a04gdzryV5hIGaKWK0XYr4FU9UY81pViM+7xypGgWPoFo8AzvLJyzMkKfQvZpWzbqmgBGkDzKVVXDzvt54ELgva0MPXvDhDAausIBbeUKiTB2J2uSgMOWF5b3EoioE7C9L0PBoyxGTM35R4TPVyCv1gNfKmHBVBjzAzXCU2JxqxEOBXFh+yMBE7Dogp2ahI4dJE6ZUWSr7xNt0STDkc/OlglG5aUAZBqsGtNdgMPshVaf4y1RC2hv4gcoHKKIhKpYi5+8UAJ+kYacz1566U0SNPB3Eak7weSm8AqSuA0rs9pqJqrCWcC9zwjy+fHceUTv16doPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnHEK4yS3wJ5khAwaiY014Qjs6Xj5Pus0hU5Ea9+uog=;
 b=V2NCMRCqOHrWkP26cK+KdnaMh52vxsLs2CsXWxnihIb+5u2GyHTZ0opc8Z8jsoKFW7/xNisiNbQHrLqOFk2LkxBA4LSkANVc3oRbQxQDq/zfLQfKqNg+9SL6DhIh2BYao38l+ubUsgXcYZWHF5dLOTGZZQOUUwk+ByS+YvHzDpg=
Received: from BN8PR12CA0008.namprd12.prod.outlook.com (2603:10b6:408:60::21)
 by CYXPR19MB8401.namprd19.prod.outlook.com (2603:10b6:930:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 23 Jun
 2025 09:47:22 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:60:cafe::7f) by BN8PR12CA0008.outlook.office365.com
 (2603:10b6:408:60::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 09:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDD6D406552;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A246F82255D;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 3/7] ASoC: SDCA: Fixup some kernel doc errors
Date: Mon, 23 Jun 2025 10:47:12 +0100
Message-Id: <20250623094716.1874443-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|CYXPR19MB8401:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef69362c-9648-414e-8a94-08ddb23af382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0DH8rx2ZoUeHnGko01CY5tdF+EQKFswmApiIzrSklHpLU9n45pEf/7ERp3dm?=
 =?us-ascii?Q?xjriI0qXnObHQK9CzUPDt+Qa9Te9y9P1Fe0tObfez2UNJHewMMTPjuzgLCpH?=
 =?us-ascii?Q?GwsHEdSBxUiezXbE+VGor9xIIexnX85BBbJqZNRlojWjmlLO/yKenj3cE3OS?=
 =?us-ascii?Q?TYxEojwiDmLXN7xDAotyKcVZ6PRYkwsFtkRA8vyUZ8qqBW89oy4BvdgfNVAy?=
 =?us-ascii?Q?aFSeKgTbfhkVr22zGJNCj4VYU7F0OAtlr1gAmtdR+LK78Fgcjy+McW1COdWV?=
 =?us-ascii?Q?j0MZtA3XPyRkvPs69r6sSmTtATuNsBiyErgzAi/55CVbS8H8F1Iy4LYeUa93?=
 =?us-ascii?Q?24hSORL4rkzX+4VgpsTR8PdpxAvhEMJkw7gmy3LDfprgyNuWa/SjwS1auo79?=
 =?us-ascii?Q?jK+94BdQWXFQoenk3s7uHfwhSjFeq8e06RAvm00wg/Txm4HDcNq6voeD15sF?=
 =?us-ascii?Q?U9ZdYik4VCEq8gVR6/nFnIF90vUW/kDO8nTbUIOvDdJH+CUXP3ilfeOmFutO?=
 =?us-ascii?Q?LJ/J78JVt6GplqlmCzQqG82bi0STHRCUhvYAWdCVCydzGKZeuHisSHesH2pI?=
 =?us-ascii?Q?1cQCUKJL2xW4JCG6h4B/ky2JGW4r0+aLQujwgNV2KgbUhk52IXfH07rfZeF6?=
 =?us-ascii?Q?BwtVoUGW7OVUWGT9Wc3Hoe6TAWpNIf1grz4X3yianOtLjwbQvxm1ocFqQZGX?=
 =?us-ascii?Q?LZ3LvfaP44+BgOXAv6GowfskdusA1Rv62aSvbeVHnk01GGVWKCSNFLuPLpsr?=
 =?us-ascii?Q?l38t3r8ZMJqVjvEW0tpC/mHWS8iPiZ231AMKuqju0wZn0yVKjmxFXUIz88vs?=
 =?us-ascii?Q?wOJBmemBgdm8K8NNoQdZR0JgwX0HkExWi8bY8YL7u1Gttd963ycO1hDiQPdV?=
 =?us-ascii?Q?wkvMGkwUGG/gmtl2e1cLjden8pSYA38xnpKuELvWlYEIbboqkhqvq2idDS+x?=
 =?us-ascii?Q?iz7Jp89vCH3DsO99ygIXsQq5FbX1av8XsiGIfXGhrcuHsBvcckJrztbw2uah?=
 =?us-ascii?Q?EZlzouXL0EBpWq7FWkQyT7RoDo43uZZ1Lkw8C2lDsY3v2uP3R75wm6BL7AN9?=
 =?us-ascii?Q?j9miKcRFtsIg0yXQPk6omJYSebiWQjtbtCzos9yBuVOF06ZVl5EwsRzlTbld?=
 =?us-ascii?Q?0Ic92BRvaWYhuywA+pXH9YvsQ4gGFWO/pLyKx6Pp5LAFZEHjc9qSrz74OYbi?=
 =?us-ascii?Q?3cl4LtbzJsXZGpR/JEJ4H2XSMW9ioosoHkShnJr0EdZ/8k86vl8yVd5khDtr?=
 =?us-ascii?Q?5rzic2H8ZnDrXaaM1inrgCL93KLEdYGohZkpGOsLmDtBfnydl1XLuAlpFS8F?=
 =?us-ascii?Q?/iVxItwK6kIBY54wcmqMGT0wqr7Th1oEz1Mi+1wlj3GzOP8io7GdfQ3U1QJu?=
 =?us-ascii?Q?ZJfKvEUCCCgX3+MnvYRA+glgO1ImSH4EBHa3rJt1k+AUNMviflrE5UY2yNb8?=
 =?us-ascii?Q?s3J3V3+CONtK8CnARcTu3EWiRfa5OTp66Ik3Rd0gyZfkFBDl0gWK4RnL3bCp?=
 =?us-ascii?Q?aKrcnkob0EeWqx96tVmc339+9v6T+aT5+pKg?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:21.7590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef69362c-9648-414e-8a94-08ddb23af382
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8401
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX9nhA5/uQ5aX5 5MImZj2AC0TjMOWLl0WUPhYo9jvs/O4LW9I4Z4uHgV8q2eAK9jq9UyreUe52u0B1ChPfjmxdaeG osPfBVPC0BtjA/WOvoKm3i3ie/fIHflru+ygp/OnH6Tz+MYzjWsNj8SoUSiVLmoAU6aP2ZZxMIE
 vKYEVc4hszkD1ncO1XyYBe+Ri/guR+u70hUc9nVASPVluYnd9gP8uGB407LjZJl32clETnVIj6H 7JiflqMmFTJ+HjixsUWhPrMM3aN5ANBBeRgp5X44WsH8c2+1c0JuXt50Yi1NDI1b8BFn4w8AYCt MCVMLLGTfYvYCr7ZMcffhP58ci0u5n09DltAvf+VqnugkbZXs2jApsfwmoys/G3mPLX13YfT7On
 aK7VRWrCs5pdbFYd885+CsQylwKD5qOY0juBA2QsYrAckfexshZiVIOOnsO4uHK3HdCijJXo
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685922ae cx=c_pps a=LlJu7KdtfZhlUeFcEDMJtQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=JE3WF5roqhOJyUsBzO4A:9
X-Proofpoint-ORIG-GUID: QORVNWCMiSncX7mcrCxcDmbvgYWoUX3Y
X-Proofpoint-GUID: QORVNWCMiSncX7mcrCxcDmbvgYWoUX3Y
X-Proofpoint-Spam-Reason: safe

Correct some typos and omissions in the kernel doc for the ASoC SDCA
code.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_asoc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index e96e696cb1079..83911dab73ae2 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -93,6 +93,7 @@ static bool readonly_control(struct sdca_control *control)
 
 /**
  * sdca_asoc_count_component - count the various component parts
+ * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
  * @num_widgets: Output integer pointer, will be filled with the
  * required number of DAPM widgets for the Function.
@@ -997,7 +998,7 @@ static int populate_pin_switch(struct device *dev,
  * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @route: Array of ALSA controls to be populated.
+ * @kctl: Array of ALSA controls to be populated.
  *
  * This function populates an array of ALSA controls from the DisCo
  * information for a particular SDCA Function. Typically,
@@ -1244,7 +1245,11 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
  * @function: Pointer to the Function information.
- * @copmonent_drv: Pointer to the component driver to be populated.
+ * @component_drv: Pointer to the component driver to be populated.
+ * @dai_drv: Pointer to the DAI driver array to be allocated and populated.
+ * @num_dai_drv: Pointer to integer that will be populated with the number of
+ * DAI drivers.
+ * @ops: DAI ops pointer that will be used for each DAI driver.
  *
  * This function populates a snd_soc_component_driver structure based
  * on the DisCo information for a particular SDCA Function. It does
-- 
2.39.5

