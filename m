Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430062C15AA
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057750; cv=fail; b=iBUvqIYSES8oy/geUVa18NcldoGfG9sKoiD+kfJ/RDKUOkqdxoQ224lrRBWrpv3IV0hZLKcYL+3i8ziTKZh16RmulRm3gDu/2tkn+aCDax1PbZdGzIkhcqDWRM3DLOCYR/vcTxULDLrAOK8MQ47DgYhA7ujjSFBkVftbUGDL8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057750; c=relaxed/simple;
	bh=m532ZTF/It+viPg47aYmrP6+vo0/K2Tdqnuq+aq0G/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzZTMoIlu3ALRaeRH4uNZTWyFezCW2k39TruZA27cecrpZVYQJQ59S4VC9YDdGeAxhKAHFLXqSEvIbZVYKHIWxT+BmiaB96JwduH8lGab8+aadvbUK3djKC7+i4IXKv5c4eSmwPNwCvwmJULPQ191M/KzEdN7tnqSd3Z+oTNSfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l9s9hKmH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RPOrJiXw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l9s9hKmH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RPOrJiXw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI5g3X63315776;
	Thu, 18 Dec 2025 05:35:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zhk45Zp4TtF9em88Yk0oKmox6MwU+fETnwMNFR3DTaM=; b=
	l9s9hKmHTB2GoB1yAjNcxeZ995zcOipvahkNyqtsttg85E+gD5ZZ3a6Fj3X7AWPI
	wHJBEcdSi6saWFayU/xP9R07qCU3cxDTsAeYhOsL1P07xC766LEwtwu5HJHlPtIl
	1WHZw7Romi96lRCbyFRDwe8W6D7IQYKPAQ6nry5CQhIP69BiwvhpUGQG7g0olWDA
	I4QMoLnbqnfkE0APz5ogLxhQ1YkIOvjV67mFATmK6jHpUmDkCOPJq8yCeJNImGSS
	b/zWKSmIPgwT5dj5802vearikknGPzb9ArC82jjcqa/TPDqZtJOcuU8B/dW5RnWB
	S5F906WSh6UxbVoQabFZPw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022086.outbound.protection.outlook.com [52.101.48.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1wwsq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:35:30 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHCHeMDxFhGmL9TboqViOVBy4BFVX0K5gMgw6jlKLAOWo+3tD+PMkHz+gFXHUHx92O9oqCazZG8ibGULx9NTSvGdfkA6W5tlC0R2dNgbIEfItynFkTQJiicrNqQPbHtn5W7amKazsYa/DhI56p4w4Oa0ik8mRDTzfOegZCu6l2F4FIq/rWdYNIgbq0ZEo9zL0hJW4AdwBJFPmlzF4yOs4Ea3THU6QyKJLeLNY182er/5QRScHTHv/Vo/6+vxI9PLjoKU9SHcRyA0TphqRf8KkOE61O+Uj0DXvpaJVpYTlwNSbSW7lbMctJFnPm7isutypUeI+GeC1qVULghHk5DPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhk45Zp4TtF9em88Yk0oKmox6MwU+fETnwMNFR3DTaM=;
 b=k3F2wI5gnFT2Q4jdrsFB8U64J4A4IaOiEuSmrwEZHgT7iumxRtDEhDr5lp1PchaI1zrOh1r2d07/pFl3rd8mFEJD1OLSoAgunCEofTc91fdJCJpl0zbAGg3FNdU0YuWFOLj/4G+YthGnE242u1ADlMzEEJNsuiR4oArAfQnaly3Jdf9ZH/jQWxsDFnEJl5kyznL8ZbHTI0+EXDXHHn3+RfkXoJjXBVjr3Zx00h4MEKvJ41KgyZZu25eBUE1w5FVnx5FlLqr5D9Q/CLoKUX2vwEBkz6C2jkQPa+wpFCzyKz17wa5eOItInwBvPT0wbZLpDyRxKuOKq8quJsQU9EClxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhk45Zp4TtF9em88Yk0oKmox6MwU+fETnwMNFR3DTaM=;
 b=RPOrJiXwuUdX70kO2KiMYbBW0rwtwaSVgAdH+YjGAi7BD7vhLoNELtZhNZCaamV556sLGykWG3qb9jPS4GDsbHKbpNK8OnMSYOHe/jJyT8358NgBkXDuGQh/1E5OcnRbve8iQjlxhujk6ZVXrxbSW5MeiqlsWR6HRerhL4DJhnk=
Received: from CH0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:610:77::21)
 by SA1PR19MB6743.namprd19.prod.outlook.com (2603:10b6:806:25e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:35:26 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::a7) by CH0PR04CA0046.outlook.office365.com
 (2603:10b6:610:77::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 11:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via
 Frontend Transport; Thu, 18 Dec 2025 11:35:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 49866406559;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2C4CA820247;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 4/4] ASoC: SDCA: Add lock to serialise the Function initialisation
Date: Thu, 18 Dec 2025 11:35:20 +0000
Message-ID: <20251218113520.1287693-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SA1PR19MB6743:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 15193baa-3dd5-40fe-47d4-08de3e2989af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BaAw0VtE8pcPr1iCb/zwGnhhuWQrB2MFo0Pmgw28pKjCJILtap+rkWKQg8t1?=
 =?us-ascii?Q?gyYCEsXRYOZWI4YVkjbot9Ciw/tlG9d1hc08rxohAOBbeVqwnm30s5OUr5v1?=
 =?us-ascii?Q?osEW7Zp5GLfEBImyL/D9yipbIvgG12TSR8w5qmBQo9w8m/9rzx9DBlqdffcV?=
 =?us-ascii?Q?4+RHQd1lbKoQ8tJMgtlZvjr7Oy4cclIoQzLgx5EHw3vfbGZYpDWkTskOCubZ?=
 =?us-ascii?Q?GnuCwk+FGz67KjFAyqlleXMcQ6KbcSVA8Lj+HyhAblXsVq/8DuFcfX+s13p7?=
 =?us-ascii?Q?Sx9NXRRwQZXSHNc3WlZTrhvPbXtNcRL5dteWZnHAqnmqYZoWLeXnCvYIDRnY?=
 =?us-ascii?Q?QFx5fSagp92S1NAzQSMt7c+/HuD5ndonCTecXE9vvMlgenVY6ZeveD7fnJEp?=
 =?us-ascii?Q?hz4/GmwLWO4kMjDNixGMoKihi6+6zpujmgaOb4u/POWfuBEYzylfiXF7lqTL?=
 =?us-ascii?Q?h+SDw2IZz1W2okKBNJSQdgx8S4e+oox7iGfwvNSglKROE1Rcz0hL3SJ5EvHm?=
 =?us-ascii?Q?M0Swb1glgjrdfEvRpQNsBMWnzaULzu3SgCfjJxZ1S9SLyNpB+WjeD7Sx0EAy?=
 =?us-ascii?Q?ZWv5At8HLIS5bltsd9HaPtap0eFYeYvpIBvkk2IGbdoSVC28EB+kg52+6Sms?=
 =?us-ascii?Q?bQ10mH9KSpuiruH9eC3te84DZ+TkRayWvEaqQz41okKaEP08oNr1v7PXmlp/?=
 =?us-ascii?Q?hEvBDtJzAbAZjIs5JZncGSEFOMfqrxGBlb3KtU2qZCaKK9r4XkbygapTJbCg?=
 =?us-ascii?Q?y7qs8XI2QdzeUf6tL48CDrx1Nt4rhPgTVTAVq9s9SZfOEMn2tgQBCBDiDinB?=
 =?us-ascii?Q?PhTJPhGkWfk0BcvwZ6TnfNaQcQfHWELc1tX727Buh2YEoEpJp7dyV44cgXBy?=
 =?us-ascii?Q?4wnJ+KFMX2qBuwIaYjQUvfSdOxtgGnZWz0pQrFUI/zEdeqSPQbdeQtrAwrba?=
 =?us-ascii?Q?ifzpbqoraLbs7RAowGUeUAPYCdWvIW2gZXDylBewIm44QwNG+5piI+TNUxot?=
 =?us-ascii?Q?9b8Yvk50TpiohjVfH4iQkXZ2zgRhwY1OgHANrmuSLOm1gfHL4GZKXUNwHRA2?=
 =?us-ascii?Q?Ho8DhyRXcKt1JzlfuUsD0/WwH7Ay++vUxYjqR7NgmkT+AZ2z66lQy6ryTcXr?=
 =?us-ascii?Q?RTIxcdGNbWdFnYk88hW5d1hBzgGTHFL5CIg5KUbat2kDj2lOhUcgnbkrYuul?=
 =?us-ascii?Q?cuuIIlevPsFrGZZwhW0v3Y5yollXxZzrNmW+I8tlIPcomcFvZKe/UrKMysoe?=
 =?us-ascii?Q?wFoDrq1Tapd2839/SWQGjZdf3dkVbq7Si1cfBRtW9ULWx/qxFlXdc9Zd3d2r?=
 =?us-ascii?Q?xw5ndsw1Aqi68BeoRf0MIud4eNKvV0kOwjhv/MVDC7+3xlnrIyl72ttBs/4T?=
 =?us-ascii?Q?HyhNUdtbEwhgpd4fYiniZU9YMayrA7yga9LR4YVveG3uXySSrgCGc8eXA53C?=
 =?us-ascii?Q?JcvNjFEWNbT40JXM92bhiAyemfC7a/m5KMNpQmVTb2dCToNCixS9O+WtMxdS?=
 =?us-ascii?Q?1qvQ5PvfbRN348aua0mHwOOFgP3EytAEwzcDJAQjnks+nxTf/lnj06A3yCDX?=
 =?us-ascii?Q?5NHYaRr3mlnBvMPx/D8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:35:25.4893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15193baa-3dd5-40fe-47d4-08de3e2989af
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6743
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfX7Us1Ivj1N4bg
 +pvC9eDDBatxvZkUCn3abY+l7kSV4aLx4Rw/s59RBty2lS+uOUVX4HklRcHJA8nD2fC/w8VN6Cu
 KhQs8MRHCKvjYBm8GBLhjU9wPA+X/Cckv6d08mhxmYKo9TvVoRfRcyHijBa+inNOoWJbd5fbFQx
 c+QlOpzLZVl+RyIMMgaCQU1RtcuNoHaBZ/k/jofoXX2zqbrLVg9gSQqZE+IPK9XEr9nJBUqhb4h
 3KKKC4qu+OmPU9wJ6utyJ7g1BhCNRy3PMxnqDPvb3LKyKYgiOngnbJAWgv3aQUVbtFwz7J67xLX
 G/BuK/vpMSp1BH3n7msJ6ECAWPUqxdj1sivwM36FkHHGO4caC+1XpvjHQRyXwKAjZOqCGmN1gY/
 Td2fstR0nZoj5ENPTsWKZEzPDtslbw==
X-Proofpoint-ORIG-GUID: mEkR77aXCwlUGobI7XV3j9OavsuxejnE
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=6943e702 cx=c_pps
 a=fkVT6ClcRaXWu6jQ4rTLEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=ZebSmUhBFGRK0BiUr4kA:9
X-Proofpoint-GUID: mEkR77aXCwlUGobI7XV3j9OavsuxejnE
X-Proofpoint-Spam-Reason: safe

To avoid issues on some devices serialise the boot of each SDCA Function
from the others.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_class.c          | 1 +
 sound/soc/sdca/sdca_class.h          | 2 ++
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 438695291257e..1b83aad1d9d3b 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -205,6 +205,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
 	drv->dev = dev;
 	drv->sdw = sdw;
 	mutex_init(&drv->regmap_lock);
+	mutex_init(&drv->init_lock);
 
 	dev_set_drvdata(drv->dev, drv);
 
diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
index bb4c9dd124296..6f24ea2bbd381 100644
--- a/sound/soc/sdca/sdca_class.h
+++ b/sound/soc/sdca/sdca_class.h
@@ -28,6 +28,8 @@ struct sdca_class_drv {
 	struct sdca_interrupt_info *irq_info;
 
 	struct mutex regmap_lock;
+	/* Serialise function initialisations */
+	struct mutex init_lock;
 	struct work_struct boot_work;
 	struct completion device_attach;
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 5a818d958543f..b4d2e40efe174 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm.h>
@@ -234,6 +235,8 @@ static int class_function_boot(struct class_function_drv *drv)
 	unsigned int val;
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	ret = regmap_read(drv->regmap, reg, &val);
 	if (ret < 0) {
 		dev_err(drv->dev, "failed to read function status: %d\n", ret);
@@ -405,6 +408,8 @@ static int class_function_runtime_resume(struct device *dev)
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 	int ret;
 
+	guard(mutex)(&drv->core->init_lock);
+
 	regcache_mark_dirty(drv->regmap);
 	regcache_cache_only(drv->regmap, false);
 
-- 
2.47.3

