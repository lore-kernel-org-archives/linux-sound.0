Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8C3271FD
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084121; cv=fail; b=DFSZ7XaB7/0o9xCzQQcZ3NCT3nmPF8/zZdAcGXQ7YkivyYRWOnnqb9Ra126DAN9CT8k2iGdnuRUcPwwI9ky0MVuAjncSWBaWCe+k58feKF5oLEZ2Lf9FYQQUj9YCxZ56VlZ2EiwQkZw6L4jBE8PuJFaCz5Dthy1JVz3okamg8gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084121; c=relaxed/simple;
	bh=sh2qDDsSjClxR4KCdu4B+eW0zK4FqudsWG5zwribGQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VylkWAzk1+zfWUxlbifU4AaSDozHt4yrHSnw82tZU41stuG3JIIam5Rmc7KD9gOZ1EMeDnE9r04DpHFtCx/flRtA8a+dJM+KKZWsHk1oyAnox3gRC+PRJpjFFJ/w5TmePmet/qDsaa3M06rPpOSUinvS3xbQYnLmKCjVGWZ/CuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iEdejhgj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Xte51sOA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iEdejhgj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Xte51sOA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APCJjDU4074483;
	Tue, 25 Nov 2025 09:21:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=; b=
	iEdejhgj0xgQrzYPAjFlTNsqTNzhhEyPe7Z27QZ6XqLzU8Une3RRUDdJIsGRLD/p
	+yUt4DYc7HeGaLMfllj0GJ7G9ZvjTQ5pDj6epyuh2uTjkooGpCoQTbnlr32p20dB
	ypm1v+I5Jodq9YrwnXCQSqnyOg1k1Ktz0VCN12nl2bN1F8A4na93dGgfLX/3dyjS
	19AnT4Uy2VzWXjKWmRIVPcGyywVUdY/UPzlfa7VILHOJiCBZrLmEk8eBbVYppMpq
	bJQIF34Mm7DdcJxqoRpZj/VECeUExJI7QSNrt7XKlbN+789JuDGZZwFxc0b9KuBq
	3YvqYxT5bniU25DtwhuSgg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020097.outbound.protection.outlook.com [52.101.56.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf1b5sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 09:21:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+zsZBKOsr0drl1c8shvL9TS24tuEmeC0zEiWKj+zPRWZ8mgIOz7wnBPZFn4iqZLz/Eg6hTOXZpe2uF43f4/Np3dvyO3iPfd7izTRSxCESMPFxKNM59YDt2kJGuTVF4IvOTBweSO1wj4R0AkY1fc4xJSCdQlZdvfx0HJGhnUzaxmhkFm4APKyRwgq1vH0W0sxOEeg2zifHFeUKSyNo/i0x9OF6mxweECp9f5ArHtDJctxQHxajMSGepKRCkiiTPVU2j4rAYQJU20JG/UuiOMqHDtlUkXOMsz2PkiAsmzSZkbQwDHUZroh2yHhXqsH3C4N5J8gvBFxlAwtkpVEfSzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=;
 b=bKKNf9/iz9IDEGFm7TUoelTb7Q20V/PW769aGZunWoHsS74stJl0pZsqHOmWcTQ4SPmAuEXPfAWtpidadMPZo/pk5R8V6ms6v/xepVRk0i91KBVG0ZQA7BwQ7kJHVDv/WRPkKODQ43ncbEPSSD+OoveTW/Y2euhlULLHgOP3w6sAdK6TuXp+KbeHwGO+lFWpfJWfIf0mqAH2JaPBW3ysJZlbGx0+Tr+o2TA+API1eMwqNmdbz5AQay7nqdyQOBptDKR8dGZC2UmiWZcq+ebB952m3Rj4OZv+AyJ3fvMfNScBF4mvOrjQgzHh6ppaj54H5u6BzEb9Tl9Gekhm/yMflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk/CwdIupaLhxpP2/T1hV1Bd42VFn7qR/a2avVOh9tc=;
 b=Xte51sOAD/XI4EUr3Z0dPwvNkgWYAiqzNaiYNSmOr6gAXs7MZjNrpLJ72rZtkfrLxrJN6QKtSixAVQ4tdIdm9rCOjdEaK2P40CD8Aa+Dd7yz7kfOqgvEkISj1+cqI1Q16jzYvnuo5c0eBwfk33R3D3CZliPV/hknv3HsaywZjBk=
Received: from SJ0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:33a::18)
 by SJ0PR19MB5479.namprd19.prod.outlook.com (2603:10b6:a03:3d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 15:21:34 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::1c) by SJ0PR03CA0013.outlook.office365.com
 (2603:10b6:a03:33a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 15:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 15:21:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80BF6406544;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 63D5282024D;
	Tue, 25 Nov 2025 15:21:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        vkoul@kernel.org, lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/7] ASoC: SDCA: Add ASoC jack hookup in class driver
Date: Tue, 25 Nov 2025 15:21:24 +0000
Message-ID: <20251125152128.274808-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SJ0PR19MB5479:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7408a92-5ed2-4bcb-dc16-08de2c365199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTvbmfhpoBdR3k25YJTA8kz+/HMtflkJmjigFpxbhjkmA8ur6DWR4cTQVn3U?=
 =?us-ascii?Q?vAfLr0p+R8404mq5Q4qGtmyve9ahKU92VoVZz6bdo5xpHwemkuoNZb2sk3ZA?=
 =?us-ascii?Q?APygxZUbmK6aLl086zB8G28b9/RCHl3pCzoL9WXaAUfhPsPcLZfOaBtI7FuE?=
 =?us-ascii?Q?AjhgwYPbhQWWdifatPKb/jNHbkX6VFXsyHXq8g8h0EZVwXcFca9Em3PkcS40?=
 =?us-ascii?Q?BQcdfAXGMST+Ugv5nYVIXoZPNZmyuV0z6x18DiLTYV57xBDpABxZoSw/LmJB?=
 =?us-ascii?Q?isD6kyYNX51J/+PrHTxdWOd/hlQ5qZamTPTu8zkayQEZkOivEszO8/C0/6q4?=
 =?us-ascii?Q?NO/QRa+EFcrEXtk/lctRsZv4xDy26JjzPpE/YSijRij9uMXtaef9HCkVB+Ho?=
 =?us-ascii?Q?cfFFJZnVErS4MRP8PvM0/frW3FnU2ixZNUK/zNudAfUMtqKCQsBqGCmMaH4E?=
 =?us-ascii?Q?Phem3V9vvvchX9PfBLYLC4SRVtYy9BxVbhyZcMgzdgSh0hVpx2niF3YLFrLn?=
 =?us-ascii?Q?vqcot2fb7lLoFcFxnVflfN+P6KmUsd3lrGPQF1xktqNlOgSWyFYqAXeYSb6b?=
 =?us-ascii?Q?7I+yDsYAQXYjKyTmtL9hrFTUcNvY/EPhv82xOZT9Abu273HXRTG+ZOsVWh/G?=
 =?us-ascii?Q?yTA/ak+mzV9wUsYaSoW+9+RHT9JcI055G7FYq9at4dlVjt5QDFOYOPma4n6+?=
 =?us-ascii?Q?cSMrLYpjGqTKxhPO8Ml8+mIpL9ho+IOhvuR3lyft06DMvz7pvlNCqhbITkCM?=
 =?us-ascii?Q?GmSu4IFpgWew8i95FQKNDIuDawhcmI4TmxW9bagmMF0mV8YqfYjgpORFkuor?=
 =?us-ascii?Q?giQgp+JUeQMrC3czn+E6piMMuKeB4f+p7oX3hMtVZ53+6pH9/cBjDhUOxUVP?=
 =?us-ascii?Q?McG1IG+LJ5vLzgN/mLMybsf3vF34cZIS6Utjte1n1c98bAQfdXKSf2ccVEfy?=
 =?us-ascii?Q?6Ill9spfiXXIm2alxOoM30WFaoB1caRCzQjXPrUm9rAZaUxRNKnTWTrj2Flf?=
 =?us-ascii?Q?HTPt2XshNVTs8Kybe4SpS7iL3ivR8Z4+TWU9xC6yOHpnfPxLccFJEVRht+Io?=
 =?us-ascii?Q?tLOLihDyhvHgaNeW6Z4WwUd3j3fWUvJX70flPicF5Otgy5vAKwhQ+3RlhkaZ?=
 =?us-ascii?Q?9ns0koetFg4RrGUQMRQqzl4Dw7aLHB9u8tXY7WEs5Pc4Kl0rR0nvfMPxgDIp?=
 =?us-ascii?Q?6S3biSVN5J4Lxf8BqUZFvZE9S69I1QXN/VsA22oKNQhRt72dfT/sJLPMn0pF?=
 =?us-ascii?Q?yxf7ppBZ/a15tstIAg2ovAq85SvWpdxr4kXKxeQ88PGhSNF80xW4cimhvsyV?=
 =?us-ascii?Q?ueY+5NYmBVEt6Bn0A3DRTcnjlum9nXqlo960gsorJZzvN5UA1ypOlrIO4svv?=
 =?us-ascii?Q?rInWZteVc5Uu7/66SJinn8/LePbuuE5Su/Hm8nvlJQ4ayuRmFxx4ntR7W30R?=
 =?us-ascii?Q?xKTej+wDQbo648h6RcYGXZMoOc/36f/M21+d4PDCG6L97gGiFgG9rCiQ63U2?=
 =?us-ascii?Q?ky8oxTLgaVEDsoHDMfmodq9BlNTFDOkDBzLdCVKUymsY1A3f5LDSeznyKmq0?=
 =?us-ascii?Q?FcXIkgyxqLsWRr+S42w=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:21:33.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7408a92-5ed2-4bcb-dc16-08de2c365199
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5479
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=6925c983 cx=c_pps
 a=ydgU9ZzZ8ygNmgwE1kSFDg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=YzWcvuQMjQxWuX-EqYYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyNyBTYWx0ZWRfX5vsYK4CGNpRT
 TroV9D/VUoVPydm5bB/3zMN/rWXVgkJZ8hTshPMQXhWnug2KDfifVpNldKVSQAZVrTGy1QNHMLi
 6JFe4VPjA4LNVaM9JMshDkBS66aZlp/aY0wlC776qAXB9RDmGgnGVtHe5JtenBt6tfFUVLvhxyP
 VSJEH5CXysIKvMxm8Zg1pp+lX5s/MzoHAb9IYXbMaZavhynpXTkWl3LfQuzgn+M65V7s4d88DFn
 CQGbdc/fL6no4B46XpNzjqXxMcsMHtGEUp4gnpwPk4BO6piM67hjJKc1NS+TG6keCcMsB9YphoY
 xuZ7gz1ERRAlbyP4s/7U4LQKyXUxckVA+GYx92tMnN6xNPz10UfDR1CK5gqG/qoImHUpIiql4pl
 KwyWUfovRpf8+8fO9PUNv8wIeQxRXg==
X-Proofpoint-GUID: kqjUK7i3y4UeGJmnXTmWfgiCbGRdhUnY
X-Proofpoint-ORIG-GUID: kqjUK7i3y4UeGJmnXTmWfgiCbGRdhUnY
X-Proofpoint-Spam-Reason: safe

Add the necessary calls to the class driver to connect the ASoC jack
from the machine driver.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 0028482a1e752..416948cfb5cb9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -19,6 +19,7 @@
 #include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_jack.h>
 #include <sound/sdca_regmap.h>
 #include <sound/sdw.h>
 #include <sound/soc-component.h>
@@ -195,6 +196,15 @@ static int class_function_component_probe(struct snd_soc_component *component)
 	return sdca_irq_populate(drv->function, component, core->irq_info);
 }
 
+static int class_function_set_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack, void *d)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	return sdca_jack_set_jack(core->irq_info, jack);
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.probe			= class_function_component_probe,
 	.endianness		= 1,
@@ -351,6 +361,9 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 		return dev_err_probe(dev, PTR_ERR(drv->regmap),
 				     "failed to create regmap");
 
+	if (desc->type == SDCA_FUNCTION_TYPE_UAJ)
+		cmp_drv->set_jack = class_function_set_jack;
+
 	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
 					   &dais, &num_dais,
 					   &class_function_sdw_ops);
-- 
2.47.3

