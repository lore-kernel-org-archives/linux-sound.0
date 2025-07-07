Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCA1F9F51
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892144; cv=fail; b=QxLKpNR4zYdHOGiRjtSPUlWn/dGj/CNSSC+86Wfz5QEWTRmWmx+laKaxTPpRt1/fppDdy+lKI8YGHmmFRmr6c3tLhhC2LcBBaIpceqbeetxXbpGS0FzU/W+YQcK16PZzsTIEpmHbNJ2P3+iiP1/MQX/OSbn2WYpwk8d1aSyEMvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892144; c=relaxed/simple;
	bh=vYMy03HzULAB6M5VXvOnk6oafTRxVQsz499+//iSEKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWMJJyMWxj+t+5r8F14Qx06E/BAYccYhMXfdsfSydQAHkFuicbY1VQJ3ob1fpduwZZ8YnYUIL27NPp2/PSbvN9YSZK4eXmh5VMj+v9owBMw2Zs+9JCiKYCZPWYbiB9YybNAgcgltxKrr1cW/tORB+V/tCjaUNNOQbd9cJ6Sz8gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bW3FNQDD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HdKe8UCf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bW3FNQDD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HdKe8UCf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5674lxEC022144;
	Mon, 7 Jul 2025 07:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kIo0R1U0vtyuch+518m4KiMsCwp4fucuj0Xiw77yLIA=; b=
	bW3FNQDDviAaPhQn9mXvo+Y4+cGf7DNEoupAluO2Pe6XszNlcy4V0/HzpXI7v2Dg
	qyB0iPPJRwKP2+JVdMPkvR3W32C59XawgP/7JgNDSkznrBycmQbIGAU05rYe7Va/
	v2ARmZbdd04xXmVhVD1q0O77YIShPItNbnJjgHxWLpoj7i40BQ7H2fVIrMvUUFm+
	g6dKM1rxu8DVyvb+zHNYVUH/Ko7T8Q5p5xw5CrT/BC3DNaCzUPRQsDCWMGvopz08
	TPMKvHDtJF5w7jLVVd8BRpxAA/jDl9NLZpnk70hO6eHmFU4KXSBRd2yoXvpgGhl4
	e6TTeImQriD5HqvfPa2TDg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2103.outbound.protection.outlook.com [40.107.94.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3j6u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgVJWu6nrll5oCZo5CbfmDo9JUKJqlRR+Amsgfio3Hc5X7KSEg9ywCSuAXkdRTM7s6qx9buZIeNJjekJNAZW1sRQxZ1rNwLRydnaaYupG0ewM+2fMNDtTW0a13FyDFfhji/wAS90xFH05Yic157y3QQRnQ/ASx2Rqd5LYxytw4mpTHPWgJlFHtDWLbchC98Z+wvZx65DAt2eoITyPbHKo2P8WgPNrnz+e4pMMNbDjC99xRhOXddz0XGhi5xv3vQVvQ83p+fD/f5+WtqPtmEP1t9BwkDA8Yo/5CQotKwYNNbh1bU0IqQqkRnzSf3bxmRG2OayvCJEuB1GaeqhQ0cDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIo0R1U0vtyuch+518m4KiMsCwp4fucuj0Xiw77yLIA=;
 b=zR8OBkQcLkpz3dmAHZxYPykVfDUNrF1ZbI73W+MtvE9MImHYCQqt7HMerucz3+DoUt3gJvqoueaR0HzoXeNPDbNrcl3vj7ZpT/3ohwihuoWAP2CNuuiMV0BUH3S4v0M/+p3wTbtGtlsJf27sEIMR10UbvmsWjk+cwaBE5QVWiQAWvyRgM7FZAjZbwVZuzAjUSIKv7134U8vEwG0gJawm1JDBMXbq2aDpH83HLhjhOBYoyAAARkHNCUPHGxSTjp/kw+K+gQ/A1yfIsSSTcOFbFMqie9kCnlvyZ+D3zISHHYtwerW80GXk3LrVBUD+ly3r4nGaVjNNFwtAyKiimGVzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIo0R1U0vtyuch+518m4KiMsCwp4fucuj0Xiw77yLIA=;
 b=HdKe8UCfWRodpvY3FwvyqaXxe92hHLzrVcVQlRLxFo8Q6RRMz8CddTkivkLuM4nkWHpePKzJA/yW/7DXbCD6xVwIfB2pgL+0m/v/ON9wBgOnBl9IAsBGDmMEvTHUJkwtLMorlDRqIzJzKtO3Fa4j6OnOlOsx8jrZgt6Xx9TeT7c=
Received: from BN8PR07CA0036.namprd07.prod.outlook.com (2603:10b6:408:ac::49)
 by IA0PPF94AC58BD3.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cb9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Mon, 7 Jul
 2025 12:42:01 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:ac:cafe::f8) by BN8PR07CA0036.outlook.office365.com
 (2603:10b6:408:ac::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 12:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.1
 via Frontend Transport; Mon, 7 Jul 2025 12:42:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 96C97406547;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7A53582026B;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 3/7] ASoC: SDCA: Move SDCA search functions and export
Date: Mon,  7 Jul 2025 13:41:51 +0100
Message-Id: <20250707124155.2596744-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
References: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|IA0PPF94AC58BD3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b7848173-6d6f-49bf-8254-08ddbd53ab59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3gSSUG0rcNTw9nDZ7Tw/T3uHsmMpCdViIo/cXKLElC1Q2O+xWWZRc538BDqP?=
 =?us-ascii?Q?uqjldLveGb3CNHIKQpGyvtVakDSCkHawQfKh3mayQPtyyiHnHfbZykgYeMcx?=
 =?us-ascii?Q?LTatTTu8iUCryZ+twx1I7jEMd3KkF8drS3zij0Dc0cxiqJdBBlwtqSExg8Ef?=
 =?us-ascii?Q?OUroV4jooXSqtDkUkTvkJywjR9RTw+Ui68MDuC38KPNzq0TU9evk3SOs7t+E?=
 =?us-ascii?Q?BdssWLkmBdQWQX4NoIZSAtwtK4ozzagNhJZDxVdgO9utP0+Js0/kDy8gboAC?=
 =?us-ascii?Q?WvEJPqLT4o93Ix8Hgw2VyhUmmucV5sA+1EiKk/EGnrU1YtbuE+CVUZn3R4B5?=
 =?us-ascii?Q?m+7ivC68FjNZ6Esn0IYMSzqus/HXGsK70j/7eICclhWWrqibTMJSVgUTgk3i?=
 =?us-ascii?Q?e2QjymhQJRR3DHdauqtfzaGcbm5u3/6Gcut0PAefLSrGGErn4lniqHj1TutO?=
 =?us-ascii?Q?xJ6fVoi+6thpE853twuB911c5QQgI22DkgX6xAOqAca0amCbLJw+YerlxakG?=
 =?us-ascii?Q?/Y0BM7nmH4zG75tTKQGP5E3lOcQV2TEYB2XgtqxQVXCL5JWdrah65tsSrPyH?=
 =?us-ascii?Q?6WuUV2SOkmaXIbFK/zHWk4TIdHwajC8P7EcqiL3eOT2mGZ+o9FD8V5djeO4V?=
 =?us-ascii?Q?ZG3PuqYEhogyNaMno39+wLrO5OvF6JxHsVSDHrgNPCswQb1gHBpBWU4oNfee?=
 =?us-ascii?Q?6d3TnvUqGScUaZ1OaHp7kshfepyVgE8zydwvxAcxZTPb+COUXa/kgee38dS1?=
 =?us-ascii?Q?FudeKJRQBulIBJ3CHie/nsZTVIWmaOWJKjSSJcOiG5wLInMy9dO6561ExSTt?=
 =?us-ascii?Q?dF7d9ig6SWtiiEqBG/gVmLcRMN0b3IJ1+nTqY6+4LxmvE/79jGnSxAhLuV1O?=
 =?us-ascii?Q?2qW1AkkbIEVHcnCgiuguYE01G254qIMIHVIkZ7XBHHzbwu3MD16LPLVsjw+t?=
 =?us-ascii?Q?0oq6PN1n/TMHuoEbw1Jam11l77wq8nk7PZVhtEfiyiLDOFXgrhRigAVtIQR3?=
 =?us-ascii?Q?Qn5+1onnXTLWocLIONmG0AZECfWOX9zsxEBxTUIVstHD59Y3PstJvi5ENyyD?=
 =?us-ascii?Q?ilqqLtt7C0pWQLjzuoLENP6i0RHQCCj5V7EZXqJ8QCeS6eBvibQ+Khe3cRvF?=
 =?us-ascii?Q?e/EsRFfMIKn1ZeaacDSAd/Two2FU3fALNTY3MVmT4UIOCzaYIf5+B9fD50Qv?=
 =?us-ascii?Q?Ua54P6qksYBMO839IVpO08mwj6aiVcsEzIPjKFgkFZeSKKF9Xn2+O0qlAU5e?=
 =?us-ascii?Q?Bc0p4eyskPHB3QB8XggtZSBo1oTDylbv1YIWIHV6my7CXyCjfawjdtVdRsmo?=
 =?us-ascii?Q?PIvN3TJFvVyjqyffwk4/AasD9/RfqfRgo3jJgkyUTNUe6dQRds5p9TuDrj9X?=
 =?us-ascii?Q?X23YRc8Xd0F4Rj7D5Azx+p5czUEygGgZoOT8yG1H4oE2mmOuf1V38yrIRyzJ?=
 =?us-ascii?Q?FChVzNZdhQsh0oXGSO8HUF+2PZrSJ+UMFrXmGjcJFTnb+QYtdmvP8zDD9/hG?=
 =?us-ascii?Q?pUYTJZ/AjMYyipNxmvZo8MucOpcwhLzgpSZf?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:00.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7848173-6d6f-49bf-8254-08ddbd53ab59
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF94AC58BD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX4qDgZpQYt9B7 B6N71UuuXuNwOBaNDAH7UgcdIXai7agFZDpISCZxZ8m42so0//ViQuiCpEclIcPj++nN3sxsus1 qe7Y8118mqEIVk5jJZA6G3HI2NMjIIxPtEK1kmB9R6YTnM+wx6UV8AOYxFrACuPvTdxDg7+N0Q2
 gdH37eEDxnO+iMtJkFihZxSM2rLbalwIPZuHvQzcVh4aaZyV2gSGeCcSdcGrouSW5985fjyqdr1 8yFJ34XCEdpiagEnAB//dUc+S7yGotqtIhNWIO5Ik8nKOwyG1YABNAs1fVqBzOHuO42cNrq85TP Afxk6Lm9B1h9GCSGN+wM5YwKLTb/CcQTZSA33alWeDmmUmq75zoEoJz1iTUvyM3OzAV5F4kg/HR
 2Ijj0yLloktZqyynIGiKexXbZlswEPg1KpexxSv82bx5p5yjDHXmlwxeJRNiRZINATraoR/7
X-Proofpoint-GUID: DhhK5RrVTT5r8eB6uuaDnxAV8y1X4otf
X-Proofpoint-ORIG-GUID: DhhK5RrVTT5r8eB6uuaDnxAV8y1X4otf
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686bc09e cx=c_pps a=F0+d6aSsnXJg5hNSnXykjw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=DtomTKx68tNhjr8evqwA:9
X-Proofpoint-Spam-Reason: safe

The ASoC code for SDCA contains several helper functions that search for
controls/ranges/etc. As the code evolves these helpers are likely to be
useful to anything interacting with the stored DisCo data. Move the
helpers into sdca_function.c and export them so other modules can also
use them.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 11 +++++
 sound/soc/sdca/sdca_asoc.c      | 73 ++++++---------------------------
 sound/soc/sdca/sdca_functions.c | 50 ++++++++++++++++++++++
 3 files changed, 74 insertions(+), 60 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index b4a97ff08729..543c09e99ab1 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1316,4 +1316,15 @@ int sdca_parse_function(struct device *dev,
 			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
+struct sdca_control *sdca_selector_find_control(struct device *dev,
+						struct sdca_entity *entity,
+						const int sel);
+struct sdca_control_range *sdca_control_find_range(struct device *dev,
+						   struct sdca_entity *entity,
+						   struct sdca_control *control,
+						   int cols, int rows);
+struct sdca_control_range *sdca_selector_find_range(struct device *dev,
+						    struct sdca_entity *entity,
+						    int sel, int cols, int rows);
+
 #endif
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index dd7b19083c85..11c9b3b935fc 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -26,53 +26,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 
-static struct sdca_control *selector_find_control(struct device *dev,
-						  struct sdca_entity *entity,
-						  const int sel)
-{
-	int i;
-
-	for (i = 0; i < entity->num_controls; i++) {
-		struct sdca_control *control = &entity->controls[i];
-
-		if (control->sel == sel)
-			return control;
-	}
-
-	dev_err(dev, "%s: control %#x: missing\n", entity->label, sel);
-	return NULL;
-}
-
-static struct sdca_control_range *control_find_range(struct device *dev,
-						     struct sdca_entity *entity,
-						     struct sdca_control *control,
-						     int cols, int rows)
-{
-	struct sdca_control_range *range = &control->range;
-
-	if ((cols && range->cols != cols) || (rows && range->rows != rows) ||
-	    !range->data) {
-		dev_err(dev, "%s: control %#x: ranges invalid (%d,%d)\n",
-			entity->label, control->sel, range->cols, range->rows);
-		return NULL;
-	}
-
-	return range;
-}
-
-static struct sdca_control_range *selector_find_range(struct device *dev,
-						      struct sdca_entity *entity,
-						      int sel, int cols, int rows)
-{
-	struct sdca_control *control;
-
-	control = selector_find_control(dev, entity, sel);
-	if (!control)
-		return NULL;
-
-	return control_find_range(dev, entity, control, cols, rows);
-}
-
 static bool exported_control(struct sdca_entity *entity, struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
@@ -213,7 +166,7 @@ static int entity_early_parse_ge(struct device *dev,
 	const char **texts;
 	int i;
 
-	control = selector_find_control(dev, entity, SDCA_CTL_GE_SELECTED_MODE);
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_GE_SELECTED_MODE);
 	if (!control)
 		return -EINVAL;
 
@@ -221,7 +174,7 @@ static int entity_early_parse_ge(struct device *dev,
 		dev_warn(dev, "%s: unexpected access layer: %x\n",
 			 entity->label, control->layers);
 
-	range = control_find_range(dev, entity, control, SDCA_SELECTED_MODE_NCOLS, 0);
+	range = sdca_control_find_range(dev, entity, control, SDCA_SELECTED_MODE_NCOLS, 0);
 	if (!range)
 		return -EINVAL;
 
@@ -443,7 +396,7 @@ static int entity_parse_pde(struct device *dev,
 	unsigned int mask = 0;
 	int i;
 
-	control = selector_find_control(dev, entity, SDCA_CTL_PDE_REQUESTED_PS);
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_PDE_REQUESTED_PS);
 	if (!control)
 		return -EINVAL;
 
@@ -452,7 +405,7 @@ static int entity_parse_pde(struct device *dev,
 		dev_warn(dev, "%s: unexpected access layer: %x\n",
 			 entity->label, control->layers);
 
-	range = control_find_range(dev, entity, control, SDCA_REQUESTED_PS_NCOLS, 0);
+	range = sdca_control_find_range(dev, entity, control, SDCA_REQUESTED_PS_NCOLS, 0);
 	if (!range)
 		return -EINVAL;
 
@@ -499,8 +452,8 @@ static int entity_parse_su_device(struct device *dev,
 		return -EINVAL;
 	}
 
-	range = selector_find_range(dev, entity->group, SDCA_CTL_GE_SELECTED_MODE,
-				    SDCA_SELECTED_MODE_NCOLS, 0);
+	range = sdca_selector_find_range(dev, entity->group, SDCA_CTL_GE_SELECTED_MODE,
+					 SDCA_SELECTED_MODE_NCOLS, 0);
 	if (!range)
 		return -EINVAL;
 
@@ -613,7 +566,7 @@ static int entity_parse_su(struct device *dev,
 		return -EINVAL;
 	}
 
-	control = selector_find_control(dev, entity, SDCA_CTL_SU_SELECTOR);
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_SU_SELECTOR);
 	if (!control)
 		return -EINVAL;
 
@@ -643,7 +596,7 @@ static int entity_parse_mu(struct device *dev,
 		return -EINVAL;
 	}
 
-	control = selector_find_control(dev, entity, SDCA_CTL_MU_MIXER);
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_MU_MIXER);
 	if (!control)
 		return -EINVAL;
 
@@ -853,7 +806,7 @@ static int control_limit_kctl(struct device *dev,
 	/*
 	 * FIXME: For now only handle the simple case of a single linear range
 	 */
-	range = control_find_range(dev, entity, control, SDCA_VOLUME_LINEAR_NCOLS, 1);
+	range = sdca_control_find_range(dev, entity, control, SDCA_VOLUME_LINEAR_NCOLS, 1);
 	if (!range)
 		return -EINVAL;
 
@@ -1140,9 +1093,9 @@ static int populate_rate_format(struct device *dev,
 	}
 
 	if (entity->iot.clock) {
-		range = selector_find_range(dev, entity->iot.clock,
-					    SDCA_CTL_CS_SAMPLERATEINDEX,
-					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		range = sdca_selector_find_range(dev, entity->iot.clock,
+						 SDCA_CTL_CS_SAMPLERATEINDEX,
+						 SDCA_SAMPLERATEINDEX_NCOLS, 0);
 		if (!range)
 			return -EINVAL;
 
@@ -1154,7 +1107,7 @@ static int populate_rate_format(struct device *dev,
 		clock_rates = UINT_MAX;
 	}
 
-	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	range = sdca_selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
 	if (!range)
 		return -EINVAL;
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 1113f8d91b3a..ca965e8a4c46 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1941,6 +1941,56 @@ int sdca_parse_function(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+struct sdca_control *sdca_selector_find_control(struct device *dev,
+						struct sdca_entity *entity,
+						const int sel)
+{
+	int i;
+
+	for (i = 0; i < entity->num_controls; i++) {
+		struct sdca_control *control = &entity->controls[i];
+
+		if (control->sel == sel)
+			return control;
+	}
+
+	dev_err(dev, "%s: control %#x: missing\n", entity->label, sel);
+	return NULL;
+}
+EXPORT_SYMBOL_NS(sdca_selector_find_control, "SND_SOC_SDCA");
+
+struct sdca_control_range *sdca_control_find_range(struct device *dev,
+						   struct sdca_entity *entity,
+						   struct sdca_control *control,
+						   int cols, int rows)
+{
+	struct sdca_control_range *range = &control->range;
+
+	if ((cols && range->cols != cols) || (rows && range->rows != rows) ||
+	    !range->data) {
+		dev_err(dev, "%s: control %#x: ranges invalid (%d,%d)\n",
+			entity->label, control->sel, range->cols, range->rows);
+		return NULL;
+	}
+
+	return range;
+}
+EXPORT_SYMBOL_NS(sdca_control_find_range, "SND_SOC_SDCA");
+
+struct sdca_control_range *sdca_selector_find_range(struct device *dev,
+						    struct sdca_entity *entity,
+						    int sel, int cols, int rows)
+{
+	struct sdca_control *control;
+
+	control = sdca_selector_find_control(dev, entity, sel);
+	if (!control)
+		return NULL;
+
+	return sdca_control_find_range(dev, entity, control, cols, rows);
+}
+EXPORT_SYMBOL_NS(sdca_selector_find_range, "SND_SOC_SDCA");
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
 MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
-- 
2.39.5

