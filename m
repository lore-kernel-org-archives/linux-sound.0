Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1A33164A9
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182534; cv=fail; b=AF2pgVb0Jb92LjAX07h4XYRwGexrYx9c+6r/mZgPwCfC1e7XoAcJ+i1MYl9ljR3LroL0SyyvyjUvUUmgmTPHirqtOh/3ap/ESs+rAFtnHvYmIVF2awG1pNGR/RGVQjErwB+oBJUsK5eMiFy58qiVCcgSgS/fgpvZkOTHDsVmudY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182534; c=relaxed/simple;
	bh=IOdhkG38zK1X8Iti55LQuThHwXpKK4QxNM+SEcqiVxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IAU8+Fl6rW7ewQJS5IKjTwFyFZZktDJVV4cW5PXzZfngbsmVJbyGskVfmIYBSw1zCLeVAJvNpJ8GAdScjEcjj+Q8FGg0DjHFPXZrbo99YMYEzQk1C88JxSqGWsKfDzli5ZWoD8i2DMZq7lXg9rsbQLu2unechB3aPZang2bogFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j8rVElTM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=X7ceYtlW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j8rVElTM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="X7ceYtlW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35JB9R874130;
	Mon, 3 Nov 2025 09:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=F3quZvapPVgSGBak3xjN6YDsHj5phkNDwSR4cb+jQ50=; b=
	j8rVElTMoTtFW2vFDoUdjNspkwnr1OCh5AuLMZGVO044pX+eBbm8rWvVD5r3SSVc
	WGhb7SEIeEJQxgvloQy69Auoe9tFO6+WDQLtihSNGYl4RGYC0J0Vxvxqyqdr3IL/
	Mol2O7RaeymzFNEYlvn2vTDTVvL+VV2ZBKNfhJfktBm9fuUFgxXriPRe5I1JMtjM
	xFXJXiEVnUdVm3oDz9seqOlIz2rBe6//Br9atBc6y4219Ic/t2OinO/qqcxM85Jo
	jTgK9r7pGvH5ScUhOlrbTYIjaiohubzC2Z5eyghTgX0OL1IMPNJjdE0iDeg7brkL
	1pexBRksRf8+uYKCy7sx/Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023115.outbound.protection.outlook.com [40.93.201.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a5emg26r1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE2xi/Rc3zH+MGwXCLit5SigJr43G/bfuM3YIRDFGT46Mn4TSCJS7hYL0HtUer3p2O6VuXcTu+RD4PJ6oyloiXev8Uw0qmQv73qGStUdjwbfF/fLqLyrQVD0dvS3uUthDIw7JrjlnLt9YnJnmycGpHeQX/aReE6oUG1ElxW4D1CcIIYKWgU4JH3t0R9Pz5X/SqdBZhXgrHSmMMpR47ygAKpKgXygZCTCH9AQbYuYtcBg9dOZD4Jpmpt+38Ni3aDBALCfJQwh2ziIlWfthL+ijJqKLDcg1kvwrqrrMWdNFfPgjOavCB5bhGC5b/zSzoogJRFS2r+CtsKHR7YLZ+B3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3quZvapPVgSGBak3xjN6YDsHj5phkNDwSR4cb+jQ50=;
 b=WBT8WXl9FtIor5azjXxiZWkSj2rUUt4r3FVIMHStYcK1hgcNogq7bhhRbIH2gCWKTknddmoxbtriUSSlgM5PjZkJvhxrjfs7YsKbIhVCe0OK7TSph4obI/1x2brPIfO7FqnHXCOROlO0deX9ryQdYXPVN0Bz+LxXCjbw444dXQervaE2HlKgMmNumvDVcCLnzs8PFPBIwjrkS9dsBLqw3L5Derf3AirkhOYg0H5kGU8OjFYqGKYIJit5wp5TI9qIwHAYdmz2vVi19M5SuODTLV9LuetBhnYm8nKsJc+9QeyKqST2xzdt5/UrgwIhMqnflPIlYiHYJHj0en8KW/Y5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3quZvapPVgSGBak3xjN6YDsHj5phkNDwSR4cb+jQ50=;
 b=X7ceYtlWeGH4TfGWfnLdkkM0QDyPdiBzd2weM95HtEGaPLa2ublgnx2bCIrwQWaF2Yui6PUplBYyi4llYOvGG5Qv2tJyvDWQ7qAWTO9OkN5wR/q5QM1J01apB3MdwqG21SDGa0rvMNcXPU752TGXJsTpgfkC1NTIR03VOfM7ifk=
Received: from PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::12)
 by CH9PR19MB9394.namprd19.prod.outlook.com (2603:10b6:610:2e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:22 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::70) by PH8P220CA0026.outlook.office365.com
 (2603:10b6:510:348::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 576BE40657D;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C59D8820258;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 11/13] ASoC: SDCA: add function devices
Date: Mon,  3 Nov 2025 15:08:06 +0000
Message-ID: <20251103150808.4015208-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CH9PR19MB9394:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b1af9a0-b017-4481-6db8-08de1aead439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SRisqmKl/Zpsg9nKuWfc32wD29CS6/xqavvok8CbAd9Ig7q+rOAskcBZDqgn?=
 =?us-ascii?Q?Z7UWjb+8F10tdrBHPWBIfq/CwD3FMgB6bb/psO010zru7Flpo8XPLDOo791/?=
 =?us-ascii?Q?48KPYNpMgiLsZ6Q7G2Rs00sdYBT0LXhipS/M+vlhLShmlDt5Q0to0s1X/8KQ?=
 =?us-ascii?Q?CaIPy9P4VouYNCkIeFRGBSMmKETtrs64sWjQ/PogC5SripqGjG651kL497hN?=
 =?us-ascii?Q?V/oGT+nzzFhfpLa+kBWBr76F7rK8uwkHjB+b3aQtG6nJBcwxXepoGrMg/FGi?=
 =?us-ascii?Q?+EulIXyrq5dl9bWAyl7EYSJoGt8liXCCDwk6D2/k8Bl9uL1PfIIHlq5IsKBj?=
 =?us-ascii?Q?+HWrwRYZY2n7rpIKg5ecMDfBeVXJDSb4iccGnQiGIaeT1bZvPH6X61spd0/+?=
 =?us-ascii?Q?szSgmVqwLo/ZO3B/V7unH/1yZ/t+xZlNtUeYrm6wFaYCMaIcHqjHAMieRu2k?=
 =?us-ascii?Q?bjhIpQRRYWm80EgAOo4Yq12KInPQvHpUKtKL3Ir6msKmQpnI/3Cfqq6YdIZ3?=
 =?us-ascii?Q?PnNicUXHwTEbZ3zEDdmmMK+h8h8yJYdL8AabMF3OGlCf0TZKam+yWZ46W45c?=
 =?us-ascii?Q?7o+x4aTbvPsdxvCg8Z6feBdtkvm8+Hbpropbh6FUuzW6YZyR3+JrXRB9fpVT?=
 =?us-ascii?Q?lYzyG+j67UMkvGfWw5ZwgHp7C/3qKpCtBPgI1cwQImFB6kAGnXsFDnYhRPu7?=
 =?us-ascii?Q?KgqUgBSvXhIJicHefoQLiI7bSS1EAd2SpLBUrJBMfVMXAJgirOeP/wF9i677?=
 =?us-ascii?Q?E0zmvDcS1+X5us2M3H6ktpqYiMJKLYjaG6gYA+9IwE7dwC4wE+znnOwrqfq+?=
 =?us-ascii?Q?6GubJydY3ccujLDsMc6viba3QXrxI6yeLScWxLO9f/abB+ThLaownwnjS7o2?=
 =?us-ascii?Q?1HM/4JBeuau61u+QlHrOhZIhNAXffJRc97li/AXNPZSFgNNfkC9GYywXDjYW?=
 =?us-ascii?Q?1fMxCJVQ9nk9M3eCFCMy4dfuJ0NREVWnFluJfxyHHeTPjlawo+aBSbCwsLzM?=
 =?us-ascii?Q?pV9aDJvTRlXocdHoDTXbxSgntvmBlrXui1wXqQrQJbr+BGdhu0ETS8oUHjoB?=
 =?us-ascii?Q?SNALHl/pMVCyybyLOZSyntgqiS7s3HbXTfxfyKJWx44vx1lSIfbu1shK4/rs?=
 =?us-ascii?Q?dK2/s6wSulWPtGk2kzweiT8YwQp0lRFOa3CtWTxrifGO9NNzYDSplwhyVHV3?=
 =?us-ascii?Q?I18ZyWHmyI2HXrtRUkqoBGothwkZZURnkZMBlRGRE+cPJ1+zEaJ3C99nNJ0a?=
 =?us-ascii?Q?sFiXt39cQHjtWC7Upj4TF4YJvStOJo74PWBHhzwwbGRWSrcPgpxzkRLKyr4x?=
 =?us-ascii?Q?NIiiDurmbjij0VDsPACqlbP4eA+FlO+pT21xDm3j0nkz60f6NSmlDBHEgAyn?=
 =?us-ascii?Q?TM2OtEXu+sMyK1zcjPaM/85Hg3ttQek2ZNsI9otpo0dMpcIxjrgzgVemndSc?=
 =?us-ascii?Q?RGX5ZStJ1x7uhwd9GaIRx3efr89WKSSvNIbNqrpQJ21cE6YKWmh4Oz7evPtL?=
 =?us-ascii?Q?N4lUXcv5GL1/vGB5eQiIZY4FgPh5+WKj+LWzXhZ0hq9FQmH5ZE7ubI5qlzvn?=
 =?us-ascii?Q?7L4E1PRyNJr3zScG5Dw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:21.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1af9a0-b017-4481-6db8-08de1aead439
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9394
X-Proofpoint-GUID: PCVQJfw0FxHmqF5QZIVLNG_T3twwtsa8
X-Authority-Analysis: v=2.4 cv=Mu5fKmae c=1 sm=1 tr=0 ts=6908c56d cx=c_pps
 a=y6Sm6l44Xb9uyrH0UefkHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=s4wzVoPRHm42yPvCsZEA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: PCVQJfw0FxHmqF5QZIVLNG_T3twwtsa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX8w5aFyXEj01d
 yQxfoTXWctHiZ7CbmTNNd0RS36/PR0rdDUh7g+L8hGytDqRwmIzAX1mKFjjBw7Ywiit7J6d6rz8
 DidArSQWGpN9whc9M2PSsEqba/8ah8SNZj4ndz5oEWn297jZ+yqsP0gCT2dDjIx6OMkHNLEFGqb
 77rKq9j5EG0swEN6MnP3/sCZDEuC2RNermSJEMWH9ZVIKNrImMTzawR/LupjkUnWxvlLd14hv79
 yFVwzBJnjG72XMTwELG8wQ+/KEd0djXszOukNEtTCrYjv9eWfPOzymf9RfM1swmFoEChZF4WX6M
 0J7UKPPL43ihIDrCWuP32enKM2eu962eeDMI7iizbw607Ec4SDXIcHQx2G2gJMKrqN/XFOXeXm0
 L3dpFcjxDnuQetHdftIxQiDwOeqkOw==
X-Proofpoint-Spam-Reason: safe

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use the auxiliary bus to register/unregister subdevices for each
function. Each function will be handled with a separate driver,
matched using a name.

If a vendor wants to override a specific function driver, they could
use a custom name to match with a custom function driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca.h                  |  13 +++
 sound/soc/sdca/Kconfig                |   1 +
 sound/soc/sdca/Makefile               |   4 +-
 sound/soc/sdca/sdca_function_device.c | 117 ++++++++++++++++++++++++++
 sound/soc/sdca/sdca_function_device.h |  15 ++++
 5 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d58d602212771..67ff3c88705d5 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -15,18 +15,21 @@
 struct acpi_table_swft;
 struct fwnode_handle;
 struct sdw_slave;
+struct sdca_dev;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
 
 /**
  * struct sdca_function_desc - short descriptor for an SDCA Function
  * @node: firmware node for the Function.
+ * @func_dev: pointer to SDCA function device.
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
+	struct sdca_dev *func_dev;
 	const char *name;
 	u32 type;
 	u8 adr;
@@ -59,6 +62,8 @@ void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
+int sdca_dev_register_functions(struct sdw_slave *slave);
+void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
@@ -69,6 +74,14 @@ static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_qu
 {
 	return false;
 }
+
+static inline int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	return 0;
+}
+
+static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
+
 #endif
 
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index a73920d07073e..e7f36d668f159 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -4,6 +4,7 @@ menu "SoundWire (SDCA)"
 config SND_SOC_SDCA
 	tristate
 	depends on ACPI
+	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
 	  Class for Audio (SDCA).
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index be911c399bbde..babe3fa2bb3ff 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
-		  sdca_ump.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_function_device.o \
+		  sdca_regmap.o sdca_asoc.o sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
new file mode 100644
index 0000000000000..91c49d7389db0
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2024 Intel Corporation.
+
+/*
+ * SDCA Function Device management
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include "sdca_function_device.h"
+
+/*
+ * A SoundWire device can have multiple SDCA functions identified by
+ * their type and ADR. there can be multiple SoundWire devices per
+ * link, or multiple devices spread across multiple links. An IDA is
+ * required to identify each instance.
+ */
+static DEFINE_IDA(sdca_function_ida);
+
+static void sdca_dev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
+
+	ida_free(&sdca_function_ida, auxdev->id);
+	kfree(sdev);
+}
+
+/* alloc, init and add link devices */
+static struct sdca_dev *sdca_dev_register(struct device *parent,
+					  struct sdca_function_desc *function_desc)
+{
+	struct sdca_dev *sdev;
+	struct auxiliary_device *auxdev;
+	int ret;
+	int rc;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev = &sdev->auxdev;
+	auxdev->name = function_desc->name;
+	auxdev->dev.parent = parent;
+	auxdev->dev.fwnode = function_desc->node;
+	auxdev->dev.release = sdca_dev_release;
+
+	sdev->function.desc = function_desc;
+
+	rc = ida_alloc(&sdca_function_ida, GFP_KERNEL);
+	if (rc < 0) {
+		kfree(sdev);
+		return ERR_PTR(rc);
+	}
+	auxdev->id = rc;
+
+	/* now follow the two-step init/add sequence */
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to initialize SDCA function dev %s\n",
+			function_desc->name);
+		ida_free(&sdca_function_ida, auxdev->id);
+		kfree(sdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to add SDCA function dev %s\n",
+			sdev->auxdev.name);
+		/* sdev will be freed with the put_device() and .release sequence */
+		auxiliary_device_uninit(&sdev->auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return sdev;
+}
+
+static void sdca_dev_unregister(struct sdca_dev *sdev)
+{
+	auxiliary_device_delete(&sdev->auxdev);
+	auxiliary_device_uninit(&sdev->auxdev);
+}
+
+int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++) {
+		struct sdca_dev *func_dev;
+
+		func_dev = sdca_dev_register(&slave->dev,
+					     &sdca_data->function[i]);
+		if (!func_dev)
+			return -ENODEV;
+
+		sdca_data->function[i].func_dev = func_dev;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_dev_register_functions, "SND_SOC_SDCA");
+
+void sdca_dev_unregister_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++)
+		sdca_dev_unregister(sdca_data->function[i].func_dev);
+}
+EXPORT_SYMBOL_NS(sdca_dev_unregister_functions, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_function_device.h b/sound/soc/sdca/sdca_function_device.h
new file mode 100644
index 0000000000000..5adf7551d3a44
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2024 Intel Corporation. */
+
+#ifndef __SDCA_FUNCTION_DEVICE_H
+#define __SDCA_FUNCTION_DEVICE_H
+
+struct sdca_dev {
+	struct auxiliary_device auxdev;
+	struct sdca_function_data function;
+};
+
+#define auxiliary_dev_to_sdca_dev(auxiliary_dev)		\
+	container_of(auxiliary_dev, struct sdca_dev, auxdev)
+
+#endif
-- 
2.47.3

