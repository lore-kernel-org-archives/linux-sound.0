Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4833629B8
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=YHA/MdSa7ST1pX8Chuz9gZpsaIPJ19dNfM8XZ2g3Tie1i0GKb7z53jXJPwtACae1+DVpj4iY8q5Oc8fqe/CjwV8ZfUa25P0iiuwk4YlstbeFA0Wgvn0z1l68X55v6EzDL4FGEz80ftt5ry8r19PM85VR4cgoUJ+dOcb6IqgEDI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=YzJbfmcpA9uAfvGKGNVKtChTCNu7wBAg8oQtvmIe07k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcsGtj9EepC+7WlMvYPgbcRbiMSuhXrlsPThYtfc42VVPmnotNAPJD2j19rG4FPooJ44Ob3SD10PkQRDOddSxFic0Fv6fQgNrQ7Q3oWdnaJMm45YT9PvxOXHlc3x4dsUpKkpMSjWihLZJvuUFMjfZOhGC0Ewg6r0cwnlTISmsSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WLL7GPcg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nO0O9hj8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WLL7GPcg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nO0O9hj8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58550DJo1324090;
	Fri, 5 Sep 2025 09:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=px4dRkm6qZz1z1Inw9xSH8vMc95RzRaJRf1yDipX65A=; b=
	WLL7GPcg+WSaR0e082eyEFsd5qIaGwq9Hk33uTZvdzfpFa6yGPDICMFMh+lRBhHo
	9p15CQUm696cHY0l54Xvo3yverrkxO+9rKAFzB6vyxYR9hpY+uzb4s3eZF2xrut6
	c9ojTkzoKMx1RvIhVOwn0uvt3Ef9rY0JLunq1/Gkk/kpXomUMQvISnyY8EWT8Lxz
	EmtKIJQA55BbSqr4d6XZbJbWZPsLIUUnwtwkKNaSCr+go0MH+yLZhC2Ud8WVVN9k
	TXBNnDFQvSHg0Z6akEDevDguxJsr3mT5P951BuzV6pfRpMZHIaMKpqGNE1BABYmm
	0/iGPZF2ObPKdx+JFiUg3g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2200.outbound.protection.outlook.com [52.100.171.200])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSJfH8VAsEZjhLkujuyfoNaS8ybAW630QKof426tZm/jy/4WkMmbRNRTmXqgZCfPUpgCDRqSUljWlY7g+GAPKUfrcOnsV80fBSDAVU7D758y79in6djVNC7uIc4s0xQsejKGLBJNFaWMMQRsWyuBR9EZ0K0ggzRU2p3JY5oJ+KEl/Mkt+/7iMJJS4kxX3MASLcVtcsr30C9qNBN2X7vlQgCENjnNOv77QReANQORefcVK8DRe3WlxzJN+PDnHi9HuEq3oyJS2dQBV/7es1TqnhJcNLbxZP+rU0g87SxhOwwDlVt70LybJBUJNQ1moIaNeIsjQjoC+mkOWNVg8ZN67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px4dRkm6qZz1z1Inw9xSH8vMc95RzRaJRf1yDipX65A=;
 b=ZEPIJwHuwxH+dJYG3lJG84YQCtO+88b5E1IAujz2GIKeKLw9EJjzOTnHEIDUJ2l6Md5ZlTon1OhzJn/oue2xKZWBv99KlorVdI7bLmsgFbFkzgMvSeCYcfxXetRtYQ8G/2sUqz/yMusddPCxxfv5GjFhQJQ+EmIkH3uTa0R0eTEdAL8kDxnowtszfCxTo2LwBRVNa2SGtTOQdW5nuRVtjluj62CN7UX0Nvl6VRaC5oFOHfNJ3V1V4lRr8TeZT0a4v1TKmnAfXMpbQNA+50n/8xNd92C66sOWMNSHrx2N4aXFwx4e4UnFT+PkQRLMwX3YltqSTxNfcSjiB01eS9gapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px4dRkm6qZz1z1Inw9xSH8vMc95RzRaJRf1yDipX65A=;
 b=nO0O9hj8+T3MyY6eX1IRhk0adbKCVwFrsKT+2Ac2ASIgr2jPW+fwHm043gR6UiJih00cipHFqqcHLJb4n+OWP22JctLJ/C3mIakwY3PB1n/zGg+QSlbV9IUmbl5qTQqAN19omGWuJdgHu06A0ZBuMDKkkOv8IHrCdc4FG+6ssdg=
Received: from SN1PR12CA0085.namprd12.prod.outlook.com (2603:10b6:802:21::20)
 by BY1PR19MB7799.namprd19.prod.outlook.com (2603:10b6:a03:526::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 14:31:33 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::91) by SN1PR12CA0085.outlook.office365.com
 (2603:10b6:802:21::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.21 via Frontend Transport; Fri,
 5 Sep 2025 14:31:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CC10240655A;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9EE9822548;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ handling
Date: Fri,  5 Sep 2025 15:31:15 +0100
Message-ID: <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|BY1PR19MB7799:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 75e1bda2-004f-4775-31fe-08ddec88e8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|34020700016|82310400026|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tLQgeQypCHcCVN4HMwb5paDqfMTQMdDPx78eI3SXwSq5axjBPP07rtfrHN7L?=
 =?us-ascii?Q?oy8XWyh+cmMYPLfeKwkKGmzVZyUHomzvtcgjh/hgxBLUQrhdb2nDhPyx341x?=
 =?us-ascii?Q?9HmIRZde0GMl7h9gOatkJbo4fuCJpHwmdRqsDEJfhPLj9NQHERGt5MNwruxC?=
 =?us-ascii?Q?jrKyT07ZW8vgVZvcQOzNeaHkOBAQkF8hitBo1xU1njI3ZyELS1DT6cxqSVSv?=
 =?us-ascii?Q?ncYkQrgTgK69VpkYVw3oaldGQhB9rYbEChDYGPUOgGoi2Zkd0XmS+NLgtpDu?=
 =?us-ascii?Q?HvYsTMzi9guxOHtrJB0DN0W1lEIPItr05WniCLIstWZTputA8qhyXEadsv/V?=
 =?us-ascii?Q?LjkyEYiuFrrVeBbOCFWE5eIwGQKkA1T1dk5zVVTYrLFN+HSSkvjUa/LCRaby?=
 =?us-ascii?Q?7syWSC2pBrhzkzzgHFwKXiGqeVauwUXYG7+vRtXDcl9OorDdnPXycnbfVJaN?=
 =?us-ascii?Q?5k5SSyyP1IcKCFSKUo41eHquBU/doq4iV6SdhIxd/ZV2S6AYt4sMzQlMWgzY?=
 =?us-ascii?Q?3tRfpEm7c7Pea+LGwy+tFCroiaqUEtH+ZrQS9MmgkFPqUUhOtvaoBab3KZoT?=
 =?us-ascii?Q?ZBXMaLES32fzFrhFtWyBaNyRXeVzXTiVPd14d2KAwpAbxVz8S0VYyHBtQmCi?=
 =?us-ascii?Q?xRZRHg//oui2EYbSqXHbZ0J8iDRVPh5CqPsN8L/hu+HVOvgCk9160mOD9pmf?=
 =?us-ascii?Q?8Nlck6HGvRWD8xUdOZzonw3EmbxYAKFGoDbOSZNmhlCcykHT8vHkvzKA23D+?=
 =?us-ascii?Q?xTrwabTEfhme44oSLRzkNgHkIB1pXQkMjs1BjprZdhxmsJFASMYneh8TJ3kb?=
 =?us-ascii?Q?mF66Z9FK9eT22gtx+jOVY/sItno24LnBWe3WdV5bzsgJjxjnxJbq72EOu88w?=
 =?us-ascii?Q?w4NHuEMsBmr7UgvDVi5wxVP06p8ESePTRWCfhhZJnegj4W+xuhz3cy3jby8k?=
 =?us-ascii?Q?T9mnmTsBGZlwq0e9Ids8xba3+2ndRqC/6e47qy7I37jOnCCqonOw2u1X5gb0?=
 =?us-ascii?Q?9DSpf5xHw7DmOBKsKIcvhpbV4Jv5K5Kw/3/MmiDN4FqQebTrZnR47M8hizKP?=
 =?us-ascii?Q?uG9HaQhTQkJx5CVe4HocN1fNKCDTKIV0EM/cX6lmmWobw0GHz3JvGIejGNYR?=
 =?us-ascii?Q?HoqkyNQ/HI8f4xCvLjmQYA2v47xvuReLfYwksD5Askn+4hCmWXzmQDCGovUp?=
 =?us-ascii?Q?ZG9mCbiaQeDuwDKTZtbz27TkiOiDcvBMosDoILgHxTn0FA8idLPh8bLeWP/a?=
 =?us-ascii?Q?z7G10Qe6oXZ1VXO/8Ehk8A8pCbX1ldCbSE3uKUUdYOG5QKfYbECx+lShy3sE?=
 =?us-ascii?Q?LrqcUT2+H7fTIk+GE00CDvr59amUbwJKhB3rSREmkWrOg59rqe+DieWV7Bh8?=
 =?us-ascii?Q?cDCqRO6RHRcpQ1nhpGZ8IF6QtKgdhnZ8tYbbmksbWo9iS4QL+lRQ5iF77LOc?=
 =?us-ascii?Q?S5wXzLoi8twEJGKygwc9CsPQn7UfO9a0ra0g+29rcP7R9nuggZ4uMPkLDeAr?=
 =?us-ascii?Q?B2a4xyJHcI4TpVPkF47lorrfwDRXI2e0VbQI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(34020700016)(82310400026)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:32.2023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e1bda2-004f-4775-31fe-08ddec88e8fd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7799
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfX3RSQeiUyPE6l
 +GCbNKa+NGP6HlBN3qdAqAVaaGyr8Fg23ZuPd25nWQrazXf3P70rUFyBzEMERw43AlOLsqBPIoH
 JqSIMFqrmvt1+lLKvn7+J3UIJWR+gzQ+JYRrCtVe6S0igvLmVrHT7GoqLKfFaM7pMSGL4T3H7IG
 6XTet/VZoppQJIPUmFDiEY4RNkGGrnfWSn2uiD9hpA7T07mZHDZoeT2nYXIQv8LdxNJaM1oT2zc
 rENgSCpPhkQ+nIN/l3/GiZWVRsjYTVSdDnJ7MNBDPMjdR+tr/hhNH8FbG3FHzLlQlpXBmA67U9+
 3UvL6WZ5YD00uDgLC6KS1DOsnOvz0vNlhWRCftdLdMk1KTya+nZiait8J/iRtQ=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf44a cx=c_pps
 a=YgK7Hnrd43RjXn8z8Cdn1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=HNOCfHEcfLzxOuSqOzMA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: rxeoHIpEfNC04kByrkISWGhIa-J-ypAb
X-Proofpoint-ORIG-GUID: rxeoHIpEfNC04kByrkISWGhIa-J-ypAb
X-Proofpoint-Spam-Reason: safe

In the future some IRQs (mostly File DownLoad) will need to run before
the soundcard is constructed, as such refactor more of the IRQ handling
to use raw device and regmap pointers rather than accessing things
through the component.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |  7 +++++-
 sound/soc/sdca/sdca_interrupts.c | 37 +++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index e2c1337d24e0e..4c347fdce1658 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -23,7 +23,9 @@ struct sdca_function_data;
 /**
  * struct sdca_interrupt - contains information about a single SDCA interrupt
  * @name: The name of the interrupt.
+ * @dev: Pointer to the Function device.
  * @device_regmap: Pointer to the IRQ regmap.
+ * @function_regmap: Pointer to the SDCA Function regmap.
  * @component: Pointer to the ASoC component owns the interrupt.
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
@@ -35,7 +37,9 @@ struct sdca_function_data;
 struct sdca_interrupt {
 	const char *name;
 
+	struct device *dev;
 	struct regmap *device_regmap;
+	struct regmap *function_regmap;
 	struct snd_soc_component *component;
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
@@ -65,7 +69,8 @@ struct sdca_interrupt_info {
 int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *interrupt_info,
 		     int sdca_irq, const char *name, irq_handler_t handler,
 		     void *data);
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *function_regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index a203cd2764ecc..a0677911503fb 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -77,7 +77,7 @@ static const struct regmap_irq_chip sdca_irq_chip = {
 static irqreturn_t base_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 
 	dev_info(dev, "%s irq without full handling\n", interrupt->name);
 
@@ -87,7 +87,7 @@ static irqreturn_t base_handler(int irq, void *data)
 static irqreturn_t function_status_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
-	struct device *dev = interrupt->component->dev;
+	struct device *dev = interrupt->dev;
 	irqreturn_t irqret = IRQ_NONE;
 	unsigned int reg, val;
 	unsigned long status;
@@ -103,7 +103,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(interrupt->component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read function status: %d\n", ret);
 		goto error;
@@ -136,7 +136,7 @@ static irqreturn_t function_status_handler(int irq, void *data)
 		}
 	}
 
-	ret = regmap_write(interrupt->component->regmap, reg, val);
+	ret = regmap_write(interrupt->function_regmap, reg, val);
 	if (ret < 0) {
 		dev_err(dev, "failed to clear function status: %d\n", ret);
 		goto error;
@@ -151,8 +151,8 @@ static irqreturn_t function_status_handler(int irq, void *data)
 static irqreturn_t detected_mode_handler(int irq, void *data)
 {
 	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
 	struct snd_soc_component *component = interrupt->component;
-	struct device *dev = component->dev;
 	struct snd_soc_card *card = component->card;
 	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
 	struct snd_kcontrol *kctl = interrupt->priv;
@@ -190,7 +190,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
-	ret = regmap_read(component->regmap, reg, &val);
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(dev, "failed to read detected mode: %d\n", ret);
 		goto error;
@@ -209,9 +209,9 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 		 * detected mode is unknown we need to see what the device
 		 * selected as a "safe" option.
 		 */
-		regcache_drop_region(component->regmap, reg, reg);
+		regcache_drop_region(interrupt->function_regmap, reg, reg);
 
-		ret = regmap_read(component->regmap, reg, &val);
+		ret = regmap_read(interrupt->function_regmap, reg, &val);
 		if (ret) {
 			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
 			goto error;
@@ -309,6 +309,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
 
 /**
  * sdca_irq_data_populate - Populate common interrupt data
+ * @dev: Pointer to the Function device.
+ * @regmap: Pointer to the Function regmap.
  * @component: Pointer to the ASoC component for the Function.
  * @function: Pointer to the SDCA Function.
  * @entity: Pointer to the SDCA Entity.
@@ -317,21 +319,31 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
  *
  * Return: Zero on success, and a negative error code on failure.
  */
-int sdca_irq_data_populate(struct snd_soc_component *component,
+int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
+			   struct snd_soc_component *component,
 			   struct sdca_function_data *function,
 			   struct sdca_entity *entity,
 			   struct sdca_control *control,
 			   struct sdca_interrupt *interrupt)
 {
-	struct device *dev = component->dev;
 	const char *name;
 
+	if (!dev && component)
+		dev = component->dev;
+	if (!dev)
+		return -ENODEV;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s %s", function->desc->name,
 			      entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
 	interrupt->name = name;
+	interrupt->dev = dev;
+	if (!regmap && component)
+		interrupt->function_regmap = component->regmap;
+	else
+		interrupt->function_regmap = regmap;
 	interrupt->component = component;
 	interrupt->function = function;
 	interrupt->entity = entity;
@@ -394,8 +406,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			else if (!interrupt)
 				continue;
 
-			ret = sdca_irq_data_populate(component, function, entity,
-						     control, interrupt);
+			ret = sdca_irq_data_populate(dev, NULL, component,
+						     function, entity, control,
+						     interrupt);
 			if (ret)
 				return ret;
 
-- 
2.47.2

