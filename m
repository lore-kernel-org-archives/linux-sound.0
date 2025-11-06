Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A7315D46
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429906; cv=fail; b=ApsI3r+xzb4m4vbCn0aAyEEg+tuyxIsxGpet2r8UkyK08jtKetIqcUgkhyjIHvWvxMW6Fm3ROli+Vrj4t00RJZKi7geH0r5dMZCL6PC90mU0OU8h8GSZJRMEF+K9A3Hz5lgLRK1JkaQF6qrVsrBFDt4Zal0kkaoo1MW+qK2bpGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429906; c=relaxed/simple;
	bh=YNxflJY7BPWCC90FxTuJ+e4IjC//FzX8n1mUrxKj5qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3EafZvIMv+A35/PGkLPg8FRi0XScv5Fkal07uBR11lnR2eu5GSX6hE58JbqrpSz2QCjHFJ45r7oJNGfQH3vXgce/frFFzbtKdbcuIQ2m6oFwtIqvbxAAia6poXRXQ+nlCQBUdyOTGrcYI1YcPQDiTNjiYlpMrIR4gFBhQQla5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Nz37xXkp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r5MPFpjZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Nz37xXkp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r5MPFpjZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61vDH01122962;
	Thu, 6 Nov 2025 05:44:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dV2kubRorY4fX7eTHGO2v75e0BWz7smRB2cc0C1oW/c=; b=
	Nz37xXkpU0HGmVyFB/Fqc9zG7m9D8w+PmD4JAC8N6FvzgCUTAB8xWgKGTVRgyNFc
	UKmQ4EZFCipuiz7xrsvzh2OwP5YvZRzmOgOIE31W0pvaMwclW00AWUqlvE9TZnWg
	Is8GSe6mM40g7QxuGLJuowMqxFwpYb8AOktodl8ei+b2J4ug+eLsRwfzPcjvM9UP
	39+jCkjiQrfCt2ApakZF51OASy09Ko4cODX4frGLwF9VIrCZwsXxsWM3lYvuXj+t
	iftsw0KaaY4DfsxkaB8GF84Vb8Uy9CmVWtx7JFgl+EYDgEXxAjCc24HY+SO9XaZl
	X0xbIaHBqUmxDoxnajBdeQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021084.outbound.protection.outlook.com [40.107.208.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a783wun4r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtVlyTSOAu3YwxkkkANw5uWrkoH+6HwTDX4enAxW0d5xDnpFGfXwYzmlID+G2WSuLvg713iUs6BNCt7UUTagyGXW3tiYhGQn8rkm92+UOzaKcOdWRQCrAm0oFoE+CYf22CxOpAB3pKNL+kRpOKXYVdMrGJaxjeSKX32TVa4xbThX9R0yIvt5xy13Zph1XDZlmcTu58P+qAkYTQHxVMTZkE6oJgyCaMaOIvZV/WNlrwbzbrtNe8yFqoEIvdtoXHReMo6nkSUaVzbNqvhyus3v9zO+UKqltJA2yngUdZG6zPbQmwO4PzqrpYlvu5dfm2MtzMKRQUE2nCaSzgrIf95inQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV2kubRorY4fX7eTHGO2v75e0BWz7smRB2cc0C1oW/c=;
 b=ALS1gjcgDUEkMbj/8Ei/SUJDXZbwp9nKid+hUBGPP4Vv7SHYYaJBPTNyYxtKyEnC1rz2ID4yC9yqohsq3HWlPAaMAl6eMtH7nXZ/4l+y4ATJnAQh4cwl4FK2dPAwzXqBWYV7QRisWKftQhfMTLu9irWF+pnWNZY8dtsdP4o7atcrD5gujF/Z4SiQecW/2RVSWVSq6+5cpB2XqVh5cQuJ9zs2m1bjLrR8H4kUZgVKMaKVzamHqpdi+vrdw3LblL1sLXp74d0vhEPg4jYpziBOu9odlEGZYzPVaaEP4tptVJTBY91xbFgmeXnebHvkbiXzGi81OG8si+V58IZiUJ7UsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV2kubRorY4fX7eTHGO2v75e0BWz7smRB2cc0C1oW/c=;
 b=r5MPFpjZKsAfQTofBsuM1ZuaSwipCQ8S6WK2zAYxdGKLXSoE6Of6/l41PgfGdxxySpAcDlyzihkg7wf5p5HkiU+wBo+2yJk6tRNoijcYh/VuZWKFMvVtRF05Xrzk65EkfP97zO7Tdr6db40uZr2OULfO5F+9lDsNYtD2IIZ2Jww=
Received: from CH2PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:59::32)
 by MN0PR19MB8299.namprd19.prod.outlook.com (2603:10b6:208:3c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 11:44:31 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::bc) by CH2PR03CA0022.outlook.office365.com
 (2603:10b6:610:59::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
 Nov 2025 11:44:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 138F840655B;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D98D582254A;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 09/13] ASoC: SDCA: Populate regmap cache for readable Controls
Date: Thu,  6 Nov 2025 11:44:18 +0000
Message-ID: <20251106114422.906370-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|MN0PR19MB8299:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea422b43-e75a-4dae-680a-08de1d29d8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4gyxL3mt8ou+Xi1MNO2ntDdASYGvYN2K1SyK6jJKNTQqtrcgmRVrto3N4Jp?=
 =?us-ascii?Q?/J1eJpcOGGE5T5BDMPtWedYClJE/jG6zSkT2Xq8uY0RGrUDt/N6p7Z/rO3uF?=
 =?us-ascii?Q?1xQsb8FjHSRwkspz/45LweTi60sYqQ+bwXSOI1Y5NLErMQdZB/NSszCkXeDx?=
 =?us-ascii?Q?B853yeYdK9ZbrLzQc/WFj3rBccTyBvhOswKnebmwjilXZb6AAX6QW9un3P09?=
 =?us-ascii?Q?yhWWF+J1n+U9ybl3/pCWsjCqYCL71a0I0Ek7+mrkaJ6brdO+qJdBHWbpYPFj?=
 =?us-ascii?Q?YmV8dnyCvGHnXlZgyI4Ojr4aDNYQMCAv4aOqbW4pk55dxxk2G2mWKUqhk5vJ?=
 =?us-ascii?Q?16oeqUYJPcV+qW9YE+k9K+BRGLxa4X0skQ/14DZYiHL4v7i0cGilV1QIkipe?=
 =?us-ascii?Q?R4bKYs+4xNA/Ks6cxWq+nLc9WdbSTb26BcDAjK++/erVPor6CLl1mugNuke5?=
 =?us-ascii?Q?KeBoaAjH/QDAagL9TLl2Wdct/QGljsB1HzrsWZhK8aV5TZJOK+EnJHH/9GFC?=
 =?us-ascii?Q?N4eS+jufTTfZvI9FD5sF50+Q0U2yuzQ7/nenkJQPoJFTJb7bNgFIhQOXJk1a?=
 =?us-ascii?Q?dZpOJ2VLvnOf4zIgrZZPKPQZwKec8DJtT31dyYpW2qkv9RsU+HFDgPeIWK9z?=
 =?us-ascii?Q?V7VpxbOA0WSGQrTGnXVucFRBunHSmpBqIvS4BWoB713RMmyZzoB0SDQEYAX/?=
 =?us-ascii?Q?Y0hGfcuucn3RocjCG9mbzhwA2+pMgjmN2zTdPpej8t1OwK2M6+g6EZfFrGbe?=
 =?us-ascii?Q?U8wmlyNeL2HGh+5S2qko1V2z69dJtrXsUu29IjKAWwbM+R243cU6lFa74HS/?=
 =?us-ascii?Q?woGsU/bZKqFpc2D2peC3UIo+nUlV9PZvcd9PaFWOVo/zDlZ+msCMh0qIRq9h?=
 =?us-ascii?Q?LlPERbiLORX3ML+6MiFwk6EatDJhYPmE3b9kYiHSLJ56U3Q4veSEobr39+rg?=
 =?us-ascii?Q?Pu5/tZbkcXu8XJ3qjnMrGMx1DuAI3yUGeIMUaPHhgp+AS3Im+TXle3RUkhTC?=
 =?us-ascii?Q?CgwrfaxdZyKF1kp1TkKEFw8HiE0Rg3vGvh7PrmEKzJp+Eh+i584lgmWYvfzR?=
 =?us-ascii?Q?Sw4gajXwUJDM3c+aLYM793ra/qbA1V7qBeTUdeSFAzG7kCezwRSg8RdOf7eh?=
 =?us-ascii?Q?vYzYsP6Yl1ASeB1RnHNVo4ljYAcwupSWDX5N1CixQihpwERFNli8kzvS1yKF?=
 =?us-ascii?Q?GK1onAm9A7NpV1+6kGAolMr+9R00wQ8GmdBOdqEjLO+iC7Z7XqIDPq4EK7sK?=
 =?us-ascii?Q?EqsbscuubRrEspvXgMHwIJ7dxu/LceX/eStUQh910AlhI7RlC8l8TjY8eF2E?=
 =?us-ascii?Q?+ypfie2a6kJjbbvkNfwsXSJN9pGjGBnZtfLC5QgVhpn+JdPzZ7I3nGh+Vur3?=
 =?us-ascii?Q?bQetKPh+mx5cxI3siCkzjhJf9q1HgJUIWFsiDWM2iizbODld1DwfKPrLnJaX?=
 =?us-ascii?Q?DpPKGxIAob4SKTHLX6EgkCcnFtm/CZN8tnrJFrTJaTnRabt22Wj7zhFcsubp?=
 =?us-ascii?Q?HegCLee+BrHPZ530d83Anjmygy/7pdjcAPidl5rflRIOsWd2tM0dOZLsKxeG?=
 =?us-ascii?Q?2yH5QGIEKl8007cPau8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:29.6988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea422b43-e75a-4dae-680a-08de1d29d8ae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB8299
X-Proofpoint-GUID: qyXFIe3jELD0NEqCRTo-reI5UG2qHItb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX0KcRsFcQzQLC
 nXR/nPGNNb8e+UA4SUTKZOOkQCG/n3F0dequI+TVwVqTsHzaQuzMHhYO4CNhoFikbF0Lyyi+QJa
 +xgWhKUdXYfMMa53W5xKkOH/iMdyzJpiajMrZpkT5uqcNxGguhAhjQWcqoHtkRpV2drCOljxfNI
 Mh5DwCA/K56NkTUkHezIYVbhL0uQFa37q2DSqG5pEj3JfH3y8pMhMxBf/9BOxUlMWRAoE79c0NL
 IUAeLOOUG6WJKGBiPlfOepqqer6iYfjFKJ9FwYmrJmrItw2FtrTA3pDrW48rIBYqXenRY80PY6O
 pNNYI362UNPiinykn2wmg2rG1VBU4yRW123sgx6NmIfCqkoZ6eFLLJJSyD/4QSAItyLDCas6NhK
 NPPwFCSkgXujrGuPPOOtYTYtMybx+w==
X-Proofpoint-ORIG-GUID: qyXFIe3jELD0NEqCRTo-reI5UG2qHItb
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=690c8a25 cx=c_pps
 a=0iCLHuH1wF6tAjvkAzcOzg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=wK1mv6r_7XBLNqKtUq8A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

It is not uncommon for an SDCA Control to have no specified default
value in the DisCo. Non-volatile registers with no defaults will not be
present in the cache until they are accessed. However, if the first
operation user-space performs is a read whilst the device is runtime
suspended this read will fail.

To avoid such problems we should populate values from the hardware into
the cache for all non-volatile readable registers with no defaults.
Update the defaults handling to do this cache population since it is
iterating over the Controls and happens at a time the hardware is
always powered up.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_regmap.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 5104ae99df33a..6fbb241d9d357 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -286,24 +286,33 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
 	if (control->mode == SDCA_ACCESS_MODE_DC)
 		return 0;
 
-	if (!control->has_default && !control->has_fixed)
+	if (control->layers & SDCA_ACCESS_LAYER_DEVICE)
 		return 0;
 
 	i = 0;
 	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
 			 BITS_PER_TYPE(control->cn_list)) {
-		unsigned int reg;
+		unsigned int reg, val;
 
 		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
 
-		ret = regmap_write(regmap, reg, control->values[i]);
-		if (ret) {
-			dev_err(dev, "Failed to write default %#x: %d\n",
-				reg, ret);
-			return ret;
-		}
+		if (control->has_default || control->has_fixed) {
+			ret = regmap_write(regmap, reg, control->values[i]);
+			if (ret) {
+				dev_err(dev, "Failed to write default %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
 
-		i++;
+			i++;
+		} else if (!control->is_volatile) {
+			ret = regmap_read(regmap, reg, &val);
+			if (ret) {
+				dev_err(dev, "Failed to read initial %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
@@ -317,7 +326,10 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
  *
  * This function will write out to the hardware all the DisCo default and
  * fixed value controls. This will cause them to be populated into the cache,
- * and subsequent handling can be done through a cache sync.
+ * and subsequent handling can be done through a cache sync. It will also
+ * read any non-volatile registers that don't have defaults/fixed values to
+ * populate those into the cache, this ensures they are available for reads
+ * even when the device is runtime suspended.
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-- 
2.47.3

