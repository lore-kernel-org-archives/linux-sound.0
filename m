Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14F3168F5
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182551; cv=fail; b=p8E2PRBPDrPrrMjB4JBuss6T5TGhnYHxudiKqIjAB8FWHx2bHIDc/rgmW6QoVAN/K9FcpF22AxVc6n2WwKqez/fH5Zb2oWflS/Ytac1ZxZF93Rk26UM6P1OVA+q+Br1iNfh2eQXrwrOmqawdwyEIdWTnJMMOgu2/qDsNjj2j2Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182551; c=relaxed/simple;
	bh=gVGjX6YAv2oUTzW+FquuJHKz5HHKI6oM18qch/HG60s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrZsSRkCClI4xmShzqmUOm68xj9d2W4WbQTOvIwmiB/i07BjnaEhMgbxQ8bfAOtqbROxA+7daFrB5b1+R1ojB881cxeFxSAJisLRFSygD3MFmanAXdV9Cee3aaa8wlXul039cwQbaH3gmvDR04DEXB4Yg9jgTa8J7UN1QZ0fx/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FsGiYr/5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wFFHl6sD; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FsGiYr/5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wFFHl6sD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35JB9P874130;
	Mon, 3 Nov 2025 09:08:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7E+m1om8dTpQxPYgDJkBDKSTka53cqHHVASCbRY6Aa4=; b=
	FsGiYr/5CVPCRdSWqU5ZsQ5IOF7uSQrIYZkTaiBFGSkxdiSIBocaw81cD5eqKq2z
	/znJQ4lU2616cgyvfY2loWveKBUjmfeDWmuIFP2up9E/3DJODo0LP4tNBqgHp0nF
	WRLfb+t0QOrokcEofjhTMjNiaFnJ20x00fewX0tqX8J56qJrro+C3rjZzm8VZaC3
	1l88Xr66Oi3Y6zhy0tSKOGb8Yil7BNat0pwgl6LHlss39vDEzyjt2+Lzr6FVs8fv
	Yapeo4n4ZEe82b8vQMhtv0VomadkJClbKUETkmNn+5QEsr1UyUBPTG9dRYw4e37v
	1xs97R7cKjUM1oO96k/ydQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022098.outbound.protection.outlook.com [52.101.53.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDmF4YdTL/eVPq+zPAqNGr60WThPJ+ITvIKBEXpnR1x7ND15Nxz5ltkS/Ev7YYySXbyn12gGjT4ACBtdWrxdYY1IS3aCwDgbr9YszNE9LTdZgp8Js6H5vol0MrhUNgYHmioGd5kGsAZoVnH5JO7ep6CdS0Jijn7+yHNVeneDDmZ6oNMT0cS7GzLqSrujuPQjX+vctSeIQ121L967a74fFMCTRtZXHBoC0WoGCFPhBhgJGVF+dwAli2vuZ+Ua0IaxsMEGt4LyQVrYRWl8TTRJi+jPXBE0/H/HrKnt712Q3H4017Bi7VVtyZIjuQZuA7hGFieq1Qrpp/57b5N3ZcNoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E+m1om8dTpQxPYgDJkBDKSTka53cqHHVASCbRY6Aa4=;
 b=OsK/j7dFtFLdZ2jc0aIYrn/p8Nhk+O1rnjpwOYOuXXikj7oUEmIxS5+oZkFG++niz0GIazjeqKb70GJA9nmZ1H0yyUXn9eCE0fymoToaPonp6JJJbFliAhblqz/kamrHclCzWWzBy/4yKAMqYEfDqLXbBSWTwHLPI4T9yu0pU1Rffg/l/bHoZF4V2tFlzio75H0o3n97IJGzrvCxPvDCtl08BHlndpUFCOoPxuRcJBmfNjWFNGs9KyTBi6ilz+LuWfMdM1APSO7FylocNhcDunMfe7lkX6xUuxueX7jRS5QUwlkhKwjejiABXpX99ShP/QueDy5H7eItFS/Nk9wv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E+m1om8dTpQxPYgDJkBDKSTka53cqHHVASCbRY6Aa4=;
 b=wFFHl6sD9NIgNSOM9vrclS8yQ4V5UZROCQHmyAwtxE4ZHycrDydioWl2LXxgTd0w0ZgDOwCDk8DxABz1O+ZUYVhcVHX6t2yAcSZTn6ZTYO3aCpE+9vT5Ed4K1Guf8CkAuAsIgfs9qc0HFHUrpdTR2UNJkb5J2pGH4V34TGOb8ME=
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by IA1PR19MB7208.namprd19.prod.outlook.com (2603:10b6:208:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 15:08:21 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::47) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 15:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E441406569;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AA558820257;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 08/13] ASoC: SDCA: Factor out helper to process Control defaults
Date: Mon,  3 Nov 2025 15:08:03 +0000
Message-ID: <20251103150808.4015208-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|IA1PR19MB7208:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f8c036d-a719-4a1e-98db-08de1aead378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ITd9z26yclwt/LjtraEjMMqgXGvWOv1qS7Fb8fD/3jGOAvQ0uJHXG5ewygv?=
 =?us-ascii?Q?jSXyTkueWcw5P0oSW0CYygd4Zk0zMgWajx3OJdQ/ELSa3TTPaikiGcpd6MR1?=
 =?us-ascii?Q?Mqd38GSYHVN0HUur7cveGwRW5s6kzbdCgBcgN9sZO/GFtWiabfzmv3Oy9w9T?=
 =?us-ascii?Q?8jOVfFQ4CHD5NG944VBrQX0hJ3HfXotdImTFU9ug9xEF3fgR/SVTCTEtm3EL?=
 =?us-ascii?Q?O14nQozSpGoe7tRbilcv0MU9tdhBn2e2pgMoa1gqF3Ow0uu1n35+IojVM7wQ?=
 =?us-ascii?Q?pfucCiJgms0jdiKwDqjd7qAejYSOV+M4uw6YoRJYxJxoZxMe3BQ8vg+i2X+k?=
 =?us-ascii?Q?NwwgV07igQm0M3QqNkgXFdEf4EyfjtHT5wkfbZUwQ7HNjqbdoJGXzTKWEaGW?=
 =?us-ascii?Q?XAb+sbv3s2IntLzxgxfO8XDOCalneow2fRnm2g+breIgyFpiKDZTUG1D5lk5?=
 =?us-ascii?Q?29tdjTvNUYm8Io3dG5VOgdHamYf4tBhhOALjgCU1Sdr01E/GY3X0wvyDaNBW?=
 =?us-ascii?Q?3I5Ft1uT7fPHmTLQUcaRhlbL1D+x0HcJUN56XbXOYhItBVwG9bnAD8c7RHO2?=
 =?us-ascii?Q?NGL8yAxrvNbsttrVYluhYb1tB/bzIy5BZ6ULpW+kmmYiEeDS2STj1nleP0vw?=
 =?us-ascii?Q?9fZ0yE654R67rVkYAPqkpt2iGjQ/uSmWLSH5HjllRU8f/+zTSeCLxXXa1qR3?=
 =?us-ascii?Q?s0gFoAW0lpG/nXkcmvOyTOoO5hIm9PQllScSFMfY8WmyaV6upw8JhqFCB0Vv?=
 =?us-ascii?Q?ztqtqqBMop7U3mJpodrhYvkvbYLZ3e0EMWNyCBkb2mebuaRT/aRCYcq+qW/X?=
 =?us-ascii?Q?nFcT1bIBRgBUV+dJLpk9r8j76YHrOdI7DMRXK48+Y0K4FlBTgl959/fLU4yU?=
 =?us-ascii?Q?J1PwJPWK9IJZoJzBivVC/EzO+DUiUdWH1ygCj7VVKvTC6LhBTOEzeS7UkoMB?=
 =?us-ascii?Q?S1nzcXTn9BEQ4yeQDuAdpqJuEd3kBR9qFbjw2hmOdSOVsbYII/0LoLG4x9jH?=
 =?us-ascii?Q?sPkFZYAKL9vk0jp0VXR0Y2frDk7DSrz59CAn1nBn/b/gExUnZBnf0oAqG5R7?=
 =?us-ascii?Q?MxWasEkP/+GDJxEoeN4vkJRfiMaZM0waRKl6iBMF8wTTII14dOxlH6f2fZMP?=
 =?us-ascii?Q?bZ0WM3mfWy4SbDcZ7gfEF2n/epp00Dtplfl1cnn+NQNzmbguKLy+a439PDPh?=
 =?us-ascii?Q?fiyf1yezqPzOXATGG4r2h/CUJe0A7FgEpQnK3KnTbYW5uIasgjZMm9qkEU1L?=
 =?us-ascii?Q?gCOsWaBu9WYa8VcWeyfL2P62QaotZLxyYXg3M8dkKfwxT5dyqcJDphYxL2oK?=
 =?us-ascii?Q?ZsaJdiZe/Hef3HVaWmO/2TaEX9rx8eYP1UOppTmTJ4rDO8b+xI08qzM8h8Z3?=
 =?us-ascii?Q?OEVz1bU9irzWxL0Pr5+7UPts14kvraFBKWMiggzXu4elK0gYi9wPaE+Qz6TO?=
 =?us-ascii?Q?5qnGIkX1Sb+nD91/66nVwPT3j1L7cjPKLb3+1/dM1exXa5k2wrUaznq4DLi8?=
 =?us-ascii?Q?f0JM2DLFMkzgk7wsr2Fi6PE8of7FDtar65OBgXisUuBmV0kcVurn/xWCnSP7?=
 =?us-ascii?Q?uuK9Yr3wY1tjAMVkGcs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.2401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8c036d-a719-4a1e-98db-08de1aead378
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7208
X-Proofpoint-GUID: gq_8DvOX6TKn8UWz_Y-wAxLqHsG2kxsi
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c569 cx=c_pps
 a=R7kjjBOimlSL4s1eswC2GA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=IUiMwORI4Q0lmyDNHjMA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: gq_8DvOX6TKn8UWz_Y-wAxLqHsG2kxsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX9FRQs+ue+jmY
 6Ar6b+KIuxgb/rkA7NMJsyPEuxSRXvwaNMjucdONChc4LBvjr0b4mCBStv0m99mwaim3pwzps9g
 Ax0bVsjq+bLLJ30R8QeBOp1P0pR0vcvBHP8wkPNM/C/JF8EUoFEGstOo7V93WwjqVJvV7cL4tRj
 GkFG9grSiJgFv2CGViqW1kCksK4usq6iq3/UYJfJz1TVadERD/hWQd8WR6+pDCNGqaFDBnjGpXf
 N1+b9c5ezrkvipCKJfoIoSe5Htqxz9/VLO9jzXiGyQVTxA7lct+yCPP/qNEJM/rq2Yldznyy6cs
 idHFwVK7BO8N9WwwUcJfR337L9kWGXx/W7dtVhkQmywAgkeS3vFqBmqXwMeGPzQx5h4B1l7sKFj
 rTR7p8Oxtw/PwzA0YJWEG6oYhlE0FA==
X-Proofpoint-Spam-Reason: safe

The indentation of the loop processing writing out SDCA Control default
values is getting a bit large. Reduce indentation and make adding more
functionality easier by factoring out the Control handling into a helper
function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_regmap.c | 61 +++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 8fa138fca00ff..5104ae99df33a 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -275,6 +275,40 @@ int sdca_regmap_populate_constants(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 
+static int populate_control_defaults(struct device *dev, struct regmap *regmap,
+				     struct sdca_function_data *function,
+				     struct sdca_entity *entity,
+				     struct sdca_control *control)
+{
+	int i, ret;
+	int cn;
+
+	if (control->mode == SDCA_ACCESS_MODE_DC)
+		return 0;
+
+	if (!control->has_default && !control->has_fixed)
+		return 0;
+
+	i = 0;
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		unsigned int reg;
+
+		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
+
+		ret = regmap_write(regmap, reg, control->values[i]);
+		if (ret) {
+			dev_err(dev, "Failed to write default %#x: %d\n",
+				reg, ret);
+			return ret;
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
 /**
  * sdca_regmap_write_defaults - write out DisCo defaults to device
  * @dev: Pointer to the device.
@@ -290,7 +324,7 @@ EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function)
 {
-	int i, j, k;
+	int i, j;
 	int ret;
 
 	for (i = 0; i < function->num_entities; i++) {
@@ -298,28 +332,11 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 
 		for (j = 0; j < entity->num_controls; j++) {
 			struct sdca_control *control = &entity->controls[j];
-			int cn;
-
-			if (control->mode == SDCA_ACCESS_MODE_DC)
-				continue;
 
-			if (!control->has_default && !control->has_fixed)
-				continue;
-
-			k = 0;
-			for_each_set_bit(cn, (unsigned long *)&control->cn_list,
-					 BITS_PER_TYPE(control->cn_list)) {
-				unsigned int reg;
-
-				reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
-						   control->sel, cn);
-
-				ret = regmap_write(regmap, reg, control->values[k]);
-				if (ret)
-					return ret;
-
-				k++;
-			}
+			ret = populate_control_defaults(dev, regmap, function,
+							entity, control);
+			if (ret)
+				return ret;
 		}
 	}
 
-- 
2.47.3

