Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC12F7AC0
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797666; cv=fail; b=qBqyVYSez6GYhbYVKrY7sJm8GlP2ClXWVebSWrFGOvln3vkVhSIfqFuZFUw8xXJJO+t4Wl/lEGm7pgzkgLuVcLP/0NuBbBrxzVsSJOcGhZVHTmSvbSzEDlDWzJU+U/ZNRLUJ8rfa4W8bchX8i3TeoiMZCM4QZsAuOFwkzOWS7rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797666; c=relaxed/simple;
	bh=6grs5F7DkecznN0ASecuNlAoNW1mlEXFWDvtYX0fdvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UT59KVr4XGOMsUcI3QSUWC4mvTNNAWfa2i8Dvu/h7q+WUcqHdrZor4/BQfD78q//xOnpCieduR9NAiDyptGj01gm0rTM23K22PoSt2sJ/rXtTrz/l0VyYy174+Are4YsmWZY7YOYmimV4g3YXn1ED3N/vuBiBj887mafGbun2jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ja8UHVEf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iJdDQ4Dr; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ja8UHVEf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iJdDQ4Dr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P4PF6k2026617;
	Thu, 25 Sep 2025 05:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=; b=
	Ja8UHVEf4mpEy4WxAAJG+t2JHIRtpLvYGJaY4zrWTBnosLZt8+Pw9deYLKrOWoiv
	nHf60uqKNFMNBAmJobJbbtJfXK2CFU516Gli9AQCBKrRr8+qokdvU4ch8vZoTTMm
	9gUKVoXnm2x3bMYi1FYZ/hKEbiQGrrjy8Nm9qYXh0E9HPaGN6KSJdS/lNuKjEaXn
	LfydtrasXxzNZnxCBklQ8nI5VyLtgvidaol6q7f5gUDaZ2qPbD5EAplw7/GcM6c7
	C2HmbqceBvnABZ29sslHyOBObSk2HpEjWmHT3A/fQA1VgicQ0J2HjO/0Zud2BGfj
	RQXWIvd8pCWK1lJC9MDwxA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022111.outbound.protection.outlook.com [52.101.43.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC0E8RkyJZACdy98i2w6sN92EzZWu2ejkp5icJd2vW1s4jdFMqtHB6J8UzEPYs8tm4Sme5uT7hoHFmGxlz0zsHUUqAp2VHyLsj3C1D6axbC9aYFDyabmJ60KmtMr2aeTb5lkSppAEIOW9+ur+LlDce2hv2rYWx92ozb4pLHhSMaTM2KYbviIEcbDBGM4DBRbBh53KKsCxIeQRZNBr66DCdCJTWWsTxVNlhe0e5w+PEfAjD6oT65U9DHEedLJD4u7H66wYpKZIyng2y4p34/LvhhCF30hvcx5CV7N+BVv7Khti3fSn364rCsmwFOw1kic5NuPxTccyPO9FbO8QHvSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=;
 b=AWsdOLffz8NXatvvg51LW4y0mltIfcce/tgjMbzcXgvcZ0mU6k7WUTL6TD85bYNSVYH9zprpLcfMS/RLWHZLKliuwYVQVbnceyeSh632BWa5qdg37k+4C7ygqF4BiJGROg0La3yi187ep5WlH/0HEoCUcFj5asdIhvDOd1SjdYui/gQFmMxFqQn+aLEuvuXvDwuvv2Uum2TP4AkJLiJ5QD7MC/IWr9h9YvZE+sj7YSnZxTL+DgkK5TTiHO9sxJ1utSBT7jVphVXXitzzf/HIRg3o92SZOGo+cbJxwU6lC8P7N60HVkcYeylpTdVRjnbo0rz7NnjJSQrAM2RK+xaQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRbpU8Iwr5zLUbvr64Xw0C8mh8/e+8ls7+WtsKG6cXw=;
 b=iJdDQ4DrFu1Uu4sncQBCzqt12QCXhTKnnVo9LZIqb+OzoF5boNgnDebe28iwsJMFIVCeZFGnV2+C+ORuzbUL6qLF0u++WOTMwRUn+9B8K7rm2w3on25twhpQnnydLPiGN0s670jBmwPrYcZgKTN2fFqtzxrQ84GU+UmADl4ZkOM=
Received: from MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31)
 by SJ2PR19MB8124.namprd19.prod.outlook.com (2603:10b6:a03:53f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:53:54 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::bd) by MN2PR05CA0062.outlook.office365.com
 (2603:10b6:208:236::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0DFA406647;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9BCB482024B;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 15/19] ASoC: SDCA: Add FDL-specific IRQ processing
Date: Thu, 25 Sep 2025 11:53:37 +0100
Message-ID: <20250925105341.194178-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SJ2PR19MB8124:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37801a81-eb63-4345-01d3-08ddfc21d0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8D5wh+K5CIxWZJ2+MU5ju3WqZxEwX7T/eGVxbbIpxc3NtguJXZwRcegwojkv?=
 =?us-ascii?Q?Fcerrc2VyPeI3d3x3BSK8TtIaLjPkWy1MtduyXPLo7+cfIw0eBqNG+PiwQfx?=
 =?us-ascii?Q?MjNhAsRHLuBY7wYLRwEntfGEkFRf3cfGkFQapO+2M3WYYIdeCD6ymYTGXy3c?=
 =?us-ascii?Q?Ua8hdpOzo2w9IX14kzqbbsI1/GKN8Vjp2jxnXM29xt12NbF3b5MIyW+eP3OK?=
 =?us-ascii?Q?TbDyTA1wwJcNDxclMZAotbAqhXG2BI8O9bO6SjjagrLEmcqVSWZWW+GbUShR?=
 =?us-ascii?Q?PEH/g9TBqZYNStKIgbZqF3Dwu6M3O78qdPvleG2L1xC5mHeanjl4E4HS/asQ?=
 =?us-ascii?Q?5pzCwoyp5hlEl/fT0GCFEmwnh2JPxQL2P8nMaHUEvJ0A7yq/O95aSQAncl9R?=
 =?us-ascii?Q?ltGzdDRQz9CcqkI8naeCapD/Opf+rHzQXed632uOtOm2+CIM1gWI6T91UEEK?=
 =?us-ascii?Q?DVSHEqhZBKZsx+zvMIZjPTUVq1hLTw6NgLJ6OyoxIQPlnFf7WC+pQ1KLQyuS?=
 =?us-ascii?Q?kMqYxVG3aepI+58hMly9jgMsHO2xXtMsAS/BBvFoSYakRLUn4esG//W5zKxz?=
 =?us-ascii?Q?a4S40BybWG1yfYcv5lhvEKqmq7ubtIU/2wIGYNx5f8XLWCUg6Mwv/pBAunZv?=
 =?us-ascii?Q?iktMQN+bX5QopefylImAA/V0DeW0PqxN1bIzS3lg3LmnWaVQFqIAhwuGQPGX?=
 =?us-ascii?Q?8s8tHL9w+CoyugNvGxkXvmmg9wRgNZHJK/k0nZCEBzv7MHfcwUssA+t4IDt+?=
 =?us-ascii?Q?dQ6EEAotL0fhoadXckjNVr2pYizs8+ec2ICkUaZprmsbvL5OqmB3s5H33izg?=
 =?us-ascii?Q?wSYQsdi3E1HKt26JTMMX4VGNYqA7+eDXtOp2yTVEu0T/0ibkiFVJ+mQOnLEr?=
 =?us-ascii?Q?ABf/4+kfhRoWkHOfeG5O95kBEk9cPcXwUlxoiCUjr30bldW7ZMXliQoa+ydN?=
 =?us-ascii?Q?2LGzAdTP4wfoNZDCCP4/AhQAzRWfrCJqRmokbEZVA19+SjN7cDrp+tQvwGwZ?=
 =?us-ascii?Q?38vrYKPUFsUA99b7Vmi8xEuZ9uBYqKhktQJleMKZiNFrgo7faaFx0EUk7MvQ?=
 =?us-ascii?Q?DCxkWvp+wmudg68Em1vt6Btym9GjO06ou9/gm14ObOAM3Z6wWbRbb8uCzApu?=
 =?us-ascii?Q?Gqolb+08PO5ysUJNn16DLnQq3XI72D/EnzP6CAm7yomgLf4f7epITj8JRD3S?=
 =?us-ascii?Q?pjFbMEa9mm/rMptgnU06KiBGGHdi6VM8tLmQyO/RS1pjelFHxq2zlyyUFXeA?=
 =?us-ascii?Q?e2ByPwaAjeriHXFvtfE/DKxqpZOlqE7U6ETkrXUgRInIt298Oqojmdo724YI?=
 =?us-ascii?Q?f92jQmj6mPPGFHre0iN26PcOQRMopUbuEdBdnvvDobFLixRX99s8hXOjUYPA?=
 =?us-ascii?Q?i1u7K57BYr8iYIzYxgzOku53MaqC5DZrs8rqAxU2DP6wD8XUtu8gCe3YK4v/?=
 =?us-ascii?Q?X9tUbFJ01wFqiYQ1v1p5S/yyp5RVqSbDImo2JGiZ/O8SuvbSO+HGRcuvki44?=
 =?us-ascii?Q?GBXsdAGy/6Xy7p3w/EL6bq7jk8KfY6xUn415Y1ZrXWmT0jTmMhvuXF+bquWW?=
 =?us-ascii?Q?MoR+GVFaHYyoX/kfuxA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:52.1485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37801a81-eb63-4345-01d3-08ddfc21d0cc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8124
X-Proofpoint-GUID: TvIke_fpInGeUz9P4VN68DJwgNmUIqin
X-Proofpoint-ORIG-GUID: TvIke_fpInGeUz9P4VN68DJwgNmUIqin
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f46 cx=c_pps
 a=Gg7HfhqIPUY1o8E1DfVvqA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=QyXUC8HyAAAA:8 a=vrUAae3nbITHHW_ohNAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX/GVdhgMi/N06
 HUD2QEfYPnp8fmsRjC/OVufNhaw41m5X1671+ZK/w9nqvrPXtf1s8cO3AcMdghNoqd2EyYvEAxM
 AcLCX5cq4p7MljEqq78BIqCHRGBF5FqNuPFi3O5D4LZLtdo8kUU08rxErhTsTC03F11Ah+h7mVw
 D7Zkwo0bIYQeLVeq7+KVcLWSpYWB89TjI/t/bGTtZHs3f7IoGtjledH/9Qmzwccct8fpYQ58iTs
 kFWmT8uSmc1Hr9OIps9z3ZeCdJ88jVJnkBdwK17FxyUHdrVMmNE3RPD0L/6ZC6Wt336jwddZF5b
 1DSDfjCwb9oLmnAC+5pwD5LzcCO3bFa5O6SQhJ7nwpkb8BtNDeD0jVvTJAHM68=
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Hookup the XU IRQs required for the FDL process.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/sdca/sdca_interrupts.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index d0894c8e0552c..3a3b966b5782b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -18,8 +18,10 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/sdca.h>
+#include <sound/sdca_fdl.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
 
@@ -245,6 +247,29 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	return irqret;
 }
 
+static irqreturn_t fdl_owner_handler(int irq, void *data)
+{
+	struct sdca_interrupt *interrupt = data;
+	struct device *dev = interrupt->dev;
+	irqreturn_t irqret = IRQ_NONE;
+	int ret;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume for fdl: %d\n", ret);
+		goto error;
+	}
+
+	ret = sdca_fdl_process(interrupt);
+	if (ret)
+		goto error;
+
+	irqret = IRQ_HANDLED;
+error:
+	pm_runtime_put(dev);
+	return irqret;
+}
+
 static int sdca_irq_request_locked(struct device *dev,
 				   struct sdca_interrupt_info *info,
 				   int sdca_irq, const char *name,
@@ -423,6 +448,15 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
 					handler = detected_mode_handler;
 				break;
+			case SDCA_ENTITY_TYPE_XU:
+				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
+					ret = sdca_fdl_alloc_state(interrupt);
+					if (ret)
+						return ret;
+
+					handler = fdl_owner_handler;
+				}
+				break;
 			default:
 				break;
 			}
-- 
2.47.3

