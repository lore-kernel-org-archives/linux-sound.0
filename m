Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A31F91E3
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 01:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880864; cv=fail; b=Y+R7vy3aduhgrKhj22sFfO8nWAARc4TZgUAtzceJeenVX4mZjHxVa2ZJXFFbtGjpzqTZ7gJW4g1go/PQelKbpmxiwpTR4ayjkR4Gfdkc3uqIBJ+3n8POM6LEDdXMxshTbUY9QOM+/fq3NJeYalAQj01V6ew/AWVHcjNbCqwRrgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880864; c=relaxed/simple;
	bh=FHuoXxTJNqLrIIyeCW+LnwC6Xf3s0J6bgd0qznQcEtY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K5yNkXGgfOASPZZnmPSqGU+JLcmgfqtMxNXSDMeNrbWHwcZkVJrb3AX9InxLFguctYsy1l6JmCOU0gom2NRMD36QvfTJEhfhf+3NYHln7g/iE9fmaGIJq6WZYyDQom0eTUdGLxPK2ScLrSpMl8ImgLgLcYp7yjB/9P3JD4lIjmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=YPuVl0wM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=V+7qsY4R; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="YPuVl0wM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V+7qsY4R"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67RMeFdj4103793;
	Thu, 27 Aug 2026 20:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2rYZjTckCJDfq
	n+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=; b=YPuVl0wMWYBivXJuu+v5V+N/zwnu0
	AuRIrjSwfHf6nIyIjAJZ/Z+u4AOFsEN9MlMeSOyT9aBvNcSYOiYNaPyrQOhdCm29
	HavSvD8ZSG/5+40zEg7yfF3g2Op93subw94MWPLSrGdJ7syRC78hawqSnJRfq3jE
	1gxo2QLCR6/9rDEcZ0V+VSxmiDosz8w76Lf1wjdFNhqT954YBc+C6W8locWfM2Fl
	nnIgDjrfXdLsuMg6F3yZpQyMhl1tmgxCnU8nxq8wh4CnFbeWNYD3lSGrcPJB1AdM
	06UH8YTLqqhvjGgE5CFnkcrvxFp7CpeJjctCGbAQbmW2oBApV50rvE4Cw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gahg3e0n9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 20:33:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik924dTJwTJbI2vnQmpvCxwErwcKCURFnSX+Y3CFGRK/4sbM0Z9Ikjmt+MPiCLDCyyVwSW3ZEdgp9AaToH59bTjd6H1abdLFAUF5pfznPOFsA2Y1sUEDQoEZWJjDyRci1/VUYIfahNgqkhcKED2//sEyK/BafegXn5ZZ1l0pJGS2lISlsD/ROhGqZF7aSxvJUvNYyA8SDt7wF8oF3gS2Ia9wBXZvKAqPxnLEdoPpNTRoJveFlseArU6NlvBYbYtXlg0aGP7DDj6qlquKpI6aCKNMZUVJXhXhyLURsJFYxVWMM+esRUNicShsTudbLO+3K/7/ElUnt9/CU5DF4+mauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rYZjTckCJDfqn+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=;
 b=yt9kP3Ux2QTJqUJ/2zZq9Ys1gQxtM1tKZoFGRwH0DFRp5qy4lnBIZ1iV4sojEPESTkd7l374brApaHCAveh5lF9H8TkA9bnhvuX4zhF2ImRfn0g41klJZR4iwpC+lAYsXOErrpHGma79/hqX/aqtc/jOSuxrAtibNRJGbfvj1PEXxWKEAVpxNiKlglYPOmJLHiUMxDb1YyMU7tW+JAopah53YLu+VbvTB3vRZcTwCIH8oltCe3fkK3tYMb05zxJXFv8hiezuhAxzalcVfprElWqcjCg+Z47MdDTsmYrac+AbsOt+YQwQSANR9Wwy1QWbHyITaCfCVVwidAFHgrP8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rYZjTckCJDfqn+JdJ9bBYw/nJaUPcXUmtvwmmSzWgA=;
 b=V+7qsY4ROvjVYmEZZzAyyQ2nSLZcTTE3gBYsbs9EHsrBkgltVsl97E19S8MBQcqohCqj7Ig+EJ5A2S50RfaMwH3XHW2VpqM16YLyg66QOrAo+9sYFKYkSgR0TseXlmsdKriIS24HBHQAF7IC3XnfVyj/lfWl1Fq2Ud7+2fVK1sE=
Received: from SJ2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:a03:505::10)
 by PH0PR10MB4725.namprd10.prod.outlook.com (2603:10b6:510:3e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 01:33:40 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::8b) by SJ2PR07CA0004.outlook.office365.com
 (2603:10b6:a03:505::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 01:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 01:33:40 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 20:33:32 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 20:33:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 20:33:31 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.163])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S1XRxi1864865;
	Thu, 27 Aug 2026 20:33:28 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [RESEND PATCH v1] ASoC: tas2781: add support for TAS2573 DSP functionality
Date: Fri, 28 Aug 2026 09:33:24 +0800
Message-ID: <20260828013324.1051-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|PH0PR10MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a486a12-e543-4d24-25c3-08df04a463a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	QkIEKIFsOcS21D5oRCfb7nyBmdeU/F8+6AIEMHmt1P8/dOnqry8t8f5jC9u8F2/O47pH7wQxLSNi8x+qlPmVvMfn5eXzqgOhEZLVtVsU57s8Eqxqe/N6rcJqF6BbPUaVjLaj6cpwLTNVQy9M0OxjsRowVaU587oOHtopSh+WHNrz2ypzf94gDVF4PlJDZIVWarT2Bvq1ToqpA2GWQtSekYK0rqk13z160uU/t3/MEElnBqAo1CPaTRC5pJPEgkLfc+lHsCOInwuZjehhSbdgMWPTUemjIzQEYjddXkrJ3G7cMGMt92GzUOhmUxy3TPuKND/dcmEkZXqW/+wMLO/l972qkoClj6cHlEeq+WkaKaL4slGih6sqUgmoXBNnY1BlI9JvTySJLCNZ/eGi4acgoBduqzviUuPcLrY1frKCNe/gnoPbd5GvXCsAWovzElH4TL55pXnFjfJOVsJ0U6MqWJ4ZaK7Gc0FjjBmCfSb47ZyJTDcBwgg/WNtZJb1avGByYPfRCOMDbe/I8siy8kx+I9f7GFMShNf25rFg08QWVIptRxBsQMALNWhTNpqGUhg8MuLl+5pxDDuepwost5VXl19bYwiq3OY8rUPyk9/Q3QVpoxVREpOfJ8YvHD7/BpP/JRofbSlLQ3FibFeYfwixAJ0gtFal5zScIASVDA5LJdG8e7+8gTDJkE2tPomkLArank33MpILzEAxtAx5fSUULw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MV7Aut1Bacykj06A9XQWHeQuIIjqmB4dXYlRhoyNoSsegXtPVoggtA2GAuW/EOwstGjeXjWAIrRB1dc1+dflq8NGLvFTUA3ES7n2gjKNehj2Xos7dc2TM24k8bHCPnzY7kN2vAIiD4hK1gpBusfL/ovhNJlnPozZzDtOkKY8uvhxP/k+0cm9r9PN8Gr2GT8MU/QQsmkWQspJLAa+m82MbqTNh6lrbzF6HT63g0an4CPnB5BW0oLzz42CZdi7DgrNnmU0AUu22bDZV+liNPKbSKf0WPHyGQlnZXWj+7h1SKwu8XnfWz3i6sc+HETQ+PJCM7L3/f/ZRPYAWq2APHLx4rAQOAqfeJehbF5TdblyTheH83XREqKpw68FrCoPkV+0TqC+xOavHyain7/G3viv5GNPNG74Uqxg3XkSwxV9MxP1DSrFqhno/cSoYFLcPiIn
X-Exchange-RoutingPolicyChecked:
	B60STdnbrB6CXT8Xu2tmI2uYx77iiOS3QXwuxTSCcMKmGIniwVBjgEveHXU+T0laPmRKVa/7dCeoPxvpX0QYpktqmHVME0TpBbeQcwEAT+lJ83DKIzeppdLSzlFda4s7kTS5bjLxJ9sOkbX+OO/6QhtZcyZ19YY+61V97OuhUOZ589vIvcIrHS3CiYI1mgX2mxwqoiqTpU/csMjkLnIbGVJ/8EeUlyydrZ6ruwophN9WA4V/kcLLQV9VxCA4qAPGv7Ug04YwtWPqgvxEmZ0yatreR+bbQCnKjE1FQETAaQq4+15QnCJrIY7PMjSk5ImkLyeBrXyunFklVmFjIU1N3w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 01:33:40.1559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a486a12-e543-4d24-25c3-08df04a463a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4725
X-Proofpoint-GUID: DNHnShSfaqY1CBpmVj7FNUmggESD7mUv
X-Authority-Analysis: v=2.4 cv=M4597Sws c=1 sm=1 tr=0 ts=6a90e577 cx=c_pps
 a=+5nsKerQHvRPAoQt0ERV+A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=gJ_vmGEaB9TpX6CrqTgA:9
X-Proofpoint-ORIG-GUID: DNHnShSfaqY1CBpmVj7FNUmggESD7mUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAxMSBTYWx0ZWRfX/XzD2Tg6RCH7
 uR10Ktua43SuWQR8tcExYYiSCsJY19M+F/Y8dylj8QkUwg7Ldr3QRnBVh0nhK+iOi6G/oF/yySn
 mJctufg2M8SpBs2Pl16BkAzDuwYjKI+WnWwRQwJtBp9OybF2XTW1wcurln+I5dmEutyjcdT8M/x
 A5ENGwF/tEb7hwH2RfW5dJ0TLJL9aDPtq/j4Mt1PeTjoPc/Ljw36iN0F+KlwjeHeqNR+EfyH7cf
 Y+QmKAhhZZhr0o+hqHkbVIqQKBze9xAgmX5JZgC/3W2JQTPRzHJw8LiPtoDh15NYoiz4hHyaKUe
 WFxOpopCvP7BZ3skEKtMRVn7DMKFfy4a13Fbg6ZMvsgBOKj6FUXCw1b2xhvlE6hdEdPHuAh4vzH
 +cSiBk87xVSZUC5W3eswz3C0o6X2GRUITqox1OJN/+WNSW5ix3OnYl4yD3Y+h/gBjjz4Yue30VE
 BMklmlWxOF6D9cuYrnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAxMSBTYWx0ZWRfX8Rq30C1hcBOs
 D2j6iFt09tAsqDTiIbSlOhPhmviGq1lKO3dxd2L90+/zGuKYLsq8dCSrNEWiKNZpnr3gAun4jPD
 L7eVpaSEh0rwkpxGCYq4VkvpWfAWzYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_09,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280011

This patch extends the existing tas2781 codec driver to add full support
for the TAS2573 integrated DSP feature.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781-dsp.h       | 4 ++++
 sound/soc/codecs/tas2781-fmwlib.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index e845687decf9..de087f4ca13f 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -56,6 +56,10 @@ enum tasdevice_dsp_dev_idx {
 	TASDEVICE_DSP_TAS_2781_QUAD,
 	TASDEVICE_DSP_TAS_5825_MONO,
 	TASDEVICE_DSP_TAS_5825_DUAL,
+	TASDEVICE_DSP_TAS_2573_MONO,
+	TASDEVICE_DSP_TAS_2573_DUAL,
+	TASDEVICE_DSP_TAS_2573_21,
+	TASDEVICE_DSP_TAS_2573_QUAD,
 	TASDEVICE_DSP_TAS_MAX_DEVICE
 };
 
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index df30abfb3b6b..3a9cdfcae370 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -110,7 +110,7 @@ struct tas2781_cali_specific {
 };
 
 static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] = {
-	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4, 1, 2
+	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4, 1, 2, 1, 2, 3, 4,
 };
 
 /* fixed m68k compiling issue: mapping table can save code field */
@@ -1949,6 +1949,8 @@ static void dspbin_type_check(struct tasdevice_priv *tas_priv,
 		else
 			tas_priv->dspbin_typ = TASDEV_ALPHA;
 	}
+	if (tas_priv->chip_id == TAS2573)
+		return;
 	if ((tas_priv->dspbin_typ != TASDEV_BASIC) &&
 		(ppcver < PPC3_VERSION_TAS5825_BASE))
 		tas_priv->fw_parse_fct_param_address =
-- 
2.43.0

